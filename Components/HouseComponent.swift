//
//  HouseComponent.swift
//  StimaCore
//
//  Created by salvatore dessena on 18/03/22.
//

import SwiftUI

struct HouseComponent: View {
    var letter: String
    var color: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 4)
                .frame(width: 36, height: 36, alignment: .center)
                .foregroundColor(Color(color))
                .shadow(color: Color("ColorGrayLight"), radius: 2, x: 2, y: 2)
            Text(letter.uppercased())
                .font(.system(size: 20, weight: .heavy))
                .foregroundColor(Color.white)
                .shadow(color: Color("ColorGrayLight"), radius: 1, x: 2, y: 2)
        }
    }
}

struct HouseComponent_Previews: PreviewProvider {
    static var previews: some View {
        HouseComponent(letter: "a".uppercased(), color: "Senape")
            .previewLayout(.sizeThatFits)
           
    }
} 
