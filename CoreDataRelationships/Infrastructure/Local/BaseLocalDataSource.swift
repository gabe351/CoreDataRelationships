import CoreData

struct BaseLocalDataSource {
    
    static let shared = BaseLocalDataSource()
    
    let persistentContainer: NSPersistentContainer = {
       let container = NSPersistentContainer(name: "CoreDataRelationships")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        
        return container
    }()
    
    public func getContext() -> NSManagedObjectContext {
        return persistentContainer.viewContext
    }
}


