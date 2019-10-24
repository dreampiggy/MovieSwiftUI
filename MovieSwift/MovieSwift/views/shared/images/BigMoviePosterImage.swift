//
//  BigMoviePosterImage.swift
//  MovieSwift
//
//  Created by Thomas Ricouard on 22/06/2019.
//  Copyright © 2019 Thomas Ricouard. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct BigMoviePosterImage : View {
    var path: String?
    var size: ImageService.Size
    var url: URL? {
        guard let poster = path else {
            return nil
        }
        return size.path(poster: poster)
    }
    
    var body: some View {
        ZStack(alignment: .center) {
            WebImage(url: url)
                .resizable()
                .renderingMode(.original)
                .posterStyle(loaded: true, size: .big)
                .animation(.spring())
        }
    }
}
