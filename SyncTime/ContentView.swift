import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @State private var path = [Project]()
    var body: some View {
        ProjectView(path: $path)
    }
}

#Preview {
    ContentView()
}
