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
        VStack {
            RawThumbPhotoView(imageUrl: photo.urls.thumb)
        }
    }
}

struct RawThumbPhotoView: View {
    @ObservedObject var url: ImageLoader
    var width: Float =  170
    var height: Float = 110

    init(imageUrl: String) {
        url = ImageLoader(imageUrl: imageUrl)
    }
    
    init(imageUrl: String, width: Float, height: Float){
        url = ImageLoader(imageUrl: imageUrl)
        self.width = width
        self.height = height
    }
    
    var body: some View {
        Image(uiImage: UIImage(data: url.data) ?? UIImage())
            .renderingMode(.original)
            .resizable()
            .frame(width: screenWidth/2-18, height: 150)

    }
}

