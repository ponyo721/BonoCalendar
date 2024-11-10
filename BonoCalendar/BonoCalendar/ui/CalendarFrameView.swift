//
//  CalendarFrameView.swift
//  BonoCalendar
//
//  Created by 알파카 on 2024/11/10.
//

import SwiftUI

struct CalendarFrameView: View {
    @State private var isPresenting = false // 모달 표시 여부를 제어하는 상태 변수
    
    var body: some View {
        VStack {
            HStack {
                Text("Title")
                
                Button(action: {
                    actionCreateBtn()
                }, label: {
                    Text("Add")
                })
                .sheet(isPresented: $isPresenting) {
                    CalendarCreateView() // 모달로 표시할 뷰
                }
                
            }
            .padding(5)
            
            TabView {
                
                
                CalendarView(CalendarViewConfigure(title: "모든 일정", mainColor: .blue))
                    .tabItem {
                        Image(systemName: "calendar")
                        Text("캘린더")
                    }
                
                CalendarView(CalendarViewConfigure(title: "일정", mainColor: .yellow))
                    .tabItem {
                        Image(systemName: "calendar")
                        Text("캘린더")
                    }
                
                CalendarView(CalendarViewConfigure(title: "가계부", mainColor: .red))
                    .tabItem {
                        Image(systemName: "calendar")
                        Text("캘린더")
                    }
                
                CalendarView(CalendarViewConfigure(title: "생리 주기", mainColor: .systemPink))
                    .tabItem {
                        Image(systemName: "calendar")
                        Text("캘린더")
                    }
                
                CalendarView(CalendarViewConfigure(title: "마라톤", mainColor: .gray))
                    .tabItem {
                        Image(systemName: "calendar")
                        Text("캘린더")
                    }
            }
        }
    }
    
    func actionCreateBtn() {
        print("actionCreateBtn")
        isPresenting = true
    }
}

struct CalendarFrameView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarFrameView()
    }
}
