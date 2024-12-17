//
//  CalendarView.swift
//  BonoCalendar
//
//  Created by 알파카 on 2024/11/10.
//

import SwiftUI

struct CalendarView: View {
    @StateObject private var viewModel = CalendarViewModel()
    
    @State private var todayDate = Date()
    @State private var currentDate = Date()
    
    private var mainColorImage : Image?
    public let configure : CalendarModel
    
    
    init(_ configure:CalendarModel){
        self.configure = configure
        initWithConfigure()
    }
    
    mutating func initWithConfigure() {
        mainColorImage = CustomColorCircle().createFilledCircleImage(color: configure.mainColor, diameter: 10)
    }
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    mainColorImage?.frame(width: 10, height: 10)
                    Text(configure.title)
                }
                
                
                Text("목표 : ")
            }
            
            // 월 이동 버튼과 현재 월 표시
            HStack {
                //                Text("HStack Start")
                Button(action: {
                    currentDate = Calendar.current.date(byAdding: .month, value: -1, to: currentDate) ?? currentDate
                }) {
                    Image(systemName: "chevron.left")
                }
                
                Text("\(monthAndYearString(for: currentDate))")
                    .font(.title)
                
                Button(action: {
                    currentDate = Calendar.current.date(byAdding: .month, value: 1, to: currentDate) ?? currentDate
                }) {
                    Image(systemName: "chevron.right")
                }
                //                Text("HStack End")
            }
            .padding()
            
            // 요일 표시
            HStack {
                ForEach(["일", "월", "화", "수", "목", "금", "토"], id: \.self) { day in
                    Text(day)
                        .frame(maxWidth: .infinity)
                }
            }
            
            // 날짜 표시
            let days : [Date] = generateDays(for: currentDate)
            let rows = Array(repeating: GridItem(.flexible()), count: 7)
            
            LazyVGrid(columns: rows, spacing: 10) {
                ForEach(days, id: \.self) { date in
                    if isSameDay(date, as: todayDate) {
                        Button(action: {
                            print("클릭 이벤트 \(date)") // Event Code
                        }) {
                            Text(dateString(for: date))
                                .frame(maxWidth: .infinity, minHeight: 40)
                                .background(isSameMonth(date, as: currentDate) ? Color.yellow.opacity(0.1) : Color.clear)
                                .cornerRadius(8)
                                .foregroundColor(Color.black)
                        }
                        
                        
                    }else {
                        Button(action: {
                            viewModel.actionClickDate(date)
                        }) {
                            Text(dateString(for: date))
                                .frame(maxWidth: .infinity, minHeight: 40)
                                .background(isSameMonth(date, as: currentDate) ? Color.blue.opacity(0.1) : Color.clear)
                                .cornerRadius(8)
                                .foregroundColor(Color.black)
                        }
                        .sheet(isPresented: $viewModel.showModal) {
                            ScheduleUpdatesView()
                        } //Button 끝
                    }
                    
                }
            }
            .padding()
        }
    }
    
    // Helper function to get the month and year string
    private func monthAndYearString(for date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 M월"
        return formatter.string(from: date)
    }
    
    // Helper function to generate days in the current month grid
    private func generateDays(for date: Date) -> [Date] {
        guard let monthInterval = Calendar.current.dateInterval(of: .month, for: date) else { return [] }
        
        var days = [Date]()
        var day = monthInterval.start
        
        // 이전 달의 남은 요일 채우기
        if let startWeekday = Calendar.current.dateComponents([.weekday], from: day).weekday {
            for _ in 1..<startWeekday {
                day = Calendar.current.date(byAdding: .day, value: -1, to: day)!
                days.insert(day, at: 0)
            }
        }
        
        // 현재 달의 날짜 추가
        day = monthInterval.start
        while day < monthInterval.end {
            days.append(day)
            day = Calendar.current.date(byAdding: .day, value: 1, to: day)!
        }
        
        // 다음 달의 남은 요일 채우기
        while days.count % 7 != 0 {
            days.append(day)
            day = Calendar.current.date(byAdding: .day, value: 1, to: day)!
        }
        
        return days
    }
    
    // Helper function to format date as a day string
    private func dateString(for date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        return formatter.string(from: date)
    }
    
    // Helper function to check if a date is in the same month
    private func isSameMonth(_ date1: Date, as date2: Date) -> Bool {
        let components1 = Calendar.current.dateComponents([.year, .month], from: date1)
        let components2 = Calendar.current.dateComponents([.year, .month], from: date2)
        return components1.year == components2.year && components1.month == components2.month
    }
    
    // Helper function to check if a date is in the same month
    private func isSameDay(_ date1: Date, as date2: Date) -> Bool {
        let components1 = Calendar.current.dateComponents([.year, .month, .day], from: date1)
        let components2 = Calendar.current.dateComponents([.year, .month, .day], from: date2)
        return components1.year == components2.year && components1.month == components2.month && components1.day == components2.day
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(CalendarModel(title: "title", mainColor: .black))
    }
}
