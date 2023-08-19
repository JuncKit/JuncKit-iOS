//
//  WaitingBusView.swift
//  JuncKit
//
//  Created by 박의서 on 2023/08/19.
//

import SwiftUI

struct WaitingBusView: View {
  @State var waitingBusState: WaitingBusState = .connecting
  @State var min = 3
  @Binding var isShowingWaitingBusView: Bool

  var body: some View {
    ZStack {
      Color.white
      switch(waitingBusState) {
      case .connecting:
        VStack {
          Spacer()
          Image("connectingBkg")
        }
      case .success:
        Image("JunckitBus")
      default:
        Color.white
      }
      VStack(spacing: 0) {
        HStack {
          WaitingBusTextView(waitingBusState: $waitingBusState, min: $min)
            .padding(.top, 56)
          Spacer()
        }
        Spacer()
        WaitingBusImageView(waitingBusState: $waitingBusState, isShowingWaitingBusView: $isShowingWaitingBusView)
      }
      .padding([.leading, .trailing], 24)
    }
  }
}

struct WaitingBusView_Previews: PreviewProvider {
  static var previews: some View {
    WaitingBusView(isShowingWaitingBusView: .constant(true))
  }
}
