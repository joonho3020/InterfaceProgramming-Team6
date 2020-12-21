//
//  ContentView.swift
//  qwerty
//
//  Created by Joonho Hwangbo on 2020/11/23.
//

import SwiftUI

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
