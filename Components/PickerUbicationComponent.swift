//
//  PickerUbicationComponent.swift
//  StimaCore
//
//  Created by salvatore dessena on 26/11/22.
//

import SwiftUI

struct PickerUbicationComponent: View {
    
    
    @State var sliderValue: Double = 0.00
    @ObservedObject var item: Item
    
    var body: some View {
        VStack {
            Picker("seleziona", selection: $sliderValue ) {
                Text("zone E").tag(-0.20)
                Text("zone C").tag(-0.10)
                Text("zone B").tag(0.00)
                Text("zone A").tag(0.10)
                Text("zone F").tag(0.20)
            }.pickerStyle(.segmented)
            Text("\(sliderValue * 100, specifier: "%.0f")")
            
        }
    }
}

struct PickerUbicationComponent_Previews: PreviewProvider {
    static var previews: some View {
        PickerUbicationComponent(item: Item())
    }
}
