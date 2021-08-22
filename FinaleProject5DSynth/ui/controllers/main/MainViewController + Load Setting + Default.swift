//
//  MainViewController + Load Setting + Default.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 19/08/2021.
//

import Foundation
import AudioKit

extension MainViewController{
    
    func loadSetting(){

        
        // MARK: General Setting
        
        if let value = generalData?.darkLightMod {
            darkModActivation(num: Int(value))
        }
        
        if let value = generalData?.synthGain {
            mySynth.setVolume(volume: value)
            let vol = String(format: "%.2f", value)
            synthVolumeLabelOutlet.text = "Player\n" + vol
            synthVolumeSliderOutlet.value = value
        }
        
        if let value = generalData?.playbackGain {
            mainAudioMixer.setVolume(value)
            let vol = String(format: "%.2f", value)
            playerVolumeLabelOutlet.text = "Player\n" + vol
            playbackVolumeSliderOutlet.value = value
        }
        
        if let value = generalData?.playbackCountdown {
            playbackIsCountdowning = value
        }
        
        if let value = generalData?.recordCountdown {
            recordIsCountdowning = value
        }
        
        if let value = generalData?.recordPlayback {
            mainAudioMixer.isRecordingPlayback(value)
        }

        if let value = generalData?.synthRecordGain {
            mainAudioMixer.setRecordInputSynthGain(value)
        }
        
        if let value = generalData?.playbackRecordGain {
            mainAudioMixer.setRecordInputPlayerGain(value)
        }
        
        if let value = generalData?.recordInputGain {
            mainAudioMixer.setRecordInputGain(value)
        }
        

        
        
        // MARK: Synths
        
        // Oscillator:
        
        if let value = synthData?.oscAttack {
            mySynth.setAttackDuration(value)
        }
        if let value = synthData?.oscDecay {
            mySynth.setDecayDuration(value)
        }
        if let value = synthData?.oscSustain {
            mySynth.setSustainLevel(value)
        }
        if let value = synthData?.oscRelease {
            mySynth.setReleaseDuration(value)
        }
        
        
        // FmSnyth:
        
        if let value = synthData?.fmSynthAttack {
            mySynth.setAttackDuration(value)
        }
        if let value = synthData?.fmSynthDecay {
            mySynth.setDecayDuration(value)
        }
        if let value = synthData?.fmSynthSustain {
            mySynth.setSustainLevel(value)
        }
        if let value = synthData?.fmSynthRelease {
            mySynth.setReleaseDuration(value)
        }
        if let value = synthData?.carrierMultiplier {
            mySynth.setCarrierMultiplier(value)
        }
        if let value = synthData?.modulatingMultiplier {
            mySynth.setModulatingMultiplier(value)
        }
        if let value = synthData?.modulationIndex {
            mySynth.setModulationIndex(value)
        }
        
        
        // PluckedString:
        
        if let value = synthData?.pluckedStringAttack {
            mySynth.setAttackDuration(value)
        }
        if let value = synthData?.pluckedStringDecay {
            mySynth.setDecayDuration(value)
        }
        if let value = synthData?.pluckedStringSustain {
            mySynth.setSustainLevel(value)
        }
        if let value = synthData?.pluckedStringRelease {
            mySynth.setReleaseDuration(value)
        }
        
        
        // DynamicOscillator:
        
        if let value = synthData?.dynamicOscillatorDecay {
            mySynth.setAttackDuration(value)
        }
        if let value = synthData?.dynamicOscillatorDecay {
            mySynth.setDecayDuration(value)
        }
        if let value = synthData?.dynamicOscillatorSustain {
            mySynth.setSustainLevel(value)
        }
        if let value = synthData?.dynamicOscillatorRelease {
            mySynth.setReleaseDuration(value)
        }
        if let value = synthData?.dynamicOscillatorWaveform {
            mySynth.setDynamicOscillatorWaveform(Float(value))
        }
        if let value = synthData?.doDetuningMultiplier {
            mySynth.setDetuningMultiplier(value)
        }
        if let value = synthData?.detuningOffset {
            mySynth.setDetuningOffset(value)
        }
        if let value = synthData?.doDetuningMultiplier {
            mySynth.setSynthType(type: 3)
            mySynth.setDetuningMultiplier(value)
        }
        
        
        // PwmOscillator:
        
        if let value = synthData?.pwmOscillatorAttack {
            mySynth.setAttackDuration(value)
        }
        if let value = synthData?.pwmOscillatorDecay {
            mySynth.setDecayDuration(value)
        }
        if let value = synthData?.pwmOscillatorSustain {
            mySynth.setSustainLevel(value)
        }
        if let value = synthData?.pwmOscillatorRelease {
            mySynth.setReleaseDuration(value)
        }
        if let value = synthData?.pulseWidth {
            mySynth.setPulseWidth(value)
        }
        if let value = synthData?.pwdDetuningMultiplier {
            mySynth.setSynthType(type: 4)
            mySynth.setDetuningMultiplier(value)
        }
        
        
        // VocalTract:
        
        if let value = synthData?.vocalTractAttacK {
            mySynth.setAttackDuration(value)
        }
        if let value = synthData?.vocalTractDecay {
            mySynth.setDecayDuration(value)
        }
        if let value = synthData?.vocalTractSustain {
            mySynth.setSustainLevel(value)
        }
        if let value = synthData?.vocalTractRelease {
            mySynth.setReleaseDuration(value)
        }
        if let value = synthData?.tonguePosition {
            mySynth.setTonguePosition(value)
        }
        if let value = synthData?.tongueDiameter {
            mySynth.setTongueDiameter(value)
        }
        if let value = synthData?.tenseness {
            mySynth.setTenseness(value)
        }
        if let value = synthData?.nasality {
            mySynth.setNasality(value)
        }
        if let bool = synthData?.randomTonguePosition {
            mySynth.randomTonguePosition(bool)
        }
        
        // MARK: Pitch
        
        if let value = synthData?.hermonizerOnOff {
            mySynth.hermonizerOnOff(value)
        }
        if let value = synthData?.hermonizerGain {
            mySynth.setHermonizerGain(value)
        }
        if let value = synthData?.harmonyFrequency {
            mySynth.setHarmonyFrequency(AUValue(value))
        }
        
        
        // MARK: Distortion
        
        if let value = synthData?.distOnOff {
            mySynth.distOnOff(isOn: value)
        }
        if let value = synthData?.pregain {
            mySynth.setPregain(value)
        }
        if let value = synthData?.postgain {
            mySynth.setPostgain(value)
        }
        if let value = synthData?.negativeShapeParameter {
            mySynth.setNegativeShapeParameter(value)
        }
        if let value = synthData?.positiveShapeParameter {
            mySynth.setPositiveShapeParameter(value)
        }
        
        
        //MARK: Modulation
        
        if let value = synthData?.modOnOff {
            mySynth.modOnOff(isOn: value)
        }
        if let value = synthData?.modDryWetMix {
            mySynth.setModDryWetMix(value)
        }
        if let value = synthData?.modGain {
            mySynth.setModGain(value)
        }
        
        // Chorus
        mySynth.setModulationType(0)
        if let value = synthData?.chorusFrequency {
            mySynth.setModFrequency(value)
        }
        if let value = synthData?.chorusDepth {
            mySynth.setModDepth(value)
        }
        if let value = synthData?.chorusFeedback {
            mySynth.setModFeedback(value)
        }
        
        // Flanger
        mySynth.setModulationType(1)
        if let value = synthData?.flangerFrequency {
            mySynth.setModFrequency(value)
        }
        if let value = synthData?.flangerFeedback {
            mySynth.setModFeedback(value)
        }
        if let value = synthData?.flangerDepth {
            mySynth.setModDepth(value)
        }
        
        // Tremolo
        mySynth.setModulationType(2)
        if let value = synthData?.tremoloFrequency {
            mySynth.setModFrequency(value)
        }
        if let value = synthData?.tremoloDepth {
            mySynth.setModDepth(value)
        }
        if let value = synthData?.tremoloWaveform {
            mySynth.setTremoloWaveform(Float(value))
        }
        
        
        // Mark: Reverb
        
        if let value = synthData?.reverbOnOff {
            mySynth.reverbOnOff(isOn: value)
        }
        if let value = synthData?.reverbCutoffFrequency {
            mySynth.setReverbCutoffFrequency(frequency: value)
        }
        if let value = synthData?.reverbFeedback {
            mySynth.setReverbFeedback(milliSecend: value)
        }
        if let value = synthData?.reverbDryWetMix {
            mySynth.setReverbDryWetMix(mix: value)
        }
        if let value = synthData?.reverbGain {
            mySynth.setReverbGain(value)
        }
        
        
        // Mark: Delay
        
        if let value = synthData?.delayOnOff {
            mySynth.delayOnOff(isOn: value)
        }
        // Variable Delay
        mySynth.setDelayType(0)
        if let value = synthData?.variableDelayFeedback {
            mySynth.setDelayFeedback(feedbackPrecent: value)
        }
        if let value = synthData?.variableDelayTime {
            mySynth.setDelayTime(milliSecend: value)
        }
        if let value = synthData?.variableDelayDryWetMix {
            mySynth.setDelayMix(mixPrecent: value)
        }
        if let value = synthData?.variableDelayGain {
            mySynth.setDelayGain(value)
        }
        
        // Stereo Delay
        mySynth.setDelayType(1)
        if let value = synthData?.stereoDelayFeedback {
            mySynth.setDelayFeedback(feedbackPrecent: value)
        }
        if let value = synthData?.stereoDelayTime {
            mySynth.setDelayTime(milliSecend: value)
        }
        if let value = synthData?.stereoDelayDryWetMix {
            mySynth.setDelayMix(mixPrecent: value)
        }
        if let value = synthData?.stereoDelayGain {
            mySynth.setDelayGain(value)
        }
        
        
        
        // MARK: EQ
        
        if let value = synthData?.eqOnOff {
            mySynth.eqOnOff(isOn: value)
        }
        if let value = synthData?.eqGain {
            mySynth.setEqGain(value)
        }
        
        // High Pass
        mySynth.eqType(0)
        if let onOff = synthData?.highPassOnOff {
            if onOff{
                mySynth.eqTypePlay()
            } else {
                mySynth.eqTypeBypass()
            }
        }
        if let value = synthData?.highPassFrequency {
            mySynth.setEqFrequency(frequency: value)
        }
        // Bass
        mySynth.eqType(1)
        if let onOff = synthData?.bassOnOff {
            if onOff{
                mySynth.eqTypePlay()
            } else {
                mySynth.eqTypeBypass()
            }
        }
        if let value = synthData?.bassFrequency {
            mySynth.setEqFrequency(frequency: value)
        }
        if let value = synthData?.bassBandwidth {
            mySynth.setBandwidth(bandwidth: value)
        }
        if let value = synthData?.bassGain {
            mySynth.setEqTypeGain(gain: value)
        }
        
        // Low Mid
        mySynth.eqType(2)
        if let onOff = synthData?.lowMidOnOff {
            if onOff{
                mySynth.eqTypePlay()
            } else {
                mySynth.eqTypeBypass()
            }
        }
        if let value = synthData?.lowMidFrequency {
            mySynth.setEqFrequency(frequency: value)
        }
        if let value = synthData?.lowMidBandwidth {
            mySynth.setBandwidth(bandwidth: value)
        }
        if let value = synthData?.lowMidGain {
            mySynth.setEqTypeGain(gain: value)
        }
        
        // High Mid
        mySynth.eqType(3)
        if let onOff = synthData?.highMidOnOff {
            if onOff{
                mySynth.eqTypePlay()
            } else {
                mySynth.eqTypeBypass()
            }
        }
        if let value = synthData?.highMidFrequency {
            mySynth.setEqFrequency(frequency: value)
        }
        if let value = synthData?.highMidBandwidth {
            mySynth.setBandwidth(bandwidth: value)
        }
        if let value = synthData?.highMidGain {
            mySynth.setEqTypeGain(gain: value)
        }
        
        // Treble
        mySynth.eqType(4)
        if let onOff = synthData?.trebleOnOff {
            if onOff{
                mySynth.eqTypePlay()
            } else {
                mySynth.eqTypeBypass()
            }
        }
        if let value = synthData?.trebleFrequency {
            mySynth.setEqFrequency(frequency: value)
        }
        if let value = synthData?.trebleBandwidth {
            mySynth.setBandwidth(bandwidth: value)
        }
        if let value = synthData?.trebleGain {
            mySynth.setEqTypeGain(gain: value)
        }
        
        // Low Pass
        mySynth.eqType(5)
        if let onOff = synthData?.lowPassOnOff {
            if onOff{
                mySynth.eqTypePlay()
            } else {
                mySynth.eqTypeBypass()
            }
        }
        if let value = synthData?.lowPassFrequency {
            mySynth.setEqFrequency(frequency: value)
        }
        
        
        // MARK: Types
        
        if let num = synthData?.synthType {
            mySynth.setSynthType(type: Int(num))
        }
        if let num = synthData?.modulationType {
            mySynth.setModulationType(Int(num))
        }
        if let num = synthData?.delayType {
            mySynth.setDelayType(Int(num))
        }
        if let num = synthData?.eqType {
            mySynth.eqType(Int(num))
        }
        
    }
    
}
