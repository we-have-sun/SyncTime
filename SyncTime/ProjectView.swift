import SwiftUI
import SwiftData

struct ProjectView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Project.creationDate) var projects: [Project]
    @Binding var path: [Project]
    
    var body: some View {
            NavigationStack(path: $path) {
                List {
                    ForEach(projects, id: \.self) {project in
                        ProjectRowView(project: project)
                    }
                    .onDelete(perform: deleteProject)
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
                        } catch {
                            print("Failed to clear all Country and City data.")
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
}
