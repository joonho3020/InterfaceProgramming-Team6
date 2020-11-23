//
//  PhotoListView.swift
//  qwerty
//
//  Created by Joonho Hwangbo on 2020/11/23.
//

import Foundation


import Foundation
import SwiftUI
import Combine
import SDWebImageSwiftUI


struct PhotoView: View {
    var photo: Photo
    
    var body: some View {
        HStack{
            WebImage(url: URL(string: photo.urls.thumb))
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
        }
    }
}


struct PhotoListView: View {
    @EnvironmentObject var unsplashapi: UnSplashApi
    
    var body: some View {
        VStack {
            List(unsplashapi.photos) { photo in
                PhotoView(photo: photo)
                    .onAppear {
                        self.elementOnAppear(photo)
                    }
            }
        }
    }
    
    private func elementOnAppear(_ photo:Photo) {
        if self.unsplashapi.isLastPhoto(photo) {
            self.unsplashapi.loadMore()
        }
    }
}
