import SwiftUI
import SwiftData

struct Timers: View {
    @Environment(\.modelContext) var modelContext
    @Query var projects: [Project]
    @StateObject private var navModel = NavigationModel()
    
    var body: some View {
        NavigationSplitView{
            List(projects, selection: $navModel.selectedProject) { project in
                NavigationLink(project.name, value:project)
            }
            .navigationTitle("Projects")
        }content: {
            List(navModel.selectedProject?.times ?? [], selection: $navModel.selectedTime) { time in
                NavigationLink(String(time.duration), value:time)
            }
            .navigationTitle(navModel.selectedProject?.name ?? "Times")
        } detail: {
            if navModel.selectedTime != nil {
                TimerDetail(time: navModel.selectedTime!)
            }
        }
    }
}
