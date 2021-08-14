//
//  ModelsDataSourceBuilder.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 13/08/2021.
//

import UIKit

struct ModelsDataSourceBuilder {
    
    let colorCode = SynthColorCode()
    
    let name:String
    let model:ModelsListItems
    let title:String
    let textColor:UIColor
    let minValue:Float
    let maxValue:Float
    let rounded:Bool
    
    init(model:ModelsListItems,family:SettingListItems,minValue:Float,maxValue:Float,rounded:Bool) {
        
        if let name = model.rawValue.components(separatedBy: " ").first {
            self.name = name
        } else {
            self.name = model.rawValue
        }
        self.model = model
        self.title = model.rawValue
        self.textColor = colorCode.synthColorCode(family)
        self.minValue = minValue
        self.maxValue = maxValue
        self.rounded = rounded

    }
    
}


enum ModelsListItems: String {
    
    case synthType = "Synth Type"
    
    case pulseWidth = "Pulse Width"
    
    case hermonizerOnOff = "Hermonizer OnOff"
    case harmonyFrequency = "Harmony Interval"
    case hermonizerGain = "Hermonizer Gain"
    case harmonicIntervals = "Harmonic Intervals"

    case oscAttack = "Osc Attack"
    case oscDecay = "Osc Decay"
    case oscSustain = "Osc Sustain"
    case oscRelease = "Osc Release"
    
    case fmSynthAttack = "Fm Synth Attack"
    case fmSynthDecay = "Fm Synth Decay"
    case fmSynthSustain = "Fm Synth Sustain"
    case fmSynthRelease = "Fm Synth Release"
    case carrierMultiplier = "Carrier Mult"
    case modulatingMultiplier = "Mod Mult"
    case modulationIndex = "Mod Index"
    case detuningOffset = "Detuning Offset"
    case detuningMultiplier = "Detuning Mult"
    
    case dynamicOscillatorAttack = "Dynamic Osc Attack"
    case dynamicOscillatorDecay = "Dynamic Osc Decay"
    case dynamicOscillatorSustain = "Dynamic Osc Sustain"
    case dynamicOscillatorRelease = "Dynamic Osc Release"
    case dynamicOscillatorWaveform = "Waveform"
    case doDetuningMultiplier = "Detuning Multiplier"
    
    case pluckedStringAttack = "String Attack"
    case pluckedStringDecay = "String Decay"
    case pluckedStringSustain = "String Sustain"
    case pluckedStringRelease = "String Release"
    
    case pwmOscillatorAttack = "PWD Attack"
    case pwmOscillatorDecay = "PWD Decay"
    case pwmOscillatorSustain = "PWD Sustain"
    case pwmOscillatorRelease = "PWD Release"
    case pwdDetuningMultiplier = "PWD Detuning Multiplier"
    
    case vocalTractDecay = "Vocal Decay"
    case vocalTractSustain = "Vocal Sustain"
    case vocalTractRelease = "Vocal Release"
    case tonguePosition = "Tongue Position"
    case tongueDiameter = "TongueDiameter"
    case tenseness = "Tenseness"
    case nasality = "Nasality"
    case randomTonguePosition = "random Tongue Position"
    
    case distOnOff = "Dist OnOff"
    case negativeShapeParameter = "Negative Shape Parameter"
    case positiveShapeParameter = "Positive Shape Parameter"
    case vocalTractAttack = "Vocal Attack"
    case pregain = "Pre Gain"
    case postgain = "Post Gain"
    
    case modulationType = "Modulation Type"
    case modDryWetMix = "Mod Dry Wet Mix"
    case modOnOff = "Mod OnOff"
    case modGain = "Mod Gain"
    
    case chorusFrequency = "Chorus Frequency"
    case chorusDepth = "Chorus Depth"
    case chorusFeedback = "Chorus Feedback"

    case flangerFrequency = "Flanger Frequency"
    case flangerFeedback = "Flanger Feedback"
    case flangerDepth = "Flanger Depth"

    case tremoloFrequency = "Tremolo Frequency"
    case tremoloDepth = "Tremolo Depth"
    case tremoloWaveform = "Tremolo Waveform"
    
    case reverbOnOff = "Reverb OnOff"
    case reverbFeedbackt = "Reverb Feedback"
    case reverbCutoffFrequency = "Reverb Frequency"
    case reverbDryWetMix = "Reverb Dry Wet Mix"
    case reverbGain = "Reverb Gain"
    
