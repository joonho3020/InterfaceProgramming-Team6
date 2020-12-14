//
//  PhotoView.swift
//  qwerty
//
//  Created by Joonho Hwangbo on 2020/12/15.
//

import Foundation
import SwiftUI
import Combine
import SDWebImageSwiftUI


struct PhotoView: View {
    var photo: Photo
    var show: Bool = true
    @State var selection: String? = nil
    
    var body: some View {
        VStack {
            if(self.show) {
                NavigationLink(destination: LargePhotoView(photo:photo), tag:self.photo.id, selection: self.$selection) {
                    EmptyView()
                }.frame(width: 0, height: 0)
                 .hidden()
                
                Button(action: {
                    self.selection = self.photo.id
                }) {
                    ThumbPhotoView(photo: photo)
                }.buttonStyle(PlainButtonStyle())
            } else {
                EmptyView()
            }
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 110, alignment: .center)
        .padding(8)
    }
}
