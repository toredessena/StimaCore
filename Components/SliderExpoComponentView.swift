//
//  SliderExpoComponentView.swift
//  StimaCore
//
//  Created by salvatore dessena on 24/07/22.
//

import SwiftUI

struct SliderExpoComponentView: View {
// MARK: - PROPERTIES

@AppStorage("isDarkMode") private var isDarkMode: Bool = false


var sliderValueBinding: Binding<Double>
var arc: ClosedRange<Double>
var istep: Double
var sliderValue: Double
var colorComponent: String
var qualityDescriptionText: String


// MARK: - BODY

var body: some View {

    HStack {
        Text(qualityDescriptionText)
            .foregroundColor(Color(colorComponent))
        Spacer()
        switch sliderValue {
        case -0.10:
            Text("Insufficiente")
                .bold()
        case -0.05:
            Text("Parziale")
                .bold()
        case 0.00:
            Text("Discreta")
                .bold()
        case 0.05:
            Text("Buona - casa passiva")
                .bold()
        case 0.10:
            Text("Buona - casa attiva")
                .bold()
        default:
            Text("Buona - casa passiva")
                .bold()
        }
    }
    
    HStack {
        Text("Incidenza:")
            .foregroundColor(Color(colorComponent))
        Spacer()
        Text("\(sliderValue * 100, specifier: "%.0f") %")
            .bold()
            .padding(4)
            .padding(.leading, 8)
            .padding(.trailing, 8)
            .background(Capsule(style: .circular).fill(isDarkMode ? Color(colorComponent) : Color.white))
    }
    
    Slider(value: sliderValueBinding, in: arc, step: istep)
        .accentColor(Color(colorComponent))
    }
}


/*
struct SliderExpoComponentView_Previews: PreviewProvider {
    static var previews: some View {
        SliderExpoComponentView()
    }
}
 */
