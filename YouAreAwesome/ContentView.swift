//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Paul Wagstaff on 2025-11-17.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var soundName = ""
    @State private var lastMessageNumber = -1
    @State private var lastImageNumber = -1
    @State private var lastSoundNumber = -1
    @State private var audioPlayer: AVAudioPlayer!
    @State private var soundIsOn = false
    let numberOfImages = 10
    let numberOfSounds = 6
    
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
            
            HStack {
                Text("Sound On:")
                Toggle("Sound On", isOn: $soundIsOn)
                    .labelsHidden()
                    .onChange(of: soundIsOn) { oldValue, newValue in
                        if (audioPlayer != nil && audioPlayer.isPlaying) {
                            audioPlayer.stop()
                        }
                    }
                
                Spacer()
                
                Button("Show Message!") {
                    
                    let messages: [String] = [
                        "You are Awesome!",
                        "You are Great!",
                        "You are Fantastic!",
                        "You are Amazing!",
                        "You are Incredible!",
                        "This is the way it goes, Keep going, You're doing great!"
                    ]
                    
                    //MARK: Do Message
                    lastMessageNumber = nonRepeatingRandom(lastNumber: lastMessageNumber, upperbound: messages.count-1)
                    message = messages[lastMessageNumber]
                    
                    //MARK: Do Image
                    lastImageNumber = nonRepeatingRandom(lastNumber: lastImageNumber, upperbound: numberOfImages-1)
                    imageName = "image\(lastImageNumber)"
                    
                    //MARK: Do Sound
                    lastSoundNumber = nonRepeatingRandom(lastNumber: lastSoundNumber, upperbound: numberOfSounds-1)
                    if (soundIsOn) {
                        playSound(soundName: "sound\(lastSoundNumber)")
                    }
                }
                
                .buttonStyle(.borderedProminent)
                .font(.title2)
            }
        }
        .padding()
    }
    
    func nonRepeatingRandom(lastNumber: Int, upperbound: Int) -> Int {
        var newNumber: Int
        repeat {
            newNumber = Int.random(in: 0...upperbound)
        } while newNumber == lastNumber
        return newNumber
    }
    
    func playSound(soundName: String) {
        if (audioPlayer != nil && audioPlayer.isPlaying) {
            audioPlayer.stop()
        }
        guard let soundFile = NSDataAsset(name: soundName) else {
            print("😡 Could not read file named \(soundName)")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        } catch {
            print("😡 ERROR: \(error.localizedDescription) creating audioPlayer")
        }
    }
}

#Preview("Light Mode"){
    ContentView()
        .preferredColorScheme(.light)
}
#Preview("Dark Mode") {
    ContentView()
        .preferredColorScheme(.dark)
}
