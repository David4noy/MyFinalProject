//
//  Synth.swift
//  FirstSynth
//
//  Created by דוד נוי on 11/07/2021.
//

import Foundation
import AudioKit
import SoundpipeAudioKit
import DunneAudioKit
import AudioKitEX

class Synth{
    
    let synthMixer:SynthMixer
    let fxMixer:FxMixer
    let synthFader:Fader
    
    static let shared = Synth()
    
    private init() {
        
        synthMixer = SynthMixer()
        fxMixer = FxMixer(synthMixer.synthDryWet, synthMixer.hermonizerFader)
        
        synthFader = Fader(fxMixer.mixer)
        synthFader.gain = 0.5
        
        setSynthType(type: 0)
        
        hermonizerOnOff(false)
    }
}

extension Synth{
    
    // MARK: Synths
    
    func overtoneMixChange(mix: AUValue){
        synthMixer.overtoneMixChange(mix)
    }
    
    func setVolume(volume: AUValue){
        synthFader.gain = volume
    }
    
    func setSynthType(type: Int){
        synthMixer.setSynthType(type)
    }
    
    
    func setNoteFrequency(_ frequency: AUValue){
        synthMixer.setNoteFrequency(frequency)
    }
    
    // MARK: FmSynth
    
    func setCarrierMultiplier(_ carrierMultiplier:AUValue){
        synthMixer.setCarrierMultiplier(carrierMultiplier)
    }
    
    func setModulatingMultiplier(_ modulatingMultiplier:AUValue){
        synthMixer.setModulatingMultiplier(modulatingMultiplier)
    }
    
    func setModulationIndex(_ modulationIndex:AUValue){
        synthMixer.setModulationIndex(modulationIndex)
    }
    
    // MARK: DynamicOscillator
    
    func setDetuningOffset(_ detuningOffset:AUValue){
        synthMixer.setDetuningOffset(detuningOffset)
    }
    
    func setDynamicOscillatorWaveform(_ waveform:Table){
        synthMixer.setWaveform(waveform)
    }
    
    // both
    func setDetuningMultiplier(_ detuningMultiplier:AUValue){
        synthMixer.setDetuningMultiplier(detuningMultiplier)
    }
    
    // MARK: PwmOscillator
    
    func setPulseWidth(_ pulseWidth:AUValue){
        synthMixer.setPulseWidth(pulseWidth)
    }
    
    // MARK: VocalTract
    
    func setTonguePosition(_ tonguePosition:AUValue){
        synthMixer.setTonguePosition(tonguePosition)
    }
    
    func setTongueDiameter(_ tongueDiameter:AUValue){
        synthMixer.setTongueDiameter(tongueDiameter)
    }
    
    func setTenseness(_ tenseness:AUValue){
        synthMixer.setTenseness(tenseness)
    }
    
    func setNasality(_ nasality:AUValue){
        synthMixer.setNasality(nasality)
    }
    
    func randomTonguePosition(_ isOn:Bool){
        synthMixer.randomTonguePosition(isOn)
    }

    
    // MARK: Hermonizer
    
    func hermonizerOnOff(_ isOn: Bool){
        synthMixer.hermonizerOnOff(isOn)
    }
    
    func setHarmonyFrequency(_ harmonicIntervals: AUValue ){
        synthMixer.setHarmonyFrequency(harmonicIntervals)
    }
    
    func setHermonizerGain(_ gain:AUValue){
        synthMixer.setHermonizerGain(gain)
    }
    
    
    // MARK: PluckedString
    
    func triggerPluckedString(){
        synthMixer.triggerPluckedString()
    }
    
    
    // MARK: Synth End //
    
    
    // MARK: Envelope
    
    func noteOn(){
        fxMixer.noteOn()
        triggerPluckedString()
 
    }
    
    func noteOff(){
        fxMixer.noteOff()
    }
    
    func setAttackDuration(_ attackDuration: AUValue){
        fxMixer.setAttackDuration(attackDuration)
    }
    
    func setDecayDuration(_ decayDuration:AUValue){
        fxMixer.setDecayDuration(decayDuration)
    }
    
    func setSustainLevel(_ sustainLevel:AUValue){
        fxMixer.setSustainLevel(sustainLevel)
    }
    
