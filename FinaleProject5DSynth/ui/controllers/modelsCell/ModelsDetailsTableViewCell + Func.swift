//
//  ModelsDetailsTableViewCell + Func.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 15/08/2021.
//
import AudioKit
import UIKit

extension ModelsDetailsTableViewCell{
    
    
    func setValue(value:AUValue, onOff:Bool){
        
        switch model {
        
        // MARK: Synths
        
        case .synthType:
            break
            
            
        // Oscillator:
        
        case .oscAttack:
            mySynth.setAttackDuration(value)
            synthData?.oscAttack = value
        case .oscDecay:
            mySynth.setDecayDuration(value)
            synthData?.oscDecay = value
        case .oscSustain:
            mySynth.setSustainLevel(value)
            synthData?.oscSustain = value
        case .oscRelease:
            mySynth.setReleaseDuration(value)
            synthData?.oscRelease = value
            
            
        // FmSnyth:
        
        case .fmSynthAttack:
            mySynth.setAttackDuration(value)
            synthData?.fmSynthAttack = value
        case .fmSynthDecay:
            mySynth.setDecayDuration(value)
            synthData?.fmSynthDecay = value
        case .fmSynthSustain:
            mySynth.setSustainLevel(value)
            synthData?.fmSynthSustain = value
        case .fmSynthRelease:
            mySynth.setReleaseDuration(value)
            synthData?.fmSynthRelease = value
        case .carrierMultiplier:
            mySynth.setCarrierMultiplier(value)
            synthData?.carrierMultiplier = value
        case .modulatingMultiplier:
            mySynth.setModulatingMultiplier(value)
            synthData?.modulatingMultiplier = value
        case .modulationIndex:
            mySynth.setModulationIndex(value)
            synthData?.modulationIndex = value
            
            
        // PluckedString:
        
        case .pluckedStringAttack:
            mySynth.setAttackDuration(value)
            synthData?.pluckedStringAttack = value
        case .pluckedStringDecay:
            mySynth.setDecayDuration(value)
            synthData?.pluckedStringDecay = value
        case .pluckedStringSustain:
            mySynth.setSustainLevel(value)
            synthData?.pluckedStringSustain = value
        case .pluckedStringRelease:
            mySynth.setReleaseDuration(value)
            synthData?.pluckedStringRelease = value
            
            
        // DynamicOscillator:
        
        case .dynamicOscillatorAttack:
            mySynth.setAttackDuration(value)
            synthData?.dynamicOscillatorAttack = value
        case .dynamicOscillatorDecay:
            mySynth.setDecayDuration(value)
            synthData?.dynamicOscillatorDecay = value
        case .dynamicOscillatorSustain:
            mySynth.setSustainLevel(value)
            synthData?.dynamicOscillatorSustain = value
        case .dynamicOscillatorRelease:
            mySynth.setReleaseDuration(value)
            synthData?.dynamicOscillatorRelease = value
        case .dynamicOscillatorWaveform:
            mySynth.setDynamicOscillatorWaveform(value)
            setWaveformToLabel(value)
            synthData?.dynamicOscillatorWaveform = Int64(value)
        case .doDetuningMultiplier:
            mySynth.setDetuningMultiplier(value)
            synthData?.doDetuningMultiplier = value
        case .detuningOffset:
            mySynth.setDetuningOffset(value)
            synthData?.detuningOffset = value
        case .detuningMultiplier:
            mySynth.setDetuningMultiplier(value)
            synthData?.doDetuningMultiplier = value
            
            
        // PwmOscillator:
        
        case .pwmOscillatorAttack:
            mySynth.setAttackDuration(value)
            synthData?.pwmOscillatorAttack = value
        case .pwmOscillatorDecay:
            mySynth.setDecayDuration(value)
            synthData?.pwmOscillatorDecay = value
        case .pwmOscillatorSustain:
            mySynth.setSustainLevel(value)
            synthData?.pwmOscillatorSustain = value
        case .pwmOscillatorRelease:
            mySynth.setReleaseDuration(value)
            synthData?.pwmOscillatorRelease = value
        case .pulseWidth:
            mySynth.setPulseWidth(value)
            synthData?.pulseWidth = value
        case .pwdDetuningMultiplier:
            mySynth.setDetuningMultiplier(value)
            synthData?.pwdDetuningMultiplier = value

            
        // VocalTract:
        
        case .vocalTractAttack:
            mySynth.setAttackDuration(value)
            synthData?.vocalTractAttacK = value
        case .vocalTractDecay:
            mySynth.setDecayDuration(value)
            synthData?.vocalTractDecay = value
        case .vocalTractSustain:
            mySynth.setSustainLevel(value)
            synthData?.vocalTractSustain = value
        case .vocalTractRelease:
            mySynth.setReleaseDuration(value)
            synthData?.vocalTractRelease = value
        case .tonguePosition:
            mySynth.setTonguePosition(value)
            synthData?.tonguePosition = value
        case .tongueDiameter:
            mySynth.setTongueDiameter(value)
            synthData?.tongueDiameter = value
        case .tenseness:
            mySynth.setTenseness(value)
            synthData?.tenseness = value
        case .nasality:
            mySynth.setNasality(value)
            synthData?.nasality = value
        case .randomTonguePosition:
            if value > 0 {
                mySynth.randomTonguePosition(true)
                synthData?.randomTonguePosition = true
            } else {
                mySynth.randomTonguePosition(false)
                synthData?.randomTonguePosition = false
            }
            
            
        // MARK: Pitch
        
        case .hermonizerOnOff:
            break
        case .harmonyFrequency:
            break
        case .hermonizerGain:
            mySynth.setHermonizerGain(value)
            synthData?.hermonizerGain = value
        case .harmonicIntervals:
            mySynth.setHarmonyFrequency(value)
            synthData?.harmonyFrequency = Int64(value)
         
            
        // MARK: Distortion
        
        case .pregain:
            mySynth.setPregain(value)
            synthData?.pregain = value
        case .postgain:
            mySynth.setPostgain(value)
            synthData?.postgain = value
        case .distOnOff:
            break
        case .negativeShapeParameter:
            mySynth.setNegativeShapeParameter(value)
            synthData?.negativeShapeParameter = value
        case .positiveShapeParameter:
            mySynth.setPositiveShapeParameter(value)
            synthData?.positiveShapeParameter = value

            
        //MARK: Modulation
            
        case .modulationType:
            break
        case .modOnOff:
            break
        case .modDryWetMix:
            mySynth.setModDryWetMix(value)
            synthData?.modDryWetMix = value
        case .modGain:
            mySynth.setModGain(value)
            synthData?.modGain = value
            
        // Chorus
        
        case .chorusFrequency:
            mySynth.setModFrequency(value)
            synthData?.chorusFrequency = value
        case .chorusDepth:
            mySynth.setModDepth(value)
            synthData?.chorusDepth = value
        case .chorusFeedback:
            mySynth.setModFeedback(value)
            synthData?.chorusFeedback = value
            
        // Flanger
        
        case .flangerFrequency:
            mySynth.setModFrequency(value)
            synthData?.flangerFrequency = value
        case .flangerFeedback:
            mySynth.setModFeedback(value)
            synthData?.flangerFeedback = value
        case .flangerDepth:
            mySynth.setModDepth(value)
            synthData?.flangerDepth = value
            
        // Tremolo
        
        case .tremoloFrequency:
            mySynth.setModFrequency(value)
            synthData?.tremoloFrequency = value
        case .tremoloDepth:
            mySynth.setModDepth(value)
            synthData?.tremoloDepth = value
        case .tremoloWaveform:
            mySynth.setTremoloWaveform(value)
            setWaveformToLabel(value)
            synthData?.tremoloWaveform = Int64(value)
            
            
            
        // Mark: Reverb
            
        case .reverbOnOff:
            break
        case .reverbCutoffFrequency:
            mySynth.setReverbCutoffFrequency(frequency: value)
            synthData?.reverbCutoffFrequency = value
        case .reverbFeedback:
            mySynth.setReverbFeedback(milliSecend: value)
            synthData?.reverbFeedback = value
        case .reverbDryWetMix:
            mySynth.setReverbDryWetMix(mix: value)
            synthData?.reverbDryWetMix = value
        case .reverbGain:
            mySynth.setReverbGain(value)
            synthData?.reverbGain = value
            
            
            
        // Mark: Delay
        
        case .delayOnOff:
            break
        case .variableDelayFeedback:
            mySynth.setDelayFeedback(feedbackPrecent: value)
            synthData?.variableDelayFeedback = value
        case .stereoDelayFeedback:
            mySynth.setDelayFeedback(feedbackPrecent: value)
            synthData?.stereoDelayFeedback = value
        case .variableDelayTime:
            mySynth.setDelayTime(milliSecend: value)
            synthData?.variableDelayTime = value
        case .stereoDelayTime:
            mySynth.setDelayTime(milliSecend: value)
            synthData?.stereoDelayTime = value
        case .delayType:
            break
        case .stereoDelayDryWetMix:
            mySynth.setDelayMix(mixPrecent: value)
            synthData?.stereoDelayDryWetMix = value
        case .variableDelayDryWetMix:
            mySynth.setDelayMix(mixPrecent: value)
            synthData?.variableDelayDryWetMix = value
        case .varibaleDelayGain:
            mySynth.setDelayGain(value)
            synthData?.variableDelayGain = value
        case .stereoDelayGain:
            mySynth.setDelayGain(value)
            synthData?.stereoDelayGain = value

            
            
        // Mark: EQ
        
        case .eqOnOff:
            break
        case .eqType:
            break
        case .highPassOnOff:
            if onOff{
                mySynth.eqTypePlay()
                synthData?.highPassOnOff = true
            } else {
                mySynth.eqTypeBypass()
                synthData?.highPassOnOff = false
            }
        case .bassOnOff:
            if onOff{
                mySynth.eqTypePlay()
                synthData?.bassOnOff = true
            } else {
                mySynth.eqTypeBypass()
                synthData?.bassOnOff = false
            }
        case .lowMidOnOff:
            if onOff{
                mySynth.eqTypePlay()
                synthData?.lowMidOnOff = true
            } else {
                mySynth.eqTypeBypass()
                synthData?.lowMidOnOff = false
            }
        case .highMidOnOff:
            if onOff{
                mySynth.eqTypePlay()
                synthData?.highMidOnOff = true
            } else {
                mySynth.eqTypeBypass()
                synthData?.highMidOnOff = false
            }
        case .trebleOnOff:
            if onOff{
                mySynth.eqTypePlay()
                synthData?.trebleOnOff = true
            } else {
                mySynth.eqTypeBypass()
                synthData?.trebleOnOff = false
            }
        case .lowPassOnOff:
            if onOff{
                mySynth.eqTypePlay()
                synthData?.lowPassOnOff = true
            } else {
                mySynth.eqTypeBypass()
                synthData?.lowPassOnOff = false
            }
        case .highPassFrequency:
            mySynth.setEqFrequency(frequency: value)
            synthData?.highPassFrequency = value
        case .bassFrequency:
            mySynth.setEqFrequency(frequency: value)
            synthData?.bassFrequency = value
        case .lowMidFrequency:
            mySynth.setEqFrequency(frequency: value)
            synthData?.lowMidFrequency = value
        case .highMidFrequency:
            mySynth.setEqFrequency(frequency: value)
            synthData?.highMidFrequency = value
        case .trebleFrequency:
            mySynth.setEqFrequency(frequency: value)
            synthData?.trebleFrequency = value
        case .lowPassFrequency:
            mySynth.setEqFrequency(frequency: value)
            synthData?.lowPassFrequency = value
        case .bassBandwidth:
            mySynth.setBandwidth(bandwidth: value)
            synthData?.bassBandwidth = value
        case .lowMidBandwidth:
            mySynth.setBandwidth(bandwidth: value)
            synthData?.lowMidBandwidth = value
        case .highMidBandwidth:
            mySynth.setBandwidth(bandwidth: value)
            synthData?.highMidBandwidth = value
        case .trebleBandwidth:
            mySynth.setBandwidth(bandwidth: value)
            synthData?.trebleBandwidth = value
        case .bassGain:
            mySynth.setEqTypeGain(gain: value)
            synthData?.bassGain = value
        case .lowMidGain:
            mySynth.setEqTypeGain(gain: value)
            synthData?.lowMidGain = value
        case .highMidGain:
            mySynth.setEqTypeGain(gain: value)
            synthData?.highMidGain = value
        case .trebleGain:
            mySynth.setEqTypeGain(gain: value)
            synthData?.trebleGain = value
        case .eqGain:
            mySynth.setEqGain(value)
            synthData?.eqGain = value
        }
        
        save.saveContext()
        
    }
    
