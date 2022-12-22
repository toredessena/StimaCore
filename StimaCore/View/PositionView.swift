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
                // MARK: -  UBICAZIONE con slider
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
                
                // MARK: - UBICAZIONE PICKER
                Section(header: Text("Ubicazione")) {
                    Picker("", selection: $item.ubicazioneValue ) {
                        Image(systemName: "e.circle").tag(-0.10)
                        Image(systemName: "c.circle").tag(-0.05)
                        Image(systemName: "b.circle").tag(0.00)
                        Image(systemName: "a.circle").tag(0.05)
                        Image(systemName: "f.circle").tag(0.10)
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
                            case -0.10:
                            Text("Aree agricole, non urbanizzate, al di fuori dei centri abitati")
                                    .font(.system(size: 12, weight: .bold))
                                    .foregroundColor(.gray)
                                    .multilineTextAlignment(.trailing)
                                    .lineLimit(3)
                            case -0.05:
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
                            case 0.05:
                                Text("Aree di pregio in contesti residenziali storici")
                                        .font(.system(size: 12, weight: .bold))
                                        .foregroundColor(.gray)
                                        .multilineTextAlignment(.trailing)
                                        .lineLimit(3)
                            case 0.10:
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
                  
                // MARK: - ESPOSIZIONE
                
                Section(header: Text("Esposizione")) {
                    Picker("", selection: $item.esposizioneValue ) {
                        Image(systemName: "moonphase.new.moon").tag(-0.10)
                        Image(systemName: "moonphase.waning.crescent").tag(-0.05)
                        Image(systemName: "moonphase.last.quarter").tag(0.00)
                        Image(systemName: "moonphase.waxing.crescent.inverse").tag(0.05)
                        Image(systemName: "moonphase.full.moon").tag(0.10)
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
                            case -0.10:
                            Text("Insolazione scarsa, ambienti eccessivamente esposti")
                                    .font(.system(size: 12, weight: .bold))
                                    .foregroundColor(.gray)
                                    .multilineTextAlignment(.trailing)
                                    .lineLimit(3)
                            case -0.05:
                                Text("Insolazione non sufficiente e riparazione non ottimale")
                                        .font(.system(size: 12, weight: .bold))
                                        .foregroundColor(.gray)
                                        .multilineTextAlignment(.trailing)
                                        .lineLimit(3)
                            case 0.00:
                                Text("Insolazione sufficiente, ambienti riparati dai venti dominanti")
                                        .font(.system(size: 12, weight: .bold))
                                        .foregroundColor(.gray)
                                        .multilineTextAlignment(.trailing)
                                        .lineLimit(3)
                            case 0.05:
                                Text("Discreta insolazione: ambienti riparati da verande e logge")
                                        .font(.system(size: 12, weight: .bold))
                                        .foregroundColor(.gray)
                                        .multilineTextAlignment(.trailing)
                                        .lineLimit(3)
                            case 0.10:
                            Text("Buona insolazione, schermature e logge sui lati nord e ovest")
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
                    
                // MARK: - ACCESSIBILITA
               
                
                Section(header: Text("Accessibilità")) {
                    Picker("", selection: $item.accessibilitaValue ) {
                        Image(systemName: "1.circle").tag(-0.10)
                        Image(systemName: "2.circle").tag(-0.05)
                        Image(systemName: "3.circle").tag(0.00)
                        Image(systemName: "4.circle").tag(0.05)
                        Image(systemName: "5.circle").tag(0.10)
                    }.pickerStyle(.segmented)
                       
                    VStack {
                        HStack {
                                Text("Incidenza:")
                                .foregroundColor(Color("ColorPinkBright"))
                                Spacer()
                                Text("\(item.accessibilitaValue * 100, specifier: "%.0f")%")
                                                   .bold()
                                }
                        Spacer(minLength: 4)
                        HStack(alignment: .top) {
                            Text("Tipologia:")
                                .foregroundColor(Color("ColorPinkBright"))
                            Spacer()
                            switch item.accessibilitaValue {
                            case -0.10:
                            Text("Ridotta accessibilità: viabilità angusta, assenza di parcheggi")
                                    .font(.system(size: 12, weight: .bold))
                                    .foregroundColor(.gray)
                                    .multilineTextAlignment(.trailing)
                                    .lineLimit(3)
                            case -0.05:
                                Text("Accessibilità ridotta: viabilità accettabile con pochi parcheggi")
                                        .font(.system(size: 12, weight: .bold))
                                        .foregroundColor(.gray)
                                        .multilineTextAlignment(.trailing)
                                        .lineLimit(3)
                            case 0.00:
                                Text("Accessibilità ordinaria: viabilità ordinaria con parcheggi")
                                        .font(.system(size: 12, weight: .bold))
                                        .foregroundColor(.gray)
                                        .multilineTextAlignment(.trailing)
                                        .lineLimit(3)
                            case 0.05:
                                Text("Accessibilità discreta: buona dotazione viaria e di parcheggi")
                                        .font(.system(size: 12, weight: .bold))
                                        .foregroundColor(.gray)
                                        .multilineTextAlignment(.trailing)
                                        .lineLimit(3)
                            case 0.10:
                            Text("Accessibilità buona: strade ampie e parcheggi abbondanti")
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
                
                // MARK: - TRASFORMABILITA
                
                Section(header: Text("Trasformabilità")) {
                    Picker("", selection: $item.trasformabilitaValue ) {
                        Image(systemName: "smallcircle.filled.circle").tag(-0.10)
                        Image(systemName: "circle.grid.2x2.fill").tag(-0.05)
                        Image(systemName: "circle.grid.3x3.fill").tag(0.00)
                        Image(systemName: "circle.hexagonpath.fill").tag(0.05)
                        Image(systemName: "circle.hexagongrid.fill").tag(0.10)
                    }.pickerStyle(.segmented)
                       
                    VStack {
                        HStack {
                                Text("Incidenza:")
                                .foregroundColor(Color("ColorPinkBright"))
                                Spacer()
                                Text("\(item.trasformabilitaValue * 100, specifier: "%.0f")%")
                                                   .bold()
                                }
                        Spacer(minLength: 4)
                        HStack(alignment: .top) {
                            Text("Tipologia:")
                                .foregroundColor(Color("ColorPinkBright"))
                            Spacer()
                            switch item.trasformabilitaValue {
                            case -0.10:
                            Text("Pianta bloccata, forti vincoli strutturali e distributivi")
                                    .font(.system(size: 12, weight: .bold))
                                    .foregroundColor(.gray)
                                    .multilineTextAlignment(.trailing)
                                    .lineLimit(3)
                            case -0.05:
                                Text("Pianta bloccata, possibilità di lievi modifiche alla distribuzione")
                                        .font(.system(size: 12, weight: .bold))
                                        .foregroundColor(.gray)
                                        .multilineTextAlignment(.trailing)
                                        .lineLimit(3)
                            case 0.00:
                                Text("Pianta moderatamente flessibile, possibili modifiche alla distribuzione")
                                        .font(.system(size: 12, weight: .bold))
                                        .foregroundColor(.gray)
                                        .multilineTextAlignment(.trailing)
                                        .lineLimit(3)
                            case 0.05:
                                Text("Pianta flessibile, possibili consistenti modifiche alla distribuzione")
                                        .font(.system(size: 12, weight: .bold))
                                        .foregroundColor(.gray)
                                        .multilineTextAlignment(.trailing)
                                        .lineLimit(3)
                            case 0.10:
                            Text("Flessibilità totale, possibilità di qualunque modifica alla distribuzione")
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
