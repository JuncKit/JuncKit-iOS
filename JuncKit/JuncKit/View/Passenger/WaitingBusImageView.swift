//
//  WaitingBusImageView.swift
//  JuncKit
//
//  Created by 박의서 on 2023/08/19.
//

import SwiftUI

struct WaitingBusImageView: View {
  @Binding var waitingBusState: WaitingBusState
  @Binding var isShowingWaitingBusView: Bool
  @Binding var isStartPassengerMode: Bool
  
  var body: some View {
    switch(waitingBusState) {
    case .connecting:
      HStack {
        Button {
          isShowingWaitingBusView.toggle()
        } label: {
          Image("backButton")
        }
        Spacer()
      }
    case .success:
      Image("success")
        .padding(.bottom, 97)
    case .failure:
      VStack(spacing: 0) {
        Text("Could you please call\nthe driver again?")
          .font(.system(size: 24))
          .foregroundColor(.black.opacity(0.4))
          .multilineTextAlignment(.center)
          .padding(.bottom, 14)
        Image("failureBus")
          .padding(.bottom, 33)
        Button {
          waitingBusState = .connecting
        } label: {
          Text("Call Bus Again")
        }
        .buttonStyle(MainButtonStyle())
        .padding(.bottom, 24)
        Button {
          isShowingWaitingBusView.toggle()
        } label: {
          Text("Go Home")
            .font(.system(size: 24))
            .foregroundColor(.black.opacity(0.4))
            .underline()
        }
        .padding(.bottom, 38)

      }
    case .complete:
      VStack(spacing: 0) {
        Image("arrivedBus")
          .padding(.bottom, 74)
        Button {
          isShowingWaitingBusView.toggle()
          isStartPassengerMode.toggle()
        } label: {
          Text("Boarding complete")
        }.buttonStyle(MainButtonStyle())
          .padding(.bottom, 40)
      }

    }
  }
}

struct WaitingBusImageView_Previews: PreviewProvider {
    static var previews: some View {
      WaitingBusImageView(waitingBusState: .constant(.complete), isShowingWaitingBusView: .constant(true), isStartPassengerMode: .constant(true))
    }
}
