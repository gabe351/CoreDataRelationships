import CoreData

struct PersonLocalDataSource {
    
    static let shared = PersonLocalDataSource()
    
    let context = BaseLocalDataSource.shared.getContext()
    
    @discardableResult
    public func createPerson(name: String) -> Person? {
//        let context = BaseLocalDataSource.shared.getContext()
        
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
    
    public func fetchBy(name: String) -> Person? {
        let fetchRequest = NSFetchRequest<Person>(entityName: "Person")
        fetchRequest.fetchLimit = 1
        fetchRequest.predicate = NSPredicate(format: "name == %@", name)
        
        do {
            let foundPeople = try context.fetch(fetchRequest)
            return foundPeople.first
        } catch let error {
            print("Failed to find person with name: \(name) Error: \(error)")
        }
        
        return nil
    }
    
    public func update(person: Person) {
        do {
            try context.save()
        } catch let error {
            print("Failed to update person, reason: \(error)")
        }
    }
    
    public func delete(person: Person) {
        context.delete(person)
        
        do {
            try context.save()
        } catch let error {
            print("Failed to delete person, reason: \(error)")
        }
    }
    
    public func fetchAllPeople() -> [Person] {
        
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
        
        person.addToDevice(device)
        
        do {
            try context.save()
        } catch let fetchError {
            print("Failed to update \(fetchError)")
        }
    }
}
