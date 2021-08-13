//
//  ModelsDataSourceBuilder.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 13/08/2021.
//

import UIKit

struct ModelsDataSourceBuilder {
    
    let colorCode = SynthColorCode()
    
    let title:String
    var color:UIColor?
    let textColor:UIColor
    let settingList:SettingListItems
    
    init(title:ModelsListItems,color:UIColor? = .white, settingList:SettingListItems) {
        
        self.title = title.rawValue
        self.textColor = colorCode.synthColorCode(settingList)
        self.settingList = settingList
        self.color = color
        
    }
    
}


enum ModelsListItems: String {
    case frequency = "Frequency"
    case depth = "Depth"
    case dryWetMix = "Dry Wet Mix"
    case feedback = "Feedback"
    case type = "Type"
    case time = "Time"
    case bandwidth = "Bandwidth"
    case carrierMultiplier = "Carrier Mult"
    case modulatingMultiplier = "Mod Mult"
    case modulationIndex = "Mod Index"
    case detuningOffset = "Detuning Offset"
    case waveform = "Waveform"
    case detuningMultiplier = "Detuning Mult"
    case pulseWidthdwidth = "Pulse Width"
    case tonguePosition = "Tongue Position"
    case tongueDiameter = "TongueDiameter"
    case tenseness = "Tenseness"
    case nasality = "Nasality"
    case randomTonguePosition = "random Tongue Position"
    case harmonicIntervals = "Harmonic Intervals"
    case gain = "gain"
//    case abc = "abc"
//    case abc = "abc"
//    case abc = "abc"
//    case abc = "abc"
//    case abc = "abc"
//    case abc = "abc"
//    case abc = "abc"
//    case abc = "abc"
//    case abc = "abc"
//    case abc = "abc"
//    case abc = "abc"
//    case abc = "abc"
//    case abc = "abc"
//    case abc = "abc"
//    case abc = "abc"
//    case abc = "abc"
    
    
    
}

