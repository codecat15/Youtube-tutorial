//Created by CodeCat15 on 12/22/22

import Foundation

struct Shopkeeper: Decodable {
    
    let id: Int
    let name: String
    let isActive: Bool
    let registerDate: Date
    let quantity: Double
    
    enum CodingKeys: CodingKey {
        case id
        case name
        case isActive
        case registerDate
        case quantity
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let tempId = try container.decode(String.self, forKey: .id)
        let tempRegisterDate = try container.decode(String.self, forKey: .registerDate)
        let tempIsActive = try container.decode(String.self, forKey: .isActive)
        let tempQuantity = try container.decode(String.self, forKey: .quantity)
        
        self.id = Int(tempId) ?? 0
        self.name = try container.decode(String.self, forKey: .name)
        self.isActive = Bool(tempIsActive) ?? false
        self.registerDate = tempRegisterDate.convertToAppDateFormat() ?? Date()
        self.quantity = Double(tempQuantity) ?? 0
    }
}
