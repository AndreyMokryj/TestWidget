//
//  ContentView.swift
//  test_widget
//
//  Created by Andrew Mokryj on 08.09.2022.
//

import SwiftUI

struct EmojibookListView: View {
    let emojiData: [EmojiDetails] = EmojiProvider.all()
    @State private var showingDetail: Bool = false
      
    var body: some View {
        NavigationView {
            List {
                ForEach(emojiData, content: { emojiDetails in
                  Button(action: {
                    showingDetail.toggle()
                  }, label: {
                    EmojiItemView(emoji: emojiDetails.emoji, emojiName: emojiDetails.name)
                  })
                  .sheet(isPresented: $showingDetail) {
                    EmojiDetailsView(emojiDetails: emojiDetails)
                  }
                })
            }
          .foregroundColor(.black)
          .listStyle(InsetGroupedListStyle())
          .navigationBarTitle("Emojibook")
        }
    }
}

struct EmojiItemView: View {
  let emoji: String
  let emojiName: String

  var body: some View {
    Text("\(emoji) \(emojiName)")
      .font(.largeTitle)
      .padding([.top, .bottom])
  }
}

struct EmojiDetailsView: View {
  var emojiDetails: EmojiDetails
  
  var body: some View {
    ZStack {
      // Background color
      Color(UIColor.systemIndigo).edgesIgnoringSafeArea(.all)

      // Emoji data
      VStack {
        VStack(alignment: .leading) {
          HStack {
            Text("\(emojiDetails.emoji) \(emojiDetails.name)")
              .font(.largeTitle)
              .bold()
          }
          .padding()

          Text(emojiDetails.description)
            .padding([.leading, .trailing, .bottom])
            .font(.title)
        }
      }
      .foregroundColor(.white)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojibookListView()
    }
}
