//
//  DateHelpers.swift
//  Task
//
//  Created by Steve Lederer on 12/5/18.
//  Copyright © 2018 Steve Lederer. All rights reserved.
//

import Foundation

extension Date {
    
    func stringValue() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        
        return formatter.string(from: self)
    }
    
}
