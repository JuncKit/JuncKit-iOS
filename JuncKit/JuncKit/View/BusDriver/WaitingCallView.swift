//
//  WaitingCallView.swift
//  JuncKit
//
//  Created by 박의서 on 2023/08/19.
//

import SwiftUI

struct WaitingCallView: View {
  @Binding var isShowingWaitingCallView: Bool
  @State var isShowingGetCallView = false
  
    var body: some View {
      ZStack {
        Color.white
        VStack {
          HStack {
            Text("Waiting\nfor the call")
              .font(.system(size: 36, weight: .semibold))
              .padding(.top, 36)
            Spacer()
          }
          Spacer()
          Button {
            isShowingWaitingCallView.toggle()
          } label: {
            HStack {
              Image("backButton")
              Spacer()
            }
          }
        }
        .padding([.leading, .trailing], 24)
        .onAppear {
          DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isShowingGetCallView.toggle()
          }
        }
        if isShowingGetCallView {
          GetCallView(isShowingGetCallView: $isShowingGetCallView)
            .onDisappear {
              DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                isShowingGetCallView.toggle()
              }
            }
        }
      }
    }
}

struct WaitingCallView_Previews: PreviewProvider {
    static var previews: some View {
      WaitingCallView(isShowingWaitingCallView: .constant(true))
    }
}
