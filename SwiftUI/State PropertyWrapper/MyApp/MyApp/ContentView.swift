//
//  ContentView.swift
//  MyApp
//
//  Created by CodeCat15 on 9/6/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import SwiftUI

/*hey there thank you so much for stopping by and downloading the code, I hope the video was helpful. If you have any questions then please feel free to ask and if you are new to the channel then I request you to please subscribe and share this channel with your iOS group

 `CodeCat15 */

struct ContentView: View {

    @State private var playStatus : String = "Not playing"
    @State private var isPlaying: Bool = false

    var body: some View {

        VStack{
            Image(systemName: "music.note")
                .resizable()
                .frame(width: 300, height: 300, alignment: .topLeading)
                .background(Color.gray.opacity(0.5))
                .cornerRadius(15.0)

            Text(self.playStatus)
                .font(.title)
                .frame(maxWidth: 350, alignment: .leading)
                .padding(30)

            HStack(alignment: .center, spacing: 70){
                Button(action:{
                    debugPrint("Backward button tapped")
                }){
                    Image(systemName: "backward")
                        .resizable()
                        .frame(width: 60, height: 60, alignment: .center)
                }

                Button(action:{
                    self.isPlaying.toggle()
                    self.playStatus = self.isPlaying ? "Playing" : "Not playing"
                }){
                    Image(systemName: self.isPlaying ? "pause" : "play")
                        .resizable()
                        .frame(width: 60, height: 60, alignment: .center)
                }

                Button(action:{
                    debugPrint("Forward button tapped")
                }){
                    Image(systemName: "forward")
                        .resizable()
                        .frame(width: 60, height: 60, alignment: .center)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
