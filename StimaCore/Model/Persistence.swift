//
//  Persistence.swift
//  StimaCore
//
//  Created by salvatore dessena on 19/02/22.
//

import CoreData

struct PersistenceController {
    
    // MARK: - 1. PERSISTENCE CONTROLLER
    static let shared = PersistenceController()

    
    // MARK: - 2. PERSISTENCE CONTAINER
    let container: NSPersistentContainer

    
    // MARK: - 3. INITIALIZATION (load persistent store)
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "StimaCore")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
    
    // MARK: - 4. PREVIEW
    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for i in 0..<5 {
            let newItem = Item(context: viewContext)
            newItem.title = "Sample Task n. \(i)"
            
            newItem.via = ""
            newItem.comune = ""
            newItem.foglio = ""
            newItem.mappale = ""
            newItem.sub = ""
            newItem.nome = ""
            newItem.order = ""
            newItem.provincia = ""
            newItem.numeroIscrizione = ""
            newItem.indirizzoTecnico = ""
            
            
            newItem.timestamp = Date()
            newItem.superficie = 0.00
            newItem.costoMq = 0.00
            newItem.snr = 0.00
            newItem.plot = 0.00
            newItem.cellar = 0.00
            newItem.completion = false
            newItem.id = UUID()
            
            //CONSERVAZIONE
            newItem.structValue = 0.00
            newItem.roofValue = 0.00
            newItem.windowsValue = 0.00
            newItem.plastersValue = 0.00
            newItem.installationsValue = 0.00
            newItem.floorsValue = 0.00
            
            // POSIZONE
            newItem.accessibilitaValue = 0.00
            newItem.ubicazioneValue = 0.00
            newItem.esposizioneValue = 0.00
            newItem.trasformabilitaValue = 0.00
            
        }
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()
}
