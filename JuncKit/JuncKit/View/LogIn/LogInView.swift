//
//  LogInView.swift
//  JuncKit
//
//  Created by 박의서 on 2023/08/19.
//

import SwiftUI

struct LogInView: View {
  @State var isSuccessLogIn = false
  
  var body: some View {
    ZStack {
      AppleSigninButton(isSuccessLogIn: $isSuccessLogIn)
      if (isSuccessLogIn) {
        ContentView()
      }
    }
    .frame(height:UIScreen.main.bounds.height)
    .background(Color.white)
  }
  
}

struct LogInView_Previews: PreviewProvider {
  static var previews: some View {
    LogInView()
  }
}