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
            AlternatingBackground(ranges: model.ranges)
            
            ThresholdMark(threshold: 110, color: .red)
            
            ThresholdMark(threshold: 180, color: .orange)
            
            EGVPointedLine(egvs: model.egvs)
            
            Borders(xStart: model.xAxisValues.first!, xEnd: model.xAxisValues.last!, yStart: 0, yEnd: 425)
        }
        .frame(height: 160)
        .chartYAxis {
            AxisMarks(
                values: model.yAxisMajorTicks
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
                values: model.yAxisValues
            ) {
                AxisTick(length: 6)
            }
        }
        
        // Currently this is hardcoded to specific hours in real scenario it will be calculated depending on when the session ended.
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
