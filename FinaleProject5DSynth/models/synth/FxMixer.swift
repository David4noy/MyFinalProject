//
//  FxMixer.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 04/08/2021.
//


import Foundation
import AudioKit
import SoundpipeAudioKit
import DunneAudioKit
import AudioKitEX

class FxMixer{
    
    let fx:EffecetBuilder
    let fxOvertone:EffecetBuilder
    let mixer = Mixer()

  
    init(_ node: Node,_ node2:Node ) {
        

        fx = EffecetBuilder(node)
        fx.modulation.setModulation(.chorus)
        
        fxOvertone = EffecetBuilder(node2)
        fxOvertone.modulation.setModulation(.chorus)
        
        mixer.addInput(fx.eq.dryWetMix)
        mixer.addInput(fxOvertone.eq.dryWetMix)
        
    }
    

    // MARK: Envelope
    
    func noteOn(){
        fx.noteOn()
        fxOvertone.noteOn()
    }
    
    func noteOff(){
        fx.noteOff()
        fxOvertone.noteOff()
    }
    
    func setAttackDuration(_ attackDuration: AUValue){
        fx.setAttackDuration(attackDuration)
        fxOvertone.setAttackDuration(attackDuration)
    }
    
    func setDecayDuration(_ decayDuration:AUValue){
        fx.setDecayDuration(decayDuration)
        fxOvertone.setDecayDuration(decayDuration)
    }
    
    func setSustainLevel(_ sustainLevel:AUValue){
        fx.setSustainLevel(sustainLevel)
        fxOvertone.setSustainLevel(sustainLevel)
    }
    
    func setReleaseDuration(_ releaseDuration:AUValue){
        fx.setReleaseDuration(releaseDuration)
        fxOvertone.setReleaseDuration(releaseDuration)
    }
    
    
    // MARK: Distortion
    
    func distOnOff(isOn: Bool){
        fx.distOnOff(isOn: isOn)
        fxOvertone.distOnOff(isOn: isOn)
    }
    
    func setNegativeShapeParameter(_ negativeShapeParameter:AUValue){
        fx.setNegativeShapeParameter(negativeShapeParameter)
        fxOvertone.setNegativeShapeParameter(negativeShapeParameter)
    }
    
    func setPositiveShapeParameter(_ positiveShapeParameter:AUValue){
        fx.setPositiveShapeParameter(positiveShapeParameter)
        fxOvertone.setPositiveShapeParameter(positiveShapeParameter)
    }
    
    func setPregain(_ pregain:AUValue){
        fx.setPregain(pregain)
        fxOvertone.setPregain(pregain)
    }
    
    func setPostgain(_ postgain:AUValue){
        fx.setPostgain(postgain)
        fxOvertone.setPostgain(postgain)
    }
    
    // MARK: Modulation
    
    func setModulationType(_ type: ModulationType){
        fx.setModulationType(type)
        fxOvertone.setModulationType(type)
    }
    
    func setModFrequency(_ frequency: AUValue){
        fx.setModFrequency(frequency)
        fxOvertone.setModFrequency(frequency)
    }
    
    func setDepth(_ depth: AUValue){
        fx.setDepth(depth)
        fxOvertone.setDepth(depth)
    }
    
    func setFeedback(_ feedback: AUValue){
        fx.setFeedback(feedback)
        fxOvertone.setFeedback(feedback)
    }
    
    func setWaveform(_ waveform:Table ){
        fx.setWaveform(waveform)
        fxOvertone.setWaveform(waveform)
    }
    
    func setDryWetMix(_ dryWetMix: AUValue){
        fx.setDryWetMix(dryWetMix)
        fxOvertone.setDryWetMix(dryWetMix)
    }
    
    func modOnOff(isOn: Bool){
        fx.modOnOff(isOn: isOn)
        fxOvertone.modOnOff(isOn: isOn)
    }
    
    
    // MARK: Reverb
    
    func reverbOnOff(isOn: Bool){
        fx.reverbOnOff(isOn: isOn)
        fxOvertone.reverbOnOff(isOn: isOn)
    }
    
    func setFeedback(milliSecend: AUValue){
        fx.setFeedback(milliSecend: milliSecend)
        fxOvertone.setFeedback(milliSecend: milliSecend)
    }
    
    func setcutoffFrequency(frequency: AUValue){
        fx.setcutoffFrequency(frequency: frequency)
        fxOvertone.setcutoffFrequency(frequency: frequency)
    }
    
    func setMix(mix: AUValue){
        fx.setMix(mix: mix)
        fxOvertone.setMix(mix: mix)
    }
    
    
    // MARK: Delay
    func delayOnOff(isOn: Bool){
        fx.delayOnOff(isOn: isOn)
        fxOvertone.delayOnOff(isOn: isOn)
    }
    
    func setDelayFeedback(feedbackPrecent: AUValue){
        fx.setDelayFeedback(feedbackPrecent: feedbackPrecent)
        fxOvertone.setDelayFeedback(feedbackPrecent: feedbackPrecent)
    }
    
    func setTime(milliSecend: AUValue){
        fx.setTime(milliSecend: milliSecend)
        fxOvertone.setTime(milliSecend: milliSecend)
    }
    
    func setMix(mixPrecent: AUValue){
        fx.setMix(mixPrecent: mixPrecent)
        fxOvertone.setMix(mixPrecent: mixPrecent)
    }
    
    
    // MARK: EQ
    
    func eqOnOff(isOn: Bool){
        fx.eqOnOff(isOn: isOn)
        fxOvertone.eqOnOff(isOn: isOn)
    }

    func eqTypePlay(_ eqType:EqType){
        fx.eqTypePlay(eqType)
        fxOvertone.eqTypePlay(eqType)
    }
    
    func eqTypeBypass(_ eqType:EqType){
        fx.eqTypeBypass(eqType)
        fxOvertone.eqTypeBypass(eqType)
    }
    
    func setEqFrequency(eqType:EqType, frequency:AUValue){
        fx.setFrequency(eqType: eqType, frequency: frequency)
        fxOvertone.setFrequency(eqType: eqType, frequency: frequency)
    }
    
    func setBandwidth(eqType:EqType, bandwidth:AUValue){
        fx.setBandwidth(eqType: eqType, bandwidth: bandwidth)
        fxOvertone.setBandwidth(eqType: eqType, bandwidth: bandwidth)
    }
    
    func setGain(eqType: EqType, gain: AUValue){
        fx.setGain(eqType: eqType, gain: gain)
        fxOvertone.setGain(eqType: eqType, gain: gain)
    }
    
    
    
}



