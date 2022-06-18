//
//  ContentView.swift
//  jokes
//
//  Created by NICOLE TAN YITONG stu on 11/6/22.
//

import SwiftUI

struct ContentView: View {
    
    var jokes = [
                 Joke(setUp: "Why couldn't the bicycle stand up?",
                      punchline: "It was two tired!"),
                 Joke(setUp: "What do you call a green inch?",
                      punchline: "a grinch."),
                Joke(setUp: "Where do fruits go on vacation?", punchline: "Pear-is!")]
    
    @State var showPunchline = false
    @State var currentJoke = 0
    @State var isFeedbackPresented = false
    
    @State var isFeedbackResponsePresented = false
    @State var isFeedbackPositive = false
    
    //animation stuff
    @State var punchlineSize: CGFloat = 0.1
    @State var punchlineRotation: Angle = .zero
    @State var opacity: Double = 0
    @State var tapToContinueOffset: CGFloat = 50
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
            
            VStack{
                Text(jokes[currentJoke % jokes.count].setUp)
                    .padding()
                Button {
                    print("Button tapped!")
                    withAnimation {
                        showPunchline = true
                    }
                    
                } label: {
                    Text("what why")
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                } .padding()
                
                if showPunchline {
                    Text(jokes[currentJoke % jokes.count].punchline)
                        .padding()
                        .scaleEffect(punchlineSize)
                        .rotationEffect(punchlineRotation)
                        .opacity(opacity)
                        .onAppear{
                            withAnimation(.easeInOut(duration: 0.5)){
                                punchlineSize = 1
                                punchlineRotation = Angle(degrees: 360 * 2)
                                opacity = 1
                                tapToContinueOffset = 0
                            }
                        }
                        .onDisappear {
                            punchlineSize = 0.1
                            punchlineRotation = .zero
                            opacity = 0
                            tapToContinueOffset = 50
                        }
                    Text("Tap to continue")
                        .italic()
                        .padding()
                        .opacity(opacity)
                        .offset(x: 0, y: tapToContinueOffset)
                }
                
            }
        }
        .onTapGesture{
            if showPunchline {
                currentJoke += 1
                showPunchline = false
                isFeedbackPresented = true
            }
        }
        
        .alert(isPresented: $isFeedbackPresented) {
            Alert(title: Text("Did you like the last joke"),
        primaryButton: .default(Text("💗")){
            print("good")
            isFeedbackPositive = true
            isFeedbackResponsePresented = true
        },
        secondaryButton: .default(Text("💀")){
            print("oh no")
            isFeedbackPositive = false
            isFeedbackResponsePresented = true
        })
            
        }
        
        .sheet(isPresented: $isFeedbackResponsePresented){
            FeedbackResponseView(isPositive: isFeedbackPositive)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
