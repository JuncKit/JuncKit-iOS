//
//  SetTimeView.swift
//  JuncKit
//
//  Created by 박의서 on 2023/08/19.
//

import SwiftUI

struct SetTimeView: View {
  @State private var startDate = Date()
  @State private var endDate = Date()
  @State private var isShowingAlert = false
  
    var body: some View {
      VStack(spacing: 0) {
        HStack {
          Text("오늘 하루동안\n운영가능한 시간을\n알려주세요")
            .font(.system(size: 40))
            .padding([.top], 33)
          Spacer()
        }
        .padding([.leading, .trailing], 24)
        HStack {
          DatePicker("", selection: $startDate, displayedComponents: .hourAndMinute)
            .labelsHidden()
          Text("부터")
        }
        HStack {
          DatePicker("", selection: $endDate, displayedComponents: .hourAndMinute)
            .labelsHidden()
            .onChange(of: endDate) { time in
              if (time <= startDate) {
                isShowingAlert.toggle()
              }
            }
          Text("까지")
        }
        Spacer()
        Button {
          // 콜 받기
        } label: {
          Text("콜 받기")
        }
        .buttonStyle(MainButtonStyle())
        .padding([.bottom], 30)
      }
    }
}

struct SetTimeView_Previews: PreviewProvider {
    static var previews: some View {
        SetTimeView()
    }
}
