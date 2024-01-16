//
//  ContentView.swift
//  wesplit
//
//  Created by Samith Wijesinghe on 2021-06-15.
//
import SwiftUI

struct ContentView: View {
    @State private var CheckAmount = ""
    @State private var numberOfPeople = ""
    @State private var tipPrecentage = 2
    
    let tipPrecentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double{
        let peopleCount = Double(numberOfPeople) ?? 0
        let tipSelection = Double(tipPrecentages[tipPrecentage])
        let orderAmount = Double(CheckAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var grandtotal: Double{
       
        let tipSelection = Double(tipPrecentages[tipPrecentage])
        let orderAmount = Double(CheckAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        
        return grandTotal
    }
    
   
    var body: some View {
        NavigationView{
        Form{
            Section{
                TextField("Amount", text: $CheckAmount)
                    .keyboardType(.decimalPad)
                
                TextField("Number of People", text: $numberOfPeople)
                    .keyboardType(.decimalPad)
                
                
               
            }
            Section(header: Text("How much tip do you want to leave?")){
                Picker("Tipe precentage", selection: $tipPrecentage){
                    ForEach(0 ..< tipPrecentages.count){
                        Text("\(self.tipPrecentages[$0])%")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            Section(header: Text("Total amount")){
                Text("$\(grandtotal, specifier: "%.2f")")
            }
            Section(header: Text("Amount per person")){
                Text("$\(totalPerPerson, specifier: "%.2f")")
            }
            
        }
        .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
