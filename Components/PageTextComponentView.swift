//
//  PageTextComponentView.swift
//  StimaCore
//
//  Created by salvatore dessena on 15/04/22.
//

import SwiftUI

struct PageTextComponentView: View {
    var testo: String
    var body: some View {
        Text(testo)
            .font(.system(size: 20, weight: .heavy))
            .foregroundColor(Color("ColorPinkBright"))
            .padding(.top, 52)
    }
}

struct PageTextComponentView_Previews: PreviewProvider {
    static var previews: some View {
        PageTextComponentView(testo: "Ciao")
    }
}
