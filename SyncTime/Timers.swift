import SwiftUI
import SwiftData

struct Timers: View {
    @Environment(\.modelContext) var modelContext
    @Query var projects: [Project]
    
    @State private var runningTimers: [Project: Bool] = [:]  // Track running state for each project
    
    var body: some View {
        List(projects) { project in
            HStack{
                VStack(alignment: .leading) {
                    Text(project.name)
                    Text(String(project.times?.count ?? 0))
                }
                Spacer()
                if !(runningTimers[project] ?? project.hasRunningTimers) {
                    Image(systemName: "play")
                        .onTapGesture {
                            addTime(to: project)
                            runningTimers[project] = true  // Update state to reflect the play button action
                        }
                }
                if runningTimers[project] ?? project.hasRunningTimers {
                    Image(systemName: "pause")
                        .onTapGesture {
                            calculateDurationAndPause(for: project)
                            runningTimers[project] = false  // Update state to reflect the pause button action
                        }
                    }
                }
            .onAppear {
                // Initialize running state based on project
                runningTimers[project] = project.hasRunningTimers
            }
            }
           
        }
    func calculateDurationAndPause(for project: Project) {
        guard let times = project.times else { return }
        if let zeroDurationTime = times.first(where: { $0.duration == 0 }) {
            if zeroDurationTime.startDate != nil {
                zeroDurationTime.duration = Int64(Date().timeIntervalSince(zeroDurationTime.startDate ?? Date.now))
                zeroDurationTime.isRunning = false
                
                do {
                    try modelContext.save()
                } catch {
                    print(error)
                }
                print("Time is paused: \(zeroDurationTime.hashValue)")
            }
        }
        do {
            try modelContext.save()
        } catch {
            print(error)
        }
    }
    
    func addTime(to project: Project) {
        let time = Time(name: "", duration: 0, startDate: .now, isRunning: true)
        time.project = project
        do {
            try modelContext.save()
        } catch {
            print(error)
        }
    }
}
