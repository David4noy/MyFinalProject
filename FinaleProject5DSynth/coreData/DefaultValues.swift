//
//  DefaultValues.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 19/08/2021.
//

import Foundation

struct DefaultValues {
    
    // MARE: General Setting
    
    let darkLightMod: Int64 = 0
    let playbackCountdown: Bool = false
    let recordCountdown: Bool = false
    let recordplayback: Bool = false
    let synthGain: Float = 0.3
    let playbackGain: Float = 0.3
    let synthRecordGain: Float = 0.3
    let playbackRecordGain: Float = 0.3
    let recordInputGain: Float = 0.3

    
    // MARE: Synth
    
    let synthType: Int64 = 0
    
    // Oscillator
    let oscAttack: Float = 0.1
    let oscDecay: Float =  0.15
    let oscSustain: Float = 0.7
    let oscRelease: Float = 0.1
    
    // FmSynth
    let fmSynthAttack: Float = 0.1
    let fmSynthDecay: Float =  0.15
    let fmSynthSustain: Float = 0.7
    let fmSynthRelease: Float = 0.1
    
    let carrierMultiplier: Float = 1.0
    let detuningOffset: Float = 1.0
    let modulatingMultiplier: Float = 1.0
    let modulationIndex: Float = 1.0

    // Plucked String
    let pluckedStringAttack: Float = 0.1
    let pluckedStringDecay: Float =  0.15
    let pluckedStringSustain: Float = 0.7
    let pluckedStringRelease: Float = 0.1

    // Dynamic Oscillator
    let dynamicOscillatorAttack: Float = 0.1
    let dynamicOscillatorDecay: Float =  0.15
    let dynamicOscillatorSustain: Float = 0.7
    let dynamicOscillatorRelease: Float = 0.1
    
    let dynamicOscillatorWaveform: Int64 = 0
    let doDetuningMultiplier: Float = 1.0
    
    // PWD
    let pwmOscillatorAttack: Float = 0.1
    let pwmOscillatorDecay: Float =  0.15
    let pwmOscillatorSustain: Float = 0.7
    let pwmOscillatorRelease: Float = 0.1
    
    let pwdDetuningMultiplier: Float = 1.0
    let pulseWidth: Float = 0.5
    
    
    // Vocal
    let vocalTractAttacK: Float = 0.1
    let vocalTractDecay: Float =  0.15
    let vocalTractSustain: Float = 0.7
    let vocalTractRelease: Float = 0.1
    
    let randomTonguePosition: Bool = false
    let nasality: Float = 0.0
    let tenseness: Float = 0.6
    let tongueDiameter: Float = 1.0
    let tonguePosition: Float = 0.5

    
    // MARE: Hermonizer
    
    let hermonizerOnOff: Bool = false
    let harmonyFrequency: Int64 = 7
    let hermonizerGain: Float = 1.0
    
    
    // MARE: Distortion
    
    let distOnOff: Bool = false
    let pregain: Float = 1.5
    let postgain: Float = 0.2
    let positiveShapeParameter: Float = 0
    let negativeShapeParameter: Float = 0
    
    
    // MARE: Modulation
    
    let modOnOff: Bool = false
    let modDryWetMix: Float = 50.0
    let modGain: Float = 1.2
    let modulationType: Int64 = 0
    
    let chorusFrequency: Float = 0.6
    let chorusDepth: Float = 0.4
    let chorusFeedback: Float = 0.0
    
    let flangerFrequency: Float = 0.3
    let flangerDepth: Float = 0.5
    let flangerFeedback: Float = 0.15
    
    let tremoloFrequency: Float = 7.3
    let tremoloDepth: Float = 0.6
    let tremoloWaveform: Int64 = 0
    
    
    // MARE: Reverb
    
    let reverbOnOff: Bool = false
    
    let reverbDryWetMix: Float = 40.0
    let reverbCutoffFrequency: Float = 8_000
    let reverbFeedback: Float = 600.0
    let reverbGain: Float = 1.8
    
    
    // MARE: Delay
    
    let delayOnOff: Bool = false
    let delayType: Int64 = 0
    
    let variableDelayTime: Float = 420.0
    let variableDelayFeedback: Float = 34.0
    let variableDelayGain: Float = 1.5
    let variableDelayDryWetMix: Float = 37.0
    
    let stereoDelayTime: Float = 570.0
    let stereoDelayFeedback: Float = 42.0
    let stereoDelayGain: Float = 1.5
    let stereoDelayDryWetMix: Float = 37.0
    
    
    // MARE: EQ
    
    let eqOnOff: Bool = false
    let eqType: Int64 = 0
    let eqGain: Float = 1.0
    
    let highPassOnOff: Bool = false
    let highPassFrequency: Float = 80.0
    
    let bassOnOff: Bool = false
    let bassFrequency: Float = 160.0
    let bassBandwidth: Float = 50.0
    let bassGain: Float = 1.0
    
    let lowMidOnOff: Bool = false
    let lowMidFrequency: Float = 500.0
    let lowMidBandwidth: Float = 100.0
    let lowMidGain: Float = 1.0
    
    let highMidOnOff: Bool = false
    let highMidFrequency: Float = 4_500.0
    let highMidBandwidth: Float = 700.0
    let highMidGain: Float = 1.0
    
    let trebleOnOff: Bool = false
    let trebleFrequency: Float = 8_000.0
    let trebleBandwidth: Float = 700.0
    let trebleGain: Float = 1.0
    
    let lowPassOnOff: Bool = false
    let lowPassFrequency: Float = 12_000

}

//extension Float{
//
//    var bool: Bool {
//        if self == 0 {
//            return false
//        } else {
//            return true
//        }
//    }
//
//}
