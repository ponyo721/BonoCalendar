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
                    viewModel.actionAddCalendar()
                }, label: {
                    Text("Add")
                })
                .alert(isPresented: $viewModel.isShowMaxCalendarAlert) {
                    Alert(title: Text("Title"), message: Text("This is a alert message"), dismissButton: .default(Text("Dismiss")))
                }
                
                Button(action: {
                    viewModel.actionRemoveCalendar(selectedTabTitle)
                }, label: {
                    Text("Remove")
                })
                .alert(isPresented: $viewModel.isShowRemoveCalendarAlert) {
                    Alert(title: Text("Remove Calendar Title"), message: Text("This is a remove calendar alert"), primaryButton: .default(Text("primaryButton"), action: {
                        print("action primaryButton")
                    }), secondaryButton: .default(Text("secondaryButton"), action: {
                        print("action secondaryButton")
                    }) )
                }
                
                //
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
