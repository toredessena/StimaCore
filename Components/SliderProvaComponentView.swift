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
    
    
    // MARK: - BODY
    var body: some View {
        VStack {
            VStack {
                // MARK: - INDICATORI QUALITA
                HStack {
                    qualityIndicators
                }
                // MARK: - RIGHELLO
                    HStack {
                        ruler
                    }
                    // MARK: - SLIDER
                HStack {
                    Slider(value: sliderValueBinding, in: arc, step: istep)
                        .accentColor(Color(colorComponent))
                }
                // MARK: - INCIDENZA
            HStack {
                Text("Incidenza")
                    .foregroundColor(Color(colorComponent))
                Spacer()
                Text("\(sliderValue * 100, specifier: "%.0f")%")
                    .bold()
                    .padding(4)
                    .background(Capsule(style: .circular).fill(isDarkMode ? Color(colorComponent) : Color.white))
                }
                // END OF HSTACK
            } // END OF VSTACK
        } // END OF VSTACK
    } // END OF BODY
    
    // MARK: - QUALITY INDICATOR VIEW
    var qualityIndicators: some View {
        
        HStack {
            if sliderValue == -0.50 {
                VStack {
                    Text("Scarso")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.pink)
                    cerchietto
                }
            }
            else {
                VStack {
                    Text("Scarso")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(Color(.quaternaryLabel))
                    cerchietto
                }
            }
            
            Spacer()
            
            if sliderValue == -0.25 {
                VStack {
                    Text("Mediocre")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.pink)
                    cerchietto
                }
            }
            else {
                VStack {
                    Text("Mediocre")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(Color(.quaternaryLabel))
                    cerchietto
                }
            }
            
            Spacer()
            
            if sliderValue == 0.00 {
                VStack {
                    Text("Ordinario")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.pink)
                    cerchietto
                }
            }
            else {
                VStack {
                    Text("Ordinario")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(Color(.quaternaryLabel))
                    cerchietto
                }
            }
            
            Spacer()
            
            if sliderValue == 0.25 {
                VStack {
                    Text("Discreto")
                        .foregroundColor(.pink)
                        .font(.system(size: 12, weight: .bold))
                    cerchietto
                }
            }
            else {
                VStack {
                    Text("Discreto")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(Color(.quaternaryLabel))
                    cerchietto
                }
            }
            
            Spacer()
            
            if sliderValue == 0.50 {
                VStack{
                    Text("Buono")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.pink)
                    cerchietto
                }
            }
            else {
                VStack {
                    Text("Buono")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(Color(.quaternaryLabel))
                    cerchietto
                }
            }
        }
        
    } // END OF Quality Indicator View
}
    // MARK: - CIRCLE VIEW
    var cerchietto: some View {
            Image(systemName: "circle.fill")
                .resizable()
                .frame(width: 4, height: 4)
                .foregroundColor(.gray)
    } //END OF CIRCLE VIEW

// MARK: - RULER VIEW
var ruler: some View {
    HStack {
        ForEach (0...19, id:\.self) { _ in
                    Rectangle()
                                .fill(Color(.gray))
                                .frame(width: 1, height: 10)
            Spacer()
                    }
        
        Rectangle()
                    .fill(Color(.gray))
                    .frame(width: 1, height: 10)
    }
    .padding(.leading, 14)
    .padding(.trailing, 14)
   
            }// END RULER VIEW



 struct SliderProvaComponentView_Previews: PreviewProvider {
     static var previews: some View {
         SliderProvaComponentView(sliderValueBinding: .constant(-0.20), arc: -0.40...0.40, istep: 0.02, sliderValue: 0.20, colorComponent: "ColorPinkBright")
     }
 }
 
