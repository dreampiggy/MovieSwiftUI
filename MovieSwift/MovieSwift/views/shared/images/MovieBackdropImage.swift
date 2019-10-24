//
//  MovieBackdropImage.swift
//  MovieSwift
//
//  Created by Thomas Ricouard on 08/07/2019.
//  Copyright © 2019 Thomas Ricouard. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieBackdropImage : View {
    enum DisplayMode {
        case background, normal
    }
    
    @State var displayMode: DisplayMode = .normal
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
            WebImage(url: url, placeholder: ImageService.Placeholder.grey)
                .resizable()
                .renderingMode(.original)
                .frame(width: 300, height: displayMode == .normal ? 168 : 50)
                .animation(.easeInOut)
        }
    }
}
