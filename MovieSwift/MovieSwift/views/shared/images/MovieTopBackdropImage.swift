//
//  MovieBackdropImage.swift
//  MovieSwift
//
//  Created by Thomas Ricouard on 16/06/2019.
//  Copyright © 2019 Thomas Ricouard. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieTopBackdropImage : View {
    var path: String?
    var size: ImageService.Size
    var url: URL? {
        guard let poster = path else {
            return nil
        }
        return size.path(poster: poster)
    }

    @Binding var isExpanded: Bool
    
    var forceBlur: Bool = false
    var fill: Bool = false
    var height: CGFloat = 250
    
    private let threeshold: CGFloat = 50
    private let maxBlur: CGFloat = 100
    
    func blurFor(minY: CGFloat) -> CGFloat {
        if isExpanded {
            return 0
        }
        
        if threeshold - minY > maxBlur {
            return maxBlur
        }
        
        return threeshold - minY
    }
        
    var body: some View {
        ZStack {
            ZStack {
                GeometryReader { geometry in
                    WebImage(url: self.url, placeholder: ImageService.Placeholder.grey)
                        .resizable()
                        .blur(radius: self.forceBlur ? 50 : self.blurFor(minY: geometry.frame(in: .global).minY),
                              opaque: false)
                        .aspectRatio(contentMode: self.isExpanded ||
                            self.blurFor(minY: geometry.frame(in: .global).minY) <= 0 ? .fit : .fill)
                        .opacity(1)
                        .animation(.easeInOut)
                        .onTapGesture {
                            self.isExpanded.toggle()
                        }
                    }
                }
                .frame(maxHeight: fill ? 50 : height)
        }
    }
}
