//
//  CalendarViewModel.swift
//  BonoCalendar
//
//  Created by 알파카 on 2024/11/13.
//

import Foundation

final class CalendarViewModel : ObservableObject {
    @Published var model: CalendarModel = CalendarModel()
    
    init() {
        print("[CalendarViewModel] init")
    }
}
