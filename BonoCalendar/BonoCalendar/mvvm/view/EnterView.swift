//
//  EnterView.swift
//  BonoCalendar
//
//  Created by 알파카 on 2024/11/10.
//

import SwiftUI

struct EnterView: View {
    @StateObject private var viewModel = EnterViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello BonoCalendar")
                    .padding(3)
                
                Button(action: {
                    viewModel.actionGoCalendar()
                }, label: {
                    Text("Go Calendar")
                })
                
                .fullScreenCover(isPresented: $viewModel.isLoggedIn) {
                    MainView()
                }
            }
        }
    }
}

struct EnterView_Previews: PreviewProvider {
    static var previews: some View {
        EnterView()
    }
}
