//
//  SynthData+CoreDataClass.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 18/08/2021.
//
//

import Foundation
import CoreData


public class SynthData: NSManagedObject {
    
    public static func builder () -> SynthData {
        let newSynthData = NSEntityDescription.insertNewObject(forEntityName: "SynthData", into: CoreDataManager.shared.persistentContainer.viewContext) as! SynthData
        
        let dv: DefaultValues = DefaultValues()
 
        // MARK: Synth
        
        newSynthData.synthType = dv.synthType

         // Oscillator
        newSynthData.oscAttack = dv.oscAttack
        newSynthData.oscDecay = dv.oscDecay
        newSynthData.oscSustain = dv.oscSustain
        newSynthData.oscRelease = dv.oscRelease

         // FmSynth
        newSynthData.fmSynthAttack = dv.fmSynthAttack
        newSynthData.fmSynthDecay = dv.fmSynthDecay
        newSynthData.fmSynthSustain = dv.fmSynthSustain
        newSynthData.fmSynthRelease = dv.fmSynthRelease
        
        newSynthData.carrierMultiplier = dv.carrierMultiplier
        newSynthData.modulatingMultiplier = dv.modulatingMultiplier
        newSynthData.modulationIndex = dv.modulationIndex

         // Dynamic Oscillator
        newSynthData.dynamicOscillatorAttack = dv.dynamicOscillatorAttack
        newSynthData.dynamicOscillatorDecay = dv.dynamicOscillatorDecay
        newSynthData.dynamicOscillatorSustain = dv.dynamicOscillatorSustain
        newSynthData.dynamicOscillatorRelease = dv.dynamicOscillatorRelease
        
        newSynthData.dynamicOscillatorWaveform = dv.dynamicOscillatorWaveform
        newSynthData.detuningOffset = dv.detuningOffset
        newSynthData.doDetuningMultiplier = dv.doDetuningMultiplier

         //Plucked String
        newSynthData.pluckedStringAttack = dv.pluckedStringAttack
        newSynthData.pluckedStringDecay = dv.pwmOscillatorDecay
        newSynthData.pluckedStringSustain = dv.pluckedStringSustain
        newSynthData.pluckedStringRelease = dv.pluckedStringRelease

         //PWM
        newSynthData.pwmOscillatorAttack = dv.pwmOscillatorAttack
        newSynthData.pwmOscillatorDecay = dv.pwmOscillatorDecay
        newSynthData.pwmOscillatorSustain = dv.pwmOscillatorSustain
        newSynthData.pwmOscillatorRelease = dv.pluckedStringRelease
        newSynthData.pwdDetuningMultiplier = dv.pwdDetuningMultiplier
        newSynthData.pulseWidth = dv.pulseWidth

         //Vocal TractA
        newSynthData.vocalTractAttacK = dv.vocalTractAttacK
        newSynthData.vocalTractDecay = dv.vocalTractDecay
        newSynthData.vocalTractSustain = dv.vocalTractSustain
        newSynthData.vocalTractRelease = dv.vocalTractRelease
        
        newSynthData.tonguePosition = dv.tonguePosition
        newSynthData.tongueDiameter = dv.tongueDiameter
        newSynthData.tenseness = dv.tenseness
        newSynthData.nasality = dv.nasality
        newSynthData.randomTonguePosition = dv.randomTonguePosition

        
        // MARK: Hermonizer
        
        newSynthData.hermonizerOnOff = dv.hermonizerOnOff
        newSynthData.harmonyFrequency = dv.harmonyFrequency
        newSynthData.hermonizerGain = dv.hermonizerGain
         
        
        // MARK: Diatortion
        
        newSynthData.distOnOff = dv.distOnOff
        newSynthData.negativeShapeParameter = dv.negativeShapeParameter
        newSynthData.positiveShapeParameter = dv.positiveShapeParameter
        newSynthData.pregain = dv.pregain
        newSynthData.postgain = dv.postgain


        // MARK: Modulation
        
        newSynthData.modulationType = dv.modulationType
        newSynthData.modDryWetMix = dv.modDryWetMix
        newSynthData.modOnOff = dv.modOnOff
        newSynthData.modGain = dv.modGain

        // Chorus
        newSynthData.chorusFrequency = dv.chorusFrequency
        newSynthData.chorusDepth = dv.chorusDepth
        newSynthData.chorusFeedback = dv.chorusFeedback

        // Flanger
        newSynthData.flangerFrequency = dv.flangerFrequency
        newSynthData.flangerFeedback = dv.flangerFeedback
        newSynthData.flangerDepth = dv.flangerDepth

        // Tremolo
        newSynthData.tremoloFrequency = dv.tremoloFrequency
        newSynthData.tremoloDepth = dv.tremoloDepth
        newSynthData.tremoloWaveform = dv.tremoloWaveform


        // MARK: Reverb
        newSynthData.reverbOnOff = dv.reverbOnOff
        newSynthData.reverbCutoffFrequency = dv.reverbCutoffFrequency
        newSynthData.reverbFeedback = dv.reverbFeedback
        newSynthData.reverbGain = dv.reverbGain
        newSynthData.reverbDryWetMix = dv.reverbDryWetMix

        
        // MARK: Delay
        
        newSynthData.delayOnOff = dv.delayOnOff
        newSynthData.delayType = dv.delayType
        
        // Variable Delay
        newSynthData.variableDelayTime = dv.variableDelayTime
        newSynthData.variableDelayFeedback = dv.variableDelayFeedback
        newSynthData.variableDelayGain = dv.variableDelayGain
        newSynthData.variableDelayDryWetMix = dv.variableDelayDryWetMix
        
        // Stereo Delay
        newSynthData.stereoDelayTime = dv.stereoDelayTime
        newSynthData.stereoDelayFeedback = dv.stereoDelayFeedback
        newSynthData.stereoDelayGain = dv.stereoDelayGain
        newSynthData.stereoDelayDryWetMix = dv.stereoDelayDryWetMix
        
        
        // MARK: EQ
        
        newSynthData.eqOnOff = dv.eqOnOff
        newSynthData.eqType = dv.eqType
        newSynthData.eqGain = dv.eqGain

        //HighPass
        newSynthData.highPassOnOff = dv.highPassOnOff
        newSynthData.highPassFrequency = dv.highPassFrequency
        
        // Bass
        newSynthData.bassOnOff = dv.bassOnOff
        newSynthData.bassFrequency = dv.bassFrequency
        newSynthData.bassBandwidth = dv.bassBandwidth
        newSynthData.bassGain = dv.bassGain

        // LowMid
        newSynthData.lowMidOnOff = dv.lowMidOnOff
        newSynthData.lowMidFrequency = dv.lowMidFrequency
        newSynthData.lowMidBandwidth = dv.lowMidBandwidth
        newSynthData.lowMidGain = dv.lowMidGain

        // HighMid
        newSynthData.highMidOnOff = dv.highMidOnOff
        newSynthData.highMidFrequency = dv.highMidFrequency
        newSynthData.highMidBandwidth = dv.highMidBandwidth
        newSynthData.highMidGain = dv.highMidGain

        // Treble
        newSynthData.trebleOnOff = dv.trebleOnOff
        newSynthData.trebleFrequency = dv.trebleFrequency
        newSynthData.trebleBandwidth = dv.trebleBandwidth
        newSynthData.trebleGain = dv.trebleGain

        // LowPass
        newSynthData.lowPassOnOff = dv.lowPassOnOff
        newSynthData.lowPassFrequency = dv.lowPassFrequency
        

        CoreDataManager.shared.saveContext()
        return newSynthData
    }
}
