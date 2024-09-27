//
//  TestTimer.swift
//  SyncTime
//
//  Created by Nicho on 27/09/2024.
//

import SwiftUI




struct TestTimer: View, Equatable {
    @Environment(\.modelContext) var modelContext
    let time: Time
    var body: some View {
        VStack {
            Text("Time Duration: \(time.duration)")
                .font(.caption)
                .foregroundStyle(time.isRunning ? .red : .black)
        }

    }
    static func == (lhs: TestTimer, rhs: TestTimer) -> Bool {
            return lhs.time == rhs.time
        }
}
