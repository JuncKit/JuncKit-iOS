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

  var body: some View {
    ZStack {
      Color.white
      VStack(spacing: 0) {
        HStack {
          WaitingBusTextView(waitingBusState: $waitingBusState, min: $min)
            .padding(.top, 56)
          Spacer()
        }
        Spacer()
        WaitingBusImageView(waitingBusState: $waitingBusState)
      }
      .padding([.leading, .trailing], 24)
    }
    .onAppear {
      DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        waitingBusState = .failure
      }
    }
  }
}

struct WaitingBusView_Previews: PreviewProvider {
  static var previews: some View {
    WaitingBusView()
  }
}
