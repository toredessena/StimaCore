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
    
    // correggo indicatore unità di misura
    var measureIndication: String
    
    
    var body: some View {
        
        VStack(alignment: .leading)  {
            Text(surfaceIndication)
            .lineLimit(1)
            .foregroundColor(Color(colorSelection))
            .font(.subheadline)
            .padding(.top, 10)
            
        Stepper(value: stepperBindingValue, in: range, step: step) {
            VStack(alignment: .leading) {
                Text(measureIndication)
                    .foregroundColor(.gray)
                
                Text("\(stepperValue, specifier: "%.2f")")
                    .foregroundColor(.pink)
                    .bold()
            }
            
            }

        }
    }
}

struct StepperComponent_Previews: PreviewProvider {
    static var previews: some View {
        StepperComponent(surfaceIndication: "Intonaci", colorSelection: "ColorPinkBright", range: 0...1000, step: 1.0, stepperBindingValue: .constant(0.00), stepperValue: 0.00, measureIndication: "Mq.")
    }
}

