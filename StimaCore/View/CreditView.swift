//
//  CreditView.swift
//  StimaCore
//
//  Created by salvatore dessena on 27/08/22.
//

import SwiftUI

struct CreditView: View {
    
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.openURL) var openURL
    
    var body: some View {
        
        VStack {
            VStack {
                PageTextComponentView(testo: "Credits")
                    .overlay(
                        VStack {
                            Button(action: {
                                self.presentationMode.wrappedValue.dismiss()
                                playSound(sound: "sound-tap", type: "mp3")
                            }
                                   , label: {
                                DismissButtonComponent()
                            })
                            .padding(.bottom, 20)
                            Spacer()
                        })
                List {
                    CreditsComponentView(title: "Nome", content: "StimaCore")
                    CreditsComponentView(title: "Compatibilità", content: "iPhone - iPad")
                    CreditsComponentView(title: "Developer", content: "Salvatore Dessena")
                    CreditsComponentView(title: "Design", content: "Salvatore Dessena")
                    CreditsComponentView(title: "Versione", content: "1.0")
                    
                    HStack {
                        Text("Privacy")
                            .foregroundColor(.pink)
                        Spacer()
                        Button ("Vai al sito") {
                            openURL(URL(string: "https://www.stimacore.com")!)
                        }
                    }.padding(10)
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20.00, style: .circular)
                                   .frame(width: 140, height: 140)
                                   .foregroundColor(Color("ColorPinkBright"))
                    Image("logo-small")
                        
                }
                
            } // VSTACK
        } // VSTACK
        
        .background (
            Color("ColorGrayLight")
        )
    }
}

struct CreditView_Previews: PreviewProvider {
    static var previews: some View {
        CreditView()
    }
}
