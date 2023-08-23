//
//  ContentView.swift
//  SwipeAnimation
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 100) {
            SwipeableStack(
                mainContent: { Text("main") },
                rightSubContent: { Text("rightSub") },
                leftSubContent: { Text("leftSub") },
                rightSubContentWidth: 80,
                leftSubContentWidth: 120,
                mainContentBackgroundColor: .gray,
                rightSubContentBackgroundColor: .red,
                leftSubContentBackgroundColor: .yellow
            )
            .frame(width: 250, height: 80)

            SwipeableStack(
                mainContent: {
                    HStack(spacing: 20) {
                        Text("SampleText")
                            .font(.title)
                        Image(systemName: "hand.thumbsup.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                    }
                },
                rightSubContent: {
                    HStack(spacing: 0) {
                        Button(action: { print("ButtonA") }) {
                            Text("ButtonA")
                        }
                        .padding()
                        .frame(maxHeight: .infinity)
                        .accentColor(Color.white)
                        .background(Color.blue)

                        Button(action: { print("ButtonB") }) {
                            Text("ButtonB")
                        }
                        .padding()
                        .frame(maxHeight: .infinity)
                        .accentColor(Color.white)
                        .background(Color.red)
                        
                        Button(action: { print("ButtonC") }) {
                            Text("ButtonC")
                        }
                        .padding()
                        .frame(maxHeight: .infinity)
                        .accentColor(Color.white)
                        .background(Color.yellow)
                    }
                },
                leftSubContent: { Text("leftSub") },
                rightSubContentWidth: 170,
                leftSubContentWidth: 80,
                mainContentBackgroundColor: .brown,
                rightSubContentBackgroundColor: .blue,
                leftSubContentBackgroundColor: .red,
                parentCornerRadius: 10
            )
            .frame(height: 80)
            .padding(.horizontal, 10)
            
            SwipeableStack(
                mainContent: {
                    Image(systemName: "hand.thumbsup.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color.black)
                        .frame(width: 80, height: 80)
                },
                rightSubContent: { Text("Good") },
                leftSubContent: { Text("Not Good") },
                rightSubContentWidth: 80,
                leftSubContentWidth: 100,
                mainContentBackgroundColor: .white,
                rightSubContentBackgroundColor: .cyan,
                leftSubContentBackgroundColor: .red
            )
            .frame(width: 150, height: 80)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
