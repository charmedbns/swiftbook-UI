//
//  ContentView.swift
//  swiftbook UI
//
//  Created by Alexey on 05/04/2020.
//  Copyright © 2020 Alexey. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingVideoView = false
    
    @ObservedObject var videoData = VideoModel()
    
    @EnvironmentObject var channelData: ChannelData
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                GeometryReader { geometry in
                    HStack(spacing: 20) /* <--- Расстояние между элементами */ {
                        NavigationLink(destination: ChannelView(), label: {
                            Text("Edit channel")
                        })
                            .frame(width: geometry.size.width / 2 - 10, height: 50) // <- Размер в пространстве
                            .accentColor(Color(AppColors.pink)) // <- Цвет текста
                            .background(Color(AppColors.grey)) // <- Цвет фона
                            .cornerRadius(10) // <- Скругление рамок
                        Button(action: {
                            self.showingVideoView.toggle() // <- Переключение (например: true/false)
                        }, label: {
                            Text("Edit content")
                        })
                            .sheet(isPresented: self.$showingVideoView, content: { VideoView(videoTitle: self.$videoData.title, videoDescription: self.$videoData.description)
                                .environmentObject(self.channelData) }) // <- Показ экрана
                            .frame(width: geometry.size.width / 2 - 10, height: 50)
                            .accentColor(Color(AppColors.pink))
                            .background(Color(AppColors.grey))
                            .cornerRadius(10)
                    }
                }
                .padding() // <- Отступы
                .frame(height: 50)
                Divider() // <- Разделительная черта/Сепаратор
                HStack {
                    Image(systemName: "hare")
                        .resizable() // <- Возможность изменять размер
                        .frame(width: 60, height: 50) // <- Указание размера
                        .foregroundColor(Color(AppColors.rabbit)) // <- Цвет изображения(systemSymbols)
                    VStack(alignment: .leading) {
                        Text("Title: \(videoData.title)!")
                            .font(.title)
                        Text("Description: \(videoData.description)!")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }.padding()
                Spacer()
            }
            .navigationBarTitle("\(channelData.channelName)")
        }
    }
}
