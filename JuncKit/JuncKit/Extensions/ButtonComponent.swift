//
//  ButtonComponent.swift
//  JuncKit
//
//  Created by 박의서 on 2023/08/19.
//

import SwiftUI

struct MainButtonStyle: ButtonStyle {
  @State var fontSize: CGFloat = 24
  @State private var pressed = false
  
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .font(.system(size: fontSize, weight: .semibold))
      .foregroundColor(.white)
      .padding([.top, .bottom], 24)
      .frame(maxWidth: .infinity)
      .background(RoundedRectangle(cornerRadius: 10)
        .fill(Color.mainGreen)
        .padding([.leading, .trailing], 25))
  }
  
  //         configuration.label
//    .font(.system(size: fontSize, weight: .bold))
//    .foregroundColor(.white)
//    .padding()
//    .frame(minWidth: 0, maxWidth: .infinity)
//    .foregroundColor(.white)
//    .background(RoundedRectangle(cornerRadius: 12.0).fill(Color.bunnyColor)
//
//    )
}
