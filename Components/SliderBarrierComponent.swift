//
//  SliderBarrierComponent.swift
//  StimaCore
//
//  Created by salvatore dessena on 24/03/22.
//

import SwiftUI

struct SliderBarrierComponent: View {
    
    var percentDescriptionText: String
    var sliderValueBinding: Binding<Double>
    var arc: ClosedRange<Double>
    var istep: Double
    var sliderValue: Double
    var colorComponent: String
    
   
    var body: some View {
        
          HStack {
              Text("Livello conseguito")
              Spacer()
              switch sliderValue {

              case 0.0:
                  BarrierBadgeComponent(color: "Grigiolino", text: "Nessuno")
              case 0.5:
                  BarrierBadgeComponent(color: "Senape", text: "Adattabilità")
              case 1.0:
                  BarrierBadgeComponent(color: "Arancio", text: "Visitabilità")
              case 1.5:
                  BarrierBadgeComponent(color: "Rosso", text: "Accessibilità")
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
struct SliderBarrierComponent_Previews: PreviewProvider {
    static var previews: some View {
        SliderBarrierComponent()
    }
}
 */
