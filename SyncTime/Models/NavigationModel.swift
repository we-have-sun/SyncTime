//
//  NavigationModel.swift
//  SyncTime
//
//  Created by Nicho on 02/10/2024.
//

import Foundation
import SwiftUI

class NavigationModel: ObservableObject {
    @Published var path: [Time] = []
    @Published var selectedProject: Project?
    @Published var selectedTime: Time?
}
