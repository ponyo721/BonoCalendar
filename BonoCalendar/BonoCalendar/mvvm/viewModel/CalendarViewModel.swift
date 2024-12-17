//
//  CalendarViewModel.swift
//  BonoCalendar
//
//  Created by 알파카 on 2024/11/13.
//

import Foundation

final class CalendarViewModel : ObservableObject {
    @Published var model: CalendarModel = CalendarModel()
    
    @Published var showModal: Bool = false
    
    init() {
        print("[CalendarViewModel] init")
    }
    
    func actionClickDate(_ date:Date) {
        showModal = true
    }
}
