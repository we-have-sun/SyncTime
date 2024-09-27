//
//  Time.swift
//  SyncTime
//
//  Created by Nicho on 24/09/2024.
//

import Foundation
import SwiftData

@Model
class Time: Hashable {
    var name: String = "Untitle Time"
    var duration: Int64 = 0
    var isRunning: Bool = false
    var startDate: Date? = Date.now
    var project: Project?
    
    
    init(name: String, duration: Int64, startDate: Date, parent: Project? = nil, isRunning: Bool) {
        self.name = name
        self.duration = duration
        self.startDate = startDate
        self.isRunning = isRunning
        self.project = project
    }

    
}
