//
//  VideoView.swift
//  swiftbook UI
//
//  Created by Alexey on 05/04/2020.
//  Copyright © 2020 Alexey. All rights reserved.
//

import SwiftUI

struct VideoView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode> // <- DISMISS step #1
    @EnvironmentObject var channelData: ChannelData
    @Binding var videoTitle: String
    @Binding var videoDescription: String
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                    TextField("Video title", text: self.$videoTitle)
                    TextField("Video description", text: self.$videoDescription)
                    Divider()
                    Button(action: {
                        print("112")
                        self.presentationMode.wrappedValue.dismiss() // <- DISMISS step #2
                    }, label: {
                        Text("Dismiss this ViewController")
                    })
                    Spacer()
                }
                .padding()
                .navigationBarTitle("\(channelData.channelName)")
        }
    }
}
