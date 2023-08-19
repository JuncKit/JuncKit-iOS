//
//  ContentView.swift
//  JuncKit
//
//  Created by 박의서 on 2023/08/19.
//

import SwiftUI
import Alamofire

struct ShopListView: View {
  @State var message = ""
  
  var body: some View {
    ZStack {
      Color.red
      Text("\(message)")
        .foregroundColor(.green)
    }
    .ignoresSafeArea()
    .task { // .task? .onAppear?
      getShopList()
    }
  }
}

extension ShopListView {
  private func getShopList() { // responseJSON -> responseString
    AF.request(APIEnvironment.serverUrl+"/demo").responseString() { response in
      switch response.result {
      case .success:
        if let data = try! response.result.get() as? String {
          self.message = data
        }
      case .failure(let error):
        print("Error: \(error)")
        return
      }
    }
  }
}

struct ShopListView_Previews: PreviewProvider {
  static var previews: some View {
    ShopListView()
  }
}
