//
//  SynthMixer.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 02/08/2021.
//

import Foundation
import AudioKit
import SoundpipeAudioKit
import AudioKitEX


class SynthMixer{
    
    let synth:SynthType
    let overtoneSynth:SynthType
    let synthDryWet:DryWetMixer
    
    let hermonizer:SynthType
    let hermonizerOvertone:SynthType
    let hermonizerDryWet:DryWetMixer
    
    //    let secondSynth:SynthType
    //    let secondOvertoneSynth:SynthType
    //    let secondeSynthDryWet:DryWetMixer
    
    var harmonicIntervals:HarmonicIntervals = .perfectFifth
    

    
    
     init() {
        
        // Main synth
        synth = SynthType(.fmSynth)
        
        overtoneSynth = SynthType(.fmSynth)
        overtoneSynth.mixer.volume = 0.6
        
        synthDryWet = DryWetMixer(synth.mixer, overtoneSynth.mixer)
        
        // Hermonizer
        hermonizer = SynthType(.fmSynth)
        
        hermonizerOvertone = SynthType(.fmSynth)
        
        hermonizerDryWet = DryWetMixer(hermonizer.mixer, hermonizerOvertone.mixer)
        hermonizerOnOff(false)
    }
    
    func hermonizerOnOff(_ isOn: Bool){
        isOn ? hermonizer.startSynth() : hermonizer.stopSynth()
        isOn ? hermonizerOvertone.startSynth() : hermonizerOvertone.stopSynth()
    }
    
    
    func overtoneMixChange(_ mix: AUValue){
        var finalMix = mix
        if finalMix > 100 {
            finalMix = 100
        }
        synthDryWet.balance = finalMix / 100
        hermonizerDryWet.balance = finalMix / 100
        
        overtoneSynth.mixer.volume = finalMix / 100
        hermonizerOvertone.mixer.volume = finalMix / 100
        
    }
    
    func setSynthType(_ type: ChooseSynth){
        synth.setSynth(type)
        hermonizer.setSynth(type)
    }
    
    func setNoteFrequency(_ frequency: AUValue){
        
        synth.setNoteFrequency(frequency)
        overtoneSynth.setNoteFrequency(frequency * 2)
        
        let totalFrequency = frequency * harmonicIntervals.rawValue
                
        hermonizer.setNoteFrequency(totalFrequency)
        hermonizerOvertone.setNoteFrequency(totalFrequency * 2)
    }
    
    func setHarmonyFrequency(_ harmonicIntervals: HarmonicIntervals ){
        self.harmonicIntervals = harmonicIntervals
    }

    
    
    // MARK: FmSynth
    
    func setCarrierMultiplier(_ carrierMultiplier:AUValue){
        synth.setCarrierMultiplier(carrierMultiplier)
        overtoneSynth.setCarrierMultiplier(carrierMultiplier)
        hermonizer.setCarrierMultiplier(carrierMultiplier)
        hermonizerOvertone.setCarrierMultiplier(carrierMultiplier)
    }
    
    func setModulatingMultiplier(_ modulatingMultiplier:AUValue){
        synth.setModulatingMultiplier(modulatingMultiplier)
        overtoneSynth.setModulatingMultiplier(modulatingMultiplier)
        hermonizer.setModulatingMultiplier(modulatingMultiplier)
        hermonizerOvertone.setModulatingMultiplier(modulatingMultiplier)
    }
    
    func setModulationIndex(_ modulationIndex:AUValue){
        synth.setModulationIndex(modulationIndex)
        overtoneSynth.setModulationIndex(modulationIndex)
        hermonizer.setModulationIndex(modulationIndex)
        hermonizerOvertone.setModulationIndex(modulationIndex)
    }
    
    // MARK: DynamicOscillator
    
    func setDetuningOffset(_ detuningOffset:AUValue){
        synth.setDetuningOffset(detuningOffset)
        overtoneSynth.setDetuningOffset(detuningOffset)
        hermonizer.setDetuningOffset(detuningOffset)
        hermonizerOvertone.setDetuningOffset(detuningOffset)
    }
    
    
    // both
    func setDetuningMultiplier(_ detuningMultiplier:AUValue){
        synth.setDetuningMultiplier(detuningMultiplier)
        overtoneSynth.setDetuningMultiplier(detuningMultiplier)
        hermonizer.setDetuningMultiplier(detuningMultiplier)
        hermonizerOvertone.setDetuningMultiplier(detuningMultiplier)
    }
    
    // MARK: PwmOscillator
    
    func setPulseWidth(_ pulseWidth:AUValue){
        synth.setPulseWidth(pulseWidth)
        overtoneSynth.setPulseWidth(pulseWidth)
        hermonizer.setPulseWidth(pulseWidth)
        hermonizerOvertone.setPulseWidth(pulseWidth)
    }
    
    // MARK: VocalTract
    
    func setTonguePosition(_ tonguePosition:AUValue){
        synth.setTonguePosition(tonguePosition)
        overtoneSynth.setTonguePosition(tonguePosition)
        hermonizer.setTonguePosition(tonguePosition)
        hermonizerOvertone.setTonguePosition(tonguePosition)
    }
    
    func setTongueDiameter(_ tongueDiameter:AUValue){
        synth.setTongueDiameter(tongueDiameter)
        overtoneSynth.setTongueDiameter(tongueDiameter)
        hermonizer.setTongueDiameter(tongueDiameter)
        hermonizerOvertone.setTongueDiameter(tongueDiameter)
    }
    
    func setTenseness(_ tenseness:AUValue){
        synth.setTenseness(tenseness)
        overtoneSynth.setTenseness(tenseness)
        hermonizer.setTenseness(tenseness)
        hermonizerOvertone.setTenseness(tenseness)
    }
    
    func setNasality(_ nasality:AUValue){
        synth.setNasality(nasality)
        overtoneSynth.setNasality(nasality)
        hermonizer.setNasality(nasality)
        hermonizerOvertone.setNasality(nasality)
    }
    
    func randomTonguePosition(){
        let rand = Float.random(in: 0...1)
        setTonguePosition(rand)
    }

    
    
}

enum HarmonicIntervals: Float {
    case minorSecond = 1.059463636
    case majorSecound = 1.122463636
    case minorThird = 1.1892090909
    case majorThird = 1.25992272727
    case perfectFourth = 1.33333333333
    case tritone = 1.41421363636
    case perfectFifth = 1.5
    case minorSixth = 1.5874
    case majorSixth = 1.68179090909
    case minorSeventh = 1.781795454545
    case majorSeventh = 1.88775
    case octave = 2.0
}
