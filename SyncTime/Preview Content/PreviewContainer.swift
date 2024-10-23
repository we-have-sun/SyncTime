import SwiftUI
import SwiftData

@MainActor
class DataController {
    static let previewWithProjects: ModelContainer = {
        do {
            let config = ModelConfiguration(isStoredInMemoryOnly: true)
            let schema = Schema([Project.self, Time.self])
            let container = try ModelContainer(for: schema, configurations: config)

            var firstProject: Project? = nil
            
            for i in 1...9 {
                let creationDate = Date.now.addingTimeInterval(TimeInterval(i))
                let project = Project(name: "Project \(i)", creationDate: creationDate)
                container.mainContext.insert(project)
                if i == 1 {
                                    firstProject = project
                                }
            }
            if let firstProject = firstProject {
                let time = Time(
                    name: "Untitled",
                    duration: 0,
                    startDate: Date.now.addingTimeInterval(-3600), // 1 hour ago
                    project: firstProject,
                    isRunning: true
                    )
                container.mainContext.insert(time)
            }

            return container
        } catch {
            fatalError("Failed to create model container for previewing: \(error.localizedDescription)")
        }
    }()
    
    static let previewEmpty: ModelContainer = {
        do {
            let config = ModelConfiguration(isStoredInMemoryOnly: true)
            let schema = Schema([Project.self, Time.self])
            let container = try ModelContainer(for: schema, configurations: config)

            return container
        } catch {
            fatalError("Failed to create model container for previewing: \(error.localizedDescription)")
        }
    }()
}
