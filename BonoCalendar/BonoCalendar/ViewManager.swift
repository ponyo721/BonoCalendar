//
//  ViewManager.swift
//  BonoCalendar
//
//  Created by 알파카 on 2024/11/10.
//

import Foundation
import SwiftUI

class ViewManager {
//    let mainView : (any View)?
    
//    init?(_ mainView:(any View)) {
    init?() {
//        self.mainView = mainView
        print("ViewManager")
        
        test()
    }
    
    func test() {
        let date = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: date)

        let year = components.year
        let month = components.month
        print("day : \(components.day)")
    }
    
}
