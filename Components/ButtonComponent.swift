//
//  ButtonComponent.swift
//  StimaCore
//
//  Created by salvatore dessena on 16/03/22.
//

import SwiftUI

struct ButtonComponent: View {
    var color: String
    var text: String
    var textColor: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .frame(maxWidth: .infinity, maxHeight: 50)
                .foregroundColor(Color(color))
                .shadow(color: Color("ColorGrayLight"), radius: 8, x: 0, y: 0)
            Text(text)
                .font(.system(size: 18, weight: .heavy))
                .foregroundColor(Color(textColor))
                .padding()
            
        } //: ZSTACK
        .padding(.vertical, 8)
    }
}

/*
 struct ButtonComponent_Previews: PreviewProvider {
     static var previews: some View {
         ButtonComponent()
     }
 }
 */

