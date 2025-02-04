//
//  ContentView.swift
//  Memorize
//
//  Created by 김유석 on 2/1/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            CardView(isFaceUp: false)
            CardView()
            CardView(isFaceUp: true)
            CardView(isFaceUp: true)
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView : View{
    @State var isFaceUp = false // 원래 struct 내부는 불변(immutable)인데,
                                // @State 써서 포인터처럼 만들어 임시로 변하게함 (나중에 없앨것)
                                // @State는 View 내부에서 변할 수 있는 상태를 저장하는 속성 래퍼임
                                // 내부에서 수정할거라 let 하면 안됨
    
    var body : some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text("👻").font(.largeTitle)
            } else {
                base.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle() // bool 타입에 .toggle() 하면 true <-> false 바뀜
        }
    }
}

#Preview {
    ContentView()
}
