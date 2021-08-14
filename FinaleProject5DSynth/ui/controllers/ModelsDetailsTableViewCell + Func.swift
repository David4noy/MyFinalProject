//
//  ModelsDetailsTableViewCell + Func.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 15/08/2021.
//
import AudioKit
import UIKit

extension ModelsDetailsTableViewCell{
    
    
    func setValue(value:AUValue){
        
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
        case .chorusFrequency:
            mySynth.setModFrequency(value)
        case .chorusDepth:
            mySynth.setModDepth(value)
        case .chorusFeedback:
            mySynth.setModFeedback(value)
        case .flangerFrequency:
            mySynth.setModFrequency(value)
        case .flangerFeedback:
            mySynth.setModFeedback(value)
        case .flangerDepth:
            mySynth.setModDepth(value)
        case .tremoloFrequency:
            mySynth.setModFrequency(value)
        case .tremoloDepth:
            mySynth.setModDepth(value)
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
        case .delayGain:
            mySynth.setDelayGain(value)
        //        case .eqOnOff:
        //            break
        //        case .eqType:
        //            break
        //        case .highPassOnOff:
        //            break
        //        case .bassOnOff:
        //            break
        //        case .lowMidOnOff:
        //            break
        //        case .highMidOnOff:
        //            break
        //        case .trebleOnOff:
        //            break
        //        case .lowPassOnOff:
        //            break
        //        case .highPassFrequency:
        //            <#code#>
        //        case .bassFrequency:
        //            <#code#>
        //        case .lowMidFrequency:
        //            <#code#>
        //        case .highMidFrequency:
        //            <#code#>
        //        case .trebleFrequency:
        //            <#code#>
        //        case .lowPassFrequency:
        //            <#code#>
        //        case .bassBandwidth:
        //            <#code#>
        //        case .lowMidBandwidth:
        //            <#code#>
        //        case .highMidBandwidth:
        //            <#code#>
        //        case .trebleBandwidth:
        //            <#code#>
        //        case .bassGain:
        //            <#code#>
        //        case .lowMidGain:
        //            <#code#>
        //        case .highMidGain:
        //            <#code#>
        //        case .trebleGain:
        //            <#code#>
        //        case .eqGain:
        //            <#code#>
        default:
            break
        }
        
        
    }
    
    func getTable(_ value:AUValue) ->Table{
        
        //     var tablr:TableType
        
        switch value {
        case 0:
            return Table(.sine)
        case 1:
            return Table(.triangle)
        case 3:
            return Table(.square)
        case 4:
            return Table(.sawtooth)
        case 5:
            return Table(.positiveSine)
        case 6:
            return Table(.positiveTriangle)
        case 7:
            return Table(.positiveSquare)
        case 8:
            return Table(.positiveSawtooth)
        case 9:
            return Table(.positiveReverseSawtooth)
        default:
            return Table(.sine)
        }
        
        
    }
    
}
