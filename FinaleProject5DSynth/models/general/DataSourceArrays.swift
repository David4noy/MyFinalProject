//
//  SynthDataSource.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 11/08/2021.
//

import UIKit

struct DataSourceArrays {
        
    // Array for the note names and color in the keybord
    let noteColor:[DataSourceBuilder] = [
        DataSourceBuilder(title: NotNames.c.rawValue, textColor: UIColor.white.withAlphaComponent(0.4), settingList: .nonModel),
        DataSourceBuilder(title: NotNames.db.rawValue, textColor: UIColor.gray.withAlphaComponent(0.3), settingList: .nonModel),
        DataSourceBuilder(title: NotNames.d.rawValue, textColor: UIColor.white.withAlphaComponent(0.4), settingList: .nonModel),
        DataSourceBuilder(title: NotNames.eb.rawValue, textColor: UIColor.gray.withAlphaComponent(0.3), settingList: .nonModel),
        DataSourceBuilder(title: NotNames.e.rawValue, textColor: UIColor.white.withAlphaComponent(0.4), settingList: .nonModel),
        DataSourceBuilder(title: NotNames.f.rawValue, textColor: UIColor.white.withAlphaComponent(0.4), settingList: .nonModel),
        DataSourceBuilder(title: NotNames.gb.rawValue, textColor: UIColor.gray.withAlphaComponent(0.3), settingList: .nonModel),
        DataSourceBuilder(title: NotNames.g.rawValue, textColor: UIColor.white.withAlphaComponent(0.4), settingList: .nonModel),
        DataSourceBuilder(title: NotNames.ab.rawValue, textColor: UIColor.gray.withAlphaComponent(0.3), settingList: .nonModel),
        DataSourceBuilder(title: NotNames.a.rawValue, textColor: UIColor.white.withAlphaComponent(0.4), settingList: .nonModel),
        DataSourceBuilder(title: NotNames.bb.rawValue, textColor: UIColor.gray.withAlphaComponent(0.3), settingList: .nonModel),
        DataSourceBuilder(title: NotNames.b.rawValue, textColor: UIColor.white.withAlphaComponent(0.4), settingList: .nonModel)]
    
    //MARK: Synths General List
    
    let generalSettingList:[SettingDataSourceBuilder] = [
        SettingDataSourceBuilder(settingItems: .darkMod,.segment),
        SettingDataSourceBuilder(settingItems: .about, .btn),
        SettingDataSourceBuilder(settingItems: .myScocialMedia,.btn)]
    
    let playerSettingList:[SettingDataSourceBuilder] = [
        SettingDataSourceBuilder(settingItems: .chooseFile, .btn),
        SettingDataSourceBuilder(settingItems: .copyFileToAppFolder, .btn),
        SettingDataSourceBuilder(settingItems: .playbackCountdown, .switchOnOff)]
    
    let recorderSettingList:[SettingDataSourceBuilder] = [
        SettingDataSourceBuilder(settingItems: .inputGain, .slider),
        SettingDataSourceBuilder(settingItems: .synthInputGain, .slider),
        SettingDataSourceBuilder(settingItems: .playbackInputGain, .slider),
        SettingDataSourceBuilder(settingItems: .recordName, .btn),
        SettingDataSourceBuilder(settingItems: .recordPlaybackToo,.switchOnOff),
        SettingDataSourceBuilder(settingItems: .recordCountdown,.switchOnOff)]
    
    
    //MARK: Synths Setting List

    let synthSettingList:[DataSourceBuilder] = [
        DataSourceBuilder(title: SettingListItems.synth.rawValue,settingList: .synth,numberOfModels: 6),
        DataSourceBuilder(title: SettingListItems.pitch.rawValue, settingList: .pitch,numberOfModels: 1),
        DataSourceBuilder(title: SettingListItems.distoration.rawValue, settingList: .distoration,numberOfModels: 1),
        DataSourceBuilder(title: SettingListItems.modulation.rawValue, settingList: .modulation,numberOfModels: 3),
        DataSourceBuilder(title: SettingListItems.reverb.rawValue, settingList: .reverb,numberOfModels: 1),
        DataSourceBuilder(title: SettingListItems.delay.rawValue, settingList: .delay,numberOfModels: 3),
        DataSourceBuilder(title: SettingListItems.eq.rawValue, settingList: .eq,numberOfModels: 6)]
    
    
    
