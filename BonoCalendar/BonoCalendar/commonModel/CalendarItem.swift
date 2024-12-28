//
//  CalendarItem.swift
//  BonoCalendar
//
//  Created by 박병호 on 12/24/24.
//

import SwiftUI

struct CalendarItem: Identifiable {
    var id: ObjectIdentifier?
    
    var title: String = ""
    var mainColor: Color = .blue
    var iconName: String? = "calendar"
    
    var contents: [CalendarContent]? = []
}
