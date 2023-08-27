//
//  DateProvider.swift
//  ReportCharts
//
//  Created by Youssef Ghattas on 27/08/2023.
//

import Foundation

struct DateProvider {
    var todayStartDate: Date {
        let now = Date()
        let secondsSinceStartOfDay = now.timeIntervalSince1970.truncatingRemainder(dividingBy: 24 * 60 * 60)
        return now.addingTimeInterval(-1 * secondsSinceStartOfDay).addingTimeInterval(-3 * 60 * 60)
    }
}
