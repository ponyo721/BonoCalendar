//
//  CalendarFrameView.swift
//  BonoCalendar
//
//  Created by 알파카 on 2024/11/10.
//

import SwiftUI

struct CalendarFrameView: View {
    var body: some View {
        
        TabView {
            
            CalendarView("1")
                .tabItem {
                    Image(systemName: "calendar")
                    Text("캘린더")
                }
            
            CalendarView("2")
                .tabItem {
                    Image(systemName: "calendar")
                    Text("캘린더")
                }
            
            CalendarCreateView()
                .tabItem {
                    Image(systemName: "pencil.circle")
                    Text("추가")
                }
        }
    }
}

struct CalendarFrameView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarFrameView()
    }
}
