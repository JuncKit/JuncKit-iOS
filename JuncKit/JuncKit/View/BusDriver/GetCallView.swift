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
  @State var address = "Busan\nMetropolitan City,\nGijang County"
  
  @Binding var isShowingGetCallView: Bool
  
  var body: some View {
    ZStack {
      Color.white
      VStack(spacing: 0) {
        Text("\(callstate)")
          .font(.system(size: 36))
          .multilineTextAlignment(.leading)
          .padding(.top, 97)
          .padding(.bottom, 24)
        ZStack {
          Image("callFrame")
          VStack {
              HStack(spacing: 12) {
                  Text("\(distance)km")
                      .font(.system(size: 24))
                      .foregroundColor(.green.opacity(0.6))
                      .padding(8.0)
                      .background(
                          RoundedRectangle(cornerRadius: 25)
                              .stroke(Color.green, lineWidth: 2)
                      )

                  Text("\(min)mins")
                      .font(.system(size: 24))
                      .foregroundColor(.green.opacity(0.6))
                      .padding(8.0)
                      .background(
                          RoundedRectangle(cornerRadius: 25)
                              .stroke(Color.green, lineWidth: 2)
                      )
              }.padding(.bottom, 36)
            Text("\(address)")
              .font(.system(size: 32))
              .multilineTextAlignment(.center)
          }
          .padding([.leading, .trailing], 32)
        }
        Spacer()
        Button {
          
        } label: {
          Text("Get the call")
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
      .padding([.leading, .trailing], 24)
    }
  }
}

struct GetCallView_Previews: PreviewProvider {
    static var previews: some View {
      GetCallView(isShowingGetCallView: .constant(true))
    }
}
