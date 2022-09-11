//
//  SliderSismaComponent.swift
//  StimaCore
//
//  Created by salvatore dessena on 23/03/22.
//

import SwiftUI

struct SliderSismaComponent: View {
    
    var percentDescriptionText: String
    var sliderValueBinding: Binding<Double>
    var arc: ClosedRange<Double>
    var istep: Double
    var sliderValue: Double
    var colorComponent: String
   
    
    var body: some View {
       
      
        HStack {
            Text("Classe sismica")
            Spacer()
            switch sliderValue {

            case 0.0:
                BadgeSismaComponent(circleColor: "Rosso", letter: "G")
            case 0.5:
                BadgeSismaComponent(circleColor: "Arancioscuro", letter: "F")
            case 1.0:
                BadgeSismaComponent(circleColor: "Arancio", letter: "E")
            case 1.5:
                BadgeSismaComponent(circleColor: "Giallo", letter: "D")
            case 2.0:
                BadgeSismaComponent(circleColor: "Verdolino", letter: "C")
            case 2.5:
                BadgeSismaComponent(circleColor: "Verde", letter: "B")
            case 3.0:
                BadgeSismaComponent(circleColor: "Verdone1", letter: "A")
            case 3.5:
                BadgeSismaComponent(circleColor: "Verdone2", letter: "A+")
            default:
                Text("No Class")
            }
        }
        
        HStack{
            Text(percentDescriptionText)
            Spacer()
            Text("\(sliderValue, specifier: "%.2f")%")
                .bold()
            }
        
        Slider(value: sliderValueBinding, in: arc, step: istep)
                  .accentColor(.pink)
        
    }
}

/*
struct SliderSismaComponentView_Previews: PreviewProvider {
    static var previews: some View {
        SliderSismaComponent()
    }
}
 */
