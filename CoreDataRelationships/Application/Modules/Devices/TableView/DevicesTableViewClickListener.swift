import Foundation

protocol DeviceTableViewClickListener {
    func select(device: Device)
    func delete(device: Device)
}
