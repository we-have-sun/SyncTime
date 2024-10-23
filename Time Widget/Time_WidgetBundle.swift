//
//  Time_WidgetBundle.swift
//  Time Widget
//
//  Created by Nicho on 17/10/2024.
//

import WidgetKit
import SwiftUI

#if os(iOS)
@main
struct Time_WidgetBundle: WidgetBundle {
    var body: some Widget {
        Time_Widget()
    }
}
#endif
