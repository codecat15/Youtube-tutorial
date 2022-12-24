//Created by CodeCat15 on 12/23/22

import Foundation

enum DateFormat {
    static let APP_DATE_FORMAT = "dd-MM-yyyy"
}

extension String {
    
    func convertToAppDateFormat() -> Date? {
        
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormat.APP_DATE_FORMAT
        let result = formatter.date(from: self)
        
        return result
    }
}
