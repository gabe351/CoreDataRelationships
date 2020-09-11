import CoreData

struct PersonLocalDataSource {
    
    static let shared = PersonLocalDataSource()
    
    let persistentContainer: NSPersistentContainer = {
       let container = NSPersistentContainer(name: "CoreDataRelationships")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        
        return container
    }()
    
    @discardableResult
    public func createPerson(name: String) -> Person? {
        let context = BaseLocalDataSource.shared.getContext()
        
        let person = NSEntityDescription.insertNewObject(forEntityName: "Person", into: context) as! Person
        
        person.name = name
        
        
        do {
            try context.save()
            return person
        } catch let createError {
            print("Failed to create person \(createError)")
        }
        
        return nil
    }
    
    public func fetchAllPeople() -> [Person] {
        let context = BaseLocalDataSource.shared.getContext()
        
        let fetchRequest = NSFetchRequest<Person>(entityName: "Person")
        
        do {
            let people = try context.fetch(fetchRequest)
            return people
        } catch let fetchError {
            print("Failed to fecth \(fetchError)")
        }
        
        return []
    }
    
    public func addDeviceTo(person: Person, _ device: Device) {
        let context = BaseLocalDataSource.shared.getContext()
        
        person.addToDevice(device)
        
        do {
            try context.save()
        } catch let fetchError {
            print("Failed to update \(fetchError)")
        }
    }
}
