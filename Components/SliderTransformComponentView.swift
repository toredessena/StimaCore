//
//  SliderComponent.swift
//  StimaCore
//
//  Created by salvatore dessena on 11/03/22.
//

import SwiftUI

struct SliderTransformComponentView: View {
    
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
                Text("Struttura bloccata")
                    .bold()
            case -0.05:
                Text("Possibili lievi modifiche")
                    .bold()
            case 0.00:
                Text("Flessibile con vincoli")
                    .bold()
            case 0.05:
                Text("Discreta flessibilità")
                    .bold()
            case 0.10:
                Text("Flessibilità da pianta libera")
                    .bold()
            default:
                Text("Discreta flessibilità")
                    .bold()
            }
        }
        
        HStack {
            Text("Incidenza sul fattore")
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
struct SliderPositionComponentView_Previews: PreviewProvider {
    static var previews: some View {
 SliderTransformComponentView()
    }
}
 */