    // MARK: Building the models
    
    //MARK: Synths

    let oscilatorSetting:[ModelsDataSourceBuilder] = [
        ModelsDataSourceBuilder(model: .oscAttack,family:.synth, minValue: 0,maxValue: 1.0),
        ModelsDataSourceBuilder(model: .oscDecay,family:.synth, minValue: 0,maxValue: 1.0),
        ModelsDataSourceBuilder(model: .oscSustain,family:.synth, minValue: 0,maxValue: 1.0),
        ModelsDataSourceBuilder(model: .oscRelease,family:.synth, minValue: 0.0,maxValue: 1.0)]
    
    let fmSynthSetting:[ModelsDataSourceBuilder] = [
        ModelsDataSourceBuilder(model: .fmSynthAttack,family:.synth, minValue: 0,maxValue: 1.0),
        ModelsDataSourceBuilder(model: .fmSynthDecay,family:.synth, minValue: 0,maxValue: 1.0),
        ModelsDataSourceBuilder(model: .fmSynthSustain,family:.synth, minValue: 0,maxValue: 1.0),
        ModelsDataSourceBuilder(model: .fmSynthRelease,family:.synth, minValue: 0.0,maxValue: 1.0),
        ModelsDataSourceBuilder(model: .carrierMultiplier,family:.synth, minValue: 0,maxValue: 4.0),
        ModelsDataSourceBuilder(model: .modulatingMultiplier,family:.synth, minValue: 0,maxValue: 4.0),
        ModelsDataSourceBuilder(model: .modulationIndex,family:.synth, minValue: 0,maxValue: 10.0)]
    
    let pluckedStringSetting:[ModelsDataSourceBuilder] = [
        ModelsDataSourceBuilder(model: .pluckedStringAttack,family:.synth, minValue: 0,maxValue: 1.0),
        ModelsDataSourceBuilder(model: .pluckedStringDecay,family:.synth, minValue: 0,maxValue: 1.0),
        ModelsDataSourceBuilder(model: .pluckedStringSustain,family:.synth, minValue: 0,maxValue: 1.0),
        ModelsDataSourceBuilder(model: .pluckedStringRelease,family:.synth, minValue: 0.0,maxValue: 1.0)]
    
    let dynamicOscillatorSetting:[ModelsDataSourceBuilder] = [
        ModelsDataSourceBuilder(model: .dynamicOscillatorAttack,family:.synth, minValue: 0,maxValue: 1.0),
        ModelsDataSourceBuilder(model: .dynamicOscillatorDecay,family:.synth, minValue: 0,maxValue: 1.0),
        ModelsDataSourceBuilder(model: .dynamicOscillatorSustain,family:.synth, minValue: 0,maxValue: 1.0),
        ModelsDataSourceBuilder(model: .dynamicOscillatorRelease,family:.synth, minValue: 0.0,maxValue: 1.0),
        ModelsDataSourceBuilder(model: .dynamicOscillatorWaveform,family:.synth, minValue: 0,maxValue: 9, rounded: true)]
    
    let pwmOscillatorSetting:[ModelsDataSourceBuilder] = [
        ModelsDataSourceBuilder(model: .pwmOscillatorAttack,family:.synth, minValue: 0,maxValue: 1.0),
        ModelsDataSourceBuilder(model: .pwmOscillatorDecay,family:.synth, minValue: 0,maxValue: 1.0),
        ModelsDataSourceBuilder(model: .pwmOscillatorSustain,family:.synth, minValue: 0,maxValue: 1.0),
        ModelsDataSourceBuilder(model: .pwmOscillatorRelease,family:.synth, minValue: 0.0,maxValue: 1.0),
        ModelsDataSourceBuilder(model: .pulseWidth,family:.synth, minValue: 0.0,maxValue: 1.0)]
    
