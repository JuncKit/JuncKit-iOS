//
//  WaitingBusTextView.swift
//  JuncKit
//
//  Created by 박의서 on 2023/08/19.
//

import SwiftUI

enum WaitingBusState {
  case connecting
  case success
  case failure
}

struct WaitingBusTextView: View {
  @Binding var waitingBusState: WaitingBusState
  @Binding var min: Int
  
  var body: some View {
    switch(waitingBusState) {
    case .connecting:
      VStack(alignment: .leading, spacing: 0) {
        Text("버스기사님을\n연결하고 있어요")
          .font(.system(size: 40))
          .padding(.bottom, 22)
        Text("잠시만 기다려주세요")
          .font(.system(size: 24))
      }
    case .success:
      Text("\(min)분 뒤\n버스기사님이\n도착하신대요")
        .font(.system(size: 40))
    case .failure:
      Text("응답하신\n버스기사님이\n없어요")
        .font(.system(size: 40))
    }
  }
}

struct WaitingBusTextView_Previews: PreviewProvider {
  static var previews: some View {
    WaitingBusTextView(waitingBusState: .constant(.connecting), min: .constant(3))
  }
}
