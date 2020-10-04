//
//  Provider.swift
//  MyTravelWidgetExtension
//
//  Created by CodeCat15 on 10/2/20.
//

import WidgetKit

struct Provider: TimelineProvider {
    let loader: TravelResource = TravelResource()
    typealias Entry = TravelEntry

    func placeholder(in context: Context) -> TravelEntry {
        TravelEntry.mockTravelEntry()
    }

    func getSnapshot(in context: Context, completion: @escaping (TravelEntry) -> ()) {
        let entry = TravelEntry.mockTravelEntry()
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {

        loader.getTravelDetails { (response) in
            if(response != nil && response?.result != nil)
            {
                let currentDate = Date()
                let entry = TravelEntry(date: currentDate, travel: (response?.result)!)
                let refreshDate = Calendar.current.date(byAdding: .minute, value: 60, to: currentDate)!
                let timeline = Timeline(entries: [entry], policy: .after(refreshDate))
                completion(timeline)
            }
        }

    }
}
