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

    var eqType:EqType = .bass
    var highPassIsOn = false
    var bassIsOn = false
    var lowMidIsOn = false
    var highMidIsOn = false
    var trebleIsOn = false
    var lowPassIsOn = false
    
    init(_ node:Node) {
        
        highPass = HighPassButterworthFilter(node)
        bass = EqualizerFilter(highPass, centerFrequency: 150, bandwidth: 70.1, gain: 0)
        lowMid = EqualizerFilter(bass, centerFrequency: 500, bandwidth: 200, gain: 0)
        highMid = EqualizerFilter(lowMid, centerFrequency: 1500, bandwidth: 400, gain: 0)
        treble = EqualizerFilter(highMid, centerFrequency: 8000, bandwidth: 1000, gain: 0)
        lowPass = LowPassButterworthFilter(treble)
        
        fader = Fader(lowPass, gain: 1)
                
        bypass()

    }

    
    func play(){
        bypass()
        
        if highPassIsOn{
            highPass.play()
        }
        
        if bassIsOn{
            bass.play()
        }
        
        if lowMidIsOn{
            lowMid.play()
        }
        
        if highMidIsOn{
            highMid.play()
        }
        
        if trebleIsOn{
            treble.play()
        }
        
        if lowPassIsOn{
            lowPass.play()
        }
    }
    
    func bypass(){
        highPass.bypass()
        bass.bypass()
        lowMid.bypass()
        highMid.bypass()
        treble.bypass()
        lowPass.bypass()
    }
    
    func eqType(_ type:Int){
        
        switch type {
        case 0:
            eqType = .highPass
        case 1:
            eqType = .bass
        case 2:
            eqType = .lowMid
        case 3:
            eqType = .highMid
        case 4:
            eqType = .treble
        case 5:
            eqType = .lowPass
        default:
            eqType = .bass
        }
    }


    func eqTypePlay() {
        switch eqType {
        case .highPass:
            highPass.play()
            highPassIsOn = true
        case .bass:
            bass.play()
            bassIsOn = true
        case .lowMid:
            lowMid.play()
            lowMidIsOn = true
        case .highMid:
            highMid.play()
            highMidIsOn = true
        case .treble:
            treble.play()
            trebleIsOn = true
        case .lowPass:
            lowPass.play()
            lowPassIsOn = true
        }
 
    }
    
    func eqTypeBypass() {
        switch eqType {
        case .highPass:
            highPass.bypass()
            highPassIsOn = false
        case .bass:
            bass.bypass()
            bassIsOn = false
        case .lowMid:
            lowMid.bypass()
            lowMidIsOn = false
        case .highMid:
            highMid.bypass()
            highMidIsOn = false
        case .treble:
            treble.bypass()
            trebleIsOn = false
        case .lowPass:
            lowPass.bypass()
            lowPassIsOn = false
        }
    }
    
    func setFrequency(frequency:AUValue){
        
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
    
    func setBandwidth(bandwidth:AUValue){
        
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
    
    func setGain(gain:AUValue){
        
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
