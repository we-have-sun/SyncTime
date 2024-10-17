import SwiftUI
import SwiftData

@Observable
class ProjectModel {
    var project: Project
    init(project: Project) {
        self.project = project
    }
}

struct ProjectRowView: View {
    @Environment(\.modelContext) var modelContext
    @Bindable var project: Project
    
    //new
//    var project: ProjectModel
//    init(project: Project) {
//            let projectModel = ProjectModel(project: project)
//            self.project = projectModel
//        }
//    
    @Query private var times: [Time]
    private var timesByProjects: [Time] {
        times.filter { $0.project?.id == project.id}
     }
    
    @State private var zeroDurationExists: Bool = false
    var body: some View {
        HStack(spacing: 16) {
            Group {
                if !project.hasRunningTimers {
                    Image(systemName: "play")
                        .onTapGesture {
                            addTime(to: project)
                            updateZeroDurationExists()
                        }
                }
                if project.hasRunningTimers {
                    Image(systemName: "pause")
                    .onTapGesture {
                        calculateDurationAndPause(for: project)
                        updateZeroDurationExists()
                    }
                }
                
            }
            
            VStack(alignment: .leading) {
                Text(project.name)
                    .font(.title2)
//                  .foregroundStyle(project.hasRunningTimers ? .red : .black)
                TimeDisplay(project: project)
                TimerTotal(project: project)
            }
            
            }
        .onAppear{
            updateZeroDurationExists()
        }
        .onChange(of: times) {
            updateZeroDurationExists()
        }
    }

    func updateZeroDurationExists() {
        zeroDurationExists = timesByProjects.contains { $0.duration == 0 }
        }
    @MainActor
    func addTime(to project: Project) {
        let time = Time(name: "", duration: 0, startDate: .now, isRunning: true)
        project.times?.append(time)
        //time.project = project
        
        do {
           try modelContext.save()
        } catch {
           print(error)
        }
        
    }
    func calculateDurationAndPause(for project: Project) {
        let times = timesByProjects
        if let zeroDurationTime = times.first(where: { $0.duration == 0 }) {
            if zeroDurationTime.startDate != nil {
                zeroDurationTime.duration = Int64(Date().timeIntervalSince(zeroDurationTime.startDate ?? Date.now))
                zeroDurationTime.isRunning = false
                //project.times?.append(zeroDurationTime)
                
                zeroDurationTime.project = project
                
                let temporaryTime = zeroDurationTime.copy() as! Time
                modelContext.delete(zeroDurationTime)
                project.times?.append(temporaryTime)
//                
                do {
                   try modelContext.save()
                } catch {
                   print(error)
                }
                
                
                
                
            }
        }
        do {
           try modelContext.save()
            
        } catch {
           print(error)
        }
    }
}







