//
//  ContentView.swift
//  qwerty
//
//  Created by Joonho Hwangbo on 2020/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            SearchView()
            Spacer()
            PhotoListView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
