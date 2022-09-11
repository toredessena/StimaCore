//
//  BadgeSismaComponent.swift
//  StimaCore
//
//  Created by salvatore dessena on 23/03/22.
//

import SwiftUI

struct BadgeSismaComponent: View {
    var circleColor: String
    var letter: String
    var body: some View {
       
            ZStack {
                Capsule()
                    .frame(width: 36, height: 36, alignment: .center)
                    .foregroundColor(Color(circleColor))
                    .shadow(color: Color("ColorGrayLight"), radius: 2, x: 2, y: 2)
                Text(letter)
                    .font(.system(size: 20, weight: .heavy))
                    .foregroundColor(Color.white)
                    .shadow(color: Color("ColorGrayLight"), radius: 1, x: 2, y: 2)
            }
    }
}

struct BadgeSismaComponent_Previews: PreviewProvider {
    static var previews: some View {
        BadgeSismaComponent(circleColor: "ColorPinkDark", letter: "A+")
            .previewLayout(.sizeThatFits)
    }
}
