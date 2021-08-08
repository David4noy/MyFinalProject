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
    let engine = AudioEngine()
    let fader:Fader
//    let recorder:NodeRecorder
    
    static let shared = Synth()
    
    private init() {
        
        synthMixer = SynthMixer()
        
        fxMixer = FxMixer(synthMixer.synthDryWet, synthMixer.hermonizerFader)
        
        fader = Fader(fxMixer.mixer)
        
        engine.output = fader
        
        fader.gain = 0.5
        
        do {
            try engine.start()
            print("engine started")
        } catch {
            print(error, "Field")
        }
        
    }
}

extension Synth{
    
    // MARK: Synths
    
    func overtoneMixChange(mix: AUValue){
        synthMixer.overtoneMixChange(mix)
    }
    
    func setVolume(volume: AUValue){
        fader.gain = volume
    }
    
    func setSynthType(type: ChooseSynth){
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
    
    func randomTonguePosition(){
        synthMixer.randomTonguePosition()
    }
    // MARK: Synth End

    
    // MARK: Envelope
    
    func noteOn(){
        fxMixer.noteOn()
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
    
    // MARK: Hermonizer
    
    func hermonizerOnOff(_ isOn: Bool){
        synthMixer.hermonizerOnOff(isOn)
    }
    
    func setHarmonyFrequency(_ harmonicIntervals: HarmonicIntervals ){
        synthMixer.setHarmonyFrequency(harmonicIntervals)
    }
    
    func setHermonizerGain(_ gain:AUValue){
        synthMixer.setHermonizerGain(gain)
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
    
    func setModulationType(_ type: ModulationType){
        fxMixer.setModulationType(type)
    }
    
    func setModFrequency(_ frequency: AUValue){
        fxMixer.setModFrequency(frequency)
    }
    
    func setDepth(_ depth: AUValue){
        fxMixer.setDepth(depth)
    }
    
    func setFeedback(_ feedback: AUValue){
        fxMixer.setFeedback(feedback)
    }
    
    func setTremoloWaveform(_ waveform:Table ){
        fxMixer.setWaveform(waveform)
    }
    
    func setDryWetMix(_ dryWetMix: AUValue){
        fxMixer.setDryWetMix(dryWetMix)
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
    
    func setFeedback(milliSecend: AUValue){
        fxMixer.setFeedback(milliSecend: milliSecend)
    }
    
    func setcutoffFrequency(frequency: AUValue){
        fxMixer.setcutoffFrequency(frequency: frequency)
    }
    
    func setMix(mix: AUValue){
        fxMixer.setMix(mix: mix)
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
    
    func setTime(milliSecend: AUValue){
        fxMixer.setTime(milliSecend: milliSecend)
    }
    
    func setMix(mixPrecent: AUValue){
        fxMixer.setMix(mixPrecent: mixPrecent)
    }
    
    func setDelayGain(_ gain:AUValue){
        fxMixer.setDelayGain(gain)
    }
    
    // MARK: EQ
    
    func eqOnOff(isOn: Bool){
        fxMixer.eqOnOff(isOn: isOn)
    }

    func eqTypePlay(_ eqType:EqType){
        fxMixer.eqTypePlay(eqType)
    }
    
    func eqTypeBypass(_ eqType:EqType){
        fxMixer.eqTypeBypass(eqType)
    }
    
    func setEqFrequency(eqType:EqType, frequency:AUValue){
        fxMixer.setEqFrequency(eqType: eqType, frequency: frequency)
    }
    
    func setBandwidth(eqType:EqType, bandwidth:AUValue){
        fxMixer.setBandwidth(eqType: eqType, bandwidth: bandwidth)
    }
    
    func setGain(eqType: EqType, gain: AUValue){
        fxMixer.setGain(eqType: eqType, gain: gain)
    }
    
    func setEqGain(_ gain:AUValue){
        fxMixer.setEqGain(gain)
    }
    
}


