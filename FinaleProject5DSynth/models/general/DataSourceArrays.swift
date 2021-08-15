//
//  SynthDataSource.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 11/08/2021.
//

import UIKit

struct DataSourceArrays {
        
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
    
    //MARK: Synths Setting List

    let synthSettingList:[DataSourceBuilder] = [
        DataSourceBuilder(title: SettingListItems.synth.rawValue,settingList: .synth,numberOfModels: 6),
        DataSourceBuilder(title: SettingListItems.pitch.rawValue, settingList: .pitch,numberOfModels: 1),
        DataSourceBuilder(title: SettingListItems.distoration.rawValue, settingList: .distoration,numberOfModels: 1),
        DataSourceBuilder(title: SettingListItems.modulation.rawValue, settingList: .modulation,numberOfModels: 3),
        DataSourceBuilder(title: SettingListItems.reverb.rawValue, settingList: .reverb,numberOfModels: 1),
        DataSourceBuilder(title: SettingListItems.delay.rawValue, settingList: .delay,numberOfModels: 3),
        DataSourceBuilder(title: SettingListItems.eq.rawValue, settingList: .eq,numberOfModels: 6)]
    
    
    //MARK: Synths

    let oscilatorSetting:[ModelsDataSourceBuilder] = [
        ModelsDataSourceBuilder(model: .oscAttack,family:.synth, minValue: 0,maxValue: 1.0),
        ModelsDataSourceBuilder(model: .oscDecay,family:.synth, minValue: 0,maxValue: 1.0),
        ModelsDataSourceBuilder(model: .oscSustain,family:.synth, minValue: 0,maxValue: 1.0),
        ModelsDataSourceBuilder(model: .modDryWetMix,family:.synth, minValue: 0.0,maxValue: 1.0)]
    
    let fmSynthSetting:[ModelsDataSourceBuilder] = [
        ModelsDataSourceBuilder(model: .fmSynthAttack,family:.synth, minValue: 0,maxValue: 1.0),
        ModelsDataSourceBuilder(model: .fmSynthDecay,family:.synth, minValue: 0,maxValue: 1.0),
        ModelsDataSourceBuilder(model: .fmSynthSustain,family:.synth, minValue: 0,maxValue: 1.0),
        ModelsDataSourceBuilder(model: .fmSynthRelease,family:.synth, minValue: 0.0,maxValue: 1.0),
        ModelsDataSourceBuilder(model: .carrierMultiplier,family:.synth, minValue: 0,maxValue: 560.0),
        ModelsDataSourceBuilder(model: .modulatingMultiplier,family:.synth, minValue: 0,maxValue: 20.0),
        ModelsDataSourceBuilder(model: .modulationIndex,family:.synth, minValue: 0,maxValue: 100.0)]
    
    let pluckedStringSetting:[ModelsDataSourceBuilder] = [
        ModelsDataSourceBuilder(model: .oscAttack,family:.synth, minValue: 0,maxValue: 1.0),
        ModelsDataSourceBuilder(model: .oscDecay,family:.synth, minValue: 0,maxValue: 1.0),
        ModelsDataSourceBuilder(model: .oscSustain,family:.synth, minValue: 0,maxValue: 1.0),
        ModelsDataSourceBuilder(model: .modDryWetMix,family:.synth, minValue: 0.0,maxValue: 1.0)]
    
    let dynamicOscillatorSetting:[ModelsDataSourceBuilder] = [
        ModelsDataSourceBuilder(model: .oscAttack,family:.synth, minValue: 0,maxValue: 1.0),
        ModelsDataSourceBuilder(model: .oscDecay,family:.synth, minValue: 0,maxValue: 1.0),
        ModelsDataSourceBuilder(model: .oscSustain,family:.synth, minValue: 0,maxValue: 1.0),
        ModelsDataSourceBuilder(model: .modDryWetMix,family:.synth, minValue: 0.0,maxValue: 1.0)]
    
    let pwmOscillatorSetting:[ModelsDataSourceBuilder] = [
        ModelsDataSourceBuilder(model: .oscAttack,family:.synth, minValue: 0,maxValue: 1.0),
        ModelsDataSourceBuilder(model: .oscDecay,family:.synth, minValue: 0,maxValue: 1.0),
        ModelsDataSourceBuilder(model: .oscSustain,family:.synth, minValue: 0,maxValue: 1.0),
        ModelsDataSourceBuilder(model: .modDryWetMix,family:.synth, minValue: 0.0,maxValue: 1.0)]
    
    let vocalTractSetting:[ModelsDataSourceBuilder] = [
        ModelsDataSourceBuilder(model: .oscAttack,family:.synth, minValue: 0,maxValue: 1.0),
        ModelsDataSourceBuilder(model: .oscDecay,family:.synth, minValue: 0,maxValue: 1.0),
        ModelsDataSourceBuilder(model: .oscSustain,family:.synth, minValue: 0,maxValue: 1.0),
        ModelsDataSourceBuilder(model: .modDryWetMix,family:.synth, minValue: 0.0,maxValue: 1.0)]
    
    
    
    
    
    

    //MARK: Modulation
    
    let chorusDataSource:[ModelsDataSourceBuilder] = [
        ModelsDataSourceBuilder(model: .chorusFrequency,family:.modulation, minValue: 0,maxValue: 10_000.0),
        ModelsDataSourceBuilder(model: .chorusDepth,family:.modulation, minValue: 0,maxValue: 1.0),
        ModelsDataSourceBuilder(model: .chorusFeedback,family:.modulation, minValue: -0.95,maxValue: 0.95),
        ModelsDataSourceBuilder(model: .modDryWetMix,family:.modulation, minValue: 0.0,maxValue: 1.0)]
    
    let flangerDataSource:[ModelsDataSourceBuilder] = [
        ModelsDataSourceBuilder(model: .flangerFrequency,family:.modulation, minValue: 0,maxValue: 10_000.0),
        ModelsDataSourceBuilder(model: .flangerDepth,family:.modulation,minValue: 0,maxValue: 1.0),
        ModelsDataSourceBuilder(model: .flangerFeedback,family:.modulation, minValue: -0.95,maxValue: 0.95),
        ModelsDataSourceBuilder(model: .modDryWetMix,family:.modulation, minValue: 0.0,maxValue: 1.0)]
    
    let tremoloDataSource:[ModelsDataSourceBuilder] = [
        ModelsDataSourceBuilder(model: .tremoloFrequency,family:.modulation, minValue: 0,maxValue: 10_000.0),
        ModelsDataSourceBuilder(model: .tremoloDepth,family:.modulation,minValue: 0,maxValue: 1.0),
        ModelsDataSourceBuilder(model: .tremoloWaveform,family:.modulation, minValue: 0,maxValue: 9, rounded: true),
        ModelsDataSourceBuilder(model: .modDryWetMix,family:.modulation, minValue: 0.0,maxValue: 1.0)]
    
    
    
    
    
    
    func synthSettingDataSource() -> [[ModelsDataSourceBuilder]]{
    return [chorusDataSource,flangerDataSource,tremoloDataSource]
    }
    
    func modulationDataSource() -> [[ModelsDataSourceBuilder]]{
        return [oscilatorSetting,fmSynthSetting,pluckedStringSetting,
                dynamicOscillatorSetting,pwmOscillatorSetting,vocalTractSetting]
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
