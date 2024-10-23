//
//  TimerDetail.swift
//  SyncTime
//
//  Created by Nicho on 02/10/2024.
//

import SwiftUI

struct TimerDetail: View {
    var time: Time
    var body: some View {
        VStack{
            Text("Time Duration:")
                .font(.title)
            Text(time.name)
                .font(.headline)
            Text("\(time.duration)")
                .font(.caption)
        }
        
    }
}

