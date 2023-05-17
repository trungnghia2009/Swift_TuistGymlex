//
//  File.swift
//  
//
//  Created by trungnghia on 17/05/2023.
//

import Lottie
import SwiftUI

public struct LottieView: UIViewRepresentable {
    var filePath: String
    var loopMode: LottieLoopMode
    
    var animationView = LottieAnimationView()
    
    public init(filePath: String, loopMode: LottieLoopMode) {
        self.filePath = filePath
        self.loopMode = loopMode
    }
    
    public func makeUIView(context: Context) -> some UIView {
        let view = UIView()
        
        animationView.animation = LottieAnimation.filepath(filePath)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        animationView.play()
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
        return view
    }
    
    //public func updateUIView(_ uiView: UIViewType, context _: UIViewRepresentableContext<LottieView>) {}
    public func updateUIView(_ uiView: UIViewType, context: Context) {}
}
