//
//  MainViewModel.swift
//  BonoCalendar
//
//  Created by 알파카 on 2024/11/13.
//

import Foundation

final class MainViewModel : ObservableObject {
    @Published var isShowEditView: Bool = false
    @Published var mainTabViewList: [Any] = []
    
    init() {
        print("MainViewModel init")
    }
 
    func actionEditCalendar() {
        print("CalendarFrameViewModel actionEditCalendar")
        isShowEditView = true
    }
}