    let vocalTractSetting:[ModelsDataSourceBuilder] = [
        ModelsDataSourceBuilder(model: .vocalTractAttack,family:.synth, minValue: 0,maxValue: 1.0),
        ModelsDataSourceBuilder(model: .vocalTractDecay,family:.synth, minValue: 0,maxValue: 1.0),
        ModelsDataSourceBuilder(model: .vocalTractSustain,family:.synth, minValue: 0,maxValue: 1.0),
        ModelsDataSourceBuilder(model: .vocalTractRelease,family:.synth, minValue: 0.0,maxValue: 1.0),
        ModelsDataSourceBuilder(model: .tonguePosition,family:.synth, minValue: 0,maxValue: 1.0),
        ModelsDataSourceBuilder(model: .tongueDiameter,family:.synth, minValue: 0,maxValue: 1.0),
        ModelsDataSourceBuilder(model: .nasality,family:.synth, minValue: 0.0,maxValue: 1.0),
        ModelsDataSourceBuilder(model: .tenseness,family:.synth, minValue: 0,maxValue: 1.0)]
    
    
    //MARK: Pitch
    
    let pitchSetting:[ModelsDataSourceBuilder] = [
        ModelsDataSourceBuilder(model: .hermonizerGain,family:.pitch, minValue: 0,maxValue: 2.0),
        ModelsDataSourceBuilder(model: .harmonicIntervals,family:.pitch, minValue: -12,maxValue: 12.0, rounded: true)]
    
    
    //MARK: Distoration
    
    let distortionSetting:[ModelsDataSourceBuilder] = [
        ModelsDataSourceBuilder(model: .pregain,family:.distoration, minValue: 0,maxValue: 10.0),
        ModelsDataSourceBuilder(model: .postgain,family:.distoration, minValue: 0,maxValue: 10.0),
        ModelsDataSourceBuilder(model: .positiveShapeParameter,family:.distoration, minValue: -10,maxValue: 10.0),
        ModelsDataSourceBuilder(model: .negativeShapeParameter,family:.distoration, minValue: -10,maxValue: 10.0)]

    

    //MARK: Modulation
    
    let chorusDataSource:[ModelsDataSourceBuilder] = [
        ModelsDataSourceBuilder(model: .chorusFrequency,family:.modulation, minValue: 0,maxValue: 10.0),
        ModelsDataSourceBuilder(model: .chorusDepth,family:.modulation, minValue: 0,maxValue: 1.0),
        ModelsDataSourceBuilder(model: .chorusFeedback,family:.modulation, minValue: -0.95,maxValue: 0.95),
        ModelsDataSourceBuilder(model: .modDryWetMix,family:.modulation, minValue: 0.0,maxValue: 100.0)]
    
    let flangerDataSource:[ModelsDataSourceBuilder] = [
        ModelsDataSourceBuilder(model: .flangerFrequency,family:.modulation, minValue: 0,maxValue: 10.0),
        ModelsDataSourceBuilder(model: .flangerDepth,family:.modulation,minValue: 0,maxValue: 1.0),
        ModelsDataSourceBuilder(model: .flangerFeedback,family:.modulation, minValue: -0.95,maxValue: 0.95),
        ModelsDataSourceBuilder(model: .modDryWetMix,family:.modulation, minValue: 0.0,maxValue: 100.0)]
    
    let tremoloDataSource:[ModelsDataSourceBuilder] = [
        ModelsDataSourceBuilder(model: .tremoloFrequency,family:.modulation, minValue: 0,maxValue: 10.0),
        ModelsDataSourceBuilder(model: .tremoloDepth,family:.modulation,minValue: 0,maxValue: 1.0),
        ModelsDataSourceBuilder(model: .tremoloWaveform,family:.modulation, minValue: 0,maxValue: 9, rounded: true),
        ModelsDataSourceBuilder(model: .modDryWetMix,family:.modulation, minValue: 0.0,maxValue: 100.0)]
    
    
    //MARK: Reverb
    
