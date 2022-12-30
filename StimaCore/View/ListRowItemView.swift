//
//  ListRowItemView.swift
//  StimaCore
//
//  Created by salvatore dessena on 19/02/22.
//

import SwiftUI

struct ListRowItemView: View {
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject var item: Item
    
    var body: some View {
        Toggle(isOn: $item.completion) {
            VStack (alignment: .leading, spacing: 8) {
               
                // TITOLO STIMA
                Text(item.title?.uppercased() ?? "")
                    .font(.system(.headline))
                    .fontWeight(.heavy)
                    .foregroundColor(item.completion ? Color.pink : Color.primary)
                    .padding(.top, 4)
                    .padding(.leading, 8)
                
                  // VALORE STIMA
                Text("€. \(item.valoreFinale, specifier: "%.2f")")
                    .font(.system(.headline))
                    .fontWeight(.regular)
                    .foregroundColor(item.completion ? Color.pink : Color.primary)
                    .padding(.leading, 8)
                
                // DATA CREAZIONE ITEM
                Text("Creata: \(item.timestamp ?? Date(), style: .date)")
                    .font(.footnote)
                    .foregroundColor(Color.gray)
                    .padding(.leading, 8)
            }
        } //: TOGGLE
        .toggleStyle(CheckboxStyle())
        .onReceive(item.objectWillChange, perform: { _ in
            if self.viewContext.hasChanges {
                try? self.viewContext.save()
            }
        })
    }
}


