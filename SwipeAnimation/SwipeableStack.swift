//
//  SwipeableStack.swift
//  SwipeAnimation
//

import SwiftUI

struct SwipeableStack<MainContent:View, SubContent:View>: View {
    @State private var translationWidth: CGFloat = 0
    @State private var endedTranslationWidth: CGFloat = 0
    @State private var isActiveSubContent: Bool = false
    
    private let mainContent: MainContent
    private let subContent: SubContent
    private let subContentWidth: CGFloat
    private let mainContentBackgroundColor: Color
    private let subContentBackgroundColor: Color
    private let parentCornerRadius: CGFloat

    init(
        @ViewBuilder mainContent: () -> MainContent,
        @ViewBuilder subContent: () -> SubContent,
        subContentWidth: CGFloat,
        mainContentBackgroundColor: Color,
        subContentBackgroundColor: Color,
        parentCornerRadius: CGFloat = 0
    ) {
        self.mainContent = mainContent()
        self.subContent = subContent()
        self.subContentWidth = subContentWidth
        self.mainContentBackgroundColor = mainContentBackgroundColor
        self.subContentBackgroundColor = subContentBackgroundColor
        self.parentCornerRadius = parentCornerRadius
    }

    var body: some View {
        ZStack {
            HStack {
                Spacer()
                subContent
                    .frame(maxWidth: subContentWidth, maxHeight: .infinity)
                    .offset(x: calcSubContentWidth(), y: 0)
                    .animation(.spring(response: 0.6), value: endedTranslationWidth)
                    .clipped()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(subContentBackgroundColor)

            mainContent
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(mainContentBackgroundColor)
                .offset(x: 0 + translationWidth, y: 0)
                .animation(.spring(response: 0.6), value: endedTranslationWidth)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            let width = calcChangedWidth(width: value.translation.width)
                            if width <= 0 {
                                translationWidth = width
                            } else {
                                translationWidth = 0
                            }
                        }
                        .onEnded { value in
                            let width = calcChangedWidth(width: value.translation.width)
                            endedTranslationWidth = width
                            if width <= subContentWidth / 2 * -1 {
                                translationWidth = subContentWidth * -1
                                isActiveSubContent = true
                            } else {
                                translationWidth = 0
                                isActiveSubContent = false
                            }
                        }
                )
                .clipped()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .cornerRadius(parentCornerRadius)
    }

    private func calcSubContentWidth() -> CGFloat {
        let width = subContentWidth + translationWidth
        if width <= 0 {
            return 0
        }
        return width
    }

    private func calcChangedWidth(width: CGFloat) -> CGFloat {
        if isActiveSubContent {
            return width + subContentWidth * -1
        }
        return width
    }
}

struct SwipeableStack_Previews: PreviewProvider {
    static var previews: some View {
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
            .frame(height: 80)
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
