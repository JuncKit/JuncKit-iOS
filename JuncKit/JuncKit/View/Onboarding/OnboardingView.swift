//
//  OnboardingView.swift
//  JuncKit
//
//  Created by 박의서 on 2023/08/19.
//

import SwiftUI

struct OnboardingView: View {
  var body: some View {
    NavigationView {
      VStack {
        Image("image") // TODO
          .padding([.top], 77)
          .padding([.leading, .trailing], 44)
        
        VStack(spacing: 28) {
          Button {
            // 탑승자 모드
          } label: {
            NavigationLink(destination: CallBusView()) {
              Text("탑승자 모드") // TODO
            }
          }
          Button {
            // 탑승자 모드
          } label: {
            Text("운전자 모드") // TODO
          }
        }
        .padding([.bottom], 72)
      }
    }
  }
}

struct OnboardingView_Previews: PreviewProvider {
  static var previews: some View {
    OnboardingView()
  }
}
