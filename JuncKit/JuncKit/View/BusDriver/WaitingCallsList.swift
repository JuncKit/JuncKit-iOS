//
//  WaitingCallsList.swift
//  JuncKit
//
//  Created by 박의서 on 2023/08/19.
//

import SwiftUI

struct WaitingCallsList: View {
  @State var isShowingWaitingCallView = false
  @State var waitingCallList = ["8 Baesan-ro, Gijang-gun", "8 Baesan-ro, Gijang-gun", "8 Baesan-ro, Gijang-gun", "8 Baesan-ro, Gijang-gun", "8 Baesan-ro, Gijang-gun", "8 Baesan-ro, Gijang-gun", "8 Baesan-ro, Gijang-gun", "8 Baesan-ro, Gijang-gun"]
  var count = 0
  
  @State var isShowingGetCallView = false
  @Binding var isShowingCallList: Bool
  
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
                    isShowingGetCallView.toggle()
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
                  .padding(.bottom, 20)
                }.tint(.black)
              }
            }
//            .padding(.bottom, 10)
            VStack {
              Spacer()
              Image("opacityRectangle")
                .resizable()
                .frame(height:144)
                .ignoresSafeArea()
            }
            VStack {
              Spacer()
              HStack {
                Button {
                  isShowingCallList.toggle()
                } label: {
                  Image("backButton")
                }
                .padding(.bottom, 40)
                .padding(.leading, 24)
                Spacer()
              }
            }
          }
        }
        if (isShowingWaitingCallView) {
          WaitingCallView(isShowingWaitingCallView: $isShowingWaitingCallView)
            .padding([.leading], 24)
        }
        if (isShowingGetCallView) {
          GetCallView(isShowingGetCallView: $isShowingGetCallView)
        }
      }
    }
}

struct WaitingCallsList_Previews: PreviewProvider {
    static var previews: some View {
      WaitingCallsList( isShowingCallList: .constant(true))
    }
}
