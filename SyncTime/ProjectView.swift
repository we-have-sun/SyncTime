import SwiftUI
//import ActivityKit
import SwiftData

struct ProjectView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Project.creationDate) var projects: [Project]
    
    //Live Activity
//    @State private var isTrackingTime: Bool = false
//    @State private var startTime: Date? = nil
//    @State private var activity: Activity<TimerAttributes>? = nil
//    
    var body: some View {
        NavigationStack(){
            VStack {
//                Button {
//                    isTrackingTime.toggle()
//                    if isTrackingTime {
//                        startTime = .now
//                        startLiveActivity(projectName: "project name", startTime: .now)
//                    } else {
//                        endLiveActivity(projectName: "project name", startTime: .now)
//                    }
//                    
//                } label: {
//                    Text(isTrackingTime ? "STOP" : "START")
//                        .fontWeight(.bold)
//                        .foregroundColor(.white)
//                        .frame(width: 100, height: 20)
//                        .background(isTrackingTime ? Color.red : Color.green)
//                }
                
                List {
                    ForEach(projects) {project in
                        NavigationLink(destination: EditProjectView(project: project)) {
                            ProjectRowView(project: project)
                        }
                    }
                    .onDelete(perform: deleteProject)
                }
            }
        .navigationTitle("Projects")
        .navigationDestination(for: Project.self) { project in
            EditProjectView(project: project)
        }
        .toolbar {
            Button("Add Project", systemImage: "plus") {
                let project = Project(name: " ", creationDate: .now)
                modelContext.insert(project)
                do {
                    try modelContext.save()
                } catch {
                    print(error)
                }
            }
            Button("Delete all", systemImage: "minus") {
                do {
                    try modelContext.delete(model: Project.self)
                    try modelContext.delete(model: Time.self)
                    try modelContext.save()
                } catch {
                    print("Failed to clear "    )
                }
            }
        }
        
    }
        }
    func deleteProject(at indexSet: IndexSet) {
            for index in indexSet.sorted(by: >) {
                guard index < projects.count else { continue }
                modelContext.delete(projects[index])
            }
            do {
                try modelContext.save()
            } catch {
                print("Error saving context after deletion: \(error)")
            }
        }
    func timeString(interval: TimeInterval) -> String {
        let hours = Int(interval) / 3600
        let minutes = Int(interval) / 60 % 60
        let seconds = Int(interval) % 60
        let milliseconds = Int((interval - floor(interval)) * 1000)
        return String(format: "%02i:%02i:%02i:%03i", hours, minutes, seconds, milliseconds)
        }
    
//    func startLiveActivity(projectName: String = "", startTime: Date?) {
//        let attributes = TimerAttributes()
//        let state = TimerAttributes.ContentState(startTime: startTime ?? .now, projectName: projectName)
//        do {
//                activity = try Activity.request(
//                    attributes: attributes,
//                    content: .init(state: state, staleDate: nil)
//                )
//            } catch {
//                print("Error starting Live Activity: \(error)")
//            }
//    }
//    func endLiveActivity(projectName: String = "", startTime: Date?) {
//        guard let startTime else { return }
//        let state = TimerAttributes.ContentState(startTime: startTime, projectName: projectName)
//        Task {
//            await activity?.end(
//                .init(state: state, staleDate: nil),
//                    dismissalPolicy: .immediate
//                )
//        }
//        self.startTime = nil
//    }
    
}
