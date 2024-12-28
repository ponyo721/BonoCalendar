//
//  CalendarContent.swift
//  BonoCalendar
//
//  Created by 박병호 on 12/24/24.
//

import Foundation

struct CalendarContent {
    var creator: String = ""
    
    var title:String = ""
    var content: String = ""
    
    var startDate: Date = .now
    var endDate: Date = .now
    var isSolar:Bool = false
}
