import SwiftUI
import SwiftData


class ProjectModel: ObservableObject {
    @Published var project: Project
    init(project: Project) {
        self.project = project
    }
}


struct TimeDisplay: View {
    @Environment(\.modelContext) var modelContext
    @ObservedObject var project: ProjectModel
    @State private var times: [Time] = []
    
    init(project: Project) {
            let projectModel = ProjectModel(project: project)
            self.project = projectModel
        }
    
    var body: some View{
        ForEach(project.project.times ?? [], id:\.self) { time in
            TestTimer(time: time)
        }
        .onAppear {
            // Reload the times array when the view appears
            times = project.project.times ?? []
        }
        .onChange(of: project.project.times) {
            times = project.project.times ?? []
            print("CINT \(project.project.times?.count ?? 0 )")
        }
        
//        .onChange(of: times){
//            print("Times they are a-changing")
//        }

        
        
    }
    
    
}
