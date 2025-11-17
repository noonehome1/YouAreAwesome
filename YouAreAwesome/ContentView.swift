//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Paul Wagstaff on 2025-11-17.
//

import SwiftUI

struct ContentView: View {
    @State private var message = "I am a app developer!"
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
                .frame(width: 200, height: 200 )
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
            Spacer()
            HStack {
                Button("Awesome!") {
                    message = "Awesome!"
                }
                .buttonStyle(.borderedProminent)
                .font(.title2)
                .tint(.orange)
                Button("Great!") {
                    message = "Great!"
                }
                .buttonStyle(.borderedProminent)
                .font(.title2)
                .tint(.orange)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
