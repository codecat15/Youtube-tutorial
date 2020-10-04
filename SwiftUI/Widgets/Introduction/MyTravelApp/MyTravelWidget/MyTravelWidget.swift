//
//  MyTravelWidget.swift
//  MyTravelWidget
//
//  Created by CodeCat15 on 10/1/20.
//

import WidgetKit
import SwiftUI

/*Hey there thank you for downloading the source code, I hope the video was helpful and you are all set to create your very first widget for your iOS app. If you face any issues don't hesitate to reach out. Please make sure you are using XCode 12 to run this demo locally.

 If you like my work then please do support the channel by sharing with your iOS group on facebook or whatsapp and do request them to subscribe :)

 Thank you for your time for reading this, Happy iCoding

~CodeCat15
 */

struct MyTravelWidgetEntryView : View {
    var entry: Provider.Entry

    @Environment(\.widgetFamily) var family

    @ViewBuilder
    var body: some View {
        switch family {
        case .systemSmall:
            TWSmallView(_travel: entry.travel.first!)

        case .systemMedium:
            TWMediumView(_travel: entry.travel)

        default:
            fatalError()

        }
    }
}

@main
struct MyTravelWidget: Widget {
    let kind: String = "MyTravelWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            MyTravelWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Travel Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

struct MyTravelWidget_Previews: PreviewProvider {
    static var previews: some View {
        MyTravelWidgetEntryView(entry: TravelEntry.mockTravelEntry())
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
