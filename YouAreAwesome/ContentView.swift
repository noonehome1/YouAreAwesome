//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Paul Wagstaff on 2025-11-17.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
            Text(message)
                .font(.largeTitle)
                .fontWeight(.ultraLight)
            Spacer()
            Button("Press Me!") {
                let message1 = "You are Awesome!"
                let imageName1 = "sun.max.fill"
                let message2 = "You are Great!"
                let imageName2 = "hand.thumbsup"
                
                imageName = (message == message1 ? imageName2 : imageName1)
                message = (message == message1 ? message2: message1)
                
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            .tint(.orange)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
