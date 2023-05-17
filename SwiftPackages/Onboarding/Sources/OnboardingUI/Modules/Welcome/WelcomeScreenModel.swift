//
//  File.swift
//  
//
//  Created by trungnghia on 17/05/2023.
//

import Foundation

public final class WelcomeScreenModel: ObservableObject {
    public init() {}
    
    var animationFilePath: String {
        guard let filePath = Bundle.module.path(forResource: "coach", ofType: "json") else {
            preconditionFailure("Can't find Lottie File")
        }
        
        return filePath
    }
}
