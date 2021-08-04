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
        synth = SynthType()
        synth.setSynth(.oscillator)
        
        overtoneSynth = SynthType()
        overtoneSynth.setSynth(.oscillator)
        overtoneSynth.mixer.volume = 0.6
        
        synthDryWet = DryWetMixer(synth.mixer, overtoneSynth.mixer)
        
        // Hermonizer
        hermonizer = SynthType()
        hermonizer.setSynth(.oscillator)
        
        hermonizerOvertone = SynthType()
        hermonizerOvertone.setSynth(.oscillator)
        
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
