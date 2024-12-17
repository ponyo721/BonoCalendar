//
//  ScheduleUpdatesModel.swift
//  BonoCalendar
//
//  Created by 박병호 on 12/17/24.
//

import SwiftUI

struct ScheduleUpdatesModel {
    var date:Date = .now
    var color:Color = .clear
    
    var title:String = ""
    var startDate:Date = .now
    var endDate:Date = .now
    var isSolar:Bool = false
    
}
