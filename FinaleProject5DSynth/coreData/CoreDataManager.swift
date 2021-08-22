//
//  CoreDataManager.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 17/08/2021.
//

import Foundation
import CoreData
class CoreDataManager {
    
    public static let shared:CoreDataManager = CoreDataManager()
    private init(){}
    
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "FinaleProject5DSynth")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func getSynthDataSettings() -> SynthData? {
        let context = persistentContainer.viewContext
        let request:NSFetchRequest<SynthData> = SynthData.fetchRequest()
        
        do {
            let result = try context.fetch(request)
            
            if result.isEmpty {
               return SynthData.builder()
            } else {
                return result.first
            }
            
        } catch  {
            print("Failed to fetch SynthData", error)
            return nil
        }

    }
    
    func getGeneralDataSettings() -> GeneralSetting? {
        let context = persistentContainer.viewContext
        let request:NSFetchRequest<GeneralSetting> = GeneralSetting.fetchRequest()
        
        do {
            let result = try context.fetch(request)
            
            if result.isEmpty {
               return GeneralSetting.builder()
            } else {
                return result.first
            }
            
        } catch  {
            print("Failed to fetch GeneralSetting", error)
            return nil
        }

    }
    
    
}
