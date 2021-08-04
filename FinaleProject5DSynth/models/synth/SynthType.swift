//
//  SynthType.swift
//  FirstSynth
//
//  Created by דוד נוי on 07/07/2021.
//
// 

import Foundation
import AudioKit
import SoundpipeAudioKit

class SynthType {

    let oscillator = Oscillator()
    let fmSynth = FMOscillator()
    let pluckedString = PluckedString()
    let vocalTract = VocalTract()
    let pwmOscillator = PWMOscillator()
    let dynamicOscillator = DynamicOscillator()
    let mixer = Mixer()
    var choosenSynth:ChooseSynth = .oscillator

    init() {}
    
    // choose synth - using mixer to be able to change node
    func setSynth(_ type: ChooseSynth){

        stopSynth()
        mixer.removeAllInputs()
        choosenSynth = type

       switch type {
       case .oscillator:
        oscillator.start()
        mixer.addInput(oscillator)
       case .fmSynth:
        fmSynth.start()
        mixer.addInput(fmSynth)
       case .pluckedString:
        pluckedString.start()
        mixer.addInput(pluckedString)
       case .vocalTract:
        vocalTract.start()
        mixer.addInput(vocalTract)
       case .pwmOscillator:
        pwmOscillator.start()
        mixer.addInput(pwmOscillator)
       case .dynamicOscillator:
        dynamicOscillator.start()
        mixer.addInput(dynamicOscillator)
       }
        

   }
    
    func startSynth(){
        
        stopSynth()
        
        switch choosenSynth {
        case .oscillator:
         oscillator.start()
        case .fmSynth:
         fmSynth.start()
        case .pluckedString:
         pluckedString.start()
        case .vocalTract:
         vocalTract.start()
        case .pwmOscillator:
         pwmOscillator.start()
        case .dynamicOscillator:
         dynamicOscillator.start()
        }
    }
    
    func stopSynth(){
        oscillator.stop()
        fmSynth.stop()
        pluckedString.stop()
        vocalTract.stop()
        pwmOscillator.stop()
        dynamicOscillator.stop()
    }
    
    func setNoteFrequency(_ frequency: AUValue){
        
        oscillator.frequency = frequency
        fmSynth.baseFrequency = frequency
        dynamicOscillator.frequency = frequency
        pluckedString.frequency = frequency
        pwmOscillator.frequency = frequency
        vocalTract.frequency = frequency
        
    }
    
    func setWaveform(_ waveform:Table){
        
        switch choosenSynth {
        case .oscillator:
         oscillator.start()
        case .fmSynth:
         fmSynth.start()
        case .pluckedString:
         pluckedString.start()
        case .vocalTract:
         vocalTract.start()
        case .pwmOscillator:
         pwmOscillator.start()
        case .dynamicOscillator:
         dynamicOscillator.start()
        }
        
    }
    
    // MARK: Oscillator
    
    
    
    /*
     oscillator:
     waveform
     detuningOffset
     detuningMultiplier
     
     fmSynth:
     waveform
     baseFrequency
     carrierMultiplier
     modulatingMultiplier
     modulationIndex
     
     dynamicOscillator:
     waveform
     detuningOffset
     detuningMultiplier
     
     pluckedString:
     lowestFrequency
     
     pwmOscillator:
     pulseWidth
     detuningOffset
     detuningMultiplier
     
     vocalTract:
     tonguePosition
     tongueDiameter
     tenseness
     nasality
     
     
     */
    
    
}

enum ChooseSynth {
    case fmSynth
    case oscillator
    case pluckedString
    case vocalTract
    case pwmOscillator
    case dynamicOscillator
}



/*
 
 https://github.com/AudioKit/SoundpipeAudioKit/wiki/Oscillator
 waveform: The waveform of oscillation
 frequency: Frequency in cycles per second
 amplitude: Output Amplitude.
 detuningOffset: Frequency offset in Hz.
 detuningMultiplier: Frequency detuning multiplier
 
 
 https://github.com/AudioKit/SoundpipeAudioKit/wiki/FMOscillator
 waveform: The waveform of oscillation
 baseFrequency: In cycles per second, the common denominator for the carrier and modulating frequencies.
 carrierMultiplier: This multiplied by the baseFrequency gives the carrier frequency.
 modulatingMultiplier: This multiplied by the baseFrequency gives the modulating frequency.
 modulationIndex: This multiplied by the modulating frequency gives the modulation amplitude.
 amplitude: Output Amplitude.

 
 https://github.com/AudioKit/SoundpipeAudioKit/wiki/VocalTract
 frequency: Glottal frequency.
 tonguePosition: Tongue position (0-1)
 tongueDiameter: Tongue diameter (0-1)
 tenseness: Vocal tenseness. 0 = all breath. 1=fully saturated.
 nasality: Sets the velum size. Larger values of this creates more nasally sounds.
 
 
 https://github.com/AudioKit/SoundpipeAudioKit/wiki/PWMOscillator
 frequency: In cycles per second, or Hz.
 amplitude: Output amplitude
 pulseWidth: Duty cycle width (range 0-1).
 detuningOffset: Frequency offset in Hz.
 detuningMultiplier: Frequency detuning multiplier
 
 
 https://github.com/AudioKit/SoundpipeAudioKit/wiki/DynamicOscillator
 waveform: The waveform of oscillation
 frequency: Frequency in cycles per second
 amplitude: Output Amplitude.
 detuningOffset: Frequency offset in Hz.
 detuningMultiplier: Frequency detuning multiplier
 
 
 https://github.com/AudioKit/SoundpipeAudioKit/wiki/PluckedString
 
 frequency: Variable frequency. Values less than the initial frequency
 are doubled until greater than that.
 amplitude: Amplitude
 lowestFrequency: This frequency is used to allocate all the buffers needed for the delay. T
 his should be the lowest frequency you plan on using.
 
 
 
 
 
 
 
 
 
 
 
 */
