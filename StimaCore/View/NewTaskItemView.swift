//
//  NewTaskItemView.swift
//  StimaCore
//
//  Created by salvatore dessena on 19/02/22.
//

import SwiftUI

struct NewTaskItemView: View {
    // MARK: - PROPERTIES
    
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    @Environment(\.managedObjectContext) private var viewContext
    
    // Provvisorie
    @State private var showModal: Bool = false
    @State private var isPresented: Bool = false
    
    @Environment(\.presentationMode) var presentationMode
   
    @State private var title: String = ""
    @State private var via: String = ""
    @State private var comune: String = ""
    @State private var foglio: String = ""
    @State private var mappale: String = ""
    @State private var sub: String = ""
    @State private var nome: String = ""
    @State private var order: String = ""
    @State private var provincia: String = ""
    @State private var numeroIscrizione: String = ""
    @State private var indirizzoTecnico: String = ""
    
    @Binding var isShowing: Bool
    
    private var isButtonDisabled: Bool {
        title.isEmpty || via.isEmpty || comune.isEmpty
    }
    
    // MARK: - FUNCTION
    // ADD
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.title = title
            newItem.via = via
            newItem.comune = comune
            newItem.foglio = foglio
            newItem.mappale = mappale
            newItem.sub = sub
            newItem.nome = nome
            newItem.order = order
            newItem.provincia = provincia
            newItem.numeroIscrizione = numeroIscrizione
            newItem.indirizzoTecnico = indirizzoTecnico
          
            newItem.timestamp = Date()
            newItem.completion = false
            newItem.id = UUID()
            
            // SUPERFICI IMMOBILE
            newItem.superficie = 0.00
            newItem.snr = 0.00
            newItem.cellar = 0.00
            newItem.plot = 0.00
            
            // COSTO DEL NUOVO
            newItem.costoMq = 0.00
            
            //CONSERVAZIONE
            newItem.structValue = 0.00
            newItem.roofValue = 0.00
            newItem.windowsValue = 0.00
            newItem.plastersValue = 0.00
            newItem.installationsValue = 0.00
            newItem.floorsValue = 0.00
            
