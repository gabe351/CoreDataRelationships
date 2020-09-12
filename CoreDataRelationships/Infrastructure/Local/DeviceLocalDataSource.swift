import CoreData

struct DeviceLocalDataSource {
    
    static let shared = DeviceLocalDataSource()
    
    let context = BaseLocalDataSource.shared.getContext()
            
    @discardableResult
    public func createDevices(name: String) -> Device? {
        let device = NSEntityDescription.insertNewObject(forEntityName: "Device", into: context) as! Device            
        device.name = name
                
        do {
            try context.save()
            return device
        } catch let createError {
            print("Failed to create person \(createError)")
        }
        
        return nil
    }
    
    public func update(device: Device) {
        do {
            try context.save()
        } catch let error {
            print("Failed to update person, reason: \(error)")
        }
    }
    
    public func fetchAllDevices() -> [Device] {
        let fetchRequest = NSFetchRequest<Device>(entityName: "Device")
        
        do {
            let devices = try context.fetch(fetchRequest)
            return devices
        } catch let fetchError {
            print("Failed to fecth \(fetchError)")
        }
        
        return []
    }
    
    public func fetchBy(name: String) -> Device? {
        let fetchRequest = NSFetchRequest<Device>(entityName: "Device")
        fetchRequest.fetchLimit = 1
        fetchRequest.predicate = NSPredicate(format: "name == %@", name)
        
        do {
            let foundDevices = try context.fetch(fetchRequest)
            return foundDevices.first
        } catch let error {
            print("Failed to find device with name: \(name) Error: \(error)")
        }
        
        return nil
    }
    
        
    public func delete(device: Device) {
        context.delete(device)
        
        do {
            try context.save()
        } catch let error {
            print("Failed to delete person, reason: \(error)")
        }
    }    
}
