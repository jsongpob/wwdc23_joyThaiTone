//
//  ClearView.swift
//  WWDC23-ThaiTone
//
//  Created by Songpob Hamthanan on 5/3/2566 BE.
//

import SwiftUI

struct ClearView: View {
    @EnvironmentObject var gameLevelData: GameLevelData
    
    var body: some View {
        VStack {
            if (gameLevelData.FirstWelcomeView == true) {
                Button("") {
                    gameLevelData.dataWelcomeView.toggle()
                }
                .fullScreenCover(isPresented: $gameLevelData.dataWelcomeView) {
                    VStack(spacing: 100) {
                        WelcomeView()
                        Button(action: {
                            gameLevelData.dataWelcomeViewToggle()
                        }) {
                            Text("Start")
                                .frame(width: 250, height: 30)
                        }
                        .buttonStyle(.borderedProminent)
                        Spacer()
                        
                    }
                    .frame(maxWidth: .infinity,
                           maxHeight: .infinity)
                }
            }
            //            Text("\(gameLevelData.FirstWelcomeView ? "True" : "False") :FirstdataWelcomeView")
            //TAB VIEW
            TabView {
                ThaiToneCardView()
                    .tabItem {
                        Label("Challenges", systemImage: "star.fill")
                    }
                if (gameLevelData.endTabUnlock == true) {
                    EndView()
                        .tabItem {
                            Label("End", systemImage: "star")
                        }
                        .badge("")
                }
                AboutView()
                    .tabItem {
                        Label("About", systemImage: "info.circle.fill")
                    }
            }
//            .onAppear {
//                if (gameLevelData.GameLevel < 1) {
//                    gameLevelData.GameLevel = 1
//                }
//            }
        }
    }
}

struct ClearView_Previews: PreviewProvider {
    static var previews: some View {
        ClearView()
            .environmentObject(GameLevelData())
            .environmentObject(GameState())
            .previewInterfaceOrientation(.landscapeRight)
    }
}

func didDismiss() {
    
}

struct WelcomeView: View {
    var body: some View {
        Spacer()
        VStack(spacing: 20) {
            Text("Welcome to")
            Text("ThaiTone")
                .font(.system(size: 120, weight: .medium))
            Text("Are you ready? For playing and learning with the story and history of the color that comes from Thailand called ThaiTone, the color that has been used for a long time and is inspired by the lives of the ancient Thai population. Isn't it interesting? If you're ready,\n let's get started!")
                .frame(width: 700)
                .multilineTextAlignment(.center)
        }
    }
}
