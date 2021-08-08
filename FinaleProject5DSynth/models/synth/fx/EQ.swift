//
//  EQ.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 28/07/2021.
//

import Foundation
import AudioKit
import SoundpipeAudioKit
import AudioKitEX

class EQ{
    
    let highPass:HighPassButterworthFilter
    let bass:EqualizerFilter
    let lowMid:EqualizerFilter
    let highMid:EqualizerFilter
    let treble:EqualizerFilter
    let lowPass:LowPassButterworthFilter
    let fader:Fader
    let mixer = Mixer()
    
    init(_ node:Node) {
        
        highPass = HighPassButterworthFilter(node)
        bass = EqualizerFilter(highPass, centerFrequency: 150, bandwidth: 70.1, gain: 0)
        lowMid = EqualizerFilter(bass, centerFrequency: 500, bandwidth: 200, gain: 0)
        highMid = EqualizerFilter(lowMid, centerFrequency: 1500, bandwidth: 400, gain: 0)
        treble = EqualizerFilter(highMid, centerFrequency: 8000, bandwidth: 1000, gain: 0)
        lowPass = LowPassButterworthFilter(treble)
        
        fader = Fader(lowPass, gain: 1)
        
        mixer.addInput(fader)
        mixer.bypass()
        bypassAll()

    }
    
    func bypassAll(){
        highPass.bypass()
        bass.bypass()
        lowMid.bypass()
        highMid.bypass()
        treble.bypass()
        lowPass.bypass()
    }
    
    func play(){
        mixer.play()
    }
    
    func bypass(){
        mixer.bypass()
    }

    func eqTypePlay(_ eqType:EqType) {
        switch eqType {
        case .highPass:
            highPass.play()
        case .bass:
            bass.play()
        case .lowMid:
            lowMid.play()
        case .highMid:
            highMid.play()
        case .treble:
            treble.play()
        case .lowPass:
            lowPass.play()
        }
    }
    
    func eqTypeBypass(_ eqType:EqType) {
        switch eqType {
        case .highPass:
            highPass.bypass()
        case .bass:
            bass.bypass()
        case .lowMid:
            lowMid.bypass()
        case .highMid:
            highMid.bypass()
        case .treble:
            treble.bypass()
        case .lowPass:
            lowPass.bypass()
        }
    }
    
    func setFrequency(eqType:EqType, frequency:AUValue){
        
        switch eqType {
        case .highPass:
            highPass.cutoffFrequency = frequency
        case .bass:
            bass.centerFrequency = frequency
        case .lowMid:
            lowMid.centerFrequency = frequency
        case .highMid:
            highMid.centerFrequency = frequency
        case .treble:
            treble.centerFrequency = frequency
        case .lowPass:
            lowPass.cutoffFrequency = frequency
        }
 
    }
    
    func setBandwidth(eqType:EqType, bandwidth:AUValue){
        
        switch eqType {
        case .highPass: break
        case .bass:
            bass.bandwidth = bandwidth
        case .lowMid:
            lowMid.bandwidth = bandwidth
        case .highMid:
            highMid.bandwidth = bandwidth
        case .treble:
            treble.bandwidth = bandwidth
        case .lowPass: break
        }
 
    }
    
    func setGain(eqType:EqType, gain:AUValue){
        
        switch eqType {
        case .highPass:break
        case .bass:
            bass.gain = gain
        case .lowMid:
            lowMid.gain = gain
        case .highMid:
            highMid.gain = gain
        case .treble:
            treble.gain = gain
        case .lowPass:break
        }
 
    }
    

    func setEqGain(_ gain:AUValue){
        fader.gain = gain
    }
    
}

enum EqType {
    case highPass
    case bass
    case lowMid
    case highMid
    case treble
    case lowPass
    
}
