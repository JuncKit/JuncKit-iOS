//
//  HomeTabView.swift
//  JuncKit
//
//  Created by 박의서 on 2023/08/19.
//

import SwiftUI

struct HomeTabView: View {
  init() {
    UITabBar.appearance().backgroundColor = .white
  }
  
  var body: some View {
    TabView() {
      ShopListView()
        .tabItem { VStack {
          Image(systemName: "birthday.cake.fill")
          Text("매장/디자인")
        }}
      Text("Tab Content 2")
        .tabItem { VStack {
          Image(systemName: "list.bullet.clipboard.fill")
          Text("주문제작 현황")
        } }
      Text("Tab Content 2")
        .tabItem { VStack {
          Image(systemName: "person.fill")
          Text("나의 주문기록")
        }  }
    }.tint(.black)
  }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}
