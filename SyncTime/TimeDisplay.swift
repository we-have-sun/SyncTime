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
    @Environment(\.modelContext) var modelContext
    @State var project: ProjectModel
    @State private var times: [Time] = []
    
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
        .onAppear {
            // Reload the times array when the view appears
            times = project.project.times ?? []
        }
        .onChange(of: project.project.times) {
            times = project.project.times ?? []
            print("CINT \(project.project.times?.count ?? 0 )")
        }

    }
    
    
}