            // POSIZONE
            newItem.accessibilitaValue = 0.00
            newItem.ubicazioneValue = 0.00
            newItem.esposizioneValue = 0.00
            newItem.trasformabilitaValue = 0.00
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
            title = ""
            via = ""
            comune = ""
            foglio = ""
            mappale = ""
            sub = ""
            nome = ""
            order = ""
            provincia = ""
            numeroIscrizione = ""
            indirizzoTecnico = ""
            hideKeyboard()
            isShowing = false
        }
    }
    
    // MARK: - BODY
    var body: some View {

        VStack {
            Spacer()
            VStack (spacing: 16){
                Text("Dati generali di stima")
                    .foregroundColor(Color("ColorPinkBright"))
                    .font(.system(size: 16, weight: .bold))

                ScrollView {
                    Group {
                        TextField("Nome immobile...", text: $title)
                            .foregroundColor(.pink)
                            .font(.system(size: 16, weight: .bold))
                            .padding()
                            .background(
                                isDarkMode ? Color(UIColor.tertiarySystemBackground) : Color(UIColor.secondarySystemBackground)
                            )
                            .cornerRadius(10)
                        
                        TextField("Via...", text: $via)
                            .foregroundColor(Color("ColorPinkBright"))
                            .font(.system(size: 16, weight: .bold))
                            .padding()
                            .background(
                                isDarkMode ? Color(UIColor.tertiarySystemBackground) : Color(UIColor.secondarySystemBackground)
                            )
                            .cornerRadius(10)
                        
                        TextField("Comune...", text: $comune)
                            .foregroundColor(Color("ColorPinkBright"))
                            .font(.system(size: 16, weight: .bold))
                            .padding()
                            .background(
                                isDarkMode ? Color(UIColor.tertiarySystemBackground) : Color(UIColor.secondarySystemBackground)
                            )
                            .cornerRadius(10)
                        
                        TextField("Foglio...", text: $foglio)
                            .foregroundColor(Color("ColorPinkBright"))
                            .font(.system(size: 16, weight: .bold))
                            .padding()
                            .background(
                                isDarkMode ? Color(UIColor.tertiarySystemBackground) : Color(UIColor.secondarySystemBackground)
                            )
                            .cornerRadius(10)
                        
                         TextField("Mappale...", text: $mappale)
                             .foregroundColor(Color("ColorPinkBright"))
                             .font(.system(size: 16, weight: .bold))
                             .padding()
                             .background(
                                 isDarkMode ? Color(UIColor.tertiarySystemBackground) : Color(UIColor.secondarySystemBackground)
                             )
                             .cornerRadius(10)
                        
                        TextField("Sub...", text: $sub)
                            .foregroundColor(Color("ColorPinkBright"))
                            .font(.system(size: 16, weight: .bold))
                            .padding()
                            .background(
                                isDarkMode ? Color(UIColor.tertiarySystemBackground) : Color(UIColor.secondarySystemBackground)
                            )
                            .cornerRadius(10)
                    }
                    
                    Group {
                        TextField("Tecnico...", text: $nome)
                            .foregroundColor(Color("ColorPinkBright"))
                            .font(.system(size: 16, weight: .bold))
                            .padding()
                            .background(
                                isDarkMode ? Color(UIColor.tertiarySystemBackground) : Color(UIColor.secondarySystemBackground)
                            )
                            .cornerRadius(10)
                        
                        TextField("Iscritto all'ordine...", text: $order)
                            .foregroundColor(Color("ColorPinkBright"))
                            .font(.system(size: 16, weight: .bold))
                            .padding()
                            .background(
                                isDarkMode ? Color(UIColor.tertiarySystemBackground) : Color(UIColor.secondarySystemBackground)
                            )
                            .cornerRadius(10)
                        
                        TextField("Provincia...", text: $provincia)
                            .foregroundColor(Color("ColorPinkBright"))
                            .font(.system(size: 16, weight: .bold))
                            .padding()
                            .background(
                                isDarkMode ? Color(UIColor.tertiarySystemBackground) : Color(UIColor.secondarySystemBackground)
                            )
                            .cornerRadius(10)
                        
                        TextField("Al numero...", text: $numeroIscrizione)
                            .foregroundColor(Color("ColorPinkBright"))
                            .font(.system(size: 16, weight: .bold))
                            .padding()
                            .background(
                                isDarkMode ? Color(UIColor.tertiarySystemBackground) : Color(UIColor.secondarySystemBackground)
                            )
                            .cornerRadius(10)
                        
                        TextField("Con studio in...", text: $indirizzoTecnico)
                            .foregroundColor(Color("ColorPinkBright"))
                            .font(.system(size: 16, weight: .bold))
                            .padding()
                            .background(
                                isDarkMode ? Color(UIColor.tertiarySystemBackground) : Color(UIColor.secondarySystemBackground)
                            )
                            .cornerRadius(10)
                    }
                }
                
                Button(action: {
                    addItem()
                }, label: {
                    Spacer()
                    Text("Crea stima")
                        .font(.system(size: 20, weight: .bold))
                    Spacer()
            })
                    .disabled(isButtonDisabled)
                    .padding()
                    .foregroundColor(Color.white)
                    .background(isButtonDisabled ? Color.gray : Color("ColorPinkBright"))
                    .cornerRadius(10)
                    
            } //: VSTACK
            .padding(.horizontal)
            .padding(.vertical, 20)
            .background(
                isDarkMode ? Color(UIColor.secondarySystemBackground) : Color.white
            )
            .cornerRadius(16)
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.2), radius: 24)
            .frame(maxWidth: 640)
        } //: VSTACK
        .padding()
    }
}

// MARK: - PREVIEW
struct NewTaskItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskItemView(isShowing: .constant(true))
            .background(Color.gray.ignoresSafeArea(.all))
    }
}
