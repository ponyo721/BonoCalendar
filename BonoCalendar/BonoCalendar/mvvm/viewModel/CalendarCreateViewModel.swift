//
//  CalendarCreateViewModel.swift
//  BonoCalendar
//
//  Created by 알파카 on 2024/11/13.
//

import Foundation

final class CalendarCreateViewModel : ObservableObject {
    @Published var model: CalendarCreateModel = CalendarCreateModel()
    
    
    func createNewCalendar() {
        print("[CalendarCreateViewModel] createNewCalendar")
        
        
    }
    
}
