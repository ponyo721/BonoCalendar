//
//  EnterViewModel.swift
//  BonoCalendar
//
//  Created by 알파카 on 2024/11/13.
//

import Foundation

final class EnterViewModel : ObservableObject {
    @Published var isLoggedIn: Bool = false
    
    
    func actionGoCalendar() {
        print("[EnterViewModel] actionGoCalendar")
        
        // login process (ex. kakao, apple, ...)
        // add more...
        
        // load data
        guard GlobalData.sharedInstance.initGlobalData() else {
            print("[EnterViewModel] init Global data fail")
            return
        }
        
        // login success
        isLoggedIn = true
    }
}
