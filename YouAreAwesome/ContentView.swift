//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Paul Wagstaff on 2025-11-17.
//

import SwiftUI

struct ContentView: View {
    @State private var message = "I am a app developer!"
    @State private var imageName = "sun.max.fill"
    @State private var count = 1
    
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
//                .foregroundStyle(.orange)
//                .frame(width: 200, height: 200 )
//            Text(message)
//                .font(.largeTitle)
//                .fontWeight(.heavy)
//                .foregroundStyle(.red)
            Spacer()
            HStack {
                Button("Press Me!") {
                    if (count % 2 == 0) {
                        imageName = "moon.stars.fill"
                        count += 1
                    } else {
                        imageName = "sun.max.fill"
                        count += 1
                    }
                }
                .buttonStyle(.borderedProminent)
                .font(.title2)
                .tint(.orange)
//                Button("Great!") {
//                    message = "Great!"
//                }
//                .buttonStyle(.borderedProminent)
//                .font(.title2)
//                .tint(.orange)
            }

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
