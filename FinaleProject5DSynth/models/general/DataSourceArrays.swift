//
//  SynthDataSource.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 11/08/2021.
//

import UIKit

struct DataSourceArrays {
    
    let noteColorAlphe:CGFloat = 0.5
    
    let noteColor:[DataSourceBuilder] = [
        DataSourceBuilder(title: "C", textColor: UIColor.white.withAlphaComponent(0.4), settingList: .nonModel),
        DataSourceBuilder(title: "", textColor: UIColor.gray.withAlphaComponent(0.3), settingList: .nonModel),
        DataSourceBuilder(title: "D", textColor: UIColor.white.withAlphaComponent(0.4), settingList: .nonModel),
        DataSourceBuilder(title: "", textColor: UIColor.gray.withAlphaComponent(0.3), settingList: .nonModel),
        DataSourceBuilder(title: "E", textColor: UIColor.white.withAlphaComponent(0.4), settingList: .nonModel),
        DataSourceBuilder(title: "F", textColor: UIColor.white.withAlphaComponent(0.4), settingList: .nonModel),
        DataSourceBuilder(title: "", textColor: UIColor.gray.withAlphaComponent(0.3), settingList: .nonModel),
        DataSourceBuilder(title: "G", textColor: UIColor.white.withAlphaComponent(0.4), settingList: .nonModel),
        DataSourceBuilder(title: "", textColor: UIColor.gray.withAlphaComponent(0.3), settingList: .nonModel),
        DataSourceBuilder(title: "A", textColor: UIColor.white.withAlphaComponent(0.4), settingList: .nonModel),
        DataSourceBuilder(title: "", textColor: UIColor.gray.withAlphaComponent(0.3), settingList: .nonModel),
        DataSourceBuilder(title: "B", textColor: UIColor.white.withAlphaComponent(0.4), settingList: .nonModel)]
    
    let synthSettingList:[DataSourceBuilder] = [
        DataSourceBuilder(title: SettingListItems.synth.rawValue,settingList: .synth,numberOfModels: 6),
        DataSourceBuilder(title: SettingListItems.pitch.rawValue, settingList: .pitch,numberOfModels: 1),
        DataSourceBuilder(title: SettingListItems.distoration.rawValue, settingList: .distoration,numberOfModels: 1),
        DataSourceBuilder(title: SettingListItems.modulation.rawValue, settingList: .modulation,numberOfModels: 3),
        DataSourceBuilder(title: SettingListItems.reverb.rawValue, settingList: .reverb,numberOfModels: 1),
        DataSourceBuilder(title: SettingListItems.delay.rawValue, settingList: .delay,numberOfModels: 3),
        DataSourceBuilder(title: SettingListItems.eq.rawValue, settingList: .eq,numberOfModels: 6)]
    
   // let synthTypeDataSource
    
   // let modulationDataSource = [chorusDataSource,flangerDataSource,tremoloDataSource]
    
    let chorusDataSource:[ModelsDataSourceBuilder] = [
        ModelsDataSourceBuilder(model: .chorusFrequency,family:.modulation, minValue: 0,maxValue: 5, rounded: false),
        ModelsDataSourceBuilder(model: .chorusDepth,family:.modulation, minValue: 0,maxValue: 5, rounded: false),
        ModelsDataSourceBuilder(model: .chorusFeedback,family:.modulation, minValue: 0,maxValue: 5, rounded: false)]
    
    let flangerDataSource:[ModelsDataSourceBuilder] = [
        ModelsDataSourceBuilder(model: .flangerFrequency,family:.modulation, minValue: 0,maxValue: 5, rounded: false),
        ModelsDataSourceBuilder(model: .flangerDepth,family:.modulation, minValue: 0,maxValue: 5, rounded: false),
        ModelsDataSourceBuilder(model: .flangerFeedback,family:.modulation, minValue: 0,maxValue: 5, rounded: false)]
    
    let tremoloDataSource:[ModelsDataSourceBuilder] = [
        ModelsDataSourceBuilder(model: .tremoloFrequency,family:.modulation, minValue: 0,maxValue: 5, rounded: false),
        ModelsDataSourceBuilder(model: .tremoloDepth,family:.modulation, minValue: 0,maxValue: 5, rounded: false),
        ModelsDataSourceBuilder(model: .tremoloWaveform,family:.modulation, minValue: 0,maxValue: 3, rounded: true)]
    
    
    
    
    
    
    
    
    func modulationDataSource() -> [[ModelsDataSourceBuilder]]{
        return [chorusDataSource,flangerDataSource,tremoloDataSource]
    }
    
    
}

