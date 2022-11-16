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
            // MARK: - INDICATORI QUALITA
            HStack {
                switch sliderValue {
                case -0.20:
                        qualityIndicators
                case -0.10:
                        qualityIndicators
                case 0.00:
                        qualityIndicators
                case 0.10:
                        qualityIndicators
                case 0.20:
                        qualityIndicators
                default:
                        qualityIndicators
                }
            }
            // FINE INDICATORI QUALITA

            // MARK: - RIGHELLO E PUNTINI
                /*
            HStack(spacing: 80) {
                    ForEach (1...5, id:\.self) { _ in
                        cerchietto
                    }
                }
                 */
            
                HStack {
                    Spacer()
                        ForEach (1...41, id:\.self) { _ in
                                   ruler
                            Spacer()
                        }
                }.padding(.horizontal)
            
         Slider(value: sliderValueBinding, in: arc, step: istep)
             .accentColor(Color(colorComponent))
             .padding(.horizontal, 24)
             
            HStack {
                Text("Incidenza sul componente")
                    .foregroundColor(Color(colorComponent))
                Spacer()
                Text("\(sliderValue * 100, specifier: "%.0f")%")
                    .bold()
                    .padding(4)
                    .background(Capsule(style: .circular).fill(isDarkMode ? Color(colorComponent) : Color.white))
                }
            .padding(.horizontal, 24)
         
            }
       
    }
    
    // MARK: - QUALITY INDICATOR VIEW
    var qualityIndicators: some View {
        HStack {
            if sliderValue == -0.20 {
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
                        .font(.system(size: 12))
                    .foregroundColor(Color(.quaternaryLabel))
                    cerchietto
                }
            }
            Spacer()
            
            if sliderValue == -0.10 {
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
                            .font(.system(size: 12))
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
                            .font(.system(size: 12))
                        .foregroundColor(Color(.quaternaryLabel))
                        cerchietto
                    }
                }
            Spacer()
            
            if sliderValue == 0.10 {
                VStack {
                    Text("Discreto")
                        .font(.system(size: 12, weight: .bold))
                    .foregroundColor(.pink)
                    cerchietto
                }
            }
                else {
                    VStack {
                        Text("Discreto")
                            .font(.system(size: 12))
                        .foregroundColor(Color(.quaternaryLabel))
                        cerchietto
                    }
                }
            Spacer()
            
            if sliderValue == 0.20 {
                VStack {
                    Text("Buono")
                        .font(.system(size: 12, weight: .bold))
                    .foregroundColor(.pink)
                    cerchietto
                }
            }
                else {
                    VStack {
                        Text("Buono")
                            .font(.system(size: 12))
                        .foregroundColor(Color(.quaternaryLabel))
                        cerchietto
                    }
                }
            }
        .padding(.horizontal, 20)
        // Finish HSTACK
        } // Finish Quality Indicator View
        
    
    // MARK: - RULER VIEW
    var ruler: some View {
        HStack {
            Rectangle()
                .fill(Color(.gray))
                .frame(width: 1, height: 10)
        }
        
    } // Finish ruler view
    
    // MARK: - CIRCLE VIEW
    var cerchietto: some View {
      
            Image(systemName: "circle.fill")
                .resizable()
                .frame(width: 4, height: 4)
                .foregroundColor(.gray)
        
    }
    // finish circle view
}


 struct SliderProvaComponentView_Previews: PreviewProvider {
     static var previews: some View {
         SliderProvaComponentView(sliderValueBinding: .constant(-0.20), arc: -0.20...0.20, istep: 0.10, sliderValue: 0.10, colorComponent: "ColorPinkBright")
     }
 }
 
