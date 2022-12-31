//
//  AnimatedButtonView.swift
//  StimaCore
//
//  Created by salvatore dessena on 30/12/22.
//

import SwiftUI

struct AnimatedButtonView: View {
    @State private var animationButton: Bool = false
    
    var body: some View {
        VStack {
            Text("Ciao")
            .onAppear {
                withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
                    animationButton = true
                }
            }
            .scaleEffect(self.animationButton ? 1.4 : 1)
            
        }
        
       
       
    }
}

struct AnimatedButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedButtonView()
    }
}
