//
//  SettingDataSource.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 05/08/2021.
//

import Foundation


struct SettingDataSource {
    
    let synthSettingList:[TitleColor] = [
        TitleColor(title: SettingListItems.synth.rawValue, color: .purple, settingList: .synth),
        TitleColor(title: SettingListItems.pitch.rawValue, color: .systemPurple, settingList: .pitch),
        TitleColor(title: SettingListItems.distoration.rawValue, color: .systemOrange, settingList: .distoration),
        TitleColor(title: SettingListItems.modulation.rawValue, color: .systemBlue, settingList: .modulation),
        TitleColor(title: SettingListItems.reverb.rawValue, color: .systemRed, settingList: .reverb),
        TitleColor(title: SettingListItems.delay.rawValue, color: .systemGreen, settingList: .delay),
        TitleColor(title: SettingListItems.eq.rawValue, color: .systemYellow, settingList: .eq)]
    
    
    
    func getDataSource(_ chooseDataSource:ChooseDataSource){
        
        switch chooseDataSource {
        case .synthSettingMain:
            print("synthSettingMain")
        case .setting:
            print("setting")
        case .recorderSetting:
            print("recorderSetting")
        case .audioPlayerSetting:
            print("audioPlayerSetting")
        }
        
    }
    
}

enum ChooseDataSource {
    case setting
    case synthSettingMain
    case recorderSetting
    case audioPlayerSetting
}

enum SettingListItems: String {
    case synth = "Synth"
    case pitch = "Pitch"
    case distoration = "Distoration"
    case modulation = "Modulation"
    case reverb = "Reverb"
    case delay = "Delay"
    case eq = "EQ"
}
