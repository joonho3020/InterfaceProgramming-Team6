//
//  ThumbPhotoView.swift
//  qwerty
//
//  Created by Joonho Hwangbo on 2020/12/15.
//

import Foundation
import SwiftUI
import Combine
import SDWebImageSwiftUI

public var screenWidth: CGFloat {
    return UIScreen.main.bounds.width
}
public var screenHeight: CGFloat {
    return UIScreen.main.bounds.height
}

struct ThumbPhotoView: View {
    var photo: Photo
    var body: some View {
//        VStack {
//            RawThumbPhotoView(imageUrl: photo.urls.thumb)
//        }
        RawThumbPhotoView(photo: photo)
    }
}

struct RawThumbPhotoView: View {
    @State var photo: Photo
    
    var body: some View {
        AnimatedImage(url: URL(string: photo.urls.thumb))
            .renderingMode(.original)
            .resizable()
            .padding(3)
            .frame(width: screenWidth/2-18, height: 150)

    }
}

