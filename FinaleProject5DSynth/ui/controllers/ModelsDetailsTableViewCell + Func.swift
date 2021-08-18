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
            save.saveContext()
        case .oscDecay:
            mySynth.setDecayDuration(value)
            data?.oscDecay
                = value
            save.saveContext()
        case .oscSustain:
            mySynth.setSustainLevel(value)
            data?.oscSustain = value
            save.saveContext()
        case .oscRelease:
            mySynth.setReleaseDuration(value)
            data?.oscRelease = value
            save.saveContext()
            
            
        // FmSnyth:
        
        case .fmSynthAttack:
            mySynth.setAttackDuration(value)
            data?.fmSynthAttack = value
            save.saveContext()
        case .fmSynthDecay:
            mySynth.setDecayDuration(value)
            data?.fmSynthDecay = value
            save.saveContext()
        case .fmSynthSustain:
            mySynth.setSustainLevel(value)
            data?.fmSynthSustain = value
            save.saveContext()
        case .fmSynthRelease:
            mySynth.setReleaseDuration(value)
            data?.fmSynthRelease = value
            save.saveContext()
        case .carrierMultiplier:
            mySynth.setCarrierMultiplier(value)
            data?.carrierMultiplier = value
            save.saveContext()
        case .modulatingMultiplier:
            mySynth.setModulatingMultiplier(value)
            data?.modulatingMultiplier = value
            save.saveContext()
        case .modulationIndex:
            mySynth.setModulationIndex(value)
            data?.modulationIndex = value
            save.saveContext()
            
            
        // PluckedString:
        
        case .pluckedStringAttack:
            mySynth.setAttackDuration(value)
            data?.pluckedStringAttack = value
            save.saveContext()
        case .pluckedStringDecay:
            mySynth.setDecayDuration(value)
            data?.pluckedStringDecay = value
            save.saveContext()
        case .pluckedStringSustain:
            mySynth.setSustainLevel(value)
            data?.pluckedStringSustain = value
            save.saveContext()
        case .pluckedStringRelease:
            mySynth.setReleaseDuration(value)
            data?.pluckedStringRelease = value
            save.saveContext()
            
            
        // DynamicOscillator:
        
        case .dynamicOscillatorAttack:
            mySynth.setAttackDuration(value)
            data?.dynamicOscillatorAttack = value
            save.saveContext()
        case .dynamicOscillatorDecay:
            mySynth.setDecayDuration(value)
            data?.dynamicOscillatorDecay = value
            save.saveContext()
        case .dynamicOscillatorSustain:
            mySynth.setSustainLevel(value)
            data?.dynamicOscillatorSustain = value
            save.saveContext()
        case .dynamicOscillatorRelease:
            mySynth.setReleaseDuration(value)
            data?.dynamicOscillatorRelease = value
            save.saveContext()
        case .dynamicOscillatorWaveform:
            mySynth.setDynamicOscillatorWaveform(getTable(value))
            data?.dynamicOscillatorWaveform = Int64(value)
            save.saveContext()
        case .doDetuningMultiplier:
            mySynth.setDetuningMultiplier(value)
            data?.doDetuningMultiplier = value
            save.saveContext()
        case .detuningOffset:
            mySynth.setDetuningOffset(value)
            data?.detuningOffset = value
            save.saveContext()
        case .detuningMultiplier:
            mySynth.setDetuningMultiplier(value)
            data?.doDetuningMultiplier = value
            save.saveContext()
            
            
        // PwmOscillator:
        
        case .pwmOscillatorAttack:
            mySynth.setAttackDuration(value)
            data?.pwmOscillatorAttack = value
            save.saveContext()
        case .pwmOscillatorDecay:
            mySynth.setDecayDuration(value)
            data?.pwmOscillatorDecay = value
            save.saveContext()
        case .pwmOscillatorSustain:
            mySynth.setSustainLevel(value)
            data?.pwmOscillatorSustain = value
            save.saveContext()
        case .pwmOscillatorRelease:
            mySynth.setReleaseDuration(value)
            data?.pwmOscillatorRelease = value
            save.saveContext()
        case .pulseWidth:
            mySynth.setPulseWidth(value)
            data?.pulseWidth = value
            save.saveContext()
        case .pwdDetuningMultiplier:
            mySynth.setDetuningMultiplier(value)
            data?.pwdDetuningMultiplier = value
            save.saveContext()

            
        // VocalTract:
        
        case .vocalTractAttack:
            mySynth.setAttackDuration(value)
            data?.vocalTractAttacK = value
            save.saveContext()
        case .vocalTractDecay:
            mySynth.setDecayDuration(value)
            data?.vocalTractDecay = value
            save.saveContext()
        case .vocalTractSustain:
            mySynth.setSustainLevel(value)
            data?.vocalTractSustain = value
            save.saveContext()
        case .vocalTractRelease:
            mySynth.setReleaseDuration(value)
            data?.vocalTractRelease = value
            save.saveContext()
        case .tonguePosition:
            mySynth.setTonguePosition(value)
            data?.tonguePosition = value
            save.saveContext()
        case .tongueDiameter:
            mySynth.setTongueDiameter(value)
            data?.tongueDiameter = value
            save.saveContext()
        case .tenseness:
            mySynth.setTenseness(value)
            data?.tenseness = value
            save.saveContext()
        case .nasality:
            mySynth.setNasality(value)
            data?.nasality = value
            save.saveContext()
        case .randomTonguePosition:
            if value > 0 {
                mySynth.randomTonguePosition(true)
                data?.randomTonguePosition = true
                save.saveContext()
            } else {
                mySynth.randomTonguePosition(false)
                data?.randomTonguePosition = false
                save.saveContext()
            }
            
            
        // MARK: Pitch
        
        case .hermonizerOnOff:
            break
        case .harmonyFrequency:
            break
        case .hermonizerGain:
            mySynth.setHermonizerGain(value)
            data?.hermonizerGain = value
            save.saveContext()
        case .harmonicIntervals:
            mySynth.setHarmonyFrequency(value)
            data?.harmonyFrequency = Int64(value)
            save.saveContext()
         
            
        // MARK: Distortion
        
        case .pregain:
            mySynth.setPregain(value)
            data?.pregain = value
            save.saveContext()
        case .postgain:
            mySynth.setPostgain(value)
            data?.postgain = value
            save.saveContext()
        case .distOnOff:
            break
        case .negativeShapeParameter:
            mySynth.setNegativeShapeParameter(value)
            data?.negativeShapeParameter = value
            save.saveContext()
        case .positiveShapeParameter:
            mySynth.setPositiveShapeParameter(value)
            data?.positiveShapeParameter = value
            save.saveContext()

            
        //MARK: Modulation
            
        case .modulationType:
            break
        case .modOnOff:
            break
        case .modDryWetMix:
            mySynth.setModDryWetMix(value)
            data?.modDryWetMix = value
            save.saveContext()
        case .modGain:
            mySynth.setModGain(value)
            data?.modGain = value
            save.saveContext()
            
        // Chorus
        
        case .chorusFrequency:
            mySynth.setModFrequency(value)
            data?.chorusFrequency = value
            save.saveContext()
        case .chorusDepth:
            mySynth.setModDepth(value)
            data?.chorusDepth = value
            save.saveContext()
        case .chorusFeedback:
            mySynth.setModFeedback(value)
            data?.chorusFeedback = value
            save.saveContext()
            
        // Flanger
        
        case .flangerFrequency:
            mySynth.setModFrequency(value)
            data?.flangerFrequency = value
            save.saveContext()
        case .flangerFeedback:
            mySynth.setModFeedback(value)
            data?.flangerFeedback = value
            save.saveContext()
        case .flangerDepth:
            mySynth.setModDepth(value)
            data?.flangerDepth = value
            save.saveContext()
            
        // Tremolo
        
        case .tremoloFrequency:
            mySynth.setModFrequency(value)
            data?.tremoloFrequency = value
            save.saveContext()
        case .tremoloDepth:
            mySynth.setModDepth(value)
            data?.tremoloDepth = value
            save.saveContext()
        case .tremoloWaveform:
            mySynth.setTremoloWaveform(getTable(value))
            data?.tremoloWaveform = Int64(value)
            save.saveContext()
            
            
            
        // Mark: Reverb
            
        case .reverbOnOff:
            break
        case .reverbCutoffFrequency:
            mySynth.setReverbCutoffFrequency(frequency: value)
            data?.reverbCutoffFrequency = value
            save.saveContext()
        case .reverbFeedback:
            mySynth.setReverbFeedback(milliSecend: value)
            data?.reverbFeedback = value
            save.saveContext()
        case .reverbDryWetMix:
            mySynth.setReverbDryWetMix(mix: value)
            data?.reverbDryWetMix = value
            save.saveContext()
        case .reverbGain:
            mySynth.setReverbGain(value)
            data?.reverbGain = value
            save.saveContext()
            
            
            
        // Mark: Delay
        
        case .delayOnOff:
            break
        case .variableDelayFeedback:
            mySynth.setDelayFeedback(feedbackPrecent: value)
            data?.variableDelayFeedback = value
            save.saveContext()
        case .stereoDelayFeedback:
            mySynth.setDelayFeedback(feedbackPrecent: value)
            data?.stereoDelayFeedback = value
            save.saveContext()
        case .variableDelayTime:
            mySynth.setDelayTime(milliSecend: value)
            data?.variableDelayTime = value
            save.saveContext()
        case .stereoDelayTime:
            mySynth.setDelayTime(milliSecend: value)
            data?.stereoDelayTime = value
            save.saveContext()
        case .delayType:
            break
        case .stereoDelayDryWetMix:
            mySynth.setDelayMix(mixPrecent: value)
            data?.stereoDelayDryWetMix = value
            save.saveContext()
        case .variableDelayDryWetMix:
            mySynth.setDelayMix(mixPrecent: value)
            data?.variableDelayDryWetMix = value
            save.saveContext()
        case .varibaleDelayGain:
            mySynth.setDelayGain(value)
            data?.variableDelayGain = value
            save.saveContext()
        case .stereoDelayGain:
            mySynth.setDelayGain(value)
            data?.stereoDelayGain = value
            save.saveContext()
            
            
        // Mark: EQ
        
        case .eqOnOff:
            break
        case .eqType:
            break
        case .highPassOnOff:
            if onOff{
                mySynth.eqTypePlay()
                data?.highPassOnOff = true
                save.saveContext()
            } else {
                mySynth.eqTypeBypass()
                data?.highPassOnOff = false
                save.saveContext()
            }
        case .bassOnOff:
            if onOff{
                mySynth.eqTypePlay()
                data?.bassOnOff = true
                save.saveContext()
            } else {
                mySynth.eqTypeBypass()
                data?.bassOnOff = false
                save.saveContext()
            }
        case .lowMidOnOff:
            if onOff{
                mySynth.eqTypePlay()
                data?.lowMidOnOff = true
                save.saveContext()
            } else {
                mySynth.eqTypeBypass()
                data?.lowMidOnOff = false
                save.saveContext()
            }
        case .highMidOnOff:
            if onOff{
                mySynth.eqTypePlay()
                data?.highMidOnOff = true
                save.saveContext()
            } else {
                mySynth.eqTypeBypass()
                data?.highMidOnOff = false
                save.saveContext()
            }
        case .trebleOnOff:
            if onOff{
                mySynth.eqTypePlay()
                data?.trebleOnOff = true
                save.saveContext()
            } else {
                mySynth.eqTypeBypass()
                data?.trebleOnOff = false
                save.saveContext()
            }
        case .lowPassOnOff:
            if onOff{
                mySynth.eqTypePlay()
                data?.lowPassOnOff = true
                save.saveContext()
            } else {
                mySynth.eqTypeBypass()
                data?.lowPassOnOff = false
                save.saveContext()
            }
        case .highPassFrequency:
            mySynth.setEqFrequency(frequency: value)
            data?.highPassFrequency = value
            save.saveContext()
        case .bassFrequency:
            mySynth.setEqFrequency(frequency: value)
            data?.bassFrequency = value
            save.saveContext()
        case .lowMidFrequency:
            mySynth.setEqFrequency(frequency: value)
            data?.lowMidFrequency = value
            save.saveContext()
        case .highMidFrequency:
            mySynth.setEqFrequency(frequency: value)
            data?.highMidFrequency = value
            save.saveContext()
        case .trebleFrequency:
            mySynth.setEqFrequency(frequency: value)
            data?.trebleFrequency = value
            save.saveContext()
        case .lowPassFrequency:
            mySynth.setEqFrequency(frequency: value)
            data?.lowPassFrequency = value
            save.saveContext()
        case .bassBandwidth:
            mySynth.setBandwidth(bandwidth: value)
            data?.bassBandwidth = value
            save.saveContext()
        case .lowMidBandwidth:
            mySynth.setBandwidth(bandwidth: value)
            data?.lowMidBandwidth = value
            save.saveContext()
        case .highMidBandwidth:
            mySynth.setBandwidth(bandwidth: value)
            data?.highMidBandwidth = value
            save.saveContext()
        case .trebleBandwidth:
            mySynth.setBandwidth(bandwidth: value)
            data?.trebleBandwidth = value
            save.saveContext()
        case .bassGain:
            mySynth.setEqTypeGain(gain: value)
            data?.bassGain = value
            save.saveContext()
        case .lowMidGain:
            mySynth.setEqTypeGain(gain: value)
            data?.lowMidGain = value
            save.saveContext()
        case .highMidGain:
            mySynth.setEqTypeGain(gain: value)
            data?.highMidGain = value
            save.saveContext()
        case .trebleGain:
            mySynth.setEqTypeGain(gain: value)
            data?.trebleGain = value
            save.saveContext()
        case .eqGain:
            mySynth.setEqGain(value)
            data?.eqGain = value
            save.saveContext()
        }
        
        
    }
    
    func getTable(_ value:AUValue) ->Table{
        
        switch value {
        case 0:
            waveform = TableToStrnig.sine.rawValue
            return Table(.sine)
        case 1:
            waveform = TableToStrnig.triangle.rawValue
            return Table(.triangle)
        case 3:
            waveform = TableToStrnig.square.rawValue
            return Table(.square)
        case 4:
            waveform = TableToStrnig.sawtooth.rawValue
            return Table(.sawtooth)
        case 5:
            waveform = TableToStrnig.positiveSine.rawValue
            return Table(.positiveSine)
        case 6:
            waveform = TableToStrnig.positiveTriangle.rawValue
            return Table(.positiveTriangle)
        case 7:
            waveform = TableToStrnig.positiveSquare.rawValue
            return Table(.positiveSquare)
        case 8:
            waveform = TableToStrnig.positiveSawtooth.rawValue
            return Table(.positiveSawtooth)
        case 9:
            waveform = TableToStrnig.positiveReverseSawtooth.rawValue
            return Table(.positiveReverseSawtooth)
        default:
            waveform = TableToStrnig.sine.rawValue
            return Table(.sine)
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


/*
 
 switch model {
 case .synthType:
     break
 case .pulseWidth:
     mySynth.setPulseWidth(value)
 case .hermonizerOnOff:
     break
 case .harmonyFrequency:
     break
 case .hermonizerGain:
     mySynth.setHermonizerGain(value)
 case .harmonicIntervals:
     mySynth.setHarmonyFrequency(value)
 case .oscAttack:
     mySynth.setAttackDuration(value)
 case .oscDecay:
     mySynth.setDecayDuration(value)
 case .oscSustain:
     mySynth.setSustainLevel(value)
 case .oscRelease:
     mySynth.setReleaseDuration(value)
 case .fmSynthAttack:
     mySynth.setAttackDuration(value)
 case .fmSynthDecay:
     mySynth.setDecayDuration(value)
 case .fmSynthSustain:
     mySynth.setSustainLevel(value)
 case .fmSynthRelease:
     mySynth.setReleaseDuration(value)
 case .carrierMultiplier:
     mySynth.setCarrierMultiplier(value)
 case .modulatingMultiplier:
     mySynth.setModulatingMultiplier(value)
 case .modulationIndex:
     mySynth.setModulationIndex(value)
 case .detuningOffset:
     mySynth.setDetuningOffset(value)
 case .detuningMultiplier:
     mySynth.setDetuningMultiplier(value)
 case .dynamicOscillatorAttack:
     mySynth.setAttackDuration(value)
 case .dynamicOscillatorDecay:
     mySynth.setDecayDuration(value)
 case .dynamicOscillatorSustain:
     mySynth.setSustainLevel(value)
 case .dynamicOscillatorRelease:
     mySynth.setReleaseDuration(value)
 case .dynamicOscillatorWaveform:
     mySynth.setDynamicOscillatorWaveform(getTable(value))
 case .doDetuningMultiplier:
     mySynth.setDetuningMultiplier(value)
 case .pluckedStringAttack:
     mySynth.setAttackDuration(value)
 case .pluckedStringDecay:
     mySynth.setDecayDuration(value)
 case .pluckedStringSustain:
     mySynth.setSustainLevel(value)
 case .pluckedStringRelease:
     mySynth.setReleaseDuration(value)
 case .pwmOscillatorAttack:
     mySynth.setAttackDuration(value)
 case .pwmOscillatorDecay:
     mySynth.setDecayDuration(value)
 case .pwmOscillatorSustain:
     mySynth.setSustainLevel(value)
 case .pwmOscillatorRelease:
     mySynth.setReleaseDuration(value)
 case .pwdDetuningMultiplier:
     mySynth.setDetuningMultiplier(value)
 case .vocalTractAttack:
     mySynth.setAttackDuration(value)
 case .vocalTractDecay:
     mySynth.setDecayDuration(value)
 case .vocalTractSustain:
     mySynth.setSustainLevel(value)
 case .vocalTractRelease:
     mySynth.setReleaseDuration(value)
 case .tonguePosition:
     mySynth.setTonguePosition(value)
 case .tongueDiameter:
     mySynth.setTongueDiameter(value)
 case .tenseness:
     mySynth.setTenseness(value)
 case .nasality:
     mySynth.setNasality(value)
 case .randomTonguePosition:
     if value > 0 {
         mySynth.randomTonguePosition(true)
     } else {
         mySynth.randomTonguePosition(false)
     }
 case .distOnOff:
     break
 case .negativeShapeParameter:
     mySynth.setNegativeShapeParameter(value)
 case .positiveShapeParameter:
     mySynth.setPositiveShapeParameter(value)
 case .pregain:
     mySynth.setPregain(value)
 case .postgain:
     mySynth.setPostgain(value)
 case .modulationType:
     break
 case .modDryWetMix:
     mySynth.setModDryWetMix(value)
 case .modOnOff:
     break
 case .modGain:
     mySynth.setModGain(value)
 case .chorusFrequency,
      .flangerFrequency,
      .tremoloFrequency:
     mySynth.setModFrequency(value)
 case .chorusDepth,
      .flangerDepth,
      .tremoloDepth:
     mySynth.setModDepth(value)
 case .chorusFeedback,
      .flangerFeedback:
     mySynth.setModFeedback(value)
 case .tremoloWaveform:
     mySynth.setTremoloWaveform(getTable(value))
 case .reverbOnOff:
     break
 case .reverbFeedbackt:
     mySynth.setReverbFeedback(milliSecend: value)
 case .reverbCutoffFrequency:
     mySynth.setReverbCutoffFrequency(frequency: value)
 case .reverbDryWetMix:
     mySynth.setReverbDryWetMix(mix: value)
 case .reverbGain:
     mySynth.setReverbGain(value)
 case .delayOnOff:
     break
 case .variableDelayFeedback,
      .stereoDelayFeedback:
     mySynth.setDelayFeedback(feedbackPrecent: value)
 case .variableDelayTime,
      .stereoDelayTime:
     mySynth.setDelayTime(milliSecend: value)
 case .delayType:
     break
 case .variableDelayDryWetMix,
      .stereoDelayDryWetMix:
     mySynth.setDelayMix(mixPrecent: value)
 case .delayGain:
     mySynth.setDelayGain(value)
         case .eqOnOff:
             break
         case .eqType:
             break
 case .highPassOnOff,
      .bassOnOff,
      .lowMidOnOff,
      .highMidOnOff,
      .trebleOnOff,
      .lowPassOnOff:
             if onOff{
             mySynth.eqTypePlay()
             } else {
                 mySynth.eqTypeBypass()
             }
         case .highPassFrequency:
             <#code#>
         case .bassFrequency:
             <#code#>
         case .lowMidFrequency:
             <#code#>
         case .highMidFrequency:
             <#code#>
         case .trebleFrequency:
             <#code#>
         case .lowPassFrequency:
             <#code#>
         case .bassBandwidth:
             <#code#>
         case .lowMidBandwidth:
             <#code#>
         case .highMidBandwidth:
             <#code#>
         case .trebleBandwidth:
             <#code#>
         case .bassGain:
             <#code#>
         case .lowMidGain:
             <#code#>
         case .highMidGain:
             <#code#>
         case .trebleGain:
             <#code#>
         case .eqGain:
             <#code#>
 */
