//
//  ReportViewTwo.swift
//  StimaCore
//
//  Created by salvatore dessena on 08/04/22.
//

import SwiftUI
import UniformTypeIdentifiers

struct ReportViewTwo: View {
    
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var viewContext
    
    @ObservedObject var item: Item

    @State private var document: MessageDocument = MessageDocument(message: "Hello, World!")
    @State private var isExporting: Bool = false
    
    var body: some View {
        VStack {
            VStack {
                PageTextComponentView(testo: "Relazione di stima per \(item.title ?? "Relazione")")
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
                Divider()
             
                Text("Il valore di stima finale per l'immobile denominato \(item.title ?? "Boh") ammonta a:\n€ \(item.valoreFinale, specifier: "%.2f").\nPuoi ancora modificare il valore ottenuto tornando ai selettori di calcolo dei parametri.")
                    .font(.system(size: 18, weight: .heavy))
                    .lineSpacing(10)
                    .foregroundColor(Color("ColorPinkBright"))
                    .padding()
                    .background(Color("ColorGrayLight"))
                    .cornerRadius(8)
                Spacer()
                    Button(action: {
                                transform()
                                isExporting.toggle()
                            }, label: {
                                ButtonComponent(color: "ColorPinkBright", text: "Genera relazione", textColor: "ColorWhite")
                            })
                                .fileExporter(
                                    isPresented: $isExporting,
                                    document: document,
                                    contentType: UTType.plainText,
                                    defaultFilename: "Relazione di stima \(item.title ?? "Relazione")"
                                ) { result in
                                    if case .success = result {
                                        Swift.print("Success!")
                                    } else {
                                        Swift.print("Something went wrong…")
                            }
                        }
                } //: VSTACK
            .padding()
        }
    }
    private func transform()  {
        document.message = item.stringa
        
    }
}

/*

struct ReportViewTwo_Previews: PreviewProvider {
    static var previews: some View {
        ReportViewTwo()
    }
}
 
 */
