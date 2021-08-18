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

    func saveContext () {
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
    
//    func getSettings() -> Osc? {
//        let context = persistentContainer.viewContext
//        let request:NSFetchRequest<Osc> = Osc.fetchRequest()
//        if let result = context.fetch(request) {
//            return result.first
//        }
//        return nil
//    }
    
  
    
    
}
