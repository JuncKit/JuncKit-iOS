//
//  CategoryButton.swift
//  JuncKit
//
//  Created by 박의서 on 2023/08/19.
//

import SwiftUI

struct CategoryButton: View {
  @State var category: String
  @State var isFilledButton = false
  
    var body: some View {
      Button {
        isFilledButton.toggle()
      } label: {
        ZStack {
          Image(isFilledButton ? "categoryButton_fill" : "categoryButton")
          Text("\(category)")
            .font(.system(size: 16))
            .foregroundColor(.black)
        }
      }
    }
}

struct CategoryButton_Previews: PreviewProvider {
    static var previews: some View {
      CategoryButton(category: "사랑")
    }
}
