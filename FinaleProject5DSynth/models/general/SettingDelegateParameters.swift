//
//  SettingDelegateParameters.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 17/08/2021.
//

import Foundation

class SettingDelegateParameters {
    
    var mod: Int
    var inputGain: Float
    var bool :Bool

    
    init(numberOfKeys: Int, inputGain: Float, bool: Bool) {
        
        self.mod = numberOfKeys
        self.inputGain = inputGain
        self.bool = bool

        
    }
    
    
}

