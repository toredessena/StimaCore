//
//  DismissButtonComponent.swift
//  StimaCore
//
//  Created by salvatore dessena on 25/03/22.
//

import SwiftUI

struct DismissButtonComponent: View {
    @State private var isDarkMode: Bool = false
        
    var body: some View {
                Image(systemName: "chevron.down.circle.fill")
             .font(.title)
             .foregroundColor( isDarkMode ? Color("ColorWhiteMedium") : Color.white)
             .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.10), radius: 8, x: 0, y: 4)
                    .padding(.top, 12)
            }
            
           
    }


struct DismissButtonComponent_Previews: PreviewProvider {
    static var previews: some View {
        DismissButtonComponent()
    }
}
