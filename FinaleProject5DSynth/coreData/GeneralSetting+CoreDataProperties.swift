//
//  GeneralSetting+CoreDataProperties.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 22/08/2021.
//
//

import Foundation
import CoreData


extension GeneralSetting {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GeneralSetting> {
        return NSFetchRequest<GeneralSetting>(entityName: "GeneralSetting")
    }

    @NSManaged public var darkLightMod: Int64
    @NSManaged public var playbackCountdown: Bool
    @NSManaged public var recordCountdown: Bool
    @NSManaged public var recordplayback: Bool
    @NSManaged public var synthGain: Float
    @NSManaged public var playbackGain: Float
    @NSManaged public var synthRecordGain: Float
    @NSManaged public var playbackRecordGain: Float
    @NSManaged public var recordInputGain: Float

}

extension GeneralSetting : Identifiable {

}
