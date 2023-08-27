//
//  ContentView.swift
//  ReportCharts
//
//  Created by Youssef Ghattas on 22/08/2023.
//

import SwiftUI

struct ChartRange: Identifiable {
    var id: UUID = UUID()
    var name: String
    var x: Date
    var y: Int
    var color: Color
}

struct ContentView: View {
    var body: some View {
        VStack(spacing: 4) {
            OneDayChartView()
            ThreeHourChartView()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
