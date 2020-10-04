//
//  TWMediumView.swift
//  MyTravelWidgetExtension
//
//  Created by CodeCat15 on 10/2/20.
//

import SwiftUI
import WidgetKit

struct TWMediumView: View {
    private var travel: [Travel]
    init(_travel: [Travel]) {
        self.travel = _travel
    }

    var body: some View {
        VStack(alignment:.leading){
            Text("Upcoming trips")
                .font(Font.headline)
                .foregroundColor(Color.primary)

            ForEach(travel, id: \.id){ item in
                HStack{
                    RoundedRectangle(cornerRadius: 1)
                        .fill(item.reservation != nil ? Color.green : Color.red)
                        .frame(width: 2, height: 20)
                    Text(item.destination!).font(.callout)
                    Spacer()
                    Text(item.date!).font(.subheadline)
                        .foregroundColor(Color.secondary)

                }
                Divider()
            }

        }.padding()
    }
}

struct TWMediumView_Previews: PreviewProvider {
    static var previews: some View {
        TWMediumView(_travel: [Travel(id: 1, destination: "Mumbai", travelby: "Airplane", date: "15-Jul-2021", reservation: Reservation(id: 12, hotelName: "CodeCat hotel", stayFrom: "16-Jul-2021", stayTo: "10-Aug-2021", totalCost: 16000))])
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
