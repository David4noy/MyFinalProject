//
//  EffecetBuilder.swift
//  FirstSynth
//
//  Created by דוד נוי on 04/07/2021.
//

import Foundation
import AudioKit
import SoundpipeAudioKit
//import DunneAudioKit

class EffecetBuilder {
    
    let dist:TanhDistortion
    let modulation:Modulation
    let reverb:Reverbs
    let delay:Delays
    let eq:EQ
    
    
    init(_ node:Node) {
        
        dist = TanhDistortion(node)
        dist.bypass()
        
        modulation = Modulation(dist)
        modulation.bypass()
        
        reverb = Reverbs(modulation.flanger)
        reverb.bypass()
        
        delay = Delays(reverb.fader)
        delay.bypass()
        
        eq = EQ(delay.fader)
        eq.bypass()
        
    }
    
    
    // MARK: Distortion
    
    func distOnOff(isOn: Bool){
        isOn ? dist.play() : dist.bypass()
    }
    
    func setNegativeShapeParameter(_ negativeShapeParameter:AUValue){
        dist.negativeShapeParameter = negativeShapeParameter
    }
    
    func setPositiveShapeParameter(_ positiveShapeParameter:AUValue){
        dist.positiveShapeParameter = positiveShapeParameter
    }
    
    func setPregain(_ pregain:AUValue){
        dist.pregain = pregain
    }
    
    func setPostgain(_ postgain:AUValue){
        dist.postgain = postgain
    }
       
    
    // MARK: Modulation
    
    func setModulationType(_ type: Int){
        modulation.setModulation(type)
    }
    
    func setModFrequency(_ frequency: AUValue){
        modulation.setFrequency(frequency)
    }
    
    func setModDepth(_ depth: AUValue){
        modulation.setDepth(depth)
    }
    
    func setModFeedback(_ feedback: AUValue){
        modulation.setFeedback(feedback)
    }
    
    func setWaveform(_ waveform:Table ){
        modulation.setWaveform(waveform)
    }
    
    func setModDryWetMix(_ dryWetMix: AUValue){
        modulation.setDryWetMix(dryWetMix)
    }
    
    func modOnOff(isOn: Bool){
        isOn ? modulation.play() : modulation.bypass()
    }
    
    func setModGain(_ gain:AUValue){
        modulation.setModGain(gain)
    }
    
        
    // MARK: Reverb
    
    func reverbOnOff(isOn: Bool){
        isOn ? reverb.play() : reverb.bypass()
    }
    
    func setReverbFeedback(milliSecend: AUValue){
        reverb.setFeedback(milliSecend: milliSecend)
    }
    
    func setReverbCutoffFrequency(frequency: AUValue){
        reverb.setCutoffFrequency(frequency: frequency)
    }
    
    func setReverbDryWetMix(mix: AUValue){
        reverb.setMix(mix: mix)
    }
    
    func setReverbGain(_ gain:AUValue){
        reverb.setGain(gain)
    }
    
    
    // MARK: Delay
    func delayOnOff(isOn: Bool){
        isOn ? delay.play() : delay.bypass()
    }
    
    func setDelayFeedback(feedbackPrecent: AUValue){
        delay.setFeedback(feedbackPrecent: feedbackPrecent)
    }
    
    func setDelayTime(milliSecend: AUValue){
        delay.setTime(milliSecend: milliSecend)
    }
    
    func setDelayMix(mixPrecent: AUValue){
        delay.setMix(mixPrecent: mixPrecent)
    }
    
    func setDelayType(_ type:Int){
        delay.setDelayType(type)
    }
    
    func setDelayGain(_ gain:AUValue){
        delay.setGain(gain)
    }
    
    
    // MARK: EQ
    
    func eqOnOff(isOn: Bool){
        isOn ? eq.play() : eq.bypass()
    }
   
    func eqTypePlay(){
        eq.eqTypePlay()
    }
    
    func eqTypeBypass(){
        eq.eqTypeBypass()
    }
    
    func setFrequency(frequency:AUValue){
        eq.setFrequency(frequency: frequency)
    }
    
    func setBandwidth(bandwidth:AUValue){
        eq.setBandwidth(bandwidth: bandwidth)
    }
    
    func setEqTypeGain(gain: AUValue){
        eq.setGain(gain: gain)
    }
    
    func setEqGain(_ gain:AUValue){
        eq.setEqGain(gain)
    }
    
    func eqType(_ type:Int){
        eq.eqType(type)
    }
    
    
}


