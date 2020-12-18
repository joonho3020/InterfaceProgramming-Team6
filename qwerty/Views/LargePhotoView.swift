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
        VStack{
            RawLargePhotoView(imageUrl: photo.urls.full)
        }
    }
}

struct RawLargePhotoView: View {
    @ObservedObject var url: ImageLoader
    @State var scale: CGFloat = 1.0
    
    var width: Float?
    var height: Float?
    
    init(imageUrl: String){
        url = ImageLoader(imageUrl: imageUrl)
    }
    
    init(imageUrl: String, width: Float, height: Float){
        url = ImageLoader(imageUrl: imageUrl)
        self.width = width
        self.height = height

    }
    
    var body: some View {
        Image(uiImage: UIImage(data: url.data) ?? UIImage())
            .resizable()
            .scaleEffect(scale)
            .scaledToFill()
            /*.contextMenu {
                Button(action:  {
                    
                     SDWebImageDownloader().downloadImage(with: URL(string: )) { (image, _, _, _) in
                     
                     UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
                     }
                     
                     
                    
                }) {
                    HStack {
                        Text("Save")
                        Spacer()
                        Image(systemName: "square.and.arrow.down.fill")
                    }
                    .foregroundColor(.black)
                }
            } */
    }

}