    func setWaveformToLabel(_ value:AUValue){
        
        switch value {
        case 0:
            waveform = TableToStrnig.sine.rawValue
        case 1:
            waveform = TableToStrnig.triangle.rawValue
        case 2:
            waveform = TableToStrnig.square.rawValue
        case 3:
            waveform = TableToStrnig.sawtooth.rawValue
        case 4:
            waveform = TableToStrnig.reverseSawtooth.rawValue
        case 5:
            waveform = TableToStrnig.positiveSine.rawValue
        case 6:
            waveform = TableToStrnig.positiveTriangle.rawValue
        case 7:
            waveform = TableToStrnig.positiveSquare.rawValue
        case 8:
            waveform = TableToStrnig.positiveSawtooth.rawValue
        case 9:
            waveform = TableToStrnig.positiveReverseSawtooth.rawValue
        default:
            waveform = TableToStrnig.sine.rawValue
        }
    }
    
}

enum TableToStrnig:String {
    case sine = "Sine"
    case triangle = "Triangle"
    case square = "Square"
    case sawtooth = "Sawtooth"
    case reverseSawtooth = "Reverse Sawtooth"
    case positiveSine = "Positive Sine"
    case positiveTriangle = "Positive Triangle"
    case positiveSquare = "Positive Square"
    case positiveSawtooth = "Positive Sawtooth"
    case positiveReverseSawtooth = "Positive Reverse Sawtooth"
}
