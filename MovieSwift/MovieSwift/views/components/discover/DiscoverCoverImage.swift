//
//  DiscoverCoverImage.swift
//  MovieSwift
//
//  Created by Thomas Ricouard on 19/06/2019.
//  Copyright © 2019 Thomas Ricouard. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct DiscoverPosterStyle: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .aspectRatio(0.66, contentMode: .fit)
            .frame(maxWidth: 245)
            .cornerRadius(5)
    }
}

extension View {
    func discoverPosterStyle() -> some View {
        return ModifiedContent(content: self, modifier: DiscoverPosterStyle())
    }
}

struct DiscoverCoverImage : View {
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
            WebImage(url: url, placeholder: ImageService.Placeholder.clear)
                .resizable()
                .renderingMode(.original)
                .discoverPosterStyle()
        }
    }
}

