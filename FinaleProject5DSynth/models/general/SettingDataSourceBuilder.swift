//
//  SettingDataSourceBuilder.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 17/08/2021.
//

import Foundation

struct SettingDataSourceBuilder {
    
    let title:String
    let settingItems:SettingItems
    let actionElementType:ActionElementType

    init(settingItems:SettingItems,_ actionElementType:ActionElementType) {
        self.title = settingItems.rawValue
        self.settingItems = settingItems
        self.actionElementType = actionElementType
    }
    
}

enum SettingItems:String {
    case darkMod = "Dark/Light Mod"
    case about = "About And Help"
    case myScocialMedia = "My Scocial Media"
    case inputGain = "General Input Gain"
    case synthInputGain = "Synth Input Gain"
    case playbackInputGain = "Playback Input Gain"
    case recordName = "record Name"
    case recordPlaybackToo = "Record Playback Too"
    case recordCountdown = "Activate Record Countdown"
    case playbackCountdown = "Activate Playback Countdown"
    case chooseFile = "Choose A File To Play"
    case copyFileToAppFolder = "Copy Audio File To App Folder"
}

enum ActionElementType {
    case switchOnOff
    case slider
    case segment
    case btn
}

