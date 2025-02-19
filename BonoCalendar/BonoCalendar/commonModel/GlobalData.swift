//
//  GlobalData.swift
//  BonoCalendar
//
//  Created by 박병호 on 12/24/24.
//

import SwiftUI

class GlobalData: ObservableObject {
    static let sharedInstance = GlobalData()
    public let calendarMaxCount: Int = 5
    
    @Published var calndarList: [CalendarItem] = []
    var currentCalendarTitle: String = "모든 일정"
    
    func initGlobalData() -> Bool {
//        do {
            // load data from DB
        calndarList.append(CalendarItem(title: "모든 일정", mainColor: .blue))
        calndarList.append(CalendarItem(title: "일정", mainColor: .yellow))
        calndarList.append(CalendarItem(title:  "가계부", mainColor: .red))
        calndarList.append(CalendarItem(title: "마라톤", mainColor: .green))
//        } catch {
//            print("[GlobalData] init fail")
//        }
        
        
        return true
    }
    
    func addNewCalendar() {
        
        
    }
}
