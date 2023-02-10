//
//  ContentView.swift
//  JokeApp
//
//  Created by abensefia on 29/01/2023.
//

import SwiftUI


struct ContentView: View {
    
    let jokes = [
        Joke(setup: "Why did the scarecrow win an award?", punchline: "Because it was out standing in its field!"),
        Joke(setup: "Why did the chicken cross the road?", punchline: "To get to the other side!"),
        Joke(setup: "Why did the bicycle fall asleep?", punchline: "Because it was two tired!"),
    ]
    
    @State var isPunchlineShown = false
    @State var isFeedbackShown = false
    @State var currentJokeIndex = 0
    @State var isSheetShown = false
    
    var body: some View {
        VStack {
            Text(jokes[currentJokeIndex].setup)
                .padding(.bottom)
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            
            Button {
                isPunchlineShown = true
            } label: {
                Text("*Tell* me the **answer**!!!!")
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
            }
            .padding(40)
            
            
            if isPunchlineShown {
                Text(jokes[currentJokeIndex].punchline)
                    .padding(.bottom)
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .multilineTextAlignment(.center)
                
                Text("Tap anywhere to continue")
                    .padding()
                    .foregroundColor(.gray)
                    .font(.caption)
            }
        }
        .padding()
        .onTapGesture {
            if (isPunchlineShown){
                isPunchlineShown = false
                currentJokeIndex = (currentJokeIndex + 1) % jokes.count
                isFeedbackShown = true
            }
        }
        .alert("Did you liek the joke?", isPresented: $isFeedbackShown) {
            Button("I love it"){
                print(":)")
                isSheetShown = true
            }
            Button("Didn't like"){
                print(":(")
                isSheetShown = false
            }
        }
        .sheet(isPresented: $isSheetShown){
            Text("Thank you !")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
