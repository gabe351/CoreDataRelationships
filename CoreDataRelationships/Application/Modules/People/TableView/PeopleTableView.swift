import UIKit

class PeopleTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    var listener: PersonTableViewClickListener?
    var people = [Person]()
        
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
        
        let currentPerson = people[indexPath.row]
        
        cell.setup(title: currentPerson.name ?? "" , subtitle: "")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentPerson = people[indexPath.row]
        listener?.select(person: currentPerson)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let rowHeight: CGFloat = 50
        return rowHeight
    }
        
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            let currentPerson = people[indexPath.row]
            listener?.delete(person: currentPerson)
        }
    }
}
