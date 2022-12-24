//Created by CodeCat15 on 12/23/22

import Foundation

struct Product: Decodable {
    
    let id: Int
    let name: String
    let category: String
    
    let weight: Double
    let manufacturingDate: Date
    let expiryDate: Date
    
    let isAvailable: Bool
    let shopkeepers: [Shopkeeper]?
    
    enum CodingKeys: CodingKey {
        case id
        case name
        case category
        case weight
        case manufacturingDate
        case expiryDate
        case isAvailable
        case shopkeepers
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let tempId = try container.decode(String.self, forKey: .id)
        let tempWeight = try container.decode(String.self, forKey: .weight)
        
        let tempMFGDate = try container.decode(String.self, forKey: .manufacturingDate)
        let tempExpDate = try container.decode(String.self, forKey: .expiryDate)
        let tempIsAvailable = try container.decode(String.self, forKey: .isAvailable)
        
        self.id = Int(tempId)!
        self.name = try container.decode(String.self, forKey: .name)
        self.category = try container.decode(String.self, forKey: .category)
        self.weight = Double(tempWeight) ?? 0
        self.manufacturingDate = tempMFGDate.convertToAppDateFormat()!
        self.expiryDate = tempExpDate.convertToAppDateFormat()!
        self.isAvailable = Bool(tempIsAvailable) ?? false
        self.shopkeepers = try container.decodeIfPresent([Shopkeeper].self, forKey: .shopkeepers)
    }
    
    static func getProductJsonAsString() -> String {
        return """
                [
                  {
                    "id": "1",
                    "name": "Test",
                    "category": "Test Category",
                    "weight": "20",
                    "manufacturingDate": "25-10-2022",
                    "expiryDate": "25-12-2023",
                    "isAvailable": "false",
                  },
                  {
                    "id": "2",
                    "name": "Test 2",
                    "category": "Test Category 2",
                    "weight": "10",
                    "manufacturingDate": "1-10-2022",
                    "expiryDate": "05-07-2023",
                    "isAvailable": "true",
                    "shopkeepers": [
                      {
                        "id": "12",
                        "name": "Shopkeeper name 1",
                        "isActive": "false",
                        "registerDate": "15-07-2004",
                        "quantity": "0"
                      },
                      {
                        "id": "1324",
                        "name": "Shopkeeper name 2",
                        "isActive": "true",
                        "registerDate": "08-06-2001",
                        "quantity": "200"
                      }
                    ]
                  }
                ]

"""
    }
    
}
