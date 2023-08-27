//
//  AlternatingBackground.swift
//  ReportCharts
//
//  Created by Youssef Ghattas on 27/08/2023.
//

import SwiftUI
import Charts

struct AlternatingBackground: ChartContent {
    let ranges: [ChartRange]
    var body: some ChartContent {
        ForEach(ranges, id: \.id) { range in
            AreaMark(x: .value("", range.x), y: .value("", range.y), stacking: .standard)
                .foregroundStyle(range.color)
                .foregroundStyle(by: .value("", range.name))
                
        }
    }
}

struct EGVLine: ChartContent {
    let egvs: [EGV]
    var body: some ChartContent {
        ForEach(egvs) { egv in
            LineMark(x: .value("", egv.time), y: .value("", egv.value))
                .foregroundStyle(.black)
                .lineStyle(StrokeStyle(lineWidth: 2))
        }
    }
}

struct EGVPointedLine: ChartContent {
    let egvs: [EGV]
    var body: some ChartContent {
        ForEach(egvs) { egv in
            LineMark(x: .value("", egv.time), y: .value("", egv.value))
                .foregroundStyle(.black)
                .lineStyle(StrokeStyle(lineWidth: 4, lineJoin: .round))
            
            PointMark(x: .value("", egv.time), y: .value("", egv.value))
                 .foregroundStyle(.black)
                .symbol {
                    Circle()
                        .strokeBorder(.white, lineWidth: 2)
                        .background(Circle().fill(.black))
                        .frame(width: 10)
                }
            
        }
    }
}

struct Borders: ChartContent {
    let xStart: Date
    let xEnd: Date
    let yStart: Int
    let yEnd: Int
    var body: some ChartContent {
        RuleMark(xStart: 14, xEnd: 675, y: .value("", yStart))
            .foregroundStyle(.gray)
            .lineStyle(StrokeStyle(lineWidth: 1))
        
        RuleMark(xStart: 14, xEnd: 675, y: .value("", yEnd))
            .foregroundStyle(.gray)
            .lineStyle(StrokeStyle(lineWidth: 1))
        
        RuleMark(x: .value("", xStart))
            .foregroundStyle(.gray)
            .lineStyle(StrokeStyle(lineWidth: 1))
        
        RuleMark(x: .value("", xEnd))
            .foregroundStyle(.gray)
            .lineStyle(StrokeStyle(lineWidth: 1))
    }
}

struct ThresholdMark: ChartContent {
    let threshold: Int
    let color: Color
    
    var body: some ChartContent {
        RuleMark(y: .value("LOW", threshold))
            .foregroundStyle(color)
            .lineStyle(StrokeStyle(lineWidth: 2))
            .annotation(position: AnnotationPosition.leading, spacing: -2) {
                Text("\(threshold)")
                    .foregroundColor(.white)
                    .background(content: {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(color)
                            .frame(width: 32, height: 10)
                    })
                    .font(Font.system(size: 8))
                    .fontWeight(Font.Weight.bold)
            }
    }
}

struct FlagProcedureMark: ChartContent {
    let date: Date
    
    var body: some ChartContent {
        RuleMark(x: .value("", date))
            .lineStyle(StrokeStyle(lineWidth: 4, lineJoin: .round))
            .foregroundStyle(.blue.opacity(0.2))
    }
}
