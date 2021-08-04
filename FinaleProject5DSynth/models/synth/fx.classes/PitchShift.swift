//
//  PitchShift.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 28/07/2021.
//

import Foundation
import AudioKit
import SoundpipeAudioKit

class PitchShift {
    
    let pitchShifter:PitchShifter
    let dryWetMix:DryWetMixer
    
    init(_ node: Node) {
        
        pitchShifter = PitchShifter((node))
        dryWetMix = DryWetMixer(node, pitchShifter)
        
        pitchShifter.windowSize = 1000
        pitchShifter.crossfade = 512
        
        pitchShifter.play()
        pitchShifter.shift = 4
        
        dryWetMix.play()
        dryWetMix.balance = 1
    }
    
    func bypass(){
        dryWetMix.bypass()
        pitchShifter.bypass()
    }
    
    func play(){
        pitchShifter.play()
        dryWetMix.play()
    }
    
    func setPitch(semiTones: AUValue ){
        pitchShifter.shift = semiTones
    }
    
    func setMix(mix: AUValue){
        var finalMix = mix
        if finalMix > 100 {
            finalMix = 100
        }
        dryWetMix.balance = finalMix / 100
    }
    
}
