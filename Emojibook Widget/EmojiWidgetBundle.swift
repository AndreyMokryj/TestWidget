//
//  EmojiWidgetBundle.swift
//  Emojibook WidgetExtension
//
//  Created by Andrew Mokryj on 09.09.2022.
//

import Foundation
import SwiftUI
import WidgetKit

@main
struct EmojiWidgetBundle: WidgetBundle {

  @WidgetBundleBuilder
  var body: some Widget {
    RandomEmojiWidget()
    CustomEmojiWidget()
  }
}
