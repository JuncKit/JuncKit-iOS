//
//  WaitingCallsList.swift
//  JuncKit
//
//  Created by 박의서 on 2023/08/19.
//

import SwiftUI

struct WaitingCallsList: View {
  @State private var isShowingWaitingCallView = false
  
    var body: some View {
      ZStack {
        Color.white
        VStack {
          HStack {
            Text("The current list\nof waiting calls")
              .font(.system(size: 36, weight: .semibold))
              .padding(.top, 36)
            Spacer()
          }
          Spacer()
          Button {
            isShowingWaitingCallView.toggle()
          } label: {
            Text("Button")
          }
        }
        .padding([.leading, .trailing], 24)
        if (isShowingWaitingCallView) {
          WaitingCallView(isShowingWaitingCallView: $isShowingWaitingCallView)
        }
      }
    }
}

struct WaitingCallsList_Previews: PreviewProvider {
    static var previews: some View {
        WaitingCallsList()
    }
}
