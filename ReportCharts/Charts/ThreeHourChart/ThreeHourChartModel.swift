//
//  ThreeHourChartModel.swift
//  ReportCharts
//
//  Created by Youssef Ghattas on 27/08/2023.
//

import Foundation


class ThreeHourChartModel {
    var egvs = [EGV]()
    var xAxisValues = [Date]()
    var yAxisMajorTicks = [Int]()
    var yAxisValues = [Int]()
    var ranges = [ChartRange]()
    
    private var numberOfReadingsInThreeHours = 35
    private let startDate = DateProvider().todayStartDate
    
    init() {
        initEGVs()
        initXAxisValues()
        initYAxisValues()
        initRanges()
    }
    
    private func initEGVs() {
        var result = [EGV]()
        for index in 0...numberOfReadingsInThreeHours {
            let egv = EGV(
                id: UUID(),
                time: startDate.addingTimeInterval(TimeInterval(index * 5 * 60)),
                value: steady120[index]
            )
            result.append(egv)
        }
        egvs = result
    }
    
    private func initXAxisValues() {
        var result = [Date]()
        for index in 0...12 {
            result.append(startDate.addingTimeInterval(TimeInterval(index * 15 * 60)))
        }
        xAxisValues = result
    }
    
    private func initYAxisValues() {
        yAxisMajorTicks = [10, 100, 200, 300, 400]
        yAxisValues = [50, 100, 150, 200, 250, 300, 350, 400]
    }
    
    private func initRanges() {
        guard !xAxisValues.isEmpty else { return }
        ranges = [
            ChartRange(name: "1", x: xAxisValues.first!, y: 50, color: .gray.opacity(0.1)),
            ChartRange(name: "1", x: xAxisValues.last!, y: 50, color: .gray.opacity(0.1)),
            ChartRange(name: "2", x: xAxisValues.first!, y: 50, color: .white),
            ChartRange(name: "2", x: xAxisValues.last!, y: 50, color: .white),
            ChartRange(name: "3", x: xAxisValues.first!, y: 50, color: .gray.opacity(0.1)),
            ChartRange(name: "3", x: xAxisValues.last!, y: 50, color: .gray.opacity(0.1)),
            ChartRange(name: "4", x: xAxisValues.first!, y: 50, color: .white),
            ChartRange(name: "4", x: xAxisValues.last!, y: 50, color: .white),
            ChartRange(name: "5", x: xAxisValues.first!, y: 50, color: .gray.opacity(0.1)),
            ChartRange(name: "5", x: xAxisValues.last!, y: 50, color: .gray.opacity(0.1)),
            ChartRange(name: "6", x: xAxisValues.first!, y: 50, color: .white),
            ChartRange(name: "6", x: xAxisValues.last!, y: 50, color: .white),
            ChartRange(name: "7", x: xAxisValues.first!, y: 50, color: .gray.opacity(0.1)),
            ChartRange(name: "7", x: xAxisValues.last!, y: 50, color: .gray.opacity(0.1)),
            ChartRange(name: "8", x: xAxisValues.first!, y: 50, color: .white),
            ChartRange(name: "8", x: xAxisValues.last!, y: 50, color: .white),
            ChartRange(name: "9", x: xAxisValues.first!, y: 25, color: .gray.opacity(0.1)),
            ChartRange(name: "9", x: xAxisValues.last!, y: 25, color: .gray.opacity(0.1))
        ]
    }
}
