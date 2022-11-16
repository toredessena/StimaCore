//
//  ConservationValueView.swift
//  StimaCore
//
//  Created by salvatore dessena on 25/02/22.
//

import SwiftUI

struct ConservationValueView: View {
    
// MARK: - PROPERTIES
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject var item: Item
    
    var body: some View {
        VStack {
            VStack {
               PageTextComponentView(testo: "Qualità dei Componenti")
                
                // MARK: - DISMISS BUTTON
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
                    
                    // MARK: - MURATURE PROVA
                    Section(header: Text("Murature")) {
                            SliderProvaComponentView(
                            
                            sliderValueBinding: $item.structValue,
                            arc: -0.20...0.20,
                            istep: 0.01,
                            sliderValue: item.structValue,
                            colorComponent: "ColorPinkBright"
                           )
                    }
                    //: SECTION
                    
                // MARK: - MURATURE
                Section(header: Text("Murature")) {
                        SliderConservationComponent(
                        
                        sliderValueBinding: $item.structValue,
                        arc: -0.20...0.20,
                        istep: 0.10,
                        sliderValue: item.structValue,
                        colorComponent: "ColorPinkBright",
                        qualityDescriptionText: "Qualità delle murature")
                    
                } //: SECTION
                
                // MARK: - SOLAI
                Section(header: Text("Solai")) {
                    SliderConservationComponent(
                   
                    sliderValueBinding: $item.roofValue,
                    arc: -0.20...0.20,
                    istep: 0.10,
                    sliderValue: item.roofValue,
                    colorComponent: "ColorPinkBright",
                    qualityDescriptionText: "Qualità dei solai")
                    } //: SECTION
                    
                // MARK: - INFISSI
                Section(header: Text("Infissi")) {
                    SliderConservationComponent(
                 
                    sliderValueBinding: $item.windowsValue,
                    arc: -0.20...0.20,
                    istep: 0.10,
                    sliderValue: item.windowsValue,
                    colorComponent: "ColorPinkBright",
                    qualityDescriptionText: "Qualità degli infissi")
                    } //: SECTION
                // MARK: - INTONACI
                Section(header: Text("Intonaci e tinte")) {
                    SliderConservationComponent(
                  
                    sliderValueBinding: $item.plastersValue,
                    arc: -0.20...0.20,
                    istep: 0.10,
                    sliderValue: item.plastersValue,
                    colorComponent: "ColorPinkBright",
                    qualityDescriptionText: "Qualità degli intonaci")
                    } //: SECTION

                // MARK: - IMPIANTI
                Section(header: Text("Impianti")) {
                    SliderConservationComponent(
                
                    sliderValueBinding: $item.installationsValue,
                    arc: -0.20...0.20,
                    istep: 0.10,
                    sliderValue: item.installationsValue,
                    colorComponent: "ColorPinkBright",
                    qualityDescriptionText: "Qualità degli impianti")
                    } //: SECTION

                // MARK: - Pavimenti e rivestimenti
                Section(header: Text("Pavimenti e rivestimenti")) {
                    SliderConservationComponent(
                   
                    sliderValueBinding: $item.floorsValue,
                    arc: -0.20...0.20,
                    istep: 0.10,
                    sliderValue: item.floorsValue,
                    colorComponent: "ColorPinkBright",
                    qualityDescriptionText: "Qualità dei rivestimenti")
                    } //: SECTION
                }
                
                VStack {
                    Text("Valore di Conservazione".uppercased())
                        .font(.system(size: 16, weight: .bold))
                    Text("Scostamento dal valore di mercato")
                        .font(.footnote)
                        .foregroundColor(Color.gray)
                    Text("€. \(item.valoreDiConservazione - item.valoreDiMercato, specifier: "%.2f")")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(Color("ColorPinkBright"))
                        .padding(.top, 10)
                }
            }
        }
        .background(Color("ColorGrayLight"))
    }
}

/*
struct ConservationValueView_Previews: PreviewProvider {
    static var previews: some View {
        ConservationValueView(item: Item())
    }
}
 */
 

