//
//  Modulation.swift
//  FirstSynth
//
//  Created by דוד נוי on 04/07/2021.
//


import Foundation
import AudioKit
import DunneAudioKit
import AudioKitEX

class Modulation {
    
    let chorus:Chorus
    let flanger:Flanger
    let tremolo: TremoloMod
    let fader:Fader
    var modIsPlaying = false
    var modulationType: ModulationType = .chorus
    
    init(_ node: Node) {
        
        tremolo = TremoloMod(node)
        chorus = Chorus(tremolo.dryWetMixer)
        flanger = Flanger(chorus)
        
        fader = Fader(flanger, gain: 1)
        
     //   defaultSetting()
        
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
    
    
    func setModulation(_ type: Int){
        
        switch type {
        case 0:
            modulationType = .chorus
        case 1:
            modulationType = .flanger
        case 2:
            modulationType = .tremolo
        default:
            modulationType = .chorus
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
    
    func setWaveform(_ waveform:Table ){
        tremolo.setWaveform(waveform)
    }

    func setDryWetMix(_ dryWetMix: AUValue){
        
        let value = dryWetMix / 100
        
        chorus.dryWetMix = value
        flanger.dryWetMix = value
        tremolo.dryWetMix(value)
        
    }
    
    func setModGain(_ gain:AUValue){
        fader.gain = gain
    }
    
}

enum ModulationType {
    case chorus
    case flanger
    case tremolo
}
