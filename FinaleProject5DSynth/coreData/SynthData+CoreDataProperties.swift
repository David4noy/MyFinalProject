//
//  SynthData+CoreDataProperties.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 13/08/2021.
//
//

import Foundation
import CoreData


extension SynthData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SynthData> {
        return NSFetchRequest<SynthData>(entityName: "SynthData")
    }

    @NSManaged public var carrierMultiplier: Float
    @NSManaged public var modulatingMultiplier: Float
    @NSManaged public var synthType: Int64
    @NSManaged public var modulationIndex: Float
    @NSManaged public var detuningOffset: Float
    @NSManaged public var dynamicOscillatorWaveform: Int64
    @NSManaged public var doDetuningMultiplier: Float
    @NSManaged public var pwdDetuningMultiplier: Float
    @NSManaged public var pulseWidth: Float
    @NSManaged public var tonguePosition: Float
    @NSManaged public var tongueDiameter: Float
    @NSManaged public var tenseness: Float
    @NSManaged public var nasality: Float
    @NSManaged public var randomTonguePosition: Bool
    @NSManaged public var hermonizerOnOff: Bool
    @NSManaged public var harmonyFrequency: Int64
    @NSManaged public var hermonizerGain: Float
    @NSManaged public var oscAttack: Float
    @NSManaged public var oscDecay: Float
    @NSManaged public var oscSustain: Float
    @NSManaged public var oscRelease: Float
    @NSManaged public var fmSynthAttack: Float
    @NSManaged public var fmSynthDecay: Float
    @NSManaged public var fmSynthSustain: Float
    @NSManaged public var dynamicOscillatorRelease: Float
    @NSManaged public var fmSynthRelease: Float
    @NSManaged public var dynamicOscillatorAttac: Float
    @NSManaged public var dynamicOscillatorDecay: Float
    @NSManaged public var dynamicOscillatorSustain: Float
    @NSManaged public var pluckedStringAttac: Float
    @NSManaged public var pluckedStringDecay: Float
    @NSManaged public var pluckedStringSustain: Float
    @NSManaged public var pluckedStringRelease: Float
    @NSManaged public var pwmOscillatorAttac: Float
    @NSManaged public var pwmOscillatorDecay: Float
    @NSManaged public var pwmOscillatorSustain: Float
    @NSManaged public var pwmOscillatorRelease: Float
    @NSManaged public var pregain: Float
    @NSManaged public var vocalTractDecay: Float
    @NSManaged public var vocalTractSustain: Float
    @NSManaged public var vocalTractRelease: Float
    @NSManaged public var distOnOff: Bool
    @NSManaged public var negativeShapeParameter: Float
    @NSManaged public var positiveShapeParameter: Float
    @NSManaged public var vocalTractAttac: Float
    @NSManaged public var postgain: Float
    @NSManaged public var modulationType: Int64
    @NSManaged public var flangerFrequency: Float
    @NSManaged public var chorusFrequency: Float
    @NSManaged public var tremoloFrequency: Float
    @NSManaged public var flangerDepth: Float
    @NSManaged public var chorusDepth: Float
    @NSManaged public var tremoloDepth: Float
    @NSManaged public var chorusFeedback: Float
    @NSManaged public var flangerFeedback: Float
    @NSManaged public var tremoloWaveform: Int64
    @NSManaged public var modDryWetMix: Float
    @NSManaged public var modOnOff: Bool
    @NSManaged public var modGain: Float
    @NSManaged public var reverbOnOff: Bool
    @NSManaged public var reverbFeedback: Float
    @NSManaged public var reverbCutoffFrequency: Float
    @NSManaged public var reverbDryWetMix: Float
    @NSManaged public var reverbGain: Float
    @NSManaged public var delayOnOff: Bool
    @NSManaged public var delayFeedback: Float
    @NSManaged public var variableDelayTime: Float
    @NSManaged public var stereoDelayTime: Float
    @NSManaged public var delayType: Int64
    @NSManaged public var stereoDelayDryWetMix: Float
    @NSManaged public var variableDelayDryWetMix: Float
    @NSManaged public var delayGain: Float
    @NSManaged public var eqOnOff: Bool
    @NSManaged public var eqType: Int64
    @NSManaged public var highPassOnOff: Bool
    @NSManaged public var bassOnOff: Bool
    @NSManaged public var lowMid: Bool
    @NSManaged public var highMid: Bool
    @NSManaged public var trebleOnOff: Bool
    @NSManaged public var lowPassOnOff: Bool
    @NSManaged public var highPassFrequency: Float
    @NSManaged public var bassFrequency: Float
    @NSManaged public var lowMidFrequency: Float
    @NSManaged public var highMidFrequency: Float
    @NSManaged public var trebleFrequency: Float
    @NSManaged public var lowPassFrequency: Float
    @NSManaged public var bassBandwidth: Float
    @NSManaged public var lowMidBandwidth: Float
    @NSManaged public var highMidBandwidth: Float
    @NSManaged public var trebleBandwidth: Float
    @NSManaged public var bassGain: Float
    @NSManaged public var lowMidGain: Float
    @NSManaged public var highMidGain: Float
    @NSManaged public var trebleGain: Float
    @NSManaged public var eqGain: Float

}

extension SynthData : Identifiable {

}
