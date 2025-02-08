//
//  MainView.swift
//  BonoCalendar
//
//  Created by 알파카 on 2024/11/10.
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = MainViewModel()
    @State var selectedTabTitle:String = ""
    
    var body: some View {
        VStack {
            HStack {
                // 이후 월단위 or 년단위 이동을 위한 버튼 생성
//                Text("월/년 단위 빠른 이동")
                
                Spacer()    // 사용 가능한 전체 공간을 띄워버리기
                Button(action: {
                    viewModel.actionAddCalendar()
                }, label: {
                    Text("+")   // 캘린더 추가
                })
                .alert(isPresented: $viewModel.isShowMaxCalendarAlert) {
                    Alert(title: Text("Title"), message: Text("This is a alert message"), dismissButton: .default(Text("Dismiss")))
                }
                
                Button(action: {
                    viewModel.actionRemoveCalendar()
                }, label: {
                    Text("-")   // 캘린더 삭제
                })
                .alert(isPresented: $viewModel.isShowRemoveCalendarAlert) {
                    Alert(title: Text("Remove Calendar Title"), message: Text("This is a remove calendar alert"), primaryButton: .default(Text("Remove"), action: {
                        print("action Remove")
                        viewModel.actionAlertConfirm()
                    }), secondaryButton: .default(Text("Cancel"), action: {
                        print("action Cancel")
                    }) )
                }
                
                //
                .sheet(isPresented: $viewModel.isShowEditView) {
                    CalendarCreateView() // 모달로 표시할 뷰
                }
            }
//            .position(CGPointMake(100, 0))
            .padding(5)
            
            TabView(selection: $selectedTabTitle) {
                ForEach(viewModel.mainTabViewList, id: \.mainColor) { item in
                    CalendarView(CalendarModel(title: item.title, mainColor: item.mainColor ))
                        .tabItem {
                            Image(systemName: item.iconName ?? "")
                            Text(item.title)
                        }
                        .tag(item.title)
                }
            }
            .onChange(of: selectedTabTitle, perform: {newValue in
                print("selectedTab: \(newValue)")
                selectedTabTitle = newValue
                viewModel.actionSwitchCalendar(newValue)
            })
               
        }
        
        
    } // View
    
    //MARK: - CalendarCreateViewDelegate -
    func actionCreateNewCalendar() {
        print("[CalendarFrameView] actionCreateNewCalendar")
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
