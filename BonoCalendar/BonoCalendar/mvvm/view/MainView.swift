//
//  MainView.swift
//  BonoCalendar
//
//  Created by 알파카 on 2024/11/10.
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = MainViewModel()
//    @State var
    
    var body: some View {
        VStack {
            HStack {
                Text("Title")
                
                Button(action: {
                    viewModel.actionEditCalendar()
                }, label: {
                    Text("Add")
                })
                
                .sheet(isPresented: $viewModel.isShowEditView) {
                    CalendarCreateView() // 모달로 표시할 뷰
                }
            }
            .padding(5)
            
            TabView {
                CalendarView(CalendarModel(title: "모든 일정", mainColor: Color("MainColor") ))
                    .tabItem {
                        Image(systemName: "calendar")
                        Text("캘린더")
                    }
                
                
                ForEach(viewModel.mainTabViewList, id: \.color) { tab in
                    CalendarView(CalendarModel(title: tab.title, mainColor: tab.color ))
                        .tabItem {
                            Image(systemName: tab.iconName)
                            Text(tab.title)
                        }
                }
                
            } // HStack
            
            
        } // VStack
        
        
    } // View
    
    //MARK: - CalendarCreateViewDelegate -
    func actionCreateNewCalendar() {
        print("[CalendarFrameView] actionCreateNewCalendar")
    }
}

struct CalendarFrameView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
