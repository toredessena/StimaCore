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
                    Picker("", selection: $item.ubicazioneValue ) {
                        Image(systemName: "e.circle").tag(-0.20)
                        Image(systemName: "c.circle").tag(-0.10)
                        Image(systemName: "b.circle").tag(0.00)
                        Image(systemName: "a.circle").tag(0.10)
                        Image(systemName: "f.circle").tag(0.20)
                    }.pickerStyle(.segmented)
                       
                    VStack {
                        HStack {
                                Text("Incidenza:")
                                .foregroundColor(Color("ColorPinkBright"))
                                Spacer()
                                Text("\(item.ubicazioneValue * 100, specifier: "%.0f")%")
                                                   .bold()
                                }
                        Spacer(minLength: 4)
                        HStack(alignment: .top) {
                            Text("Tipologia:")
                                .foregroundColor(Color("ColorPinkBright"))
                            Spacer()
                            switch item.ubicazioneValue {
                            case -0.20:
                            Text("Aree agricole, non urbanizzate, al di fuori dei centri abitati")
                                    .font(.system(size: 12, weight: .bold))
                                    .foregroundColor(.gray)
                                    .multilineTextAlignment(.trailing)
                                    .lineLimit(3)
                            case -0.10:
                                Text("Espansioni recenti, contigue al nucleo urbano consolidato")
                                        .font(.system(size: 12, weight: .bold))
                                        .foregroundColor(.gray)
                                        .multilineTextAlignment(.trailing)
                                        .lineLimit(3)
                            case 0.00:
                                Text("Espansioni e completamenti a ridosso dei centri storici")
                                        .font(.system(size: 12, weight: .bold))
                                        .foregroundColor(.gray)
                                        .multilineTextAlignment(.trailing)
                                        .lineLimit(3)
                            case 0.10:
                                Text("Aree di pregio in contesti residenziali storici")
                                        .font(.system(size: 12, weight: .bold))
                                        .foregroundColor(.gray)
                                        .multilineTextAlignment(.trailing)
                                        .lineLimit(3)
                            case 0.20:
                            Text("Contesti di lusso in aree turistiche di pregio")
                                    .font(.system(size: 12, weight: .bold))
                                    .foregroundColor(.gray)
                                    .multilineTextAlignment(.trailing)
                                    .lineLimit(3)
                            default:
                            Text("No")
                            }
                        }
                           
                    }
                    .padding(.vertical, 8)
                   
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
                // MARK: PROVA ESPOSIZIONE
                Section(header: Text("Esposizione")) {
                    Picker("", selection: $item.esposizioneValue ) {
                        Image(systemName: "moonphase.new.moon").tag(-0.20)
                        Image(systemName: "moonphase.waning.crescent").tag(-0.10)
                        Image(systemName: "moonphase.last.quarter").tag(0.00)
                        Image(systemName: "moonphase.waxing.crescent.inverse").tag(0.10)
                        Image(systemName: "moonphase.full.moon").tag(0.20)
                    }.pickerStyle(.segmented)
                       
                    VStack {
                        HStack {
                                Text("Incidenza:")
                                .foregroundColor(Color("ColorPinkBright"))
                                Spacer()
                                Text("\(item.esposizioneValue * 100, specifier: "%.0f")%")
                                                   .bold()
                                }
                        Spacer(minLength: 4)
                        HStack(alignment: .top) {
                            Text("Tipologia:")
                                .foregroundColor(Color("ColorPinkBright"))
                            Spacer()
                            switch item.esposizioneValue {
                            case -0.20:
                            Text("Livello 0")
                                    .font(.system(size: 12, weight: .bold))
                                    .foregroundColor(.gray)
                                    .multilineTextAlignment(.trailing)
                                    .lineLimit(3)
                            case -0.10:
                                Text("Livello 1")
                                        .font(.system(size: 12, weight: .bold))
                                        .foregroundColor(.gray)
                                        .multilineTextAlignment(.trailing)
                                        .lineLimit(3)
                            case 0.00:
                                Text("Livello 2")
                                        .font(.system(size: 12, weight: .bold))
                                        .foregroundColor(.gray)
                                        .multilineTextAlignment(.trailing)
                                        .lineLimit(3)
                            case 0.10:
                                Text("Livello 3")
                                        .font(.system(size: 12, weight: .bold))
                                        .foregroundColor(.gray)
                                        .multilineTextAlignment(.trailing)
                                        .lineLimit(3)
                            case 0.20:
                            Text("Livello 4")
                                    .font(.system(size: 12, weight: .bold))
                                    .foregroundColor(.gray)
                                    .multilineTextAlignment(.trailing)
                                    .lineLimit(3)
                            default:
                            Text("No")
                            }
                        }
                           
                    }
                    .padding(.vertical, 8)
                   
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
