import Foundation

protocol PersonTableViewClickListener: class {
    func select(person: Person)
    func delete(person: Person)
}
