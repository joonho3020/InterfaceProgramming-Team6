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
                SearchView()
                Spacer()
                PhotoListView()
            }.navigationBarTitle(Text("Photo Viewer"))
        }

    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
