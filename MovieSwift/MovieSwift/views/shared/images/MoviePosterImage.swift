//
//  MoviePosterImage.swift
//  MovieSwift
//
//  Created by Thomas Ricouard on 13/06/2019.
//  Copyright © 2019 Thomas Ricouard. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct MoviePosterImage: View {
    var path: String?
    var size: ImageService.Size
    var url: URL? {
        guard let poster = path else {
            return nil
        }
        return size.path(poster: poster)
    }
    let posterSize: PosterStyle.Size
    
    var body: some View {
        ZStack {
            WebImage(url: url, placeholder: ImageService.Placeholder.grey)
                .resizable()
                .renderingMode(.original)
                .posterStyle(loaded: true, size: posterSize)
                .animation(.easeInOut)
        }
    }
}
