import SwiftUI
import SwiftData

struct EditProjectView: View {
    @Bindable var project: Project
    
    var body: some View {
        Form {
            TextField("Name", text: $project.name)
            DatePicker("Creation Date", selection: $project.creationDate)
        }
        .navigationTitle("Edit Project")
        .navigationBarTitleDisplayMode(.inline)
    }
}
