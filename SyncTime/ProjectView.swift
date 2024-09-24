import SwiftUI
import SwiftData

struct ProjectView: View {
    @Environment(\.modelContext) var modelContext
    @Query var projects: [Project]
    @Binding var path: [Project]
    var body: some View {
            NavigationStack(path: $path) {
                List(projects) {project in
                    ProjectRowView(project: project)
                }
                .navigationTitle("Projects")
                .navigationDestination(for: Project.self) { project in
                    EditProjectView(project: project)
                }
                .toolbar {
                    Button("Add Project", systemImage: "plus") {
                        let project = Project(name: " ", creationDate: .now)
                        modelContext.insert(project)
                        path = [project]
                    }
                }
                
            }

        }
    
}
