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
                Section(header: Text("Ubicazione")) {
                    Picker("seleziona", selection: $item.ubicazioneValue ) {
                        Text("E").tag(-0.20)
                        Text("C").tag(-0.10)
                        Text("C-B").tag(0.00)
                        Text("B").tag(0.10)
                        Text("A-F").tag(0.20)
                    }.pickerStyle(.segmented)
                    
                    VStack {
                        HStack {
                                Text("Incidenza:")
                                Spacer()
                                Text("\(item.ubicazioneValue * 100, specifier: "%.0f")%")
                                                   .bold()
                                }
                        Spacer(minLength: 4)
                        HStack {
                            Text("Tipologia:")
                            Spacer()
                            switch item.ubicazioneValue {
                            case -0.20:
                            Text("Aree non urbanizzate")
                            case -0.10:
                            Text("Espansioni incomplete")
                            case 0.00:
                            Text("Espansioni urbanizzate")
                            case 0.10:
                            Text("Aree di completamento")
                            case 0.20:
                            Text("Aree di pregio")
                            default:
                            Text("No")
                            }
                        }
                           
                    }
                    .padding(.vertical, 8)
                   
                }
                  
                    // MARK: -  ESPOSIZIONE
                   
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