    func setReleaseDuration(_ releaseDuration:AUValue){
        fxMixer.setReleaseDuration(releaseDuration)
    }

    
    // MARK: Distortion
    
    func distOnOff(isOn: Bool){
        fxMixer.distOnOff(isOn: isOn)
    }
    
    func setNegativeShapeParameter(_ negativeShapeParameter:AUValue){
        fxMixer.setNegativeShapeParameter(negativeShapeParameter)
    }
    
    func setPositiveShapeParameter(_ positiveShapeParameter:AUValue){
        fxMixer.setPositiveShapeParameter(positiveShapeParameter)
    }
    
    func setPregain(_ pregain:AUValue){
        fxMixer.setPregain(pregain)
    }
    
    func setPostgain(_ postgain:AUValue){
        fxMixer.setPostgain(postgain)
    }
    
    // MARK: Modulation
    
    func setModulationType(_ type: Int){
        fxMixer.setModulationType(type)
    }
    
    func setModFrequency(_ frequency: AUValue){
        fxMixer.setModFrequency(frequency)
    }
    
    func setModDepth(_ depth: AUValue){
        fxMixer.setModDepth(depth)
    }
    
    func setModFeedback(_ feedback: AUValue){
        fxMixer.setModFeedback(feedback)
    }
    
    func setTremoloWaveform(_ waveform:Table ){
        fxMixer.setWaveform(waveform)
    }
    
    func setModDryWetMix(_ dryWetMix: AUValue){
        fxMixer.setModDryWetMix(dryWetMix)
    }
    
    func modOnOff(isOn: Bool){
        fxMixer.modOnOff(isOn: isOn)
    }
    
    func setModGain(_ gain:AUValue){
        fxMixer.setModGain(gain)
    }
    
    
    // MARK: Reverb
    
    func reverbOnOff(isOn: Bool){
        fxMixer.reverbOnOff(isOn: isOn)
    }
    
    func setReverbFeedback(milliSecend: AUValue){
        fxMixer.setReverbFeedback(milliSecend: milliSecend)
    }
    
    func setReverbCutoffFrequency(frequency: AUValue){
        fxMixer.setReverbCutoffFrequency(frequency: frequency)
    }
    
    func setReverbDryWetMix(mix: AUValue){
        fxMixer.setReverbDryWetMix(mix: mix)
    }
    
    func setReverbGain(_ gain:AUValue){
        fxMixer.setReverbGain(gain)
    }
    
    
    // MARK: Delay
    func delayOnOff(isOn: Bool){
        fxMixer.delayOnOff(isOn: isOn)
    }
    
    func setDelayFeedback(feedbackPrecent: AUValue){
        fxMixer.setDelayFeedback(feedbackPrecent: feedbackPrecent)
    }
    
    func setDelayTime(milliSecend: AUValue){
        fxMixer.setDelayTime(milliSecend: milliSecend)
    }
    
    func setDelayMix(mixPrecent: AUValue){
        fxMixer.setDelayMix(mixPrecent: mixPrecent)
    }
    
    func setDelayGain(_ gain:AUValue){
        fxMixer.setDelayGain(gain)
    }
    
    func setDelayType(_ type:Int){
        fxMixer.setDelayType(type)
    }
    
    
    // MARK: EQ
    
    func eqOnOff(isOn: Bool){
        fxMixer.eqOnOff(isOn: isOn)
    }

    func eqTypePlay(){
        fxMixer.eqTypePlay()
    }
    
    func eqTypeBypass(){
        fxMixer.eqTypeBypass()
    }
    
    func setEqFrequency(frequency:AUValue){
        fxMixer.setEqFrequency(frequency: frequency)
    }
    
    func setBandwidth(bandwidth:AUValue){
        fxMixer.setBandwidth(bandwidth: bandwidth)
    }
    
    func setEqTypeGain(gain: AUValue){
        fxMixer.setEqTypeGain(gain: gain)
    }
    
    func setEqGain(_ gain:AUValue){
        fxMixer.setEqGain(gain)
    }
    
    func eqType(_ type:Int){
        fxMixer.eqType(type)
    }
    
}


