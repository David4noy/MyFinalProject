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
            if let value = synthData?.oscAttack {
                return value
            }
        case .oscDecay:
            if let value = synthData?.oscDecay {
                return value
            }
        case .oscSustain:
            if let value = synthData?.oscSustain {
                return value
            }
        case .oscRelease:
            if let value = synthData?.oscRelease {
                return value
            }
            
            
        // FmSnyth:
        
        case .fmSynthAttack:
            if let value = synthData?.fmSynthAttack {
                return value
            }
        case .fmSynthDecay:
            if let value = synthData?.fmSynthDecay {
                return value
            }
        case .fmSynthSustain:
            if let value = synthData?.fmSynthSustain {
                return value
            }
        case .fmSynthRelease:
            if let value = synthData?.fmSynthRelease {
                return value
            }
        case .carrierMultiplier:
            if let value = synthData?.carrierMultiplier {
                return value
            }
        case .modulatingMultiplier:
            if let value = synthData?.modulatingMultiplier {
                return value
            }
        case .modulationIndex:
            if let value = synthData?.modulationIndex {
                return value
            }
            
            
        // PluckedString:
        
        case .pluckedStringAttack:
            if let value = synthData?.pluckedStringAttack {
                return value
            }
        case .pluckedStringDecay:
            if let value = synthData?.pluckedStringDecay {
                return value
            }
        case .pluckedStringSustain:
            if let value = synthData?.pluckedStringSustain {
                return value
            }
        case .pluckedStringRelease:
            if let value = synthData?.pluckedStringRelease {
                return value
            }
            
            
        // DynamicOscillator:
        
        case .dynamicOscillatorAttack:
            if let value = synthData?.dynamicOscillatorDecay {
                return value
            }
        case .dynamicOscillatorDecay:
            if let value = synthData?.dynamicOscillatorDecay {
                return value
            }
        case .dynamicOscillatorSustain:
            if let value = synthData?.dynamicOscillatorSustain {
                return value
            }
        case .dynamicOscillatorRelease:
            if let value = synthData?.dynamicOscillatorRelease {
                return value
            }
        case .dynamicOscillatorWaveform:
            if let value = synthData?.dynamicOscillatorWaveform {
                return Float(value)
            }
        case .doDetuningMultiplier:
            if let value = synthData?.doDetuningMultiplier {
                return value
            }
        case .detuningOffset:
            if let value = synthData?.detuningOffset {
                return value
            }
        case .detuningMultiplier:
            if let value = synthData?.doDetuningMultiplier {
                return value
            }
            
            
        // PwmOscillator:
        
        case .pwmOscillatorAttack:
            if let value = synthData?.pwmOscillatorAttack {
                return value
            }
        case .pwmOscillatorDecay:
            if let value = synthData?.pwmOscillatorDecay {
                return value
            }
        case .pwmOscillatorSustain:
            if let value = synthData?.pwmOscillatorSustain {
                return value
            }
        case .pwmOscillatorRelease:
            if let value = synthData?.pwmOscillatorRelease {
                return value
            }
        case .pulseWidth:
            if let value = synthData?.pulseWidth {
                return value
            }
        case .pwdDetuningMultiplier:
            if let value = synthData?.pwdDetuningMultiplier {
                return value
            }
            
            
        // VocalTract:
        
        case .vocalTractAttack:
            if let value = synthData?.vocalTractAttacK {
                return value
            }
        case .vocalTractDecay:
            if let value = synthData?.vocalTractDecay {
                return value
            }
        case .vocalTractSustain:
            if let value = synthData?.vocalTractSustain {
                return value
            }
        case .vocalTractRelease:
            if let value = synthData?.vocalTractRelease {
                return value
            }
        case .tonguePosition:
            if let value = synthData?.tonguePosition {
                return value
            }
        case .tongueDiameter:
            if let value = synthData?.tongueDiameter {
                return value
            }
        case .tenseness:
            if let value = synthData?.tenseness {
                return value
            }
        case .nasality:
            if let value = synthData?.nasality {
                return value
            }
            
            
        // MARK: Pitch
        
        case .hermonizerGain:
            if let value = synthData?.hermonizerGain {
                return value
            }
        case .harmonicIntervals:
            if let value = synthData?.harmonyFrequency {
                return Float(value)
            }
            
            
        // MARK: Distortion
        
        case .pregain:
            if let value = synthData?.pregain {
                return value
            }
        case .postgain:
            if let value = synthData?.postgain {
                return value
            }
        case .negativeShapeParameter:
            if let value = synthData?.negativeShapeParameter {
                return value
            }
        case .positiveShapeParameter:
            if let value = synthData?.positiveShapeParameter {
                return value
            }
            
            
        //MARK: Modulation
        
        case .modDryWetMix:
            if let value = synthData?.modDryWetMix {
                return value
            }
        case .modGain:
            if let value = synthData?.modGain {
                return value
            }
            
        // Chorus
        
        case .chorusFrequency:
            if let value = synthData?.chorusFrequency {
                return value
            }
        case .chorusDepth:
            if let value = synthData?.chorusDepth {
                return value
            }
        case .chorusFeedback:
            if let value = synthData?.chorusFeedback {
                return value
            }
            
        // Flanger
        
        case .flangerFrequency:
            if let value = synthData?.flangerFrequency {
                return value
            }
        case .flangerFeedback:
            if let value = synthData?.flangerFeedback {
                return value
            }
        case .flangerDepth:
            if let value = synthData?.flangerDepth {
                return value
            }
            
        // Tremolo
        
        case .tremoloFrequency:
            if let value = synthData?.tremoloFrequency {
                return value
            }
        case .tremoloDepth:
            if let value = synthData?.tremoloDepth {
                return value
            }
        case .tremoloWaveform:
            if let value = synthData?.tremoloWaveform {
                return Float(value)
            }
            
            
        // Mark: Reverb

        
        case .reverbCutoffFrequency:
            if let value = synthData?.reverbCutoffFrequency {
                return value
            }
        case .reverbFeedback:
            if let value = synthData?.reverbFeedback {
                return value
            }
        case .reverbDryWetMix:
            if let value = synthData?.reverbDryWetMix {
                return value
            }
        case .reverbGain:
            if let value = synthData?.reverbGain {
                return value
            }
            
            
            
        // Mark: Delay
        

        case .variableDelayFeedback:
            if let value = synthData?.variableDelayFeedback {
                return value
            }
        case .stereoDelayFeedback:
            if let value = synthData?.stereoDelayFeedback {
                return value
            }
        case .variableDelayTime:
            if let value = synthData?.variableDelayTime {
                return value
            }
        case .stereoDelayTime:
            if let value = synthData?.stereoDelayTime {
                return value
            }
        case .stereoDelayDryWetMix:
            if let value = synthData?.stereoDelayDryWetMix {
                return value
            }
        case .variableDelayDryWetMix:
            if let value = synthData?.variableDelayDryWetMix {
                return value
            }
        case .varibaleDelayGain:
            if let value = synthData?.variableDelayGain {
                return value
            }
        case .stereoDelayGain:
            if let value = synthData?.stereoDelayGain {
                return value
            }
            
            
            
        // Mark: EQ

            
        case .highPassFrequency:
            if let value = synthData?.highPassFrequency {
                return value
            }
        case .bassFrequency:
            if let value = synthData?.bassFrequency {
                return value
            }
        case .lowMidFrequency:
            if let value = synthData?.lowMidFrequency {
                return value
            }
        case .highMidFrequency:
            if let value = synthData?.highMidFrequency {
                return value
            }
        case .trebleFrequency:
            if let value = synthData?.trebleFrequency {
                return value
            }
        case .lowPassFrequency:
            if let value = synthData?.lowPassFrequency {
                return value
            }
        case .bassBandwidth:
            if let value = synthData?.bassBandwidth {
                return value
            }
        case .lowMidBandwidth:
            if let value = synthData?.lowMidBandwidth {
                return value
            }
        case .highMidBandwidth:
            if let value = synthData?.highMidBandwidth {
                return value
            }
        case .trebleBandwidth:
            if let value = synthData?.trebleBandwidth {
                return value
            }
        case .bassGain:
            if let value = synthData?.bassGain {
                return value
            }
        case .lowMidGain:
            if let value = synthData?.lowMidGain {
                return value
            }
        case .highMidGain:
            if let value = synthData?.highMidGain {
                return value
            }
        case .trebleGain:
            if let value = synthData?.trebleGain {
                return value
            }
        case .eqGain:
            if let value = synthData?.eqGain {
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
            if let bool = synthData?.randomTonguePosition {
                return bool
            }
            

        // Mark: EQ
        
 
        case .highPassOnOff:
            if let bool = synthData?.highPassOnOff {
                return bool
            }
        case .bassOnOff:
            if let bool = synthData?.bassOnOff {
                return bool
            }
        case .lowMidOnOff:
            if let bool = synthData?.lowMidOnOff {
                return bool
            }
        case .highMidOnOff:
            if let bool = synthData?.highMidOnOff {
                return bool
            }
        case .trebleOnOff:
            if let bool = synthData?.trebleOnOff {
                return bool
            }
        case .lowPassOnOff:
            if let bool = synthData?.lowPassOnOff {
                return bool
            }
 
        default:
            break
        }
        return false
    }
    
    
    
    
    
}
