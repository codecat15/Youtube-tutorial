//
//  TWSmallView.swift
//  MyTravelWidgetExtension
//
//  Created by CodeCat15 on 10/2/20.
//

import SwiftUI
import WidgetKit

struct TWSmallView: View {

    private var travel: Travel

    init(_travel: Travel) {
        self.travel = _travel
    }

    var body: some View {
        VStack(alignment:.leading, spacing:10){

            Text("Upcoming trips")
                .font(Font.headline)
                .foregroundColor(Color.primary)

            Text(travel.date!).font(.subheadline)
                .foregroundColor(Color.secondary)

            HStack{
                RoundedRectangle(cornerRadius: 1)
                    .fill(travel.reservation != nil ? Color.green : Color.red)
                    .frame(width: 2, height: 37)
                Text(travel.destination!).font(.title)
            }
        }
    }
}

struct TWSmallView_Previews: PreviewProvider {
    static var previews: some View {
        TWSmallView(_travel: Travel(id: 1, destination: "Test", travelby: "test", date: "test", reservation: nil))
        .previewContext(WidgetPreviewContext(family: .systemSmall))
        
    }
}
