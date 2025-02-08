//
//  CalendarCreateViewModel.swift
//  BonoCalendar
//
//  Created by 알파카 on 2024/11/13.
//

import Foundation

final class CalendarCreateViewModel : ObservableObject {
    @Published var model: CalendarCreateModel = CalendarCreateModel()
    
    
    func createNewCalendar(_ calendarInfo:CalendarCreateModel) {
        print("[CalendarCreateViewModel] createNewCalendar")
        
        if GlobalData.sharedInstance.calndarList.count >= GlobalData.sharedInstance.calendarMaxCount {
            print("[CalendarCreateViewModel] calendarMaxCount")
        } else {
            GlobalData.sharedInstance.calndarList.append(CalendarItem(title:calendarInfo.title, mainColor: calendarInfo.mainColor))
        }
    }
    
}
