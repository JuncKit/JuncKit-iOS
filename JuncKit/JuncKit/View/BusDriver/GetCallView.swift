//
//  GetCallView.swift
//  JuncKit
//
//  Created by 박의서 on 2023/08/19.
//

import SwiftUI

struct GetCallView: View {
  @State var callstate = "Pending Call"
  @State var distance = 5
  @State var min = 3
  @State var centerName = "Hoeryong Village\nCommunity Center"
  @State var address = "8 Baesan-ro, Gijang-gun,\nBusan Metropolitan City"
  @State var isShowingDestinationInfoView = false
  
  @Binding var isShowingGetCallView: Bool
  
  var body: some View {
    ZStack {
      Color.white
      VStack(spacing: 0) {
        HStack {
          Text("\(callstate)")
            .font(.system(size: 36, weight: .semibold))
            .padding(.top, 56)
            .padding(.bottom, 78)
          Spacer()
        }
        .padding([.leading], 24)
        ZStack {
          Image("callFrame")
          VStack {
            HStack(spacing: 12) {
              Text("\(distance)km")
                .font(.system(size: 24))
                .foregroundColor(.mainGreen)
                .padding([.top, .bottom], 4)
                .padding([.leading, .trailing], 12)
                .background(
                  RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.mainGreen, lineWidth: 1)
                )
              
              Text("\(min)mins")
                .font(.system(size: 24))
                .foregroundColor(.mainGreen)
                .padding([.top, .bottom], 4)
                .padding([.leading, .trailing], 12)
                .background(
                  RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.mainGreen, lineWidth: 1)
                )
            }
            .padding(.bottom, 28)
            Text("\(centerName)")
              .font(.system(size: 32))
              .multilineTextAlignment(.center)
              .padding(.bottom, 16)
            Text("\(address)")
              .font(.system(size: 24))
              .foregroundColor(.black.opacity(0.4))
              .multilineTextAlignment(.center)
          }
          .padding([.leading, .trailing], 32)
        }
        Spacer()
        Button {
          isShowingDestinationInfoView.toggle()
        } label: {
          Text("Get the call")
            .font(.system(size: 28, weight: .semibold))
        }
        .buttonStyle(MainButtonStyle())
        .padding(.bottom, 24)
        Button {
          isShowingGetCallView.toggle()
        } label: {
          Text("Skip")
            .font(.system(size: 24))
            .foregroundColor(.black.opacity(0.4))
            .underline()
        }
        .padding(.bottom, 38)
      }

    }
    if (isShowingDestinationInfoView) {
      DestinationInfoView()
    }
  }
}

struct GetCallView_Previews: PreviewProvider {
  static var previews: some View {
    GetCallView(isShowingGetCallView: .constant(true))
  }
}
