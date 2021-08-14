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
        
        mixer.addInput(fx.eq.mixer)
        mixer.addInput(fxOvertone.eq.mixer)
        
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
    
    func setModDepth(_ depth: AUValue){
        fx.setModDepth(depth)
        fxOvertone.setModDepth(depth)
    }
    
    func setModFeedback(_ feedback: AUValue){
        fx.setModFeedback(feedback)
        fxOvertone.setModFeedback(feedback)
    }
    
    func setWaveform(_ waveform:Table ){
        fx.setWaveform(waveform)
        fxOvertone.setWaveform(waveform)
    }
    
    func setModDryWetMix(_ dryWetMix: AUValue){
        fx.setModDryWetMix(dryWetMix)
        fxOvertone.setModDryWetMix(dryWetMix)
    }
    
    func modOnOff(isOn: Bool){
        fx.modOnOff(isOn: isOn)
        fxOvertone.modOnOff(isOn: isOn)
    }
    
    func setModGain(_ gain:AUValue){
        fx.setModGain(gain)
        fxOvertone.setModGain(gain)
    }
    
    
    // MARK: Reverb
    
    func reverbOnOff(isOn: Bool){
        fx.reverbOnOff(isOn: isOn)
        fxOvertone.reverbOnOff(isOn: isOn)
    }
    
    func setReverbFeedback(milliSecend: AUValue){
        fx.setReverbFeedback(milliSecend: milliSecend)
        fxOvertone.setReverbFeedback(milliSecend: milliSecend)
    }
    
    func setReverbCutoffFrequency(frequency: AUValue){
        fx.setReverbCutoffFrequency(frequency: frequency)
        fxOvertone.setReverbCutoffFrequency(frequency: frequency)
    }
    
    func setReverbDryWetMix(mix: AUValue){
        fx.setReverbDryWetMix(mix: mix)
        fxOvertone.setReverbDryWetMix(mix: mix)
    }
    
    func setReverbGain(_ gain:AUValue){
        fx.setReverbGain(gain)
        fxOvertone.setReverbGain(gain)
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
    
    func setDelayTime(milliSecend: AUValue){
        fx.setDelayTime(milliSecend: milliSecend)
        fxOvertone.setDelayTime(milliSecend: milliSecend)
    }
    
    func setDelayMix(mixPrecent: AUValue){
        fx.setDelayMix(mixPrecent: mixPrecent)
        fxOvertone.setDelayMix(mixPrecent: mixPrecent)
    }
    
    func setDelayGain(_ gain:AUValue){
        fx.setDelayGain(gain)
        fxOvertone.setDelayGain(gain)
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
    
    func setEqGain(_ gain:AUValue){
        fx.setEqGain(gain)
        fxOvertone.setEqGain(gain)
    }
    
    
}



