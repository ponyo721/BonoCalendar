//
//  CalendarCreateView.swift
//  BonoCalendar
//
//  Created by 알파카 on 2024/11/10.
//

import SwiftUI

struct CalendarCreateView: View {
    @StateObject private var viewModel = CalendarCreateViewModel()
    
    @Environment(\.dismiss) var dismiss
    
    @State private var configure : CalendarCreateModel = CalendarCreateModel()
    
    var body: some View {
        VStack {
            
            
            Text("Create New Calendar!")
                .padding(50)
            TextField("Enter New Calendar Title", text: $configure.title)
                    .padding()
                    .background(Color .blue)
                    .frame(width: 200)
            
            HStack() {
                Text("Main Color : ")
                ColorPicker("Main Color", selection: $configure.mainColor)
                    .frame(width: 30)
            }
            .padding(50)
            
            Button("Save") {
                actionSaveBtn()
                dismiss()
            }
        }
    }
    
    func actionSaveBtn() {
        print("[CalendarCreateView] actionSaveBtn")
        
        var calendarCreateModel:CalendarItem = CalendarItem()
        calendarCreateModel.title = configure.title
        calendarCreateModel.mainColor = configure.mainColor
        
        viewModel.createNewCalendar(calendarCreateModel)
    }
}

struct CalendarCreateView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarCreateView()
    }
}
