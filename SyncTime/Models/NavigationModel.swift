import Foundation
import SwiftUI

class NavigationModel: ObservableObject {
    @Published var path: [Time] = []
    @Published var selectedProject: Project?
    @Published var selectedTime: Time?
}