    let reverbDataSource:[ModelsDataSourceBuilder] = [
        ModelsDataSourceBuilder(model: .reverbFeedback,family:.reverb, minValue: 0,maxValue: 1_200.0),
        ModelsDataSourceBuilder(model: .reverbCutoffFrequency,family:.reverb,minValue: 40,maxValue: 20_000.0),
        ModelsDataSourceBuilder(model: .reverbGain,family:.reverb, minValue: 0,maxValue: 6),
        ModelsDataSourceBuilder(model: .reverbDryWetMix,family:.reverb, minValue: 0.0,maxValue: 100.0)]
    
    
    //MARK: Delay
    
    let variableDelayDataSource:[ModelsDataSourceBuilder] = [
        ModelsDataSourceBuilder(model: .variableDelayTime,family:.delay, minValue: 0,maxValue: 5_000.0),
        ModelsDataSourceBuilder(model: .variableDelayFeedback,family:.delay,minValue: 0,maxValue: 100.0),
        ModelsDataSourceBuilder(model: .varibaleDelayGain,family:.delay, minValue: 0,maxValue: 6),
        ModelsDataSourceBuilder(model: .variableDelayDryWetMix,family:.delay, minValue: 0.0,maxValue: 100.0)]
    
    let stereoDelayDataSource:[ModelsDataSourceBuilder] = [
        ModelsDataSourceBuilder(model: .stereoDelayTime,family:.delay, minValue: 0,maxValue: 5_000.0),
        ModelsDataSourceBuilder(model: .stereoDelayFeedback,family:.delay,minValue: 0,maxValue: 100.0),
        ModelsDataSourceBuilder(model: .stereoDelayGain,family:.delay, minValue: 0,maxValue: 6),
        ModelsDataSourceBuilder(model: .stereoDelayDryWetMix,family:.delay, minValue: 0.0,maxValue: 100.0)]
    
    
    //MARK: EQ
    
    let highPassDataSource:[ModelsDataSourceBuilder] = [
        ModelsDataSourceBuilder(model: .highPassOnOff,family:.eq, minValue: 0,maxValue: 0,onOff: true),
        ModelsDataSourceBuilder(model: .highPassFrequency,family:.eq, minValue: 0,maxValue: 20_000.0),
        ModelsDataSourceBuilder(model: .eqGain,family:.eq, minValue: 0,maxValue: 12.0)]
    
    let bassDataSource:[ModelsDataSourceBuilder] = [
        ModelsDataSourceBuilder(model: .bassOnOff,family:.eq, minValue: 0,maxValue: 0,onOff: true),
        ModelsDataSourceBuilder(model: .bassFrequency,family:.eq,minValue: 60,maxValue: 500.0),
        ModelsDataSourceBuilder(model: .bassBandwidth,family:.eq, minValue: 0,maxValue: 200),
        ModelsDataSourceBuilder(model: .bassGain,family:.eq, minValue: 0.0,maxValue: 10.0),
        ModelsDataSourceBuilder(model: .eqGain,family:.eq, minValue: 0,maxValue: 12.0)]
    
    let lowMidDataSource:[ModelsDataSourceBuilder] = [
        ModelsDataSourceBuilder(model: .lowMidOnOff,family:.eq, minValue: 0,maxValue: 0,onOff: true),
        ModelsDataSourceBuilder(model: .lowMidFrequency,family:.eq,minValue: 250,maxValue: 2_000.0),
        ModelsDataSourceBuilder(model: .lowMidBandwidth,family:.eq, minValue: 0,maxValue: 1_000),
        ModelsDataSourceBuilder(model: .lowMidGain,family:.eq, minValue: 0.0,maxValue: 10.0),
        ModelsDataSourceBuilder(model: .eqGain,family:.eq, minValue: 0,maxValue: 12.0)]
    
