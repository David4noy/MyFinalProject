//
//  ModelsDetailsTableViewCell + getValue.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 18/08/2021.
//

import AudioKit
import UIKit

extension ModelsDetailsTableViewCell{
    
    func getValue() -> Float{
                
        switch model {
        
        // MARK: Synths
        
        
        // Oscillator:
        
        case .oscAttack:
            if let value = data?.oscAttack {
                return value
            }
        case .oscDecay:
            if let value = data?.oscDecay {
                return value
            }
        case .oscSustain:
            if let value = data?.oscSustain {
                return value
            }
        case .oscRelease:
            if let value = data?.oscRelease {
                return value
            }
            
            
        // FmSnyth:
        
        case .fmSynthAttack:
            if let value = data?.fmSynthAttack {
                return value
            }
        case .fmSynthDecay:
            if let value = data?.fmSynthDecay {
                return value
            }
        case .fmSynthSustain:
            if let value = data?.fmSynthSustain {
                return value
            }
        case .fmSynthRelease:
            if let value = data?.fmSynthRelease {
                return value
            }
        case .carrierMultiplier:
            if let value = data?.carrierMultiplier {
                return value
            }
        case .modulatingMultiplier:
            if let value = data?.modulatingMultiplier {
                return value
            }
        case .modulationIndex:
            if let value = data?.modulationIndex {
                return value
            }
            
            
        // PluckedString:
        
        case .pluckedStringAttack:
            if let value = data?.pluckedStringAttack {
                return value
            }
        case .pluckedStringDecay:
            if let value = data?.pluckedStringDecay {
                return value
            }
        case .pluckedStringSustain:
            if let value = data?.pluckedStringSustain {
                return value
            }
        case .pluckedStringRelease:
            if let value = data?.pluckedStringRelease {
                return value
            }
            
            
        // DynamicOscillator:
        
        case .dynamicOscillatorAttack:
            if let value = data?.dynamicOscillatorDecay {
                return value
            }
        case .dynamicOscillatorDecay:
            if let value = data?.dynamicOscillatorDecay {
                return value
            }
        case .dynamicOscillatorSustain:
            if let value = data?.dynamicOscillatorSustain {
                return value
            }
        case .dynamicOscillatorRelease:
            if let value = data?.dynamicOscillatorRelease {
                return value
            }
        case .dynamicOscillatorWaveform:
            if let value = data?.dynamicOscillatorWaveform {
                return Float(value)
            }
        case .doDetuningMultiplier:
            if let value = data?.doDetuningMultiplier {
                return value
            }
        case .detuningOffset:
            if let value = data?.detuningOffset {
                return value
            }
        case .detuningMultiplier:
            if let value = data?.doDetuningMultiplier {
                return value
            }
            
            
        // PwmOscillator:
        
        case .pwmOscillatorAttack:
            if let value = data?.pwmOscillatorAttack {
                return value
            }
        case .pwmOscillatorDecay:
            if let value = data?.pwmOscillatorDecay {
                return value
            }
        case .pwmOscillatorSustain:
            if let value = data?.pwmOscillatorSustain {
                return value
            }
        case .pwmOscillatorRelease:
            if let value = data?.pwmOscillatorRelease {
                return value
            }
        case .pulseWidth:
            if let value = data?.pulseWidth {
                return value
            }
        case .pwdDetuningMultiplier:
            if let value = data?.pwdDetuningMultiplier {
                return value
            }
            
            
        // VocalTract:
        
        case .vocalTractAttack:
            if let value = data?.vocalTractAttacK {
                return value
            }
        case .vocalTractDecay:
            if let value = data?.vocalTractDecay {
                return value
            }
        case .vocalTractSustain:
            if let value = data?.vocalTractSustain {
                return value
            }
        case .vocalTractRelease:
            if let value = data?.vocalTractRelease {
                return value
            }
        case .tonguePosition:
            if let value = data?.tonguePosition {
                return value
            }
        case .tongueDiameter:
            if let value = data?.tongueDiameter {
                return value
            }
        case .tenseness:
            if let value = data?.tenseness {
                return value
            }
        case .nasality:
            if let value = data?.nasality {
                return value
            }
            
            
        // MARK: Pitch
        
        case .hermonizerGain:
            if let value = data?.hermonizerGain {
                return value
            }
        case .harmonicIntervals:
            if let value = data?.harmonyFrequency {
                return Float(value)
            }
            
            
        // MARK: Distortion
        
        case .pregain:
            if let value = data?.pregain {
                return value
            }
        case .postgain:
            if let value = data?.postgain {
                return value
            }
        case .negativeShapeParameter:
            if let value = data?.negativeShapeParameter {
                return value
            }
        case .positiveShapeParameter:
            if let value = data?.positiveShapeParameter {
                return value
            }
            
            
        //MARK: Modulation
        
        case .modDryWetMix:
            if let value = data?.modDryWetMix {
                return value
            }
        case .modGain:
            if let value = data?.modGain {
                return value
            }
            
        // Chorus
        
        case .chorusFrequency:
            if let value = data?.chorusFrequency {
                return value
            }
        case .chorusDepth:
            if let value = data?.chorusDepth {
                return value
            }
        case .chorusFeedback:
            if let value = data?.chorusFeedback {
                return value
            }
            
        // Flanger
        
        case .flangerFrequency:
            if let value = data?.flangerFrequency {
                return value
            }
        case .flangerFeedback:
            if let value = data?.flangerFeedback {
                return value
            }
        case .flangerDepth:
            if let value = data?.flangerDepth {
                return value
            }
            
        // Tremolo
        
        case .tremoloFrequency:
            if let value = data?.tremoloFrequency {
                return value
            }
        case .tremoloDepth:
            if let value = data?.tremoloDepth {
                return value
            }
        case .tremoloWaveform:
            if let value = data?.tremoloWaveform {
                return Float(value)
            }
            
            
        // Mark: Reverb

        
        case .reverbCutoffFrequency:
            if let value = data?.reverbCutoffFrequency {
                return value
            }
        case .reverbFeedback:
            if let value = data?.reverbFeedback {
                return value
            }
        case .reverbDryWetMix:
            if let value = data?.reverbDryWetMix {
                return value
            }
        case .reverbGain:
            if let value = data?.reverbGain {
                return value
            }
            
            
            
        // Mark: Delay
        

        case .variableDelayFeedback:
            if let value = data?.variableDelayFeedback {
                return value
            }
        case .stereoDelayFeedback:
            if let value = data?.stereoDelayFeedback {
                return value
            }
        case .variableDelayTime:
            if let value = data?.variableDelayTime {
                return value
            }
        case .stereoDelayTime:
            if let value = data?.stereoDelayTime {
                return value
            }
        case .stereoDelayDryWetMix:
            if let value = data?.stereoDelayDryWetMix {
                return value
            }
        case .variableDelayDryWetMix:
            if let value = data?.variableDelayDryWetMix {
                return value
            }
        case .varibaleDelayGain:
            if let value = data?.variableDelayGain {
                return value
            }
        case .stereoDelayGain:
            if let value = data?.stereoDelayGain {
                return value
            }
            
            
            
        // Mark: EQ

            
        case .highPassFrequency:
            if let value = data?.highPassFrequency {
                return value
            }
        case .bassFrequency:
            if let value = data?.bassFrequency {
                return value
            }
        case .lowMidFrequency:
            if let value = data?.lowMidFrequency {
                return value
            }
        case .highMidFrequency:
            if let value = data?.highMidFrequency {
                return value
            }
        case .trebleFrequency:
            if let value = data?.trebleFrequency {
                return value
            }
        case .lowPassFrequency:
            if let value = data?.lowPassFrequency {
                return value
            }
        case .bassBandwidth:
            if let value = data?.bassBandwidth {
                return value
            }
        case .lowMidBandwidth:
            if let value = data?.lowMidBandwidth {
                return value
            }
        case .highMidBandwidth:
            if let value = data?.highMidBandwidth {
                return value
            }
        case .trebleBandwidth:
            if let value = data?.trebleBandwidth {
                return value
            }
        case .bassGain:
            if let value = data?.bassGain {
                return value
            }
        case .lowMidGain:
            if let value = data?.lowMidGain {
                return value
            }
        case .highMidGain:
            if let value = data?.highMidGain {
                return value
            }
        case .trebleGain:
            if let value = data?.trebleGain {
                return value
            }
        case .eqGain:
            if let value = data?.eqGain {
                return value
            }
        default:
            break
        }
        return 0.0
    }
    
    
    func getOnOff() -> Bool{
        
        
        switch model {
        
        // VocalTract:
            
        case .randomTonguePosition:
            if let bool = data?.randomTonguePosition {
                return bool
            }
            

        // Mark: EQ
        
 
        case .highPassOnOff:
            if let bool = data?.highPassOnOff {
                return bool
            }
        case .bassOnOff:
            if let bool = data?.bassOnOff {
                return bool
            }
        case .lowMidOnOff:
            if let bool = data?.lowMidOnOff {
                return bool
            }
        case .highMidOnOff:
            if let bool = data?.highMidOnOff {
                return bool
            }
        case .trebleOnOff:
            if let bool = data?.trebleOnOff {
                return bool
            }
        case .lowPassOnOff:
            if let bool = data?.lowPassOnOff {
                return bool
            }
 
        default:
            break
        }
        return false
    }
    
    
    
    
    
}
