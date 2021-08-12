//
//  SynthColorCode.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 13/08/2021.
//

import UIKit

struct SynthColorCode {
    
    func synthColorCode(_ settingListItems:SettingListItems) -> UIColor{
        
        var color:UIColor
        
        switch settingListItems {
        case .synth:
            color = .purple
        case .pitch:
            color = .systemPurple
        case .distoration:
            color = .systemOrange
        case .modulation:
            color = .systemBlue
        case .reverb:
            color = .systemRed
        case .delay:
            color = .systemGreen
        case .eq:
            color = .systemYellow
        case .nonModel:
            color = .cyan
        }
        return color
    }
}
