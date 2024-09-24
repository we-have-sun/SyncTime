//
//  Time.swift
//  SyncTime
//
//  Created by Nicho on 24/09/2024.
//

import Foundation
import SwiftData

@Model
class Time {
    var name: String = "Untitle Time"
    var duration: Int64 = 0
    var startDate: Date = Date.now
    var parent: Project?
    
    init(name: String, duration: Int64, startDate: Date) {
        self.name = name
        self.duration = duration
        self.startDate = startDate
    }
    
}
