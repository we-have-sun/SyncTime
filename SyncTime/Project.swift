import Foundation
import SwiftData

@Model
class Project {
    var name: String = "Untitled"
    var creationDate: Date = Date.now
    @Relationship(deleteRule: .cascade) var times: [Time]? = [Time]()
    var unwrappedTimes: [Time] {
        times ?? []
    }
    init(name: String, creationDate: Date) {
        self.name = name
        self.creationDate = creationDate
    }
}
