//
//  ContentView.swift
//  Demo
//
//  Created by 茅根啓介 on 2024/12/08.
//

import SwiftUI
import Navajo_Swift

struct ContentView: View {
    @State private var contentViewModel = ContentViewModel()

    var body: some View {
        NavigationStack {
            VStack(spacing: 60) {
                VStack(spacing: 20) {
                    TextField(
                        "Enter your password",
                        text: $contentViewModel.password
                    )
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                    Text(contentViewModel.strength)
                        .font(.headline)

                    Text(
                        contentViewModel.validation.isEmpty ? String(
                            localized: "Valid"
                        )  : contentViewModel.validation
                    )
                    .foregroundColor(
                        contentViewModel.validation.isEmpty ? .green : .red
                    )
                }

                Toggle(
                    "Use Custom Validator",
                    isOn: $contentViewModel.useCustomValidator
                )
                .toggleStyle(.button)
            }
            .padding(20)
            .frame(maxWidth: .infinity)
        }
#if os(macOS) || os(visionOS)
        .frame(minWidth: 500,maxWidth: 700, minHeight: 300, maxHeight: 500)
#endif
#if os(macOS)
        .containerBackground(Material.regular, for: .window)
        .toolbar(removing: .title)
        .toolbarBackgroundVisibility(.hidden, for: .windowToolbar)
        .windowMinimizeBehavior(.disabled)
        .windowFullScreenBehavior(.disabled)
#endif
    }
}

struct PasswordValidatorView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
