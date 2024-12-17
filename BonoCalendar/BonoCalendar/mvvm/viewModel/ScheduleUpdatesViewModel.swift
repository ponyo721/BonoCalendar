//
//  ScheduleUpdatesViewModel.swift
//  BonoCalendar
//
//  Created by 박병호 on 12/17/24.
//

import SwiftUI

final class ScheduleUpdatesViewModel : ObservableObject {
    @Published var model: ScheduleUpdatesModel = ScheduleUpdatesModel()
    
    init() {
        print("[ScheduleUpdatesViewModel] init")
        
    }
    
    func initTestData(_ date:Date?, _ color:Color?, _ title:String?,_ startDate:Date?, _ endDate:Date?, _ isSolar:Bool?
    ) {
        print("[ScheduleUpdatesViewModel] initTestData")
        
    }
}
