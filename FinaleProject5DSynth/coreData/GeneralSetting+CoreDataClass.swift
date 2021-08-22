//
//  GeneralSetting+CoreDataClass.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 22/08/2021.
//
//

import Foundation
import CoreData

@objc(GeneralSetting)
public class GeneralSetting: NSManagedObject {
    
    public static func builder () -> GeneralSetting{
        let newGeneralData = NSEntityDescription.insertNewObject(forEntityName: "GeneralSetting", into: CoreDataManager.shared.persistentContainer.viewContext) as! GeneralSetting
        
        let dv: DefaultValues = DefaultValues()
        
        newGeneralData.darkLightMod = dv.darkLightMod
        newGeneralData.playbackCountdown = dv.playbackCountdown
        newGeneralData.recordCountdown = dv.recordCountdown
        newGeneralData.recordPlayback = dv.recordPlayback
        newGeneralData.synthGain = dv.synthGain
        newGeneralData.playbackGain = dv.playbackGain
        newGeneralData.synthRecordGain = dv.synthRecordGain
        newGeneralData.playbackRecordGain = dv.playbackRecordGain
        newGeneralData.recordInputGain = dv.recordInputGain
        
        CoreDataManager.shared.saveContext()
        return newGeneralData
        
    }
}
