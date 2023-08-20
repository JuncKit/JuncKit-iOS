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
  case complete
}

struct WaitingBusTextView: View {
  @Binding var waitingBusState: WaitingBusState
  @Binding var min: Int
  
  var body: some View {
    switch(waitingBusState) {
    case .connecting:
      VStack(alignment: .leading, spacing: 0) {
        Text("Connecting\nto a driver ...")
          .font(.system(size: 36, weight: .semibold))
          .padding(.bottom, 22)
        Text("Wait for a minute, please")
          .font(.system(size: 24))
          .foregroundColor(.black.opacity(0.4))
      }
      .onAppear {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
          waitingBusState = .failure
        }
      }
    case .success:
      Text("The driver's\ngoing to arrive in\n\(min)mins.")
        .font(.system(size: 36, weight: .semibold))
        .onAppear {
          DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            waitingBusState = .complete
          }
        }
    case .failure:
      Text("There's no\navailable driver\nright now")
        .font(.system(size: 36, weight: .semibold))
        .padding(.leading, 24)
    case .complete:
      Text("The driver\nhas arrived!")
        .font(.system(size: 36, weight: .semibold))
        .padding(.leading, 24)
    }
  }
}

struct WaitingBusTextView_Previews: PreviewProvider {
  static var previews: some View {
    WaitingBusTextView(waitingBusState: .constant(.connecting), min: .constant(3))
  }
}
