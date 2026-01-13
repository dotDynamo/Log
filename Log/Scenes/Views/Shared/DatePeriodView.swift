//
//  DatePeriodView.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/09.
//

import SwiftUI

struct DatePeriodView: View {
    let startDate: Date?
    let finishDate: Date?
    
    @State var dayDifference: Int?
    
    @State private var sameYear: Bool
    @State private var sameMonth: Bool
    @State private var sameDay: Bool
    
    init(startDate: Date?, finishDate: Date?) {
        self.startDate = startDate
        self.finishDate = finishDate
        if startDate != nil && finishDate != nil{
            sameYear = String(startDate!.formatted(.dateTime.year())) == String(finishDate!.formatted(.dateTime.year()))
            sameMonth = String(startDate!.formatted(.dateTime.month())) == String(finishDate!.formatted(.dateTime.month()))
            sameDay = String(startDate!.formatted(.dateTime.day())) == String(finishDate!.formatted(.dateTime.day()))
        } else {
            sameYear = false
            sameMonth = false
            sameDay = false
        }
    }
    
    var body: some View {
        if startDate != nil && finishDate != nil {
            Divider()
            VStack(alignment: .leading){
                if sameYear {
                    if sameMonth {
                        if sameDay {
                            Text("Same day").font(.headline).foregroundStyle(.gray)
                            Text(startDate!, format: .dateTime.year().month().day())
                        } else {
                            Text("Start\tFinish").font(.headline).foregroundStyle(.gray)
                            HStack{
                                Text(startDate!, format: .dateTime.day())
                                Text("-")
                                Text(finishDate!, format: .dateTime.year().month().day())
                            }
                        }
                    } else {
                        Text("Start\t\tFinish").font(.headline).foregroundStyle(.gray)
                        HStack{
                            Text(startDate!, format: .dateTime.month().day())
                            Text("-")
                            Text(finishDate!, format: .dateTime.year().month().day())
                        }
                    }
                } else {
                    Text("Start\t\t\tFinish").font(.headline).foregroundStyle(.gray)
                    HStack{
                        Text(startDate!, format: .dateTime.year().month().day())
                        Text("-")
                        Text(finishDate!, format: .dateTime.year().month().day())
                    }
                }
            //Text(String(LogUtils.compareDate(from: startDate!, to: finishDate!, component: .year)!))
            //Text(String(LogUtils.compareDate(from: startDate!, to: finishDate!, component: .month)!))
            //Text(String(LogUtils.compareDate(from: startDate!, to: finishDate!, component: .day)!))
            }
        }
    }
}

#Preview {
    
    //mismo año mes dia
    let startDate: Date? = Calendar.current.date(from: DateComponents(year: 2025, month: 9, day: 29))
    let endDate: Date? = Calendar.current.date(from: DateComponents(year: 2025, month: 9, day: 29))
    
    //mismo año mes
    let startDate1: Date? = Calendar.current.date(from: DateComponents(year: 2023, month: 5, day: 13))
    let endDate1: Date? = Calendar.current.date(from: DateComponents(year: 2023, month: 5, day: 29))
    
    //mismo año
    let startDate2: Date? = Calendar.current.date(from: DateComponents(year: 2021, month: 2, day: 13))
    let endDate2: Date? = Calendar.current.date(from: DateComponents(year: 2021, month: 5, day: 29))
    
    //mismo nada
    let startDate3: Date? = Calendar.current.date(from: DateComponents(year: 2024, month: 12, day: 29))
    let endDate3: Date? = Calendar.current.date(from: DateComponents(year: 2025, month: 3, day: 13))
    
    DatePeriodView(startDate: startDate, finishDate: endDate)
        .environment(\.locale, .init(identifier: "es_MX"))
    
    DatePeriodView(startDate: startDate1, finishDate: endDate1)
        .environment(\.locale, .init(identifier: "es_MX"))

    DatePeriodView(startDate: startDate2, finishDate: endDate2)
        .environment(\.locale, .init(identifier: "es_MX"))

    DatePeriodView(startDate: startDate3, finishDate: endDate3)
        .environment(\.locale, .init(identifier: "es_MX"))
    
    DatePeriodView(startDate: nil, finishDate: nil)
        .environment(\.locale, .init(identifier: "es_MX"))
    
}
