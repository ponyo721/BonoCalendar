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
    @Environment(\.dismiss) var dismiss
    
    @State private var configure : CalendarViewConfigure = CalendarViewConfigure()
    @State private var mainColor : Color = .black
    
    public var delegate : CalendarCreateViewDelegate?
    
    var body: some View {
        VStack {
            
            
            Text("Create New Calendar!")
                .padding(50)
            TextField("Enter New Calendar Title", text: $configure.title)
                    .padding()
                    .background(Color(uiColor: .secondarySystemBackground))
                    .frame(width: 200)
            
            HStack() {
                Text("Main Color : ")
                ColorPicker("Main Color", selection: $mainColor)
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
        delegate?.actionCreateNewCalendar()
    }
}

struct CalendarCreateView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarCreateView()
    }
}
