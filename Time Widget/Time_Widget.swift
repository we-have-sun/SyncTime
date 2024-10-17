//
//  Time_Widget.swift
//  Time Widget
//
//  Created by Nicho on 17/10/2024.
//
import ActivityKit
import WidgetKit
import SwiftUI



struct TimerActivityView: View {
    let context: ActivityViewContext<TimerAttributes>
    
    var body: some View {
        VStack {
            Text(context.state.projectName)
            Text(context.state.startTime, style: .relative)
        }
        
    }
}
 
struct Time_Widget: Widget {
    let kind: String = "Time_Widget"

    var body: some WidgetConfiguration {
        ActivityConfiguration(for: TimerAttributes.self) { context in
            TimerActivityView(context: context)
        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.leading){
                    HStack {
                        Text(context.state.projectName)
                            .foregroundStyle(.white)
                        Text(context.state.startTime, style: .relative)
                            .foregroundStyle(.white)
                    }
                }
                } compactLeading: {
                    Text(context.state.projectName)
                        .foregroundStyle(.white)
                        .font(.caption2)
                } compactTrailing: {
                    Text("On")
                        .foregroundStyle(.white)
                } minimal: {
                    Text("T")
                        .foregroundStyle(.white)
                }
            }
        }
    }


