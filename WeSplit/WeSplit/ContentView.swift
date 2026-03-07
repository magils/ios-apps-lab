//
//  ContentView.swift
//  WeSplit
//
//  Created by Moises Gil on 3/7/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var peopleCount = 2
    @State private var checkAmount = 0.0
    @State private var tipPercentage = 10
    
    private var tipPercentages = [35, 30, 25, 20, 15, 10, 0]
    private let currencyLocale = Locale.current.currencyCode ?? "USD"
    private var tipAmount: Double {
        return checkAmount * (Double(tipPercentage) / 100)
    }
    private var totalPerPerson: Double {
        return (checkAmount + tipAmount) / Double(peopleCount + 2)
    }
    
    var body: some View {
        NavigationView{
            Form {
                Section(header: Text("TODO")) {
                    TextField("Amount", value: $checkAmount, format: .currency(code: currencyLocale))
                        .keyboardType(.decimalPad)
                    
                    Picker("Split between", selection: $peopleCount) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section(header: Text("Tip percentage")) {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }.pickerStyle(.segmented)
                    
                }
                
                Section(header: Text("Split Amount")) {
                    VStack(alignment: .center) {
                        Text(totalPerPerson, format: .currency(code: currencyLocale))
                            .font(Font.largeTitle.bold())
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        Text("Total Per person")
                            .font(.subheadline)
                                                
                        Spacer()
                        
                        Text(tipAmount, format: .currency(code: currencyLocale))
                            .font(.headline)
                        
                        Text("Tip Amount")
                            .font(.subheadline)
                    }
                }
                
            }.navigationTitle("WeSplit")
        }
    }
}

#Preview {
    ContentView()
}
