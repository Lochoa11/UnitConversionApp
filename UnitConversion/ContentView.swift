//
//  ContentView.swift
//  UnitConversion
//
//  Created by Lin Ochoa on 11/13/24.
//

import SwiftUI

struct ContentView: View {
    @State private var input = ["km", "m", "cm", "mm", "in", "ft", "yd", "mi"]
//    @State private var output = ["km", "m", "cm", "mm", "in", "ft", "yd", "mi"]
    
    @State private var inputMetric = "cm"
    @State private var outputMetric = "in"
    
    @State private var inputValue: Double? = nil
    
    var convertedInput: Double {
        switch inputMetric {
            case "mm": return inputValue ?? 0.0
            case "cm": return (inputValue ?? 0.0) * 10
            case "m": return (inputValue ?? 0.0) * 1_000
            case "km": return (inputValue ?? 0.0) * 1_000_000
            case "in": return (inputValue ?? 0.0) * 2.54
            case "ft": return (inputValue ?? 0.0) * 304.8
            case "yd": return (inputValue ?? 0.0) * 914.4
            case "mi": return (inputValue ?? 0.0) * 1_609_344
            default: return 0.0
        }
    }
    
    var outputValue:Double {
        switch outputMetric {
            case "mm": return convertedInput
            case "cm": return convertedInput / 10.0
            case "m": return convertedInput / 1_000
            case "km": return convertedInput / 1_000_000
            case "in": return convertedInput / 2.54
            case "ft": return convertedInput / 304.8
            case "yd": return convertedInput / 914.4
            case "mi": return convertedInput / 1_609_344
            default: return 0
        }
    }
    
    @FocusState private var inputFocus: Bool
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Input Unit") {
                    Picker("Input Unit", selection: $inputMetric) {
                        ForEach(input, id: \.self) { input in
                            Text(input)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Output Unit") {
                    Picker("Output Unit", selection: $outputMetric) {
                        ForEach(input, id: \.self) { output in
                            Text(output)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Your Input Value") {
                    TextField("Enter Value", value: $inputValue, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($inputFocus)
                }
                Section("Your Output") {
                    Text("\(outputValue.formatted(.number))")
                        
                }
            }
            .navigationTitle("Unit Conversion")
            .toolbar {
                if inputFocus {
                    Button("Done") {
                        inputFocus = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
