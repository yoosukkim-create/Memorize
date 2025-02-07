//
//  ContentView.swift
//  Memorize
//
//  Created by 김유석 on 2/1/25.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["👻","🎃","🕷️","😈","💀","🕸️","🧙‍♀️","🙀","👹","😱","☠️","🍭"]
    
    // ------------------- Model로 이관할 부분 삭제 -------------------
//    @State var cardCount: Int = 4
    // -----------------------------------------------------------
    
    var body: some View {
        ScrollView{
            cards
        }
        .padding()
    }
    
    // CardView는 엄청 중요해 따로 struct로 뺌
    // cards, cardCountAdjusters, cardRemover, cardAdder는 그렇게 엄청 중요한건 아니지만,
    // var body에 덕지덕지 붙이기는 지저분하니,
    // 아래와 같이 작은 sub var 들로 분리
    
    var cards: some View {
        // 여긴 그냥 1줄짜리 함수야. HStack 자체는 ViewBuilder 아니고 그냥 function
        // 그래서 사실은 아래 HStack 앞에 'return' 붙여줘야 마땅하나,
        // 1줄짜리 코드는 return 생략 가능
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
        // LazyVGrid(columns: [GridItem(),GridItem(),GridItem()]) {
            // LazyVGriod : 수직방향으로 배치. 여러 열로 정렬됨 (GridItem 수 만큼 수직 정렬)
            // GridItem() : LazyVGrid/HGrid에서 각 열/행 크기 자동 결정
            // GridItem(.adaptive(minimum: 65) : 각 열의 크기를 최소 65포인트로 설정
            
            // 내부는 ViewBuilder
            ForEach(emojis.indices, id: \.self) { index in // array.indices 하면 0..<array개수의 Range 출력
                CardView(content: emojis[index])           // Range표현방식 0..<4 또는 0...3  : 0,1,2,3 출력
                    .aspectRatio(2/3, contentMode: .fit) // View 비율 설정, 크기 조정
            }
        }
        .foregroundColor(.orange)
    }
    
    // ------------------- Model로 이관할 부분 삭제 -------------------
//    var cardCountAdjusters: some View {
//        HStack{
//            cardRemover
//            Spacer()
//            cardAdder
//        }
//        .imageScale(.large)
//        .font(.largeTitle)
//    }
//    
//    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
//        Button(action:{
//            cardCount += offset
//        }, label: {
//            Image(systemName: symbol)
//        })
//        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
//    }
//    
//    var cardRemover: some View {
//        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
//    }
//    
//    var cardAdder: some View {
//        cardCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus.fill")
//    }
    // -----------------------------------------------------------
    
}

struct CardView : View{
    let content: String
    @State var isFaceUp = true // 원래 struct 내부는 불변(immutable)인데,
                                // @State 써서 포인터처럼 만들어 임시로 변하게함 (나중에 없앨것)
                                // @State는 View 내부에서 변할 수 있는 상태를 저장하는 속성 래퍼임
                                // 내부에서 수정할거라 let 하면 안됨
    
    var body : some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
            // 이모티콘 그대로 두고 투명도(Opacity)로 카드 뒤집는걸 표현
            // 만약 뒷면일때 이모티콘 없으면, 위 LazyVGrid에서는 항상 크기 최소화 하려고해서, 카드 모양이 찌부되버림
        }
        .onTapGesture {
            isFaceUp.toggle() // bool 타입에 .toggle() 하면 true <-> false 바뀜
        }
    }
}

#Preview {
    ContentView()
}
