//
//  TestView.swift
//  StimaCore
//
//  Created by salvatore dessena on 25/02/22.
//

import SwiftUI

struct PositionView: View {
    // MARK: - PROPERTIES
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject var item: Item
    
    @State var sliderValue: Double = 0.00
    
    // MARK: - BODY
    var body: some View {
        VStack {
            VStack {
               PageTextComponentView(testo: "Contesto")
                
                //: MARK: - DISMISS BUTTON
                
                .overlay(
                    VStack {
                        Button(action:
                                {self.presentationMode.wrappedValue.dismiss()
                                playSound(sound: "sound-tap", type: "mp3")
                        }
                               , label: {
                                 DismissButtonComponent()
                        })
                        
                            .padding(.bottom, 20)
                        Spacer()
                    } //: VSTACK DISMISS BUTTON
                )
                
            List {
                // MARK: -  UBICAZIONE
                /*
                Section(header: Text("Ubicazione")) {
                    SliderUbicationComponentView(
                        sliderValueBinding: $item.ubicazioneValue,
                        arc: -0.10...0.10,
                        istep: 0.05,
                        sliderValue: item.ubicazioneValue,
                        colorComponent: "ColorPinkBright",
                        qualityDescriptionText: "Tipo:"
                    )
                }
                 */
                
                // MARK: - PROVA PICKER
                Section(header: Text("askdcjhgdjh")) {
                    Picker("seleziona", selection: $item.ubicazioneValue ) {
                        Text("zone E").tag(-0.20)
                        Text("zone C").tag(-0.10)
                        Text("zone B").tag(0.00)
                        Text("zone A").tag(0.10)
                        Text("zone F").tag(0.20)
                    }.pickerStyle(.segmented)
                    Text("\(item.ubicazioneValue * 100, specifier: "%.0f")")
                    
                }
                  
                    // MARK: -  ESPOSIZIONE
                   /*
                Section(header: Text("Esposizione")) {
                        SliderExpoComponentView(
                            sliderValueBinding: $item.esposizioneValue,
                            arc: -0.10...0.10,
                            istep: 0.05,
                            sliderValue: item.esposizioneValue,
                            colorComponent: "ColorPinkBright",
                            qualityDescriptionText: "Tipo:"
                        )
                    }
                    */
                // MARK: - Accessibilità
                        Section(header: Text("Accessibilità")) {
                            SliderAccessComponentView(
                                sliderValueBinding: $item.accessibilitaValue,
                                arc: -0.10...0.10,
                                istep: 0.05,
                                sliderValue: item.accessibilitaValue,
                                colorComponent: "ColorPinkBright",
                                qualityDescriptionText: "Tipo:"
                            )
                        }
                // MARK: - Trasformabilità
                            Section(header: Text("Trasformabilità")) {
                                SliderTransformComponentView(
                                    
                                    sliderValueBinding: $item.trasformabilitaValue,
                                    arc: -0.10...0.10,
                                    istep: 0.05,
                                    sliderValue: item.trasformabilitaValue,
                                    colorComponent: "ColorPinkBright",
                                    qualityDescriptionText: "Tipo:"
                                )
                            }
                    } //: LIST
       
                VStack {
                    Text("Valore di Posizione".uppercased())
                        .font(.system(size: 16, weight: .bold))
                    Text("Scostamento dal valore di Conservazione")
                        .font(.footnote)
                        .foregroundColor(Color.gray)
                    Text("€. \(item.valoreDiPosizione - item.valoreDiConservazione, specifier: "%.2f")")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(Color("ColorPinkBright"))
                        .padding(.top, 10)
                    }
                .padding()
                }
       
            .background(Color("ColorGrayLight"))
        
        }
    }
}


/*
 
 struct PositionView_Previews: PreviewProvider {
     static var previews: some View {
         PositionView(item: Item())
     }
 }
  
 */
