//
//  ChannelView.swift
//  swiftbook UI
//
//  Created by Alexey on 05/04/2020.
//  Copyright © 2020 Alexey. All rights reserved.
//

import SwiftUI

struct ChannelView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @EnvironmentObject var channelData: ChannelData
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                TextField("Channel Name", text: $channelData.channelName)
                Divider()
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Dismiss this ViewController")
                })
                Spacer()
            }.padding()
        }
        .navigationBarTitle("\(channelData.channelName)")
    }
}

struct ChannelView_Previews: PreviewProvider {
    static var previews: some View {
        ChannelView()
    }
}
