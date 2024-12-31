//
//  ContentView.swift
//  BonoCalendar
//
//  Created by byeongho park on 12/30/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
#if os(macOS)
#elseif os(iOS)
#endif
    ContentView()
}
