//
//  ContentView.swift
//  qwerty
//
//  Created by Joonho Hwangbo on 2020/11/23.
//

import SwiftUI
import UIKit

var bounds = UIScreen.main.bounds
var screenwidth = bounds.size.width //화면 너비
var screenheight = bounds.size.height //화면 높이

struct ContentView: View {
    
    var body: some View {
        NavigationView{
            VStack {
//                Text("Photoviewer")
//                    .bold()
//                    .font(.largeTitle)
//                    .padding(.top, 30)
//                    .padding(.trailing, 120)
//                    .padding(.bottom, 10)
                SearchView()
                //Spacer()
                PhotoListView()
            }.navigationBarTitle(Text("PhotoViewer"))
            .background(Image("flower2"), alignment: .leading)
        }//.frame(width: screenwidth, height: 170, alignment: .center)
////            VStack {
////                PhotoListView()
////
////            }

    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
