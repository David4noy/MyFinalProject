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
    
    static let shared = Synth()
    
    private init() {
        
        synthMixer = SynthMixer()
        synthMixer.setSynthType(.oscillator)
        
        fxMixer = FxMixer(synthMixer.synthDryWet, synthMixer.hermonizerDryWet)
        
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
    
    // MARK: Synth
    
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
    
    func setDryWetMix(_ dryWetMix: AUValue){
        fxMixer.setDryWetMix(dryWetMix)
    }
    
    func modOnOff(isOn: Bool){
        fxMixer.modOnOff(isOn: isOn)
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
    
    
    
}


