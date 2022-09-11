//
//  BarrierBadgeComponent.swift
//  StimaCore
//
//  Created by salvatore dessena on 24/03/22.
//

import SwiftUI

struct BarrierBadgeComponent: View {
    
    var color: String
    var text: String
    
    var body: some View {
        
            Text(text)
            .font(.system(size: 14, weight: .bold))
            .foregroundColor(Color.white)
            .padding(.vertical, 10)
            .padding(.horizontal, 14)
            .background(Capsule(style: .circular).fill(Color(color)))
        
    }
}

struct BarrierBadgeComponent_Previews: PreviewProvider {
    static var previews: some View {
        BarrierBadgeComponent(color: "Arancio", text: "Visitabilità")
            .previewLayout(.sizeThatFits)
    }
}
