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
        DataSourceBuilder(title: SettingListItems.synth.rawValue,settingList: SettingListItems.synth,numberOfModels: 6),
        DataSourceBuilder(title: SettingListItems.pitch.rawValue, settingList: .pitch,numberOfModels: 1),
        DataSourceBuilder(title: SettingListItems.distoration.rawValue, settingList: .distoration,numberOfModels: 1),
        DataSourceBuilder(title: SettingListItems.modulation.rawValue, settingList: .modulation,numberOfModels: 3),
        DataSourceBuilder(title: SettingListItems.reverb.rawValue, settingList: .reverb,numberOfModels: 1),
        DataSourceBuilder(title: SettingListItems.delay.rawValue, settingList: .delay,numberOfModels: 3),
        DataSourceBuilder(title: SettingListItems.eq.rawValue, settingList: .eq,numberOfModels: 6)]
    
    let synthTypeDataSource:[DataSourceBuilder] = []
    
    
}

/*
 let noteColor:[DataSourceBuilder] = [
     DataSourceBuilder(title: "C", textColor: .white, settingList: .nonModel),
     DataSourceBuilder(title: "Db", textColor: .black, settingList: .nonModel),
     DataSourceBuilder(title: "D", textColor: .white, settingList: .nonModel),
     DataSourceBuilder(title: "Eb", textColor: .black, settingList: .nonModel),
     DataSourceBuilder(title: "E", textColor: .white, settingList: .nonModel),
     DataSourceBuilder(title: "F", textColor: .white, settingList: .nonModel),
     DataSourceBuilder(title: "Gb", textColor: .black, settingList: .nonModel),
     DataSourceBuilder(title: "G", textColor: .white, settingList: .nonModel),
     DataSourceBuilder(title: "Ab", textColor: .black, settingList: .nonModel),
     DataSourceBuilder(title: "A", textColor: .white, settingList: .nonModel),
     DataSourceBuilder(title: "Bb", textColor: .black, settingList: .nonModel),
     DataSourceBuilder(title: "B", textColor: .white, settingList: .nonModel)]
 */
