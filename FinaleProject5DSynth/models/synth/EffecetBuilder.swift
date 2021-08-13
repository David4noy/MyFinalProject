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
    
    let envelope:AmplitudeEnvelope
    let dist:TanhDistortion
    let modulation:Modulation
    let reverb:Reverbs
    let delay:Delays
    let eq:EQ
    
    var noteOnOff = false
    
    
    init(_ node:Node) {
        
        envelope = AmplitudeEnvelope(node, attackDuration: 0.12, decayDuration: 0.1, sustainLevel: 0.7, releaseDuration: 0.1)
        envelope.closeGate()
        
        dist = TanhDistortion(envelope)
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
    
    
    // MARK: Envelope
    
    func noteOn(){
        envelope.openGate()
        noteOnOff = true
    }
    
    func noteOff(){
        envelope.closeGate()
        noteOnOff = false
    }
    
    func setAttackDuration(_ attackDuration: AUValue){
        envelope.attackDuration = attackDuration
    }
    
    func setDecayDuration(_ decayDuration:AUValue){
        envelope.decayDuration = decayDuration
    }
    
    func setSustainLevel(_ sustainLevel:AUValue){
        envelope.sustainLevel = sustainLevel
    }
    
    func setReleaseDuration(_ releaseDuration:AUValue){
        envelope.releaseDuration = releaseDuration
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
    
    func setModulationType(_ type: ModulationType){
        modulation.setModulation(type)
    }
    
    func setModFrequency(_ frequency: AUValue){
        modulation.setFrequency(frequency)
    }
    
    func setDepth(_ depth: AUValue){
        modulation.setDepth(depth)
    }
    
    func setFeedback(_ feedback: AUValue){
        modulation.setFeedback(feedback)
    }
    
    func setWaveform(_ waveform:Table ){
        modulation.setWaveform(waveform)
    }
    
    func setDryWetMix(_ dryWetMix: AUValue){
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
    
    func setFeedback(milliSecend: AUValue){
        reverb.setFeedback(milliSecend: milliSecend)
    }
    
    func setCutoffFrequency(frequency: AUValue){
        reverb.setCutoffFrequency(frequency: frequency)
    }
    
    func setMix(mix: AUValue){
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
    
    func setTime(milliSecend: AUValue){
        delay.setTime(milliSecend: milliSecend)
    }
    
    func setMix(mixPrecent: AUValue){
        delay.setMix(mixPrecent: mixPrecent)
    }
    
    func setDelayType(_ type:DelaysType){
        delay.setDelayType(type)
    }
    
    func setDelayGain(_ gain:AUValue){
        delay.setGain(gain)
    }
    
    
    // MARK: EQ
    
    func eqOnOff(isOn: Bool){
        isOn ? eq.play() : eq.bypass()
    }
   
    func eqTypePlay(_ eqType:EqType){
        eq.eqTypePlay(eqType)
    }
    
    func eqTypeBypass(_ eqType:EqType){
        eq.eqTypeBypass(eqType)
    }
    
    func setFrequency(eqType:EqType, frequency:AUValue){
        eq.setFrequency(eqType: eqType, frequency: frequency)
    }
    
    func setBandwidth(eqType:EqType, bandwidth:AUValue){
        eq.setBandwidth(eqType: eqType, bandwidth: bandwidth)
    }
    
    func setGain(eqType: EqType, gain: AUValue){
        eq.setGain(eqType: eqType, gain: gain)
    }
    
    func setEqGain(_ gain:AUValue){
        eq.setEqGain(gain)
    }
    
    
    
    
}



/*
 
 https://github.com/AudioKit/DunneAudioKit/wiki/StereoDelay
 
 
 
 
 */
