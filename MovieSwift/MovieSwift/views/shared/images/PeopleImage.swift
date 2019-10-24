//
//  PeopleImage.swift
//  MovieSwift
//
//  Created by Thomas Ricouard on 06/07/2019.
//  Copyright © 2019 Thomas Ricouard. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct PeopleImage : View {
    var path: String?
    var size: ImageService.Size
    var url: URL? {
        guard let poster = path else {
            return nil
        }
        return size.path(poster: poster)
    }
    
    var body: some View {
        ZStack {
            WebImage(url: url)
                .resizable()
                .renderingMode(.original)
                .cornerRadius(10)
                .frame(width: 60, height: 90)
        }
    }
}


struct BigPeopleImage : View {
    var path: String?
    var size: ImageService.Size
    var url: URL? {
        guard let poster = path else {
            return nil
        }
        return size.path(poster: poster)
    }
    
    var body: some View {
        ZStack {
            WebImage(url: url)
                .resizable()
                .renderingMode(.original)
                .cornerRadius(10)
                .frame(width: 100, height: 150)
        }
    }
}
