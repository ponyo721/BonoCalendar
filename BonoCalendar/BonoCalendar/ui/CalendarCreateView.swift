//
//  CalendarCreateView.swift
//  BonoCalendar
//
//  Created by 알파카 on 2024/11/10.
//

import SwiftUI

protocol CalendarCreateViewDelegate {
    func actionCreateNewCalendar()
}

struct CalendarCreateView: View {
    public var delegate : CalendarCreateViewDelegate?
    
    @State private var title: String = ""
    @State private var mainColor : Color = Color.white
    
    var body: some View {
        VStack {
            Text("Create New Calendar!")
                .padding(50)
            TextField("Enter New Calendar Title", text: $title)
                    .padding()
                    .background(Color(uiColor: .secondarySystemBackground))
                    .frame(width: 200)
            
            HStack() {
                Text("Main Color : ")
                ColorPicker("", selection: $mainColor)
                    .frame(width: 30)
            }
            .padding(50)
            
            Button("Save", action: actionSaveBtn)
        }
    }
    
    func actionSaveBtn() {
        print("actionSaveBtn")
        delegate?.actionCreateNewCalendar()
    }
}

struct CalendarCreateView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarCreateView()
    }
}
