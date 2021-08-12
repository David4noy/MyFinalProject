//
//  TitleColor.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 28/07/2021.
//

import UIKit

struct DataSourceBuilder {
    
    let colorCode = SynthColorCode()
    
    let title:String
    var color:UIColor = .cyan
    let textColor:UIColor?
    let settingList:SettingListItems
    let numberOfModels:Int?
    
    init(title:String,textColor:UIColor? = .white, settingList:SettingListItems, numberOfModels:Int? = 1) {
        
        self.title = title
        self.textColor = textColor
        self.settingList = settingList
        self.numberOfModels = numberOfModels
        self.color = colorCode.synthColorCode(settingList)
        
    }
    
}

enum SettingListItems: String {
    case nonModel = ""
    case synth = "Synth"
    case pitch = "Pitch"
    case distoration = "Distoration"
    case modulation = "Modulation"
    case reverb = "Reverb"
    case delay = "Delay"
    case eq = "EQ"
}

enum ModelsListItems: String {
    case frequency = "frequency"
    case depth = "depth"
    case distoration = "Distoration"
    case modulation = "Modulation"
    case reverb = "Reverb"
    case delay = "Delay"
    case eq = "EQ"
    
}

