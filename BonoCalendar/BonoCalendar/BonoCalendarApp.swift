//
//  BonoCalendarApp.swift
//  BonoCalendar
//
//  Created by 알파카 on 2024/11/10.
//

import SwiftUI

@main
struct BonoCalendarApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
//            NavigationView {
                EnterView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
//            }
        }
    }
}
