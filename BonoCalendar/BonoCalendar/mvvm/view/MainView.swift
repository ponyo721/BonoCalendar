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
                
                CalendarView(CalendarModel(title: "일정", mainColor: .yellow))
                    .tabItem {
                        Image(systemName: "calendar")
                        Text("캘린더")
                    }
                
                CalendarView(CalendarModel(title: "가계부", mainColor: .red))
                    .tabItem {
                        Image(systemName: "calendar")
                        Text("캘린더")
                    }
                
                CalendarView(CalendarModel(title: "생리 주기", mainColor: .pink))
                    .tabItem {
                        Image(systemName: "calendar")
                        Text("캘린더")
                    }
                
                CalendarView(CalendarModel(title: "마라톤", mainColor: .gray))
                    .tabItem {
                        Image(systemName: "calendar")
                        Text("캘린더")
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
