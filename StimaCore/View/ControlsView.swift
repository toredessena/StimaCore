//
//  ControlsView.swift
//  StimaCore
//
//  Created by salvatore dessena on 12/03/22.
//

import SwiftUI

struct ControlsView: View {
    
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject var item: Item
    
    @State private var showModalOne: Bool = false
    @State private var showModalTwo: Bool = false
    @State private var showModalThree: Bool = false
    @State private var showModalFour: Bool = false
    @State private var showModalFive: Bool = false
    @State private var showModalSix: Bool = false

    @State private var isPresented: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            ScrollView {
                PageTextComponentView(testo: "Parametri base")
                
                // MARK: - MODAL VALORE DI INGRESSO
                ButtonComponent(color: "ColorPinkBright", text: "Dati", textColor: "ColorWhite")
                    .onTapGesture {
                        self.showModalOne = true
                    }
                    .sheet(isPresented: $showModalOne) {
                    StartValueView(item: item)
                    }
              
                // MARK: - MODAL VALORE DI CONSERVAZIONE
                ButtonComponent(color: "ColorPinkBright", text: "Qualità dei Componenti", textColor: "ColorWhite")
                .onTapGesture {
                self.showModalTwo = true
                }
                .sheet(isPresented: $showModalTwo) {
                    ConservationValueView(item: item)
                }
               
                // MARK: - MODAL VALORE DI POSIZIONE
                ButtonComponent(color: "ColorPinkBright", text: "Contesto", textColor: "ColorWhite")
                    .onTapGesture {
                    self.showModalThree = true
                }
                .sheet(isPresented: $showModalThree) {
                PositionView(item: item)
                }

                Divider()
                    Text("Altri parametri")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(Color("ColorPinkBright"))
                
                VStack {
                    Toggle(isOn: $isPresented, label: {
                        Text("Assegna Certificazioni")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(Color.gray)
                    })
                        .toggleStyle(SwitchToggleStyle(tint: .pink))
                        .padding()
    
                    if isPresented == true {
                        ButtonComponent(color: "ColorPinkBright", text: "Certificazioni", textColor: "ColorWhite")
                            .onTapGesture {
                                self.showModalFour = true
                            }
                            .sheet(isPresented: $showModalFour) {
                                CertificationView(item: item)
                            }
                    }
                    
                    ButtonComponent(color: "ColorPinkBright", text: "Relazione", textColor: "ColorWhite")
                        .onTapGesture {
                            self.showModalFive = true
                        }
                        .sheet(isPresented: $showModalFive) {
                            ReportViewTwo(item: item)
                        }
                    Divider()
                    ButtonComponent(color: "ColorGrayLight", text: "Credits", textColor: "ColorPinkBright")
                        .onTapGesture {
                            self.showModalSix = true
                        }
                        .sheet(isPresented: $showModalSix) {
                            CreditView()
                        }
                    
                }
            } //:   SCROLL
            .padding(.horizontal, 20)
            .padding(.bottom, 8)
            } //: VSTACK
        .background(Color("ColorGrayLight"))
        .navigationTitle("Stima")
        }
    }
    

/*
struct ControlsView_Previews: PreviewProvider {
    static var previews: some View {
        ControlsView()
    }
}
*/
