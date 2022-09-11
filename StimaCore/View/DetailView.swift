//
//  DetailView.swift
//  StimaCore
//
//  Created by salvatore dessena on 19/02/22.
//

import SwiftUI

struct DetailView: View {
    
    // MARK: - PROPERTIES
    
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject var item: Item
    @State var flip: Bool = false
   
    @State private var sparisci: Bool = false
   
    // MARK: - BODY
    var body: some View {
        
            // MARK: - INFO
        VStack {
            Form {
                Section(header: Text("Dati immobile").foregroundColor(Color.pink)) {
                    
                    HStack {
                        Text("Nome:")
                            .font(.footnote)
                            .foregroundColor(Color.gray)
                        Spacer()
                        Text(item.title ?? "")
                            .font(.system(size: 16, weight: .bold))
                    }//: HSTACK
                    
                    HStack {
                        Text("Via:")
                            .font(.footnote)
                            .foregroundColor(Color.gray)
                        Spacer()
                        Text(item.via)
                            .font(.system(size: 16, weight: .bold))
                    }//: HSTACK
                   
                    HStack {
                        Text("Comune:")
                            .font(.footnote)
                            .foregroundColor(Color.gray)
                        Spacer()
                        Text(item.comune ?? "")
                            .font(.system(size: 16, weight: .bold))
                            .lineLimit(1)
                    }//: HSTACK
                } //: SECTION DATI IMMOBILE
                
                Section(header: Text("Dati Catastali").foregroundColor(Color.pink)) {
                    HStack {
                        Text("Foglio:")
                            .font(.footnote)
                            .foregroundColor(Color.gray)
                        Spacer()
                        Text(item.foglio ?? "")
                            .font(.system(size: 16, weight: .bold))
                    }//: HSTACK
                    
                    HStack {
                        Text("Mappale:")
                            .font(.footnote)
                            .foregroundColor(Color.gray)
                        Spacer()
                        Text(item.mappale ?? "")
                            .font(.system(size: 16, weight: .bold))
                    } //: HSTACK
                    
                    HStack {
                        Text("Sub:")
                            .font(.footnote)
                            .foregroundColor(Color.gray)
                        Spacer()
                        Text(item.sub ?? "")
                            .font(.system(size: 16, weight: .bold))
                    } //: HSTACK
                } //: SECTION DATI IMMOBILE
                
                Section(header: Text("Dati Finali di Stima").foregroundColor(Color.pink)) {
                    HStack {
                        Text("Superficie (ragguagliata):")
                            .font(.footnote)
                            .foregroundColor(Color.gray)
                        Spacer()
                        Text("Mq. \(item.supRagg, specifier: "%.2f")")
                            .font(.system(size: 16, weight: .bold))
                    }
                    HStack {
                        Text("Valore Immobile:")
                            .font(.footnote)
                            .foregroundColor(Color.gray)
                        Spacer()
                        Text("€. \(item.valoreFinale, specifier: "%.2f")")
                            .font(.system(size: 16, weight: .bold))
                    }
                    
                    HStack {
                        Text("Certificazione energetica:")
                            .font(.footnote)
                            .foregroundColor(Color.gray)
                        Spacer()
                            switch item.thermoValue {
                            case -4:
                                HouseComponent(letter: "g", color: "Rosso")
                            case -3:
                                HouseComponent(letter: "f", color: "Arancioscuro")
                            case -2:
                                HouseComponent(letter: "e", color: "Arancio")
                            case -1:
                                HouseComponent(letter: "d", color: "Senape")
                            case 0:
                                HouseComponent(letter: "c", color: "Giallo")
                            case 1:
                                HouseComponent(letter: "b", color: "Verdolino")
                            case 2:
                                HouseComponent(letter: "a1", color: "Smeraldo")
                            case 3:
                                HouseComponent(letter: "a2", color: "Verde")
                            case 4:
                                HouseComponent(letter: "a3", color: "Verdone1")
                            case 5:
                                HouseComponent(letter: "a4", color: "Verdone2")
                            default:
                                Text("No Class")
                            }
                        
                       
                    }
                    HStack {
                        Text("Certificazione Sismica:")
                            .font(.footnote)
                            .foregroundColor(Color.gray)
                        Spacer()
                        switch item.sismaValueConv {
                        case 0.0:
                            BadgeSismaComponent(circleColor: "Rosso", letter: "G")
                        case 0.5:
                            BadgeSismaComponent(circleColor: "Arancioscuro", letter: "F")
                        case 1.0:
                            BadgeSismaComponent(circleColor: "Arancio", letter: "E")
                        case 1.5:
                            BadgeSismaComponent(circleColor: "Giallo", letter: "D")
                        case 2.0:
                            BadgeSismaComponent(circleColor: "Verdolino", letter: "C")
                        case 2.5:
                            BadgeSismaComponent(circleColor: "Verde", letter: "B")
                        case 3.0:
                            BadgeSismaComponent(circleColor: "Verdone1", letter: "A")
                        case 3.5:
                            BadgeSismaComponent(circleColor: "Verdone2", letter: "A+")
                        default:
                            Text("No Class")
                        }
                    }
                    
                    HStack {
                        Text("Barriere architettoniche:")
                            .font(.footnote)
                            .foregroundColor(Color.gray)
                        Spacer()
                        switch item.barrierValue {
                        case 0.0:
                            BarrierBadgeComponent(color: "Grigiolino", text: "Nessuno")
                        case 0.5:
                            BarrierBadgeComponent(color: "Senape", text: "Adattabilità")
                        case 1.0:
                            BarrierBadgeComponent(color: "Arancio", text: "Visitabilità")
                        case 1.5:
                            BarrierBadgeComponent(color: "Rosso", text: "Accessibilità")
                        default:
                            Text("No Class")
                        }
                    } //: HSTACK
                } //: SECTION
            } //: FORM
            .background(Color("ColorGrayLight"))
            
            VStack {
                NavigationLink (destination: ControlsView(item: item)) {
                    if item.valoreFinale == 0 {
                        ButtonComponent(color: "ColorPinkBright", text: "Calcola stima", textColor: "ColorWhite")
                    } else {
                        ButtonComponent(color: "ColorPinkBright", text: "Riprendi stima", textColor: "ColorWhite")
                    }
                }

                Button(action: {
                    
                    item.costoMq = 0.00
                    item.snr = 0.00
                    item.cellar = 0.00
                    item.plot = 0.00
                    item.superficie = 0.00
                    
                    item.structValue = 0.00
                    item.roofValue = 0.00
                    item.windowsValue = 0.00
                    item.plastersValue = 0.00
                    item.installationsValue = 0.00
                    item.floorsValue = 0.00
                    item.accessibilitaValue = 0.00
                    item.esposizioneValue = 0.00
                    item.trasformabilitaValue = 0.00
                    item.ubicazioneValue = 0.00
                    item.thermoValue = 0.00
                    item.sismaValueConv = 0.00
                    item.barrierValue = 0.00
                    
                    }, label: {
                            if item.valoreFinale != 0 {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(lineWidth: 1)
                                        .stroke(Color("ColorPinkBright"))
                                        .frame(maxWidth: .infinity, maxHeight: 50)
                                        .foregroundColor(Color.white)
                                        .shadow(color: Color("ColorGrayLight"), radius: 8, x: 0, y: 0)
                                    Text("Reset parametri")
                                        .font(.system(size: 18, weight: .heavy))
                                        .foregroundColor(Color("ColorPinkBright"))
                                        .padding()
                                    
                                } //: ZSTACK
                                    
                            }
                          
                        })
            }
         
        .padding()

            } //: VSTACK
       
        .navigationTitle("Info")
    }
}
    



// MARK: - PREVIEW

/*
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(item: Item())
    }
}
 
 */
