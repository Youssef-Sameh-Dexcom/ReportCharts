//
//  OneDayChartView.swift
//  ReportCharts
//
//  Created by Youssef Ghattas on 27/08/2023.
//

import SwiftUI
import Charts

struct OneDayChartView: View {
    let model = OneDayChartModel()
    
    var body: some View {
        Chart {
            AlternatingBackground(ranges: model.ranges)
            
            EGVLine(egvs: model.egvs)
            
            Borders(xStart: model.xAxisValues.first!, xEnd: model.xAxisValues.last!, yStart: 0, yEnd: 425)
            
            ThresholdMark(threshold: 110, color: .red)
            
            ThresholdMark(threshold: 180, color: .orange)
            
            FlagProcedureMark(date: Date())
        }
        .frame(height: 170)
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
        .chartXAxis {
            AxisMarks(preset: AxisMarkPreset.aligned, values: model.xAxisValues) { value in
                if let date = value.as(Date.self) {
                    let hour = Calendar.current.component(.hour, from: date)
                    AxisValueLabel {
                        switch hour {
                        case 0, 12:
                            Text(date, format: .dateTime.hour())
                                .foregroundColor(.black)
                        case 3, 6, 9, 15, 18, 21:
                            Text(date, format: .dateTime.hour(.defaultDigits(amPM: .omitted)))
                                .foregroundColor(.black)
                        default:
                            Text("")
                        }
                    }
                    switch hour {
                    case 0, 3, 6, 9, 12, 15, 18, 21:
                        AxisTick(length: 12, stroke: .init(lineJoin: .round))
                    default:
                        AxisTick(length: 8, stroke: .init(lineJoin: .round))
                    }
                }
            }
        }
        .chartLegend(.hidden)
    }
}

struct OneDayChartView_Previews: PreviewProvider {
    static var previews: some View {
        OneDayChartView()
    }
}
