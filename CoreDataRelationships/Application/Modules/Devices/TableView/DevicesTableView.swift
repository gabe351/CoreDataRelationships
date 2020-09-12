import UIKit

class DevicesTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    var listener: DeviceTableViewClickListener?
    var devices = [Device]()
        
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.delegate = self
        self.dataSource = self
        
        let cell = UINib(nibName: TableViewCell.nibName, bundle: nil)
        self.register(cell, forCellReuseIdentifier: TableViewCell.identifier)
        
        initialConfiguration()
    }
    
    private func initialConfiguration() {
        self.backgroundColor = .none
    }
            
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath as IndexPath) as! TableViewCell
        
        let currentDevice = devices[indexPath.row]
        
        cell.setup(title: currentDevice.name ?? "", subtitle: currentDevice.owner?.name ?? "Do not have owner")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentDevice = devices[indexPath.row]
        listener?.select(device: currentDevice)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return devices.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let rowHeight: CGFloat = 85
        return rowHeight
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            let currentDevice = devices[indexPath.row]
            listener?.delete(device: currentDevice)
        }
    }
}
