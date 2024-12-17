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
    @Published var mainTabViewList: [TabViewModel] = []
    
    init() {
        print("MainViewModel init")
        
        mainTabViewList.append(TabViewModel(title: "일정", color: .yellow, iconName: "calendar"))
        mainTabViewList.append(TabViewModel(title:  "가계부", color: .red, iconName: "calendar"))
        mainTabViewList.append(TabViewModel(title: "마라톤", color: .green, iconName: "calendar"))
//        mainTabViewList.append(TabViewModel(title: "생리 주기", color: .pink, iconName: "calendar"))
    }
 
    func actionEditCalendar() {
        print("CalendarFrameViewModel actionEditCalendar")
        isShowEditView = true
    }
}