    let highMidDataSource:[ModelsDataSourceBuilder] = [
        ModelsDataSourceBuilder(model: .highMidOnOff,family:.eq, minValue: 0,maxValue: 0,onOff: true),
        ModelsDataSourceBuilder(model: .highMidFrequency,family:.eq,minValue: 1_500,maxValue: 6_000.0),
        ModelsDataSourceBuilder(model: .highMidBandwidth,family:.eq, minValue: 0,maxValue: 2_000),
        ModelsDataSourceBuilder(model: .highMidGain,family:.eq, minValue: 0.0,maxValue: 10.0),
        ModelsDataSourceBuilder(model: .eqGain,family:.eq, minValue: 0,maxValue: 12.0)]
    
    let trebleDataSource:[ModelsDataSourceBuilder] = [
        ModelsDataSourceBuilder(model: .trebleOnOff,family:.eq, minValue: 0,maxValue: 0,onOff: true),
        ModelsDataSourceBuilder(model: .trebleFrequency,family:.eq,minValue: 5_500,maxValue: 20_000.0),
        ModelsDataSourceBuilder(model: .trebleBandwidth,family:.eq, minValue: 0,maxValue: 2_000),
        ModelsDataSourceBuilder(model: .trebleGain,family:.eq, minValue: 0.0,maxValue: 10.0),
        ModelsDataSourceBuilder(model: .eqGain,family:.eq, minValue: 0,maxValue: 12.0)]
    
    let lowPassDataSource:[ModelsDataSourceBuilder] = [
        ModelsDataSourceBuilder(model: .lowPassOnOff,family:.eq, minValue: 0,maxValue: 0,onOff: true),
        ModelsDataSourceBuilder(model: .lowPassFrequency,family:.eq, minValue: 0,maxValue: 20_000.0),
        ModelsDataSourceBuilder(model: .eqGain,family:.eq, minValue: 0,maxValue: 12.0)]
    
    
    
    //MARK: Methods
    // To return the right model
    
    // General Setting
    
    func settingDataSource() -> [[SettingDataSourceBuilder]]{
        return [generalSettingList,playerSettingList,recorderSettingList]
    }

    
    // Synth
    func synthSettingDataSource() -> [[ModelsDataSourceBuilder]]{
    return [oscilatorSetting,fmSynthSetting,pluckedStringSetting,
            dynamicOscillatorSetting,pwmOscillatorSetting,vocalTractSetting]
    }
    
    // Pitch
    func pitchSettingSettingDataSource() -> [[ModelsDataSourceBuilder]]{
    return [pitchSetting]
    }
    
    // Distortion
    func distortionSettingSettingDataSource() -> [[ModelsDataSourceBuilder]]{
    return [distortionSetting]
    }

    // Modulation
    func modulationDataSource() -> [[ModelsDataSourceBuilder]]{
        return [chorusDataSource,flangerDataSource,tremoloDataSource]
    }
    
    // Reverb
    func reverbSettingSettingDataSource() -> [[ModelsDataSourceBuilder]]{
    return [reverbDataSource]
    }
    
    // Delay
    func delaySettingSettingDataSource() -> [[ModelsDataSourceBuilder]]{
    return [variableDelayDataSource,stereoDelayDataSource]
    }
    
    // EQ
    func eqettingSettingDataSource() -> [[ModelsDataSourceBuilder]]{
    return [highPassDataSource,bassDataSource,lowMidDataSource,highMidDataSource,trebleDataSource,lowPassDataSource]
    }
}

enum NotNames:String{
    
    case c = "C"
    case db = "Db"
    case d = "D"
    case eb = "Eb"
    case e = "E"
    case f = "F"
    case gb = "Gb"
    case g = "G"
    case ab = "Ab"
    case a = "A"
    case bb = "Bb"
    case b = "B"
}
