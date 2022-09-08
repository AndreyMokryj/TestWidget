//
//  EmojiDetails.swift
//  test_widget
//
//  Created by Andrew Mokryj on 08.09.2022.
//

import Foundation

public struct EmojiDetails {
  public let emoji: String
  public let name: String
  public let description: String
}

// MARK: - Identifiable
extension EmojiDetails: Identifiable {
  public var id: String {
    emoji
  }
}
