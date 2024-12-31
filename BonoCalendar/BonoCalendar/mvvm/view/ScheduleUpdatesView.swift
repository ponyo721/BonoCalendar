//
//  ScheduleUpdatesView.swift
//  BonoCalendar
//
//  Created by 박병호 on 12/17/24.
//

import SwiftUI

struct ScheduleUpdatesView: View {
    @StateObject private var viewModel = ScheduleUpdatesViewModel()
    @Binding var isShowSchduleUpdateView: Bool
    
    var body: some View {
        Text("Hello, World!")
        Text("ScheduleUpdatesView")
        
        Button(action: {
            print("[ScheduleUpdatesView] action btn")
            isShowSchduleUpdateView = false
        }, label: {
            Text("save schedul")
        })
    }
}

#Preview {
    ScheduleUpdatesView(isShowSchduleUpdateView: .constant(true))
}
