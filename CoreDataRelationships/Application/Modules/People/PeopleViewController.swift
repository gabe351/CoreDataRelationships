//
//  SecondViewController.swift
//  CoreDataRelationships
//
//  Created by Gabriel Rosa on 9/11/20.
//  Copyright © 2020 Gabriel Rosa. All rights reserved.
//

import UIKit

class PeopleViewController: UIViewController, PersonTableViewClickListener {
        
    @IBOutlet weak var peopleTableView: PeopleTableView!
    
    var device: Device?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add Person", style: .plain, target: self, action: #selector(addTapped))
        peopleTableView.listener = self        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadTableView()
    }
    
    @objc
    public func addTapped() {
        let alert = UIAlertController(
            title: "Add Person",
            message: "Enter the person to add",
            preferredStyle: .alert)

        alert.addTextField()

        let submitAction = UIAlertAction(title: "Add", style: .default) {  [unowned self] (action)  in
            let textField = alert.textFields![0]

            guard let name = textField.text else {
                return
            }
            
            PersonLocalDataSource.shared.createPerson(name: name)
            
            self.reloadTableView()
        }

        alert.addAction(submitAction)

        self.present(alert, animated: true, completion: nil)
    }

    func select(person: Person) {
        guard let selectedDevice = device else {
            print("Failed to load device")
            return
        }
        
        PersonLocalDataSource.shared.addDeviceTo(person: person, selectedDevice)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    func reloadTableView() {
        let people = PersonLocalDataSource.shared.fetchAllPeople()
        peopleTableView.people = people
        peopleTableView.reloadData()
    }
}
