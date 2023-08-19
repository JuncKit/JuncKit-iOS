//
//  IntroView.swift
//  JuncKit
//
//  Created by 박의서 on 2023/08/19.
//

import SwiftUI

struct IntroView: View {
  private var categories = ["축하", "감사", "응원", "사랑", "재미"]
  
  @State var isFilledButton = false

  var body: some View {
    VStack(alignment: .leading) {
      Text("무엇을 기념하기 위한\n케이크인가요?")
        .font(.system(size: 28, weight: .bold))
        .padding(.top, 55)
      VStack(spacing: 16) {
        ForEach(categories, id: \.self) { category in
          CategoryButton(category: "\(category)")
        }
      }
        .padding(.top, 88)
      Spacer()
      Button {
        // action
      } label: {
        ZStack {
          RoundedRectangle(cornerRadius: 10)
            .frame(height: 64)
            .foregroundColor(.black)
          Text("BUTTON")
            .font(.system(size: 16))
            .foregroundColor(.white)
        }
      }
      .padding(.bottom, 22)
    }
    .padding([.leading, .trailing], 24)
  }
}

struct IntroView_Previews: PreviewProvider {
  static var previews: some View {
    IntroView()
  }
}
