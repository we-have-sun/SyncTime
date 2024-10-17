import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    var body: some View {
        ProjectView()
    }
    
}

#Preview("Empty Screen") {
    ContentView()
        .modelContainer(DataController.previewContainer)
}

#Preview("With Projects") {
    ContentView()
        .modelContainer(DataController.previewContainer)
}
