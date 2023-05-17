//
//  SwiftUIView.swift
//  
//
//  Created by trungnghia on 17/05/2023.
//

import SwiftUI
import UIComponents

public struct WelcomeScreen: View {
    
    @State private var triggerNavigation: Bool = false
    @StateObject private var screenModel: WelcomeScreenModel
    
    public init(screenModel: WelcomeScreenModel = WelcomeScreenModel()) {
        _screenModel = StateObject(wrappedValue: screenModel)
    }
    
    public var body: some View {
        VStack {
            Text("Welcome to Gymlex")
                .fontWeight(.medium)
                .font(.largeTitle)
                .padding(.top)
            
            Text("Welcome to Gymlex. Gymlex is great app to track your workouts! 🏋🏼‍♂️ \nIf you have any feedback or ideas on how to improve this app please let me know. I made this app becase I wanted a cool app to track my progress📝")
                .padding()
            
            Text("If you want to support us, check out our games. You can find them at our [website](https://gmgstudio.de/). We also have a [Youtube Channel](https://www.youtube.com/c/GMGStudioOfficial)! Feel free to subscribe ❤️")
                .padding()
            
            //TODO: Add Lottie View
            
            Spacer()
            LottieView(filePath: screenModel.animationFilePath, loopMode: .loop)
            
            Button("Continue") {
                triggerNavigation.toggle()
            }
        }
        .navigationDestination(isPresented: $triggerNavigation) {
            Text("Next screen")
        }
    }
    
    
}

#if DEBUG
struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            WelcomeScreen()
        }
    }
}
#endif
