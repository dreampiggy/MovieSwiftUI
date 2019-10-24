//
//  FullscreenMoviePosterImage.swift
//  MovieSwift
//
//  Created by Thomas Ricouard on 06/08/2019.
//  Copyright © 2019 Thomas Ricouard. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct FullscreenMoviePosterImage: View {
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
            ZStack {
                GeometryReader { geometry in
                    WebImage(url: self.url)
                        .resizable()
                        .blur(radius: 50)
                        .overlay(Color.black.opacity(0.5))
                        .frame(width: geometry.frame(in: .global).width,
                               height: geometry.frame(in: .global).height)
                }
            }.edgesIgnoringSafeArea(.all)
        }
    }
}
