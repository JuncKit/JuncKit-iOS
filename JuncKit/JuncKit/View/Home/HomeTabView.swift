//
//  HomeTabView.swift
//  JuncKit
//
//  Created by 박의서 on 2023/08/19.
//

import SwiftUI

struct HomeTabView: View {
  init() {
    UITabBar.appearance().backgroundColor = UIColor.white
  }
  
  var body: some View {
    TabView() {
      ShopListView()
        .tabItem { /*@START_MENU_TOKEN@*/Text("Tab Label 1")/*@END_MENU_TOKEN@*/ }
      Text("Tab Content 2")
        .tabItem { /*@START_MENU_TOKEN@*/Text("Tab Label 2")/*@END_MENU_TOKEN@*/ }
      Text("Tab Content 2")
        .tabItem { /*@START_MENU_TOKEN@*/Text("Tab Label 2")/*@END_MENU_TOKEN@*/ }
    }
  }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}
