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
    @Published var isShowCantRemoveCalendarAlert: Bool = false
    
    @Published var mainTabViewList: [CalendarItem] = GlobalData.sharedInstance.calndarList
    
    init() {
        print("MainViewModel init")
        
//        // load data
//        guard GlobalData.sharedInstance.initGlobalData() else {
//            print("[EnterViewModel] init Global data fail")
//            return
//        }
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
    
    func actionRemoveCalendar() {
        print("[MainViewModel] actionRemoveCalendar: \(GlobalData.sharedInstance.currentCalendarTitle)")
        if GlobalData.sharedInstance.currentCalendarTitle == "모든 일정" {
            isShowCantRemoveCalendarAlert = true
        } else {
            isShowRemoveCalendarAlert = true
        }
    }
    
    func actionShowMaxCalendarAlert() {
        print("[MainViewModel] actionShowMaxCalendarAlert")
        isShowMaxCalendarAlert = true
    }
    
    func actionSwitchCalendar(_ title:String) {
        print("[MainViewModel] actionSwitchCalendar: \(title)")
        GlobalData.sharedInstance.currentCalendarTitle = title
    }
    
    //MARK: - remove alert action -
    func actionAlertConfirm() {
        print("[MainViewModel] actionAlertConfirm: \(GlobalData.sharedInstance.currentCalendarTitle)")
        
        // remove & view data update
        GlobalData.sharedInstance.calndarList.removeAll{ item in
            item.title == GlobalData.sharedInstance.currentCalendarTitle
        }
        mainTabViewList = GlobalData.sharedInstance.calndarList
        
        // set current info
        GlobalData.sharedInstance.currentCalendarTitle = GlobalData.sharedInstance.calndarList.first?.title ?? ""
        
        print("[MainViewModel] GlobalData calndarList count: \(GlobalData.sharedInstance.calndarList.count)")
        print("[MainViewModel] GlobalData title: \(GlobalData.sharedInstance.currentCalendarTitle)")
        
    }
}
