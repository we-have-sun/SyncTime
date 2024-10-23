import Foundation
import SwiftData

@Model
class Time: NSCopying  {
    var name: String = "Untitle Time"
    var duration: Int64 = 0
    var isRunning: Bool = false
    var startDate: Date? = Date.now
    var endDate: Date? = nil
    var project: Project?
    
    init(name: String, duration: Int64, startDate: Date, endDate: Date? = nil, project: Project? = nil, isRunning: Bool) {
        self.name = name
        self.duration = duration
        self.startDate = startDate
        self.endDate = endDate
        self.isRunning = isRunning
        self.project = project
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        let copy = Time(name: name, duration: duration, startDate:startDate ?? Date.now, endDate:endDate ?? Date.now, isRunning: isRunning)
            return copy
        }
    func calculatedDuration() -> Int64 {
        return Int64(endDate?.timeIntervalSince(startDate!) ?? 0)
    }
    
}
