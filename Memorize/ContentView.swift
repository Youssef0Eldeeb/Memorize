//
//  ContentView.swift
//  Memorize
//
//  Created by Youssef Eldeeb on 14/10/2022.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🚂", "🚀", "🚁", "🚗", "🏎", "🛵", "🛺", "🛶", "🚲", "🚜", "🛸", "🚌", "🚚"]
    @State var emojiCount = 8
    var body: some View {
        VStack{
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
                .padding()
                .foregroundColor(.red)
                //: LasyVGrid
            }
            Spacer()
            HStack{
                remove
                Spacer()
                add
            }
            .padding(.horizontal)
            .font(.largeTitle)
            //: HStack
            
        }//: VStack
    }//: body
    var remove: some View{
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    var add: some View{
        Button {
            if emojiCount < emojis.count{
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
}


struct CardView: View{
    let content: String
    @State var isFaceUP: Bool = true
    var body: some View{
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUP{
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            }else{
                shape.fill()
            }
            
        }//: ZStack
        .onTapGesture {
            isFaceUP.toggle()
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .previewInterfaceOrientation(.portrait)
        ContentView()
            .preferredColorScheme(.light)
    }
}
