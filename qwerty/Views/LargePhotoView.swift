//
//  LargePhotoView.swift
//  qwerty
//
//  Created by Joonho Hwangbo on 2020/12/15.
//

import Foundation
import SwiftUI
import Combine
import SDWebImageSwiftUI

struct LargePhotoView: View {
    var photo: Photo
    var body: some View {
        RawLargePhotoView(photo: photo)
    }
}

struct RawLargePhotoView: View {
    @State var photo: Photo
    @State var scale: CGFloat = 1.0
    @State var savePhoto: Bool = false
    
    var body: some View {
        VStack(alignment:.center) {
            AnimatedImage(url: URL(string: photo.urls.full))
                .resizable()
                .scaleEffect(scale)
                .scaledToFill()
            
            Spacer()
            
            Button(action: {
                SDWebImageDownloader().downloadImage(with: URL(string: photo.urls.small)) { (image, _, _, _) in
                          UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
                      }
                    self.savePhoto = true
            }) {
                  HStack{
                      Spacer()
                      Text("Save")
                      Image(systemName: "square.and.arrow.down.fill")
                  }
            }
            .alert(isPresented: $savePhoto) {
                () -> Alert in
                return Alert(title: Text("Image Saved"),
                             message: Text("thank you!\n"),
                            dismissButton:
                            .default(Text("back")) {}
                        )
            }
            .background(Image("Button"), alignment: .center)
            .frame(width: 100.0, height: 37.0, alignment: .center)
        }

    }
}
