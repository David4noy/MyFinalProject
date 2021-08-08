//
//  JsonModeling.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 05/08/2021.
//

import Foundation
import AudioKit

struct JsonModeling: Codable {
    
//    var dynamicOscillatorhs = NodeObject(name: "dynamicOscillator", properties: [Property(title: "waveform", value: nil, table: Table(.positiveSine))], isSelected: true)
    
    var dynamicOscillatorhs:NodeObject
    var fmSynth:NodeObject
    var pluckedString:NodeObject
    var vocalTract:NodeObject
    var syntdynamicOscillatorhs:NodeObject
    var pwmOscillator:NodeObject
    
    var envelope:NodeObject

    var chorus:NodeObject
    var flanger:NodeObject
    var tremolo:NodeObject
    var modulation:NodeObject
    
    var delay:NodeObject
    var stereoDelay:NodeObject
    var pingpongDelay:NodeObject
    var delays:NodeObject
    
    var reverb:NodeObject
    var reverbs:NodeObject
    
    var distortion:NodeObject
    var distortions:NodeObject
    
    
    var highPass:NodeObject
    var bass:NodeObject
    var lowMid:NodeObject
    var highMid:NodeObject
    var treble:NodeObject
    var lowPass:NodeObject
    var eq:NodeObject
    
    

    
}
