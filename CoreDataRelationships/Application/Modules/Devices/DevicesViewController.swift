//
//  ViewController.swift
//  CoreDataRelationships
//
//  Created by Gabriel Rosa on 9/11/20.
//  Copyright © 2020 Gabriel Rosa. All rights reserved.
//

import UIKit

class DevicesViewController: UIViewController, DeviceTableViewClickListener {
                    
    @IBOutlet weak var devicesTableView: DevicesTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        devicesTableView.listener = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadTableView()
    }

    @IBAction func addDidPress(_ sender: Any) {
        let alert = UIAlertController(
            title: "Add Device",
            message: "Enter the device to add",
            preferredStyle: .alert)

        alert.addTextField()

        let submitAction = UIAlertAction(title: "Add", style: .default) {  [unowned self] (action)  in
            let textField = alert.textFields![0]

            guard let name = textField.text else {
                return
            }
            
            let createdDevice = DeviceLocalDataSource.shared.createDevices(name: name)
            
            if createdDevice != nil {
                self.reloadTableView()
            }
        }

        alert.addAction(submitAction)

        self.present(alert, animated: true, completion: nil)
    }
            
    func select(device: Device) {
        let peopleViewController = PeopleViewController()
        peopleViewController.device = device
        
        self.navigationController?.pushViewController(peopleViewController, animated: true)
    }
    
    private func reloadTableView() {
        let devices = DeviceLocalDataSource.shared.fetchAllDevices()
        devicesTableView.devices = devices
        devicesTableView.reloadData()
    }
}

