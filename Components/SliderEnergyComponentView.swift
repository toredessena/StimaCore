//
//  SliderEnergyComponentView.swift
//  StimaCore
//
//  Created by salvatore dessena on 22/03/22.
//

import SwiftUI

struct SliderEnergyComponentView: View {
    
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    var percentDescriptionText: String
    var sliderValueBinding: Binding<Double>
    var arc: ClosedRange<Double>
    var istep: Double
    var sliderValue: Double
    var colorComponent: String
  
    
    var body: some View {
        
       
      
        HStack {
            Text("Classe energetica:")
            Spacer()
            switch sliderValue {
            case -4.0:
                HouseComponent(letter: "G", color: "Rosso")
            case -3.0:
                HouseComponent(letter: "F", color: "Arancioscuro")
            case -2.0:
                HouseComponent(letter: "E", color: "Arancio")
            case -1.0:
                HouseComponent(letter: "D", color: "Senape")
            case 0.0:
                HouseComponent(letter: "C", color: "Giallo")
            case 1.0:
                HouseComponent(letter: "B", color: "Verdolino")
            case 2.0:
                HouseComponent(letter: "A1", color: "Smeraldo")
            case 3.0:
                HouseComponent(letter: "A2", color: "Verde")
            case 4.0:
                HouseComponent(letter: "A3", color: "Verdone1")
            case 5.0:
                HouseComponent(letter: "A4", color: "Verdone2")
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
struct SliderEnergyComponentView_Previews: PreviewProvider {
    static var previews: some View {
        SliderEnergyComponetView()
    }
}
 */
