//
//  SongDisplay.swift
//  MyBreathingPal
//
//  Created by Ethan Chua on 11/4/24.
//

import SwiftUI
import AVKit

struct SongDisplay: View {
    // Paths to the inhale and exhale videos
    let inhaleURL = URL(fileURLWithPath: "/Users/keshavrangan/Documents/MyBreathingPal/MyBreathingPal/Assets.xcassets/Inhale.MP4")
    let exhaleURL = URL(fileURLWithPath: "/Users/keshavrangan/Documents/MyBreathingPal/MyBreathingPal/Assets.xcassets/Exhale.MP4")
    
    // State variables to control the video and toggle between inhale and exhale
    @State private var player: AVPlayer
    @State private var isInhaling = true
    
    init() {
        _player = State(initialValue: AVPlayer(url: inhaleURL))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Song Name")
                    .font(.title)
                    .padding()
                
                // Video Player
                VideoPlayer(player: player)
                    .scaledToFit()
                    .frame(width: 200, height: 200) // Adjust as needed
                
                // Breathe In/Out Text
                Text(isInhaling ? "Breathe in..." : "Breathe out...")
                    .font(.headline)
                    .foregroundColor(.blue)
                    .padding()
                
                // Song Details Section (Placeholder)
                VStack {
                    Text("Song")
                        .font(.headline)
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Title")
                            Text("Artist")
                            Text("Genre")
                        }
                        Spacer()
                        HStack {
                            Image(systemName: "play.circle")
                            Image(systemName: "pause.circle")
                        }
                    }
                    .padding()
                }
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
                .padding()
            }
            .onAppear {
                playNextVideo()
            }
            .onDisappear {
                player.pause()
            }
            .navigationTitle("Song Display")
        }
    }
    
    private func playNextVideo() {
        // Set the appropriate video based on the breathing phase
        let videoURL = isInhaling ? inhaleURL : exhaleURL
        player.replaceCurrentItem(with: AVPlayerItem(url: videoURL))
        player.play()
        
        // Listen for when the video finishes
        NotificationCenter.default.addObserver(
            forName: .AVPlayerItemDidPlayToEndTime,
            object: player.currentItem,
            queue: .main
        ) { _ in
            // Toggle inhale/exhale
            isInhaling.toggle()
            // Play the next video
            playNextVideo()
        }
    }
}

#Preview {
    SongDisplay()
}
