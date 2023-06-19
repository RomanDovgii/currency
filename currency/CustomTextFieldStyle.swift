//
//  CustomTextFieldStyle.swift
//  currency
//
//  Created by Roman Dovgii on 6/16/23.
//

import SwiftUI

struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.horizontal)
            .padding(.vertical, 8)
            .background(Color.gray.opacity(0.10))
            .cornerRadius(20.0)
    }
}
