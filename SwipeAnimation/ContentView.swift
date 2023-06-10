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
                subContent: { Text("sub") },
                subContentWidth: 80,
                mainContentBackgroundColor: .gray,
                subContentBackgroundColor: .red
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
                subContent: {
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
                subContentWidth: 170,
                mainContentBackgroundColor: .brown,
                subContentBackgroundColor: .blue,
                parentCornerRadius: 10
            )
            .frame(width: .infinity, height: 80)
            .padding(.horizontal, 10)
            
            SwipeableStack(
                mainContent: {
                    Image(systemName: "hand.thumbsup.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                },
                subContent: { Text("Good") },
                subContentWidth: 80,
                mainContentBackgroundColor: .white,
                subContentBackgroundColor: .cyan
            )
            .frame(width: 150, height: 80)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
