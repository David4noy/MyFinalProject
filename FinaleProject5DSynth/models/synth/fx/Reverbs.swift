//
//  Reverbs.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 28/07/2021.
//

import Foundation
import AudioKit
import SoundpipeAudioKit
import AudioKitEX

class Reverbs {
    
    let reverb:CostelloReverb
    let dryWetMix:DryWetMixer
    let fader:Fader
    
    init(_ node: Node) {
        
        reverb = CostelloReverb(node, feedback: 0.6, cutoffFrequency: 8_000)
        dryWetMix = DryWetMixer(node, reverb)
        fader = Fader(dryWetMix, gain: 1)
        
        
        dryWetMix.play()
        dryWetMix.balance = 0.4
    }
    
    func bypass(){
        reverb.bypass()
        resetReverb()
    }
    
    func play(){
        reverb.play()
    }
    
    func resetReverb(){
        reverb.reset()
    }
    
    func setFeedback(milliSecend: AUValue){
        reverb.feedback = milliSecend / 1000
    }
    
    func setCutoffFrequency(frequency: AUValue){
        reverb.cutoffFrequency = frequency
    }
    
    
    func setMix(mix: AUValue){
        dryWetMix.balance = mix
    }
    
    func setGain(_ gain:AUValue){
        fader.gain = gain
    }
    
}
