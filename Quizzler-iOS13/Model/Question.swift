//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Raja Shravan on 2023-10-23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text:String
    let answer:Bool
    
    init(text:String, answer:Bool) {
        self.text = text
        self.answer = answer
    }
}
