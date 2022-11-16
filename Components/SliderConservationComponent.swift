//
//  SliderConservationComponent.swift
//  StimaCore
//
//  Created by salvatore dessena on 16/03/22.
//

import SwiftUI

struct SliderConservationComponent: View {
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
     
        VStack {
            HStack {
                Text(qualityDescriptionText)
                    .foregroundColor(Color(colorComponent))
                Spacer()
                switch sliderValue {
                case -0.20:
                    Text("Scarsa")
                        .bold()
                case -0.10:
                    Text("Mediocre")
                        .bold()
                case 0.00:
                    Text("Ordinaria")
                        .bold()
                case 0.10:
                    Text("Discreta")
                        .bold()
                case 0.20:
                    Text("Buona")
                        .bold()
                default:
                    Text("Discreta")
                        .bold()
                }
            }
            
            HStack {
                Text("Incidenza sul componente")
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
}


 
 struct SliderConservationComponent_Previews: PreviewProvider {
     static var previews: some View {
         SliderConservationComponent(sliderValueBinding: .constant(0.10), arc: -0.20...0.20, istep: 0.10, sliderValue: 0.10, colorComponent: "colorPinkBright", qualityDescriptionText: "cnc")
 .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)

     }
 }
 



