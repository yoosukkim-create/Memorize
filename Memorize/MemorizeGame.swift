//
//  MemorizeGame.swift
//  Memorize
//
//  Created by 김유석 on 2/7/25.
//

// ================ MVVM에서, Model에 해당하는 코드 ================

import Foundation // Model이라 View(UI)불필요해, import SwiftUI 안함

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(card: Card){
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
