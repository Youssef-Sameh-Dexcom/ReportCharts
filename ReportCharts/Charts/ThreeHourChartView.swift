//
//  ThreeHourChartView.swift
//  ReportCharts
//
//  Created by Youssef Ghattas on 27/08/2023.
//

import SwiftUI
import Charts

struct ThreeHourChartView: View {
    let model = ThreeHourChartModel()
    
    var body: some View {
        Chart {
            ForEach(model.ranges, id: \.id) { range in
                AreaMark(x: .value("", range.x), y: .value("", range.y), stacking: .standard)
                    .foregroundStyle(range.color)
                    .foregroundStyle(by: .value("", range.name))
                    
            }
            
            RuleMark(y: .value("LOW", 110))
                .foregroundStyle(.red)
                .lineStyle(StrokeStyle(lineWidth: 2))
                .annotation(position: AnnotationPosition.leading, spacing: -2) {
                    Text("110")
                        .foregroundColor(.white)
                        .background(content: {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.red)
                                .frame(width: 32, height: 10)
                        })
                        .font(Font.system(size: 8))
                        .fontWeight(Font.Weight.bold)
                        
                }
            
            RuleMark(y: .value("HIGH", 180))
                .foregroundStyle(.orange)
                .lineStyle(StrokeStyle(lineWidth: 2))
                .annotation(position: AnnotationPosition.leading, spacing: -2) {
                    Text("180")
                        .foregroundColor(.white)
                        .background(content: {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.orange)
                                .frame(width: 32, height: 10)
                        })
                        .font(Font.system(size: 8))
                        .fontWeight(Font.Weight.bold)
                        
                }
            
            
            ForEach(model.egvs) { egv in
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
            RuleMark(xStart: 14, xEnd: 675, y: .value("", 425))
                .foregroundStyle(.gray)
                .lineStyle(StrokeStyle(lineWidth: 1))
            RuleMark(xStart: 14, xEnd: 675, y: .value("", 0))
                .foregroundStyle(.gray)
                .lineStyle(StrokeStyle(lineWidth: 1))
            
            RuleMark(x: .value("", model.xAxisValues.first!))
                .foregroundStyle(.gray)
                .lineStyle(StrokeStyle(lineWidth: 1))
            
            RuleMark(x: .value("", model.xAxisValues.last!))
                .foregroundStyle(.gray)
                .lineStyle(StrokeStyle(lineWidth: 1))
            
            
            
            
        }
        .frame(height: 160)
        .chartYAxis {
            AxisMarks(
                values: [10, 100, 200, 300, 400]
            ) { value in
                let level = value.as(Int.self)
                AxisValueLabel {
                    switch level {
                    case 10:
                        Text("mg/dL")
                            .foregroundColor(.black)

                    default:
                        Text(String(level ?? 0))
                            .foregroundColor(.black)
                    }
                }
                
            }
            
            AxisMarks(
                values: [50, 100, 150, 200, 250, 300, 350, 400]
            ) {
                AxisTick(length: 6)
            }
        }
        .chartXAxis {
            AxisMarks(preset: AxisMarkPreset.aligned, values: model.xAxisValues) { value in
                if let date = value.as(Date.self) {
                    let hour = Calendar.current.component(.hour, from: date)
                    let minute = Calendar.current.component(.minute, from: date)
                    
                    let amPm = hour >= 12 ? "pm" : "am"
                    if hour == 0 && minute == 0 ||
                        hour == 0 && minute == 45 ||
                        hour == 1 && minute == 30 ||
                        hour == 2 && minute == 15 ||
                        hour == 3 && minute == 0 {
                        AxisValueLabel {
                            (Text(date, format: .dateTime.hour(.defaultDigits(amPM: .omitted))) +
                            Text(":") +
                            Text(date, format: .dateTime.minute(.twoDigits)) +
                            Text(amPm))
                                .foregroundColor(.black)
                        }
                        
                        AxisTick(length: 12, stroke: .init(lineJoin: .round))
                    } else {
                        AxisTick(length: 8, stroke: .init(lineJoin: .round))
                    }
                }
            }
        }
        .chartLegend(.hidden)

    }
}

struct ThreeHourChartView_Previews: PreviewProvider {
    static var previews: some View {
        ThreeHourChartView()
    }
}
