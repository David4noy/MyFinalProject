//
//  Modulation.swift
//  FirstSynth
//
//  Created by דוד נוי on 04/07/2021.
//
// https://github.com/AudioKit/DunneAudioKit
//input: Node whose output will be processed
//frequency: modulation frequency Hz
//depth: depth of modulation (fraction)
//feedback: feedback fraction
//dryWetMix: fraction of wet signal in mix

import Foundation
import AudioKit
import DunneAudioKit

class Modulation {
    
    let chorus:Chorus
    let flanger:Flanger
    let tremolo: TremoloMod
    var chorusIsChoosen = true
    var modIsPlaying = false
    var modulationType: ModulationType = .chorus
    
    init(_ node: Node) {
        
        tremolo = TremoloMod(node)
        chorus = Chorus(tremolo.dryWetMixer)
        flanger = Flanger(chorus)
        
        defaultSetting()
        
    }
    
    func defaultSetting(){
        chorus.frequency = 0.2
        flanger.frequency = 0.4
        tremolo.frequency(0.6)
        
        chorus.depth = 0.8
        flanger.depth = 0.6
        tremolo.depth(0.5)
        
        chorus.feedback = 0
        flanger.feedback = 0.6
        
        chorus.dryWetMix = 0.8
        flanger.dryWetMix = 0.8
        tremolo.dryWetMix(0.6)
    }
    
    
    func bypass(){
        chorus.bypass()
        flanger.bypass()
        tremolo.bypass()
        modIsPlaying = false
    }
    
    
    func play(){
        
        bypass()
        
        switch modulationType {
        case .chorus:
            chorus.play()
        case .flanger:
            flanger.play()
        case .tremolo:
            tremolo.play()
        }
        
        modIsPlaying = true
    }
    
    
    func setModulation(_ type: ModulationType){
        
        switch type {
        case .chorus:
            modulationType = .chorus
        case .flanger:
            modulationType = .flanger
        case .tremolo:
            modulationType = .tremolo
        }
        
        if modIsPlaying{
            play()
        }
    }
    
    func setFrequency(_ frequency: AUValue){
        
        switch modulationType {
        case .chorus:
            chorus.frequency = frequency
        case .flanger:
            flanger.frequency = frequency
        case .tremolo:
            tremolo.frequency(frequency)
        }
    }
    
    func setDepth(_ depth: AUValue){
        
        switch modulationType {
        case .chorus:
            chorus.depth = depth
        case .flanger:
            flanger.depth = depth
        case .tremolo:
            tremolo.depth(depth)
        }
    }
    
    func setFeedback(_ feedback: AUValue){
        
        switch modulationType {
        case .chorus:
            chorus.feedback = feedback
        case .flanger:
            flanger.feedback = feedback
        case .tremolo:
            break
        }
    }

    func setDryWetMix(_ dryWetMix: AUValue){
        
        chorus.dryWetMix = dryWetMix
        flanger.dryWetMix = dryWetMix
        tremolo.dryWetMix(dryWetMix)
        
    }
    
}

enum ModulationType {
    case chorus
    case flanger
    case tremolo
}
