//
//  OnboardingView.swift
//  JuncKit
//
//  Created by 박의서 on 2023/08/19.
//

import SwiftUI

struct OnboardingView: View {
  @State var isShowingCallList = false
  @State var isStartPassengerMode = false
  @State var isPresentCalls = true
  
  var body: some View {
    NavigationView {
      VStack {
        
        Image("JunckitBus")
        Text("Select a button")
              .font(.system(size: 24))
              .foregroundColor(.black.opacity(0.4))
        Image("image") // TODO
          .padding([.top], 77)
          .padding([.leading, .trailing], 44)
        
        VStack(spacing: 28) {
          Button {
            // 탑승자 모드
          } label: {
            NavigationLink(destination: CallBusView(isStartPassengerMode: $isStartPassengerMode).navigationBarBackButtonHidden(), isActive: $isStartPassengerMode) {
              Text("Passenger Mode")
            }
          }
          .buttonStyle(MainButtonStyle())
          Button {
            // 탑승자 모드
          } label: {
            NavigationLink(destination: WaitingCallsList(isShowingCallList: $isShowingCallList).navigationBarBackButtonHidden(), isActive: $isShowingCallList) {
              Text("Driver Mode")
            }
          }
          .buttonStyle(MainButtonStyle())
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
