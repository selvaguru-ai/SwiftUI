//
//  ContentView.swift
//  WeSplitApp
//
//  Created by Selvaguru K on 9/19/23.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberofPeople = 2
    @State private var tipPercentage = 20
    
    let tipPercentages = [10, 15, 20, 0]
    
    @FocusState private var amountIsFocused: Bool
    
    var totalPerson: Double {
        let peopleCount = Double(numberofPeople + 2)
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount/100 * tipSelection
        let grandTotal = checkAmount + tipValue
        
        let amountperPerson = grandTotal/peopleCount
        
        return amountperPerson
    }
    
    var totalBill: Double {
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount/100 * tipSelection
        let grandTotal = checkAmount + tipValue
        
        return grandTotal
    }
    
    var body: some View {
        NavigationView{
            Form {
                Section {
                    TextField("Amount :", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of People", selection: $numberofPeople){
                        ForEach(2 ..< 100) {
                            Text ("\($0) people")
                        }
                    }
                }
                    Section {
                        Picker("Tip Percentage :", selection: $tipPercentage){
                            ForEach(tipPercentages, id: \.self){
                                Text ($0, format: .percent)
                            }
                        }.pickerStyle(.segmented)
                } header: {
                    Text ("How much tip you want to leave")
                }
                
                Section {
                    Text(totalPerson, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                }
            header: {
                Text("Amount Per Person")
            }
                Section {
                    Text (totalBill, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                }
            header: {
                Text ("Total Bill Amount")
            }
            }
        }
        .navigationTitle("WeSplitBills")
        .toolbar{
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                
                Button ("Button")  {
                    amountIsFocused = false
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
