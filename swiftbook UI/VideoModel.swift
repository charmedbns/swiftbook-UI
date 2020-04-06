//
//  VideoModel.swift
//  swiftbook UI
//
//  Created by Alexey on 05/04/2020.
//  Copyright © 2020 Alexey. All rights reserved.
//

import Combine

final class VideoModel: ObservableObject {
    @Published var title: String = ""
    @Published var description: String = ""
}
