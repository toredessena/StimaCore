//
//  StepperComponent.swift
//  StimaCore
//
//  Created by salvatore dessena on 11/03/22.
//

import SwiftUI

struct StepperComponent: View {
    
    // MARK: - PROPERTIES

    @State private var favoriteColor = 0
    
    var surfaceIndication: String
    var colorSelection: String
    var range: ClosedRange<Double>
    var step: Double
    var stepperBindingValue: Binding<Double>
    var stepperValue: Double
    
    
    var body: some View {
        Text(surfaceIndication)
        .lineLimit(1)
        .foregroundColor(Color(colorSelection))
        .font(.subheadline)
        .padding(.top, 10)
    Stepper(value: stepperBindingValue, in: range, step: step) {
        Text("Mq. \(stepperValue, specifier: "%.2f")")
            .bold()
        }
    }
}


/*
struct StepperComponent_Previews: PreviewProvider {
    static var previews: some View {
        StepperComponent()
    }
}
 */
