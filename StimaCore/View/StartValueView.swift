//
//  StartValueView.swift
//  StimaCore
//
//  Created by salvatore dessena on 20/02/22.
//

import SwiftUI

struct StartValueView: View {
    // MARK: - PROPERTIES
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    @Environment(\.presentationMode) var presentationMode
    
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject var item: Item
    
    var body: some View {
       
        VStack  {
            VStack {
                PageTextComponentView(testo: "Dati in ingresso")
                
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
                } //: VSTACK DISMISS BUTTON OVERLAY
            )

            List {
                Section(header: Text("Superfici")) {

                    StepperComponent(surfaceIndication: "Superficie residenziale", colorSelection: "ColorPinkBright", range: 0...500, step: 1, stepperBindingValue: $item.superficie, stepperValue: item.superficie, measureIndication: "Mq.")
                    
                    StepperComponent(surfaceIndication: "Corti, logge, verande e SNR", colorSelection: "ColorPinkBright", range: 0...500, step: 1, stepperBindingValue: $item.snr, stepperValue: item.snr, measureIndication: "Mq.")
                    
                    StepperComponent(surfaceIndication: "Seminterrati e cantine", colorSelection: "ColorPinkBright", range: 0...500, step: 1, stepperBindingValue: $item.cellar, stepperValue: item.cellar, measureIndication: "Mq.")
                    
                    StepperComponent(surfaceIndication: "Lotto, pertinenze e spazi aperti ", colorSelection: "ColorPinkBright", range: 0...500, step: 1, stepperBindingValue: $item.plot, stepperValue: item.plot, measureIndication: "Mq.")
                    
            }
                Section(header: Text("Costo al Mq.")) {
                    
                    StepperComponent( surfaceIndication: "Valore di mercato per:  \(item.comune ?? "-")", colorSelection: "ColorPinkBright", range: 0...10000, step: 50, stepperBindingValue: $item.costoMq, stepperValue: item.costoMq, measureIndication: "€/mq.")
            }
        }
            .padding(.top, 10)
            
                VStack {
                    Text("Valore di Partenza".uppercased())
                        .font(.system(size: 16, weight: .bold))
                    Text("Riferito alle quotazioni di mercato")
                        .font(.footnote)
                        .foregroundColor(Color.gray)
                    Text("€. \(item.valoreDiMercato, specifier: "%.2f")")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(Color("ColorPinkMedium"))
                        .padding(.top, 8)
                }
                .padding()
        } //: VSTACK
        } //: VSTACK TITOLO SHEET
        
            .background (
                Color("ColorGrayLight")
            )
    }
}

/*
 
 struct StartValueView_Previews: PreviewProvider {
     static var previews: some View {
         StartValueView(item: Item())
     }
  }
 
 */

