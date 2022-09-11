//
//  CreditsComponentView.swift
//  StimaCore
//
//  Created by salvatore dessena on 27/08/22.
//

import SwiftUI

struct CreditsComponentView: View {
    var title: String
    var content: String
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(Color.pink)
            Spacer()
            Text(content)
                .bold()
        }
        .padding(10)
    }
}

struct CreditsComponentView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsComponentView(title: "Titolo", content: "Contenuto")
            .previewLayout(.sizeThatFits)
    }
}
