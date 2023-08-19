//
//  WaitingCallsList.swift
//  JuncKit
//
//  Created by 박의서 on 2023/08/19.
//

import SwiftUI

struct WaitingCallsList: View {
  @State private var isShowingWaitingCallView = false
  @State private var waitingCallList = ["8 Baesan-ro, Gijang-gun", "8 Baesan-ro, Gijang-gun", "8 Baesan-ro, Gijang-gun", "8 Baesan-ro, Gijang-gun", "8 Baesan-ro, Gijang-gun", "8 Baesan-ro, Gijang-gun", "8 Baesan-ro, Gijang-gun", "8 Baesan-ro, Gijang-gun"]
  private var count = 0
  
    var body: some View {
      ZStack {
        Color.white
        VStack {
          HStack {
            Text("The current list\nof waiting calls")
              .font(.system(size: 36, weight: .semibold))
              .padding(.top, 36)
              .padding(.leading, 24)
            Spacer()
          }
          .padding(.bottom, 80)
          ZStack {
            ScrollView {
              ForEach(0..<waitingCallList.count, id: \.self) { index in
                HStack(spacing: 0) {
                  Button {
                    // action
                  } label: {
                    Text("\(index+1)")
                      .font(.system(size: 16))
                      .foregroundColor(.black.opacity(0.4))
                      .padding(.trailing, 24)
                    Text("\(waitingCallList[index])")
                      .font(.system(size: 20, weight: .semibold))
                      .padding(.trailing, 46)
                    Image("rightGreenButton")
                  }
                  .padding(.bottom, 32)
                }.tint(.black)
              }
            }
            .padding(.bottom, 100)
            VStack {
              Spacer()
              Image("opacityRectangle")
                .ignoresSafeArea()
            }
          }
          HStack {
            Button {
              isShowingWaitingCallView.toggle()
            } label: {
              Image("backButton")
            }
            .padding(.bottom, 40)
            .padding(.leading, 24)
            Spacer()
          }
        }
        .padding([.leading, .trailing], 24)
        if (isShowingWaitingCallView) {
          WaitingCallView(isShowingWaitingCallView: $isShowingWaitingCallView)
            .padding([.leading], 24)
        }
      }
    }
}

struct WaitingCallsList_Previews: PreviewProvider {
    static var previews: some View {
        WaitingCallsList()
    }
}
