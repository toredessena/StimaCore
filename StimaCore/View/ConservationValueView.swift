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
                        } //: VSTACK
                    )
                // END OF  DISMISS BUTTON
                
           // MARK: - LIST OF COMPONENTS
                List {
                    // MARK: - MURATURE
                    Section(header: Text("Qualità delle murature")) {
                            SliderNewComponentView(
                            sliderValueBinding: $item.structValue,
                            arc: -0.50...0.50,
                            istep: 0.05,
                            sliderValue: item.structValue,
                            colorComponent: "ColorPinkBright")
                    }
                    //: END OF SECTION MURATURE
                    
                // MARK: - SOLAI
                Section(header: Text("Qualità dei solai")) {
                    SliderNewComponentView (
                    sliderValueBinding: $item.roofValue,
                    arc: -0.50...0.50,
                    istep: 0.05,
                    sliderValue: item.roofValue,
                    colorComponent: "ColorPinkBright")
                    } //: SECTION
                    
                // MARK: - INFISSI
                Section(header: Text("Qualità degli infissi")) {
                    SliderNewComponentView(
                    sliderValueBinding: $item.windowsValue,
                    arc: -0.50...0.50,
                    istep: 0.05,
                    sliderValue: item.windowsValue,
                    colorComponent: "ColorPinkBright")
                    } //: END OF SECTION INFISSI
                    
                // MARK: - INTONACI
                Section(header: Text("Qualità di intonaci e tinte")) {
                    SliderNewComponentView(
                    sliderValueBinding: $item.plastersValue,
                    arc: -0.50...0.50,
                    istep: 0.05,
                    sliderValue: item.plastersValue,
                    colorComponent: "ColorPinkBright")
                    } //: SECTION

                // MARK: - IMPIANTI
                Section(header: Text("Qualità degli impianti")) {
                    SliderNewComponentView(
                    sliderValueBinding: $item.installationsValue,
                    arc: -0.50...0.50,
                    istep: 0.05,
                    sliderValue: item.installationsValue,
                    colorComponent: "ColorPinkBright")
                    } //: SECTION

                // MARK: - Pavimenti e rivestimenti
                Section(header: Text("Qualità di pavimenti e rivestimenti")) {
                    SliderNewComponentView(
                    sliderValueBinding: $item.floorsValue,
                    arc: -0.50...0.50,
                    istep: 0.05,
                    sliderValue: item.floorsValue,
                    colorComponent: "ColorPinkBright")
                    } //: SECTION
                }
                // END OF LIST OF COMPONENTS
                
                // MARK: - REPORT OF COMPONENTS
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
                .padding()
                // END OF VSTACK REPORT OF COMPONENTS
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
 

