//
//  Emojibook_Widget.swift
//  Emojibook Widget
//
//  Created by Andrew Mokryj on 09.09.2022.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), emojiDetails: EmojiProvider.random())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), emojiDetails: EmojiProvider.random())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, emojiDetails: EmojiProvider.random())
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    public let date: Date
    public let emojiDetails: EmojiDetails
}

struct Emojibook_WidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        EmojiWidgetView(emojiDetails: entry.emojiDetails)
    }
}

@main
struct Emojibook_Widget: Widget {
    private let kind: String = "Emojibook_Widget"

    var body: some WidgetConfiguration {
        StaticConfiguration(
          kind: kind,
          provider: Provider()
//          placeholder: PlaceholderView()
        ) { entry in
          Emojibook_WidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Random Emoji")
        .description("Display a widget with an emoji that is updated randomly.")
        .supportedFamilies([.systemSmall])
    }
}

struct Emojibook_Widget_Previews: PreviewProvider {
    static var previews: some View {
        Emojibook_WidgetEntryView(entry: SimpleEntry(date: Date(), emojiDetails: EmojiProvider.random()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}

struct PlaceholderView : View {
  var body: some View {
    Text("Placeholder View")
  }
}
