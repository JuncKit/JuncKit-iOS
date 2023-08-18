//
//  ContentView.swift
//  JuncKit
//
//  Created by 박의서 on 2023/08/19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      ZStack {
        Color.red
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
          .foregroundColor(.green)
      }
      .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
