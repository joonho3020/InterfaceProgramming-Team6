//
//  PhotoListView.swift
//  qwerty
//
//  Created by Joonho Hwangbo on 2020/11/23.
//

import Foundation
import SwiftUI
import Combine
import SDWebImageSwiftUI

struct PhotoListView: View {
    @EnvironmentObject var unsplashapi: UnSplashApi
    
    var body: some View {
        VStack(spacing: 20) {
            List(unsplashapi.photoGrid) { photoRow in
                HStack(alignment:.top, spacing: 20) {
                    if photoRow.row.count > 1 {
                        PhotoView(photo: photoRow.row[0])
                        PhotoView(photo: photoRow.row[1])
                    }
                }.onAppear(perform: {self.unsplashapi.lastElementCheck(id:photoRow.id)}).listRowInsets(EdgeInsets(top:0, leading: 0, bottom: 0, trailing: 0)).frame(minHeight: 110)
                }
        }
    }
    
    private func elementOnAppear(_ photo:Photo) {
      if self.unsplashapi.isLastPhoto(photo) {
          self.unsplashapi.loadMore()
      }
  }
}
