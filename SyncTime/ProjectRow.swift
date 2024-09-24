import SwiftUI
import SwiftData

struct ProjectRowView: View {
    @Environment(\.modelContext) var modelContext
    @Bindable var project: Project
    @State private var zeroDurationExists: Bool = false
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                TextField("Project", text: Binding(
                    get: { project.name },
                    set: { project.name = $0 }
                ))
                .onChange(of: project.name) {
                    try? modelContext.save()
                }
                
                if let times = project.times {
                    if times == [] {
                        Text("No time recorded")
                            .font(.caption)
                    }
                    ForEach(Array(times), id: \.self) { time in
                        Text("Time Duration: \(time.duration)")
                            .font(.caption)
                    }
               }
            }
            
            if !zeroDurationExists {
                            Image(systemName: "play")
                                .onTapGesture {
                                    addTime(to: project)
                                    updateZeroDurationExists()
                                }
                        }
            if  zeroDurationExists {
                Image(systemName: "pause")
                    .onTapGesture {
                        calculateDurationAndPause(for: project)
                        updateZeroDurationExists()
                    }
            }
                    }
        .onAppear(perform: updateZeroDurationExists)
                .onChange(of: project.times) {
                    updateZeroDurationExists()
                }
    }
    func updateZeroDurationExists() {
            zeroDurationExists = project.times?.contains { $0.duration == 0 } ?? false
        }
    func addTime(to project: Project) {
        let newTime = Time(name: "", duration: 0, startDate: .now)
        project.times?.append(newTime)
        try? modelContext.save()
    }
    func calculateDurationAndPause(for project: Project) {
        guard let times = project.times else { return }
        if let zeroDurationTime = times.first(where: { $0.duration == 0 }) {
            zeroDurationTime.duration = Int64(Date().timeIntervalSince(zeroDurationTime.startDate))
        }
    }

}







