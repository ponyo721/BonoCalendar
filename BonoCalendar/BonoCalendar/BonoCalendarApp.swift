//
//  BonoCalendarApp.swift
//  BonoCalendar
//
//  Created by byeongho park on 12/30/24.
//

import SwiftUI

@main
struct BonoCalendarApp: App {
#if os(macOS)
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
#endif
    
    var body: some Scene {
        WindowGroup {
            EnterView()
                .frame(minWidth: 700, minHeight: 400)
        }
    }
}

#if os(macOS)
class AppDelegate: NSObject, NSApplicationDelegate {
    var mainWindow: NSWindow?

    func applicationDidFinishLaunching(_ notification: Notification) {
        if let window = NSApplication.shared.windows.first {
            self.mainWindow = window
            self.mainWindow?.delegate = self
        }
    }
}

// NSWindowDelegate 구현 (옵션)
extension AppDelegate: NSWindowDelegate {
    func windowWillClose(_ notification: Notification) {
        print("Main Window is closing")
        NSApp.terminate(self)
    }
}
#endif
