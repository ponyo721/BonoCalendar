//
//  EnterView.swift
//  BonoCalendar
//
//  Created by 알파카 on 2024/11/10.
//

import SwiftUI

protocol EnterViewDelegate {
    func actionGoCalendarBtn()
}

struct EnterView: View {
    public var delegate : EnterViewDelegate?
    
    var body: some View {
        VStack {
            Text("Hello BonoCalendar")
                .padding(3)
            
            Button(action: {
                actionGoCalendar()
            }, label: {
                Text("Go Calendar")
            })
        }
    }
    
    func actionGoCalendar() {
        print("actionGoCalendar")
    }
}

struct EnterView_Previews: PreviewProvider {
    static var previews: some View {
        EnterView()
    }
}
