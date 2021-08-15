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
        case .oscDecay:
            mySynth.setDecayDuration(value)
        case .oscSustain:
            mySynth.setSustainLevel(value)
        case .oscRelease:
            mySynth.setReleaseDuration(value)
            
            
        // FmSnyth:
        
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
            
            
        // PluckedString:
        
        case .pluckedStringAttack:
            mySynth.setAttackDuration(value)
        case .pluckedStringDecay:
            mySynth.setDecayDuration(value)
        case .pluckedStringSustain:
            mySynth.setSustainLevel(value)
        case .pluckedStringRelease:
            mySynth.setReleaseDuration(value)
            
            
        // DynamicOscillator:
        
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
        case .detuningOffset:
            mySynth.setDetuningOffset(value)
        case .detuningMultiplier:
            mySynth.setDetuningMultiplier(value)
            
            
        // PwmOscillator:
        
        case .pwmOscillatorAttack:
            mySynth.setAttackDuration(value)
        case .pwmOscillatorDecay:
            mySynth.setDecayDuration(value)
        case .pwmOscillatorSustain:
            mySynth.setSustainLevel(value)
        case .pwmOscillatorRelease:
            mySynth.setReleaseDuration(value)
        case .pulseWidth:
            mySynth.setPulseWidth(value)
        case .pwdDetuningMultiplier:
            mySynth.setDetuningMultiplier(value)

            
        // VocalTract:
        
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
            
            
        // MARK: Pitch
        
        case .hermonizerOnOff:
            break
        case .harmonyFrequency:
            break
        case .hermonizerGain:
            mySynth.setHermonizerGain(value)
        case .harmonicIntervals:
            mySynth.setHarmonyFrequency(value)
         
            
        // MARK: Distortion
        
        case .pregain:
            mySynth.setPregain(value)
        case .postgain:
            mySynth.setPostgain(value)
        case .distOnOff:
            break
        case .negativeShapeParameter:
            mySynth.setNegativeShapeParameter(value)
        case .positiveShapeParameter:
            mySynth.setPositiveShapeParameter(value)

            
        //MARK: Modulation
            
        case .modulationType:
            break
        case .modOnOff:
            break
        case .modDryWetMix:
            mySynth.setModDryWetMix(value)
        case .modGain:
            mySynth.setModGain(value)
            
        // Chorus
        
        case .chorusFrequency:
            mySynth.setModFrequency(value)
        case .chorusDepth:
            mySynth.setModDepth(value)
        case .chorusFeedback:
            mySynth.setModFeedback(value)
            
        // Flanger
        
        case .flangerFrequency:
            mySynth.setModFrequency(value)
        case .flangerFeedback:
            mySynth.setModFeedback(value)
        case .flangerDepth:
            mySynth.setModDepth(value)
            
        // Tremolo
        
        case .tremoloFrequency:
            mySynth.setModFrequency(value)
        case .tremoloDepth:
            mySynth.setModDepth(value)
        case .tremoloWaveform:
            mySynth.setTremoloWaveform(getTable(value))
            
            
            
        // Mark: Reverb
            
        case .reverbOnOff:
            break
        case .reverbCutoffFrequency:
            mySynth.setReverbCutoffFrequency(frequency: value)
        case .reverbFeedback:
            mySynth.setReverbFeedback(milliSecend: value)
        case .reverbDryWetMix:
            mySynth.setReverbDryWetMix(mix: value)
        case .reverbGain:
            mySynth.setReverbGain(value)
            
            
            
            
        case .delayOnOff:
            break
        case .variableDelayFeedback:
            mySynth.setDelayFeedback(feedbackPrecent: value)
        case .stereoDelayFeedback:
            mySynth.setDelayFeedback(feedbackPrecent: value)
        case .variableDelayTime:
            mySynth.setDelayTime(milliSecend: value)
        case .stereoDelayTime:
            mySynth.setDelayTime(milliSecend: value)
        case .delayType:
            break
        case .stereoDelayDryWetMix:
            mySynth.setDelayMix(mixPrecent: value)
        case .variableDelayDryWetMix:
            mySynth.setDelayMix(mixPrecent: value)
        case .varibaleDelayGain:
            mySynth.setDelayGain(value)
        case .stereoDelayGain:
            mySynth.setDelayGain(value)
        case .eqOnOff:
            break
        case .eqType:
            break
        case .highPassOnOff:
            if onOff{
                mySynth.eqTypePlay()
            } else {
                mySynth.eqTypeBypass()
            }
        case .bassOnOff:
            if onOff{
                mySynth.eqTypePlay()
            } else {
                mySynth.eqTypeBypass()
            }
        case .lowMidOnOff:
            if onOff{
                mySynth.eqTypePlay()
            } else {
                mySynth.eqTypeBypass()
            }
        case .highMidOnOff:
            if onOff{
                mySynth.eqTypePlay()
            } else {
                mySynth.eqTypeBypass()
            }
        case .trebleOnOff:
            if onOff{
                mySynth.eqTypePlay()
            } else {
                mySynth.eqTypeBypass()
            }
        case .lowPassOnOff:
            if onOff{
                mySynth.eqTypePlay()
            } else {
                mySynth.eqTypeBypass()
            }
        case .highPassFrequency:
            mySynth.setEqFrequency(frequency: value)
        case .bassFrequency:
            mySynth.setEqFrequency(frequency: value)
        case .lowMidFrequency:
            mySynth.setEqFrequency(frequency: value)
        case .highMidFrequency:
            mySynth.setEqFrequency(frequency: value)
        case .trebleFrequency:
            mySynth.setEqFrequency(frequency: value)
        case .lowPassFrequency:
            mySynth.setEqFrequency(frequency: value)
        case .bassBandwidth:
            mySynth.setBandwidth(bandwidth: value)
        case .lowMidBandwidth:
            mySynth.setBandwidth(bandwidth: value)
        case .highMidBandwidth:
            mySynth.setBandwidth(bandwidth: value)
        case .trebleBandwidth:
            mySynth.setBandwidth(bandwidth: value)
        case .bassGain:
            mySynth.setEqTypeGain(gain: value)
        case .lowMidGain:
            mySynth.setEqTypeGain(gain: value)
        case .highMidGain:
            mySynth.setEqTypeGain(gain: value)
        case .trebleGain:
            mySynth.setEqTypeGain(gain: value)
        case .eqGain:
            mySynth.setEqGain(value)

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
