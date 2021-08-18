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
    case numberOfKeys = "Number Of Keys"
    case visualEQ = "Visual EQ"
    case myScocialMedia = "My Scocial Media"
    case inputGain = "Input Gain"
    case recordName = "record Name"
    case recordPlaybackToo = "Record Playback Too"
    case countdown = "Activate Countdown"
    case chooseFile = "Choose A File To Play"
    case copyFileToAppFolder = "Copy Audio File To App Folder"
}

enum ActionElementType {
    case switchOnOff
    case slider
    case segment
    case btn
}

