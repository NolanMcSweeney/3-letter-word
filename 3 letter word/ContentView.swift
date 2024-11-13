//
//  ContentView.swift
//  3 letter word
//
//  Created by Nolan Brian McSweeney on 10/16/24.
//

import SwiftUI
struct ContentView: View {
    @State private var letter = ""
    @State private var counter = 0
    let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    @State private var selectedLetters = ["", "", ""]
    
    var body: some View {
        VStack {
            
            Text("Three Letter Word")
                .font(.title).bold()
            Text("Tap the gray box to change the letter")
            
            
            customLetterBox(color: .red, text: letter )
                .onTapGesture {
                    let position = alphabet.index(alphabet.startIndex, offsetBy: counter)
                    letter = String(alphabet[position])
                    counter += 1
                    if counter == alphabet.count {
                        counter = 0
                    }
                }
            Text("Tap the red box to select that letter")
        }
        HStack {
            ForEach(0..<3) { index in
                customLetterBox(color: .red, text: selectedLetters[index])
                    .onTapGesture {
                        withAnimation(.default) {
                            selectedLetters[index] = letter
                        }
                        
                    }
            }
      
        }
        .preferredColorScheme(.dark)
       
    }
        
}

#Preview {
    ContentView()
}

struct customLetterBox: View {
    let color : Color
    let text : String
    var body: some View {
        ZStack {
            color
            Text(text)
                .font(.system(size: 90))
                .fontWeight(.heavy)
            
        }
        .frame(width: 120, height: 120)
    }
}
