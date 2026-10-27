//
//  ContentView.swift
//  SwiftUIComponentLibrary
//
//  Created by Apple on 22/10/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Text("SwiftUI Component Library")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)

                Text("Explore reusable UI components")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

                Spacer()
                    .frame(height: 12)

                NavigationLink {
                    ButtonShowcaseView()
                } label: {
                    homeButton(title: "Button Component")
                }

                NavigationLink {
                    CardShowcaseView()
                } label: {
                    homeButton(title: "Card Component")
                }

                NavigationLink {
                    SheetShowcaseView()
                } label: {
                    homeButton(title: "Sheet / Modal Component")
                }

                NavigationLink {
                    FormInputShowcaseView()
                } label: {
                    homeButton(title: "Form Input Component")
                }

                NavigationLink {
                    DemoApplicationView()
                } label: {
                    homeButton(title: "Demo Application")
                }

                Spacer()
            }
            .padding()
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    private func homeButton(title: String) -> some View {
        Text(title)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    ContentView()
}
