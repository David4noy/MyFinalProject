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
            data?.oscAttack = value
        case .oscDecay:
            mySynth.setDecayDuration(value)
            data?.oscDecay = value
        case .oscSustain:
            mySynth.setSustainLevel(value)
            data?.oscSustain = value
        case .oscRelease:
            mySynth.setReleaseDuration(value)
            data?.oscRelease = value
            
            
        // FmSnyth:
        
        case .fmSynthAttack:
            mySynth.setAttackDuration(value)
            data?.fmSynthAttack = value
        case .fmSynthDecay:
            mySynth.setDecayDuration(value)
            data?.fmSynthDecay = value
        case .fmSynthSustain:
            mySynth.setSustainLevel(value)
            data?.fmSynthSustain = value
        case .fmSynthRelease:
            mySynth.setReleaseDuration(value)
            data?.fmSynthRelease = value
        case .carrierMultiplier:
            mySynth.setCarrierMultiplier(value)
            data?.carrierMultiplier = value
        case .modulatingMultiplier:
            mySynth.setModulatingMultiplier(value)
            data?.modulatingMultiplier = value
        case .modulationIndex:
            mySynth.setModulationIndex(value)
            data?.modulationIndex = value
            
            
        // PluckedString:
        
        case .pluckedStringAttack:
            mySynth.setAttackDuration(value)
            data?.pluckedStringAttack = value
        case .pluckedStringDecay:
            mySynth.setDecayDuration(value)
            data?.pluckedStringDecay = value
        case .pluckedStringSustain:
            mySynth.setSustainLevel(value)
            data?.pluckedStringSustain = value
        case .pluckedStringRelease:
            mySynth.setReleaseDuration(value)
            data?.pluckedStringRelease = value
            
            
        // DynamicOscillator:
        
        case .dynamicOscillatorAttack:
            mySynth.setAttackDuration(value)
            data?.dynamicOscillatorAttack = value
        case .dynamicOscillatorDecay:
            mySynth.setDecayDuration(value)
            data?.dynamicOscillatorDecay = value
        case .dynamicOscillatorSustain:
            mySynth.setSustainLevel(value)
            data?.dynamicOscillatorSustain = value
        case .dynamicOscillatorRelease:
            mySynth.setReleaseDuration(value)
            data?.dynamicOscillatorRelease = value
        case .dynamicOscillatorWaveform:
            mySynth.setDynamicOscillatorWaveform(value)
            setWaveformToLabel(value)
            data?.dynamicOscillatorWaveform = Int64(value)
        case .doDetuningMultiplier:
            mySynth.setDetuningMultiplier(value)
            data?.doDetuningMultiplier = value
        case .detuningOffset:
            mySynth.setDetuningOffset(value)
            data?.detuningOffset = value
        case .detuningMultiplier:
            mySynth.setDetuningMultiplier(value)
            data?.doDetuningMultiplier = value
            
            
        // PwmOscillator:
        
        case .pwmOscillatorAttack:
            mySynth.setAttackDuration(value)
            data?.pwmOscillatorAttack = value
        case .pwmOscillatorDecay:
            mySynth.setDecayDuration(value)
            data?.pwmOscillatorDecay = value
        case .pwmOscillatorSustain:
            mySynth.setSustainLevel(value)
            data?.pwmOscillatorSustain = value
        case .pwmOscillatorRelease:
            mySynth.setReleaseDuration(value)
            data?.pwmOscillatorRelease = value
        case .pulseWidth:
            mySynth.setPulseWidth(value)
            data?.pulseWidth = value
        case .pwdDetuningMultiplier:
            mySynth.setDetuningMultiplier(value)
            data?.pwdDetuningMultiplier = value

            
        // VocalTract:
        
        case .vocalTractAttack:
            mySynth.setAttackDuration(value)
            data?.vocalTractAttacK = value
        case .vocalTractDecay:
            mySynth.setDecayDuration(value)
            data?.vocalTractDecay = value
        case .vocalTractSustain:
            mySynth.setSustainLevel(value)
            data?.vocalTractSustain = value
        case .vocalTractRelease:
            mySynth.setReleaseDuration(value)
            data?.vocalTractRelease = value
        case .tonguePosition:
            mySynth.setTonguePosition(value)
            data?.tonguePosition = value
        case .tongueDiameter:
            mySynth.setTongueDiameter(value)
            data?.tongueDiameter = value
        case .tenseness:
            mySynth.setTenseness(value)
            data?.tenseness = value
        case .nasality:
            mySynth.setNasality(value)
            data?.nasality = value
        case .randomTonguePosition:
            if value > 0 {
                mySynth.randomTonguePosition(true)
                data?.randomTonguePosition = true
            } else {
                mySynth.randomTonguePosition(false)
                data?.randomTonguePosition = false
            }
            
            
        // MARK: Pitch
        
        case .hermonizerOnOff:
            break
        case .harmonyFrequency:
            break
        case .hermonizerGain:
            mySynth.setHermonizerGain(value)
            data?.hermonizerGain = value
        case .harmonicIntervals:
            mySynth.setHarmonyFrequency(value)
            data?.harmonyFrequency = Int64(value)
         
            
        // MARK: Distortion
        
        case .pregain:
            mySynth.setPregain(value)
            data?.pregain = value
        case .postgain:
            mySynth.setPostgain(value)
            data?.postgain = value
        case .distOnOff:
            break
        case .negativeShapeParameter:
            mySynth.setNegativeShapeParameter(value)
            data?.negativeShapeParameter = value
        case .positiveShapeParameter:
            mySynth.setPositiveShapeParameter(value)
            data?.positiveShapeParameter = value

            
        //MARK: Modulation
            
        case .modulationType:
            break
        case .modOnOff:
            break
        case .modDryWetMix:
            mySynth.setModDryWetMix(value)
            data?.modDryWetMix = value
        case .modGain:
            mySynth.setModGain(value)
            data?.modGain = value
            
        // Chorus
        
        case .chorusFrequency:
            mySynth.setModFrequency(value)
            data?.chorusFrequency = value
        case .chorusDepth:
            mySynth.setModDepth(value)
            data?.chorusDepth = value
        case .chorusFeedback:
            mySynth.setModFeedback(value)
            data?.chorusFeedback = value
            
        // Flanger
        
        case .flangerFrequency:
            mySynth.setModFrequency(value)
            data?.flangerFrequency = value
        case .flangerFeedback:
            mySynth.setModFeedback(value)
            data?.flangerFeedback = value
        case .flangerDepth:
            mySynth.setModDepth(value)
            data?.flangerDepth = value
            
        // Tremolo
        
        case .tremoloFrequency:
            mySynth.setModFrequency(value)
            data?.tremoloFrequency = value
        case .tremoloDepth:
            mySynth.setModDepth(value)
            data?.tremoloDepth = value
        case .tremoloWaveform:
            mySynth.setTremoloWaveform(value)
            setWaveformToLabel(value)
            data?.tremoloWaveform = Int64(value)
            
            
            
        // Mark: Reverb
            
        case .reverbOnOff:
            break
        case .reverbCutoffFrequency:
            mySynth.setReverbCutoffFrequency(frequency: value)
            data?.reverbCutoffFrequency = value
        case .reverbFeedback:
            mySynth.setReverbFeedback(milliSecend: value)
            data?.reverbFeedback = value
        case .reverbDryWetMix:
            mySynth.setReverbDryWetMix(mix: value)
            data?.reverbDryWetMix = value
        case .reverbGain:
            mySynth.setReverbGain(value)
            data?.reverbGain = value
            
            
            
        // Mark: Delay
        
        case .delayOnOff:
            break
        case .variableDelayFeedback:
            mySynth.setDelayFeedback(feedbackPrecent: value)
            data?.variableDelayFeedback = value
        case .stereoDelayFeedback:
            mySynth.setDelayFeedback(feedbackPrecent: value)
            data?.stereoDelayFeedback = value
        case .variableDelayTime:
            mySynth.setDelayTime(milliSecend: value)
            data?.variableDelayTime = value
        case .stereoDelayTime:
            mySynth.setDelayTime(milliSecend: value)
            data?.stereoDelayTime = value
        case .delayType:
            break
        case .stereoDelayDryWetMix:
            mySynth.setDelayMix(mixPrecent: value)
            data?.stereoDelayDryWetMix = value
        case .variableDelayDryWetMix:
            mySynth.setDelayMix(mixPrecent: value)
            data?.variableDelayDryWetMix = value
        case .varibaleDelayGain:
            mySynth.setDelayGain(value)
            data?.variableDelayGain = value
        case .stereoDelayGain:
            mySynth.setDelayGain(value)
            data?.stereoDelayGain = value

            
            
        // Mark: EQ
        
        case .eqOnOff:
            break
        case .eqType:
            break
        case .highPassOnOff:
            if onOff{
                mySynth.eqTypePlay()
                data?.highPassOnOff = true
            } else {
                mySynth.eqTypeBypass()
                data?.highPassOnOff = false
            }
        case .bassOnOff:
            if onOff{
                mySynth.eqTypePlay()
                data?.bassOnOff = true
            } else {
                mySynth.eqTypeBypass()
                data?.bassOnOff = false
            }
        case .lowMidOnOff:
            if onOff{
                mySynth.eqTypePlay()
                data?.lowMidOnOff = true
            } else {
                mySynth.eqTypeBypass()
                data?.lowMidOnOff = false
            }
        case .highMidOnOff:
            if onOff{
                mySynth.eqTypePlay()
                data?.highMidOnOff = true
            } else {
                mySynth.eqTypeBypass()
                data?.highMidOnOff = false
            }
        case .trebleOnOff:
            if onOff{
                mySynth.eqTypePlay()
                data?.trebleOnOff = true
            } else {
                mySynth.eqTypeBypass()
                data?.trebleOnOff = false
            }
        case .lowPassOnOff:
            if onOff{
                mySynth.eqTypePlay()
                data?.lowPassOnOff = true
            } else {
                mySynth.eqTypeBypass()
                data?.lowPassOnOff = false
            }
        case .highPassFrequency:
            mySynth.setEqFrequency(frequency: value)
            data?.highPassFrequency = value
        case .bassFrequency:
            mySynth.setEqFrequency(frequency: value)
            data?.bassFrequency = value
        case .lowMidFrequency:
            mySynth.setEqFrequency(frequency: value)
            data?.lowMidFrequency = value
        case .highMidFrequency:
            mySynth.setEqFrequency(frequency: value)
            data?.highMidFrequency = value
        case .trebleFrequency:
            mySynth.setEqFrequency(frequency: value)
            data?.trebleFrequency = value
        case .lowPassFrequency:
            mySynth.setEqFrequency(frequency: value)
            data?.lowPassFrequency = value
        case .bassBandwidth:
            mySynth.setBandwidth(bandwidth: value)
            data?.bassBandwidth = value
        case .lowMidBandwidth:
            mySynth.setBandwidth(bandwidth: value)
            data?.lowMidBandwidth = value
        case .highMidBandwidth:
            mySynth.setBandwidth(bandwidth: value)
            data?.highMidBandwidth = value
        case .trebleBandwidth:
            mySynth.setBandwidth(bandwidth: value)
            data?.trebleBandwidth = value
        case .bassGain:
            mySynth.setEqTypeGain(gain: value)
            data?.bassGain = value
        case .lowMidGain:
            mySynth.setEqTypeGain(gain: value)
            data?.lowMidGain = value
        case .highMidGain:
            mySynth.setEqTypeGain(gain: value)
            data?.highMidGain = value
        case .trebleGain:
            mySynth.setEqTypeGain(gain: value)
            data?.trebleGain = value
        case .eqGain:
            mySynth.setEqGain(value)
            data?.eqGain = value
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