    case delayOnOff = "Delay OnOff"
    case variableDelayFeedback = "Variable Delay Feedback"
    case stereoDelayFeedback = "Stereo Delay Feedback"
    case variableDelayTime = "Variable Delay Time"
    case stereoDelayTime = "Stereo Delay Time"
    case delayType = "Delay Type"
    case stereoDelayDryWetMix = "Stereo Delay Dry Wet Mix"
    case variableDelayDryWetMix = "Variable Delay Dry Wet Mix"
    case delayGain = "Delay Gain"
    
    case eqOnOff = "EQ OnOff"
    case eqType = "EQ Type"
    case highPassOnOff = "HighPass OnOff"
    case bassOnOff = "Bass OnOff"
    case lowMidOnOff = "LowMid OnOff"
    case highMidOnOff = "HighMid OnOff"
    case trebleOnOff = "Treble OnOff"
    case lowPassOnOff = "LowPass OnOff"
    case highPassFrequency = "HighPass Frequency"
    case bassFrequency = "Bass Frequency"
    case lowMidFrequency = "LowMid Frequency"
    case highMidFrequency = "HighMid Frequency"
    case trebleFrequency = "Treble Frequency"
    case lowPassFrequency = "LowPass Frequency"
    case bassBandwidth = "Bass Bandwidth"
    case lowMidBandwidth = "LowMid Bandwidth"
    case highMidBandwidth = "HighMid Bandwidth"
    case trebleBandwidth = "Treble Bandwidth"
    case bassGain = "Bass Gain"
    case lowMidGain = "LowMid Gain"
    case highMidGain = "HighMid Gain"
    case trebleGain = "Treble Gain"
    case eqGain = "EQ Gain"

    
}

/*
 case frequency = "Frequency"
 case depth = "Depth"
 case dryWetMix = "Dry Wet Mix"
 case feedback = "Feedback"
 case type = "Type"
 case time = "Time"
 case bandwidth = "Bandwidth"
 case carrierMultiplier = "Carrier Mult"
 case modulatingMultiplier = "Mod Mult"
 case modulationIndex = "Mod Index"
 case detuningOffset = "Detuning Offset"
 case waveform = "Waveform"
 case detuningMultiplier = "Detuning Mult"
 case pulseWidthdwidth = "Pulse Width"
 case tonguePosition = "Tongue Position"
 case tongueDiameter = "TongueDiameter"
 case tenseness = "Tenseness"
 case nasality = "Nasality"
 case randomTonguePosition = "random Tongue Position"
 case harmonicIntervals = "Harmonic Intervals"
 case gain = "gain"
 case synthType = "Synth Type"
 case dynamicOscillatorWaveform
 case doDetuningMultiplier
 case pwdDetuningMultiplier
 case pulseWidth
 case hermonizerOnOff
 case harmonyFrequency
 case hermonizerGain
 case oscAttack
 case oscDecay
 case oscSustain
 case oscRelease
 case fmSynthAttack
 case fmSynthDecay
 case fmSynthSustain
 case dynamicOscillatorRelease
 case fmSynthRelease
 case dynamicOscillatorAttac
 case dynamicOscillatorDecay
 case dynamicOscillatorSustain
 case pluckedStringAttac
 case pluckedStringDecay
 case pluckedStringSustain
 case pluckedStringRelease
 case pwmOscillatorAttac
 case pwmOscillatorDecay
 case pwmOscillatorSustain
 case pwmOscillatorRelease
 case pregain
 case vocalTractDecay
 case vocalTractSustain
 case vocalTractRelease
 case distOnOff
 case negativeShapeParameter
 case positiveShapeParameter
 case vocalTractAttac
 case postgain
 case modulationType
 case flangerFrequency
 case chorusFrequency
 case tremoloFrequency
 case flangerDepth
 case chorusDepth
 case tremoloDepth
 case chorusFeedback
 case flangerFeedback
 case tremoloWaveform
 case modDryWetMix
 case modOnOff
 case modGain
 case reverbOnOff
 case reverbFeedbackt
 case reverbCutoffFrequency
 case reverbDryWetMix
 case reverbGain
 case delayOnOff
 case variableDelayFeedback
 case stereoDelayFeedback
 case variableDelayTime
 case stereoDelayTime
 case delayType
 case stereoDelayDryWetMix
 case variableDelayDryWetMix
 case elayGain
 case eqOnOff
 case eqType
 case highPassOnOff
 case bassOnOff
 case lowMid
 case highMid
 case trebleOnOff
 case lowPassOnOff
 case highPassFrequency
 case bassFrequency
 case lowMidFrequency
 case highMidFrequency
 case trebleFrequency
 case lowPassFrequency
 case bassBandwidth
 case lowMidBandwidth
 case highMidBandwidth
 case trebleBandwidth
 case bassGain
 case lowMidGain
 case highMidGain
 case trebleGain
 case eqGain

 */
