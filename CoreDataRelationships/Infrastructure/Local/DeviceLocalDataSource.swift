import CoreData

struct DeviceLocalDataSource {
    
    static let shared = DeviceLocalDataSource()
    
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
    public func createDevices(name: String) -> Device? {
        let context = BaseLocalDataSource.shared.getContext()
        
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
    
    public func fetchAllDevices() -> [Device] {
        let context = BaseLocalDataSource.shared.getContext()
        
        let fetchRequest = NSFetchRequest<Device>(entityName: "Device")
        
        do {
            let devices = try context.fetch(fetchRequest)
            return devices
        } catch let fetchError {
            print("Failed to fecth \(fetchError)")
        }
        
        return []
    }
}
