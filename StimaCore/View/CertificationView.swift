//
//  CertificationView.swift
//  StimaCore
//
//  Created by salvatore dessena on 16/03/22.
//

import SwiftUI

struct CertificationView: View {
    // MARK: - PROPERTIES
    
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var viewContext
    
    @ObservedObject var item: Item
    
    @State private var metodoSismico = 0
    
    
    var body: some View {
        VStack {
            VStack {
               PageTextComponentView(testo: "Certificazioni")
                
                    .overlay(
                        VStack {
                            Button(action:
                                    {self.presentationMode.wrappedValue.dismiss()
                                    playSound(sound: "sound-tap", type: "mp3")
                            }
                                   , label: {
                                DismissButtonComponent()
                            })
                            
                            Spacer()
                        } //: VSTACK DISMISS BUTTON OVERLAY
                    )
                
                List {
                    Section(header: Text("Certificazione energetica")) {
                        SliderEnergyComponentView(percentDescriptionText: "Incidenza corrispondente:", sliderValueBinding: $item.thermoValue, arc: -4.0...5.0, istep: 1.0, sliderValue: item.thermoValue, colorComponent: "ColorPinkDark")
                    } //: SECTION THERMO
                    
                    Section(header: Text("Certificazione sismica")) {
                        VStack (spacing: 10) {
                            Picker("Calcolo", selection: $metodoSismico) {
                                Text("Metodo Convenzionale").tag(0)
                                Text("Metodo Semplificato").tag(1)
                            } .pickerStyle(.segmented)
                            
                            HStack {
                        if metodoSismico == 0 {
                            Text("Strutture intelaiate")
                                .font(.caption)
                                .foregroundColor(Color.pink)
                        } else {
                            Text("Edifici in muratura")
                                .font(.caption)
                                .foregroundColor(Color.pink)
                        }
                    }
                            Divider()
        
                            SliderSismaComponent(percentDescriptionText: "Incidenza corrispondente", sliderValueBinding: $item.sismaValueConv, arc: 0.0...3.5, istep: 0.5, sliderValue: item.sismaValueConv, colorComponent: "ColorPinkDark")
                        }
                    } //: SECTION SISMICA
                    
                    Section(header: Text("Barriere Architettoniche")) {
                        SliderBarrierComponent(percentDescriptionText: "Incidenza corrispondente", sliderValueBinding: $item.barrierValue, arc: 0.00...1.5, istep: 0.5, sliderValue: item.barrierValue, colorComponent: "ColorPinkDark")
                    } //: SECTION BARRIERE
                } //: LIST

            VStack {
                Text("Valore Certificazioni".uppercased())
                    .font(.system(size: 16, weight: .bold))
                Text("Scostamento dal valore di Posizione")
                    .font(.footnote)
                    .foregroundColor(Color.gray)
                Text("€. \(item.valoreCertThermo + item.totSismaConv + item.totBarrier, specifier: "%.2f")")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(Color("ColorPinkDark"))
                    .padding(.top, 10)
                }
            } //: VSTACK
            .background(Color("ColorGrayLight"))
        }
    } //: VSTACK
}


/*
struct CertificationView_Previews: PreviewProvider {
    static var previews: some View {
        CertificationView(item: Item())
    }
}
 */
