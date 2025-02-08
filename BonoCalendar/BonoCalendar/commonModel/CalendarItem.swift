//
//  CalendarItem.swift
//  BonoCalendar
//
//  Created by 박병호 on 12/24/24.
//

import SwiftUI

enum GoalType {
    case none, km, money, time
}

struct CalendarItem: Identifiable {
    var id: ObjectIdentifier?
    
    var title: String = ""
    var mainColor: Color = .blue
    
    var goalType: GoalType? = GoalType.none
    var goal: Int? = 0
    var achievement: Int? = 0
    
    // only iphone
    var iconName: String? = "calendar"
    
    var contents: [CalendarContent]? = []
}
