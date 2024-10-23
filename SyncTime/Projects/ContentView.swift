import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    var body: some View {
        ProjectView()
    }
}


#Preview("With Projects") {
    ContentView()
        .modelContainer(DataController.previewWithProjects)
}

#Preview("Empty Screen") {
    ContentView()
        .modelContainer(DataController.previewEmpty)
}

