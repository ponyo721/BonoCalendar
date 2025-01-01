//
//  MainViewModel.swift
//  BonoCalendar
//
//  Created by 알파카 on 2024/11/13.
//

import SwiftUI

struct TabViewModel {
    var title:String
    var color:Color
    var iconName:String
}

final class MainViewModel : ObservableObject {
    @Published var isShowEditView: Bool = false
    @Published var isShowMaxCalendarAlert: Bool = false
    @Published var isShowRemoveCalendarAlert: Bool = false
    
    @Published var mainTabViewList: [CalendarItem] = GlobalData.sharedInstance.calndarList
    
    init() {
        print("MainViewModel init")
    }
 
    func actionAddCalendar() {
        print("[MainViewModel] actionAddCalendar")
        
        guard mainTabViewList.count < GlobalData.sharedInstance.calendarMaxCount else {
            print("[MainViewModel] already calender max count")
            actionShowMaxCalendarAlert()
            return
        }
        
        isShowEditView = true
    }
    
    func actionRemoveCalendar(_ selectedTabTitle:String?) {
        print("[MainViewModel] actionRemoveCalendar \(selectedTabTitle ?? "")")
        isShowRemoveCalendarAlert = true
    }
    
    func actionShowMaxCalendarAlert() {
        print("[MainViewModel] actionShowMaxCalendarAlert")
        isShowMaxCalendarAlert = true
    }
}
