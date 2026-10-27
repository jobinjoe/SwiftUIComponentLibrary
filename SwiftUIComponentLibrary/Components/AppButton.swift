//
//  AppButton.swift
//  SwiftUIComponentLibrary
//
//  Created by Apple on 22/10/26.
//

import SwiftUI

enum AppButtonStyle {
    case primary
    case secondary
    case outlined
    case destructive
}

struct AppButton: View {
    let title: String
    var style: AppButtonStyle = .primary
    var isDisabled: Bool = false
    let action: () -> Void

    private var backgroundColor: Color {
        switch style {
        case .primary:
            return .blue
        case .secondary:
            return .gray.opacity(0.15)
        case .outlined:
            return .clear
        case .destructive:
            return .red
        }
    }

    private var foregroundColor: Color {
        switch style {
        case .primary, .destructive:
            return .white
        case .secondary:
            return .primary
        case .outlined:
            return .blue
        }
    }

    var body: some View {
        Button(action: action) {
            Text(title)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity)
                .padding()
                .background(backgroundColor)
                .foregroundStyle(foregroundColor)
                .clipShape(
                    RoundedRectangle(cornerRadius: 12)
                )
                .overlay {
                    if style == .outlined {
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.blue, lineWidth: 1.5)
                    }
                }
        }
        .disabled(isDisabled)
        .opacity(isDisabled ? 0.5 : 1.0)
    }
}
