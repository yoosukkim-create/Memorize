//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by 김유석 on 2/7/25.
//

// ================ MVVM에서, ViewModel에 해당하는 코드 ================

import SwiftUI // ViewModel도 View의 일부
               // 직접 View 만들진 않을거지만,
               // UI를 위해 Model을 패키징하는 역할을 하기 때문에
               // UI와 UI-dependent한 것들(색,이미지등)에 대해 알아야함

class EmojiMemoryGame {
    var model: MemoryGame<String>
}
