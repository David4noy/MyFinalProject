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
    let hermonizerFader:Fader
    var hermonizerIsOn:Bool = false
    

    //    let secondSynth:SynthType
    //    let secondOvertoneSynth:SynthType
    //    let secondeSynthDryWet:DryWetMixer
    
    var harmonicIntervals = HarmonicIntervals.perfectFifth.rawValue
    

     init() {
        
        // Main synth
        synth = SynthType()
        
        overtoneSynth = SynthType()
        
        synthDryWet = DryWetMixer(synth.fader, overtoneSynth.fader)
        
        // Hermonizer
        hermonizer = SynthType()
        
        hermonizerOvertone = SynthType()
        
        hermonizerDryWet = DryWetMixer(hermonizer.fader, hermonizerOvertone.fader)
        
        hermonizerFader = Fader(hermonizerDryWet, gain: 1)
        
    }
    
    
    // MARK: Envelope
    
    func noteOn(){
        synth.noteOn()
        overtoneSynth.noteOn()
        
        if hermonizerIsOn {
            hermonizer.noteOn()
            hermonizerOvertone.noteOn()
        }
    }
    
    func noteOff(){
        synth.noteOff()
        overtoneSynth.noteOff()
        hermonizer.noteOff()
        hermonizerOvertone.noteOff()
    }
    
    func setAttackDuration(_ attackDuration: AUValue){
        synth.setAttackDuration(attackDuration)
        overtoneSynth.setAttackDuration(attackDuration)
        hermonizer.setAttackDuration(attackDuration)
        hermonizerOvertone.setAttackDuration(attackDuration)
    }
    
    func setDecayDuration(_ decayDuration:AUValue){
        synth.setDecayDuration(decayDuration)
        overtoneSynth.setDecayDuration(decayDuration)
        hermonizer.setDecayDuration(decayDuration)
        hermonizerOvertone.setDecayDuration(decayDuration)
    }
    
    func setSustainLevel(_ sustainLevel:AUValue){
        synth.setSustainLevel(sustainLevel)
        overtoneSynth.setSustainLevel(sustainLevel)
        hermonizer.setSustainLevel(sustainLevel)
        hermonizerOvertone.setSustainLevel(sustainLevel)
    }
    
    func setReleaseDuration(_ releaseDuration:AUValue){
        synth.setReleaseDuration(releaseDuration)
        overtoneSynth.setReleaseDuration(releaseDuration)
        hermonizer.setReleaseDuration(releaseDuration)
        hermonizerOvertone.setReleaseDuration(releaseDuration)
    }
    
    
    // MARK: General Methods
    
    func overtoneMixChange(_ mix: AUValue){
        
        var finalMix = mix / 100
        if finalMix > 1 {
            finalMix = 1
        }
        synthDryWet.balance = finalMix
        hermonizerDryWet.balance = finalMix
    }
    
    func setSynthType(_ type: Int){
        synth.setSynth(type)
        overtoneSynth.setSynth(type)
        hermonizer.setSynth(type)
        hermonizerOvertone.setSynth(type)
    }
    
    func setNoteFrequency(_ frequency: AUValue){
        
        synth.setNoteFrequency(frequency)
        overtoneSynth.setNoteFrequency(frequency * 2)
        
        let totalFrequency = frequency * harmonicIntervals
        hermonizer.setNoteFrequency(totalFrequency)
        hermonizerOvertone.setNoteFrequency(totalFrequency * 2)
    }
    
    
    // MARK: Hermonizer
    
    func setHarmonyFrequency(_ harmonicIntervals: AUValue ){
        var absolute:AUValue = harmonicIntervals
        var negPos = 1.0
        if harmonicIntervals < 0 {
            absolute = abs(harmonicIntervals)
            absolute = (12 - absolute)
            negPos = 0.5
        }
        self.harmonicIntervals = getInterval(absolute).rawValue * Float(negPos)
    }
    
    
    func hermonizerOnOff(_ isOn: Bool){
        if isOn {
            hermonizer.startSynth()
            hermonizerOvertone.startSynth()
            hermonizerIsOn = true
        }else {
            hermonizer.stopSynth()
            hermonizerOvertone.stopSynth()
            hermonizerIsOn = false
        }
    }
    
    func setHermonizerGain(_ gain:AUValue){
        hermonizerFader.gain = gain
    }

    private func getInterval(_ harmonicIntervals: AUValue) -> HarmonicIntervals{
        
        switch harmonicIntervals {
        case 0:
            return HarmonicIntervals.unison
        case 1:
            return HarmonicIntervals.minorSecond
        case 2:
            return HarmonicIntervals.majorSecound
        case 3:
            return HarmonicIntervals.minorThird
        case 4:
            return HarmonicIntervals.majorThird
        case 5:
            return HarmonicIntervals.perfectFourth
        case 6:
            return HarmonicIntervals.tritone
        case 7:
            return HarmonicIntervals.perfectFifth
        case 8:
            return HarmonicIntervals.minorSixth
        case 9:
            return HarmonicIntervals.majorSixth
        case 10:
            return HarmonicIntervals.minorSeventh
        case 11:
            return HarmonicIntervals.majorSeventh
        case 12:
            return HarmonicIntervals.octave
        default:
            return HarmonicIntervals.unison
        }
    
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
    
    func setWaveform(_ waveform:Table){
        synth.setWaveform(waveform)
        overtoneSynth.setWaveform(waveform)
        hermonizer.setWaveform(waveform)
        hermonizerOvertone.setWaveform(waveform)
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
    
    func randomTonguePosition(_ isOn:Bool){
        if isOn {
            let rand = Float.random(in: 0...1)
            setTonguePosition(rand)
        }
    }

    // MARK: PluckedString
    
    func triggerPluckedString(){
        synth.triggerPluckedString()
        overtoneSynth.triggerPluckedString()
        hermonizer.triggerPluckedString()
        hermonizerOvertone.triggerPluckedString()
    }
    
}

enum HarmonicIntervals: Float {
    case unison = 1
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
