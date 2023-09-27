//
//  ContentView.swift
//  Practice_App_1
//
//  Created by Selvaguru K on 9/24/23.
//

import SwiftUI

struct ContentView: View {
    @State private var list = List<Int>()
    @State private var first_value = list.print_First()
    
    var body: some View {
        NavigationView{
            Form{
                VStack {
                           Button("Add Value to List") {
                               // Add values to the linked list
                               list.append(42) // Add your desired value here
                               list.append(123) // Add another value if needed
                           }
                           .padding()
                           
                    Text("Linked List Contents: \(first_value)")
                                   .padding()
                               
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
