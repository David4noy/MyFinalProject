//
//  TremoloMod.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 01/08/2021.
//

import Foundation
import AudioKit
import SoundpipeAudioKit



class TremoloMod{
    
    let tremolo: Tremolo
    let dryWetMixer: DryWetMixer
    
    init(_ node: Node) {
        tremolo = Tremolo(node, frequency: 0.7, depth: 0.3, waveform: Table(.positiveSine))
        dryWetMixer = DryWetMixer(node, tremolo)

        
    }
    

    
    func play(){
        tremolo.play()
    }
    
    func bypass(){
        tremolo.bypass()
    }
    
    func frequency(_ frequency:AUValue){
        tremolo.frequency = frequency
    }
    
    func depth(_ depth: AUValue){
        tremolo.depth = depth
    }
    
    func setWaveform(_ waveform:Table ){
        tremolo.setWaveform(waveform)
    }
    
    func dryWetMix(_ dryWetMix: AUValue){
        dryWetMixer.balance = dryWetMix
    }
    
}

