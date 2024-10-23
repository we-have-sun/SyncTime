import SwiftUI
import SwiftData


struct TimeDisplay: View {
    var project: ProjectModel
    init(project: Project) {
            let projectModel = ProjectModel(project: project)
            self.project = projectModel
        }
    
    var body: some View{
        ForEach(project.project.times ?? []) { time in
            if time.isRunning {
                RunningTime(time: time)
            } else {
                Text("Past Duration: \(time.duration)")
                    .font(.caption)
            }
            
            
        }
    }
}
