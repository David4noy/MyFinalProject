//
//  TitleColor.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 28/07/2021.
//

import UIKit

struct SynthDataSource {
    let title:String
    let color:UIColor
    let textColor:UIColor?
    let settingList:SettingListItems?
    
    init(title:String,color:UIColor,textColor:UIColor? = .white, settingList:SettingListItems? = nil) {
        self.title = title
        self.color = color
        self.textColor = textColor
        self.settingList = settingList
    }
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
