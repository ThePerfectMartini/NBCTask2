//
//  DateFormatter.swift
//  NBCTask2
//
//  Created by t2023-m0078 on 2023/09/20.
//

import Foundation

class dateFormatter {
    
    
    static func dateFormat(_ date:Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd HH:mm:ss"
        
        return dateFormatter.string(from: date)
    }
}


