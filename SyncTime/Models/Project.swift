import Foundation
import SwiftData

@Model
class Project {
    var name: String = "Untitled"
    var creationDate: Date = Date.now
    var times: [Time]? = [Time]()
    
    private var unwrappedTimes: [Time] {
        times ?? []
    }
    
    var hasRunningTimers: Bool {
        return unwrappedTimes.contains { $0.isRunning }
    }
    
    init(name: String, creationDate: Date) {
        self.name = name
        self.creationDate = creationDate
    }

}
