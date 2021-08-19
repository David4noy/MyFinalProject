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
        
        // MARK: Value and Bool
        
        
        // MARK: Synths
        
        // Oscillator:
        
        if let value = data?.oscAttack {
            mySynth.setAttackDuration(value)
        }
        if let value = data?.oscDecay {
            mySynth.setDecayDuration(value)
        }
        if let value = data?.oscSustain {
            mySynth.setSustainLevel(value)
        }
        if let value = data?.oscRelease {
            mySynth.setReleaseDuration(value)
        }
        
        
        // FmSnyth:
        
        if let value = data?.fmSynthAttack {
            mySynth.setAttackDuration(value)
        }
        if let value = data?.fmSynthDecay {
            mySynth.setDecayDuration(value)
        }
        if let value = data?.fmSynthSustain {
            mySynth.setSustainLevel(value)
        }
        if let value = data?.fmSynthRelease {
            mySynth.setReleaseDuration(value)
        }
        if let value = data?.carrierMultiplier {
            mySynth.setCarrierMultiplier(value)
        }
        if let value = data?.modulatingMultiplier {
            mySynth.setModulatingMultiplier(value)
        }
        if let value = data?.modulationIndex {
            mySynth.setModulationIndex(value)
        }
        
        
        // PluckedString:
        
        if let value = data?.pluckedStringAttack {
            mySynth.setAttackDuration(value)
        }
        if let value = data?.pluckedStringDecay {
            mySynth.setDecayDuration(value)
        }
        if let value = data?.pluckedStringSustain {
            mySynth.setSustainLevel(value)
        }
        if let value = data?.pluckedStringRelease {
            mySynth.setReleaseDuration(value)
        }
        
        
        // DynamicOscillator:
        
        if let value = data?.dynamicOscillatorDecay {
            mySynth.setAttackDuration(value)
        }
        if let value = data?.dynamicOscillatorDecay {
            mySynth.setDecayDuration(value)
        }
        if let value = data?.dynamicOscillatorSustain {
            mySynth.setSustainLevel(value)
        }
        if let value = data?.dynamicOscillatorRelease {
            mySynth.setReleaseDuration(value)
        }
        if let value = data?.dynamicOscillatorWaveform {
            mySynth.setDynamicOscillatorWaveform(Float(value))
        }
        if let value = data?.doDetuningMultiplier {
            mySynth.setDetuningMultiplier(value)
        }
        if let value = data?.detuningOffset {
            mySynth.setDetuningOffset(value)
        }
        if let value = data?.doDetuningMultiplier {
            mySynth.setSynthType(type: 3)
            mySynth.setDetuningMultiplier(value)
        }
        
        
        // PwmOscillator:
        
        if let value = data?.pwmOscillatorAttack {
            mySynth.setAttackDuration(value)
        }
        if let value = data?.pwmOscillatorDecay {
            mySynth.setDecayDuration(value)
        }
        if let value = data?.pwmOscillatorSustain {
            mySynth.setSustainLevel(value)
        }
        if let value = data?.pwmOscillatorRelease {
            mySynth.setReleaseDuration(value)
        }
        if let value = data?.pulseWidth {
            mySynth.setPulseWidth(value)
        }
        if let value = data?.pwdDetuningMultiplier {
            mySynth.setSynthType(type: 4)
            mySynth.setDetuningMultiplier(value)
        }
        
        
        // VocalTract:
        
        if let value = data?.vocalTractAttacK {
            mySynth.setAttackDuration(value)
        }
        if let value = data?.vocalTractDecay {
            mySynth.setDecayDuration(value)
        }
        if let value = data?.vocalTractSustain {
            mySynth.setSustainLevel(value)
        }
        if let value = data?.vocalTractRelease {
            mySynth.setReleaseDuration(value)
        }
        if let value = data?.tonguePosition {
            mySynth.setTonguePosition(value)
        }
        if let value = data?.tongueDiameter {
            mySynth.setTongueDiameter(value)
        }
        if let value = data?.tenseness {
            mySynth.setTenseness(value)
        }
        if let value = data?.nasality {
            mySynth.setNasality(value)
        }
        if let bool = data?.randomTonguePosition {
            mySynth.randomTonguePosition(bool)
        }
        
        // MARK: Pitch
        
        if let value = data?.hermonizerOnOff {
            mySynth.hermonizerOnOff(value)
        }
        if let value = data?.hermonizerGain {
            mySynth.setHermonizerGain(value)
        }
        if let value = data?.harmonyFrequency {
            mySynth.setHarmonyFrequency(AUValue(value))
        }
        
        
        // MARK: Distortion
        
        if let value = data?.distOnOff {
            mySynth.distOnOff(isOn: value)
        }
        if let value = data?.pregain {
            mySynth.setPregain(value)
        }
        if let value = data?.postgain {
            mySynth.setPostgain(value)
        }
        if let value = data?.negativeShapeParameter {
            mySynth.setNegativeShapeParameter(value)
        }
        if let value = data?.positiveShapeParameter {
            mySynth.setPositiveShapeParameter(value)
        }
        
        
        //MARK: Modulation
        
        if let value = data?.modOnOff {
            mySynth.modOnOff(isOn: value)
        }
        if let value = data?.modDryWetMix {
            mySynth.setModDryWetMix(value)
        }
        if let value = data?.modGain {
            mySynth.setModGain(value)
        }
        
        // Chorus
        mySynth.setModulationType(0)
        if let value = data?.chorusFrequency {
            mySynth.setModFrequency(value)
        }
        if let value = data?.chorusDepth {
            mySynth.setModDepth(value)
        }
        if let value = data?.chorusFeedback {
            mySynth.setModFeedback(value)
        }
        
        // Flanger
        mySynth.setModulationType(1)
        if let value = data?.flangerFrequency {
            mySynth.setModFrequency(value)
        }
        if let value = data?.flangerFeedback {
            mySynth.setModFeedback(value)
        }
        if let value = data?.flangerDepth {
            mySynth.setModDepth(value)
        }
        
        // Tremolo
        mySynth.setModulationType(2)
        if let value = data?.tremoloFrequency {
            mySynth.setModFrequency(value)
        }
        if let value = data?.tremoloDepth {
            mySynth.setModDepth(value)
        }
        if let value = data?.tremoloWaveform {
            mySynth.setTremoloWaveform(Float(value))
        }
        
        
        // Mark: Reverb
        
        if let value = data?.reverbOnOff {
            mySynth.reverbOnOff(isOn: value)
        }
        if let value = data?.reverbCutoffFrequency {
            mySynth.setReverbCutoffFrequency(frequency: value)
        }
        if let value = data?.reverbFeedback {
            mySynth.setReverbFeedback(milliSecend: value)
        }
        if let value = data?.reverbDryWetMix {
            mySynth.setReverbDryWetMix(mix: value)
        }
        if let value = data?.reverbGain {
            mySynth.setReverbGain(value)
        }
        
        
        // Mark: Delay
        
        if let value = data?.delayOnOff {
            mySynth.delayOnOff(isOn: value)
        }
        // Variable Delay
        mySynth.setDelayType(0)
        if let value = data?.variableDelayFeedback {
            mySynth.setDelayFeedback(feedbackPrecent: value)
        }
        if let value = data?.variableDelayTime {
            mySynth.setDelayTime(milliSecend: value)
        }
        if let value = data?.variableDelayDryWetMix {
            mySynth.setDelayMix(mixPrecent: value)
        }
        if let value = data?.variableDelayGain {
            mySynth.setDelayGain(value)
        }
        
        // Stereo Delay
        mySynth.setDelayType(1)
        if let value = data?.stereoDelayFeedback {
            mySynth.setDelayFeedback(feedbackPrecent: value)
        }
        if let value = data?.stereoDelayTime {
            mySynth.setDelayTime(milliSecend: value)
        }
        if let value = data?.stereoDelayDryWetMix {
            mySynth.setDelayMix(mixPrecent: value)
        }
        if let value = data?.stereoDelayGain {
            mySynth.setDelayGain(value)
        }
        
        
        
        // MARK: EQ
        
        if let value = data?.eqOnOff {
            mySynth.eqOnOff(isOn: value)
        }
        if let value = data?.eqGain {
            mySynth.setEqGain(value)
        }
        
        // High Pass
        mySynth.eqType(0)
        if let onOff = data?.highPassOnOff {
            if onOff{
                mySynth.eqTypePlay()
            } else {
                mySynth.eqTypeBypass()
            }
        }
        if let value = data?.highPassFrequency {
            mySynth.setEqFrequency(frequency: value)
        }
        // Bass
        mySynth.eqType(1)
        if let onOff = data?.bassOnOff {
            if onOff{
                mySynth.eqTypePlay()
            } else {
                mySynth.eqTypeBypass()
            }
        }
        if let value = data?.bassFrequency {
            mySynth.setEqFrequency(frequency: value)
        }
        if let value = data?.bassBandwidth {
            mySynth.setBandwidth(bandwidth: value)
        }
        if let value = data?.bassGain {
            mySynth.setEqTypeGain(gain: value)
        }
        
        // Low Mid
        mySynth.eqType(2)
        if let onOff = data?.lowMidOnOff {
            if onOff{
                mySynth.eqTypePlay()
            } else {
                mySynth.eqTypeBypass()
            }
        }
        if let value = data?.lowMidFrequency {
            mySynth.setEqFrequency(frequency: value)
        }
        if let value = data?.lowMidBandwidth {
            mySynth.setBandwidth(bandwidth: value)
        }
        if let value = data?.lowMidGain {
            mySynth.setEqTypeGain(gain: value)
        }
        
        // High Mid
        mySynth.eqType(3)
        if let onOff = data?.highMidOnOff {
            if onOff{
                mySynth.eqTypePlay()
            } else {
                mySynth.eqTypeBypass()
            }
        }
        if let value = data?.highMidFrequency {
            mySynth.setEqFrequency(frequency: value)
        }
        if let value = data?.highMidBandwidth {
            mySynth.setBandwidth(bandwidth: value)
        }
        if let value = data?.highMidGain {
            mySynth.setEqTypeGain(gain: value)
        }
        
        // Treble
        mySynth.eqType(4)
        if let onOff = data?.trebleOnOff {
            if onOff{
                mySynth.eqTypePlay()
            } else {
                mySynth.eqTypeBypass()
            }
        }
        if let value = data?.trebleFrequency {
            mySynth.setEqFrequency(frequency: value)
        }
        if let value = data?.trebleBandwidth {
            mySynth.setBandwidth(bandwidth: value)
        }
        if let value = data?.trebleGain {
            mySynth.setEqTypeGain(gain: value)
        }
        
        // Low Pass
        mySynth.eqType(5)
        if let onOff = data?.lowPassOnOff {
            if onOff{
                mySynth.eqTypePlay()
            } else {
                mySynth.eqTypeBypass()
            }
        }
        if let value = data?.lowPassFrequency {
            mySynth.setEqFrequency(frequency: value)
        }
        
        
        // MARK: Types
        
        if let num = data?.synthType {
            mySynth.setSynthType(type: Int(num))
        }
        if let num = data?.modulationType {
            mySynth.setModulationType(Int(num))
        }
        if let num = data?.delayType {
            mySynth.setDelayType(Int(num))
        }
        if let num = data?.eqType {
            mySynth.eqType(Int(num))
        }
        
    }
    
    
    func loadDefaultSetting(){
        
        
        
    }
    
}
