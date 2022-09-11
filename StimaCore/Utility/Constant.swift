//
//  Constant.swift
//  StimaCore
//
//  Created by salvatore dessena on 19/02/22.
//

import SwiftUI

// MARK: - FORMATTER
 let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
     formatter.locale = .current
     formatter.timeZone = .current
    return formatter
}()

// MARK: - UI
var backgroundGradient: LinearGradient {
    return LinearGradient(gradient: Gradient(colors: [Color.white, Color("ColorGrayLight")]), startPoint: .top, endPoint: .bottom)
}

// MARK: - UX

// MARK: - DOUBLE FORMATTER


// servirebbe static let
 let formatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.minimumFractionDigits = 2
    formatter.maximumFractionDigits = 2
    return formatter
}()
