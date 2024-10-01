import SwiftUI
import SwiftData

@Observable
class ProjectModel {
    var project: Project
    init(project: Project) {
        self.project = project
    }
}


struct TimeDisplay: View {
    var project: ProjectModel
    init(project: Project) {
            let projectModel = ProjectModel(project: project)
            self.project = projectModel
        }
    
    var body: some View{
        ForEach(project.project.times ?? [], id:\.self) { time in
            Text("Time Duration: \(time.duration)")
                .font(.caption)
                .foregroundStyle(time.isRunning ? .red : .black)
        }
    }
}
