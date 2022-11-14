//
//  SliderProvaComponentView.swift
//  StimaCore
//
//  Created by salvatore dessena on 14/11/22.
//

import SwiftUI

struct SliderProvaComponentView: View {
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
            // prova scena
            HStack {
                Text(qualityDescriptionText)
                    .foregroundColor(Color(colorComponent))
                Spacer()
                switch sliderValue {
                case -0.20:
                    scena
                case -0.10:
                    scena
                case 0.00:
                    scena
                case 0.10:
                    scena
                case 0.20:
                    scena
                default:
                    scena
             
                }
            }
            // fine prova scena
            
            /*
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
             */
         
         Slider(value: sliderValueBinding, in: arc, step: istep)
             .accentColor(Color(colorComponent))
         

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
            }
        .padding()
        }
    
    var scena: some View {
        HStack {
            if sliderValue == -0.20 {
                Text("S")
            }
                else {
                    Text("S")
                        .foregroundColor(.gray)
                }
            Spacer()
            
            if sliderValue == -0.10 {
                Text("M")
                    .foregroundColor(.pink)
            }
                else {
                    Text("med")
                        .foregroundColor(.gray)
                }
            Spacer()
            
            if sliderValue == 0.00 {
                Text("O")
                    .foregroundColor(.pink)
            }
                else {
                    Text("ord")
                        .foregroundColor(.gray)
                }
            Spacer()
            if sliderValue == 0.10 {
                Text("D")
                    .foregroundColor(.pink)
            }
                else {
                    Text("dis")
                        .foregroundColor(.gray)
                }
            Spacer()
            if sliderValue == 0.20 {
                Text("B")
                    .foregroundColor(.pink)
            }
                else {
                    Text("buo")
                        .foregroundColor(.gray)
                }
            }
        }
    
    // ruler
    
    }
    



 
 struct SliderProvaComponentView_Previews: PreviewProvider {
     static var previews: some View {
         SliderProvaComponentView(sliderValueBinding: .constant(0.10), arc: -0.20...0.20, istep: 0.10, sliderValue: 0.10, colorComponent: "ColorPinkBright", qualityDescriptionText: "")
     }
 }
 
