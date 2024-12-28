//
//  MainView.swift
//  BonoCalendar
//
//  Created by 알파카 on 2024/11/10.
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = MainViewModel()
    @State var selectedTabTitle:String?
    
    var body: some View {
        VStack {
            HStack {
                Text("Title")
                
                Button(action: {
                    if !viewModel.actionAddCalendar() {
                        print("show alert create fail")
                        viewModel.actionShowMaxCalendarAlert()
                    }
                }, label: {
                    Text("Add")
                })
                .alert(isPresented: $viewModel.isShowShowMaxCalendarAlert) {
                    Alert(title: Text("Title"), message: Text("This is a alert message"), dismissButton: .default(Text("Dismiss")))
                }
                
                Button(action: {
                    viewModel.actionRemoveCalendar(selectedTabTitle)
                }, label: {
                    Text("Remove")
                })
                
                .sheet(isPresented: $viewModel.isShowEditView) {
                    CalendarCreateView() // 모달로 표시할 뷰
                }
            }
            .padding(5)
            
            TabView() {
                ForEach(viewModel.mainTabViewList, id: \.mainColor) { item in
                    CalendarView(CalendarModel(title: item.title, mainColor: item.mainColor ))
                        .tabItem {
                            Image(systemName: item.iconName ?? "")
                            Text(item.title)
                        }
                        .tag(item.title)
                }
            }
            .onChange(of: selectedTabTitle) { newValue in
                print("selectedTab: \(newValue ?? "")")
            }
               
        }
        
        
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
