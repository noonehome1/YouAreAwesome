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
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
                .frame(height: 100)
                .animation(.easeInOut(duration: 0.2), value: message)
                .foregroundStyle(.red)
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
                .animation(.easeInOut, value: imageName)
            
 
            Spacer()
            
            Button("Show Message!") {
                let messages: [String] = ["You are Awesome!", "You are Great!", "You are Fantastic!", "You are Amazing!", "You are Incredible!", "This is the way it goes, Keep going, You're doing great!"]
                
                message = messages[Int.random(in: 0..<messages.count)]
                
                //MARK: Do Images
                imageName = "image\(Int.random(in: 0..<10))"
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
