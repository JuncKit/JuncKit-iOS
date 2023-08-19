//
//  WaitingCallsList.swift
//  JuncKit
//
//  Created by 박의서 on 2023/08/19.
//

import SwiftUI

struct WaitingCallsList: View {
    var body: some View {
      VStack {
        HStack {
          Text("The current list\nof waiting calls")
            .font(.system(size: 36, weight: .semibold))
            .padding(.top, 36)
          Spacer()
        }
      }
      .padding([.leading, .trailing], 24)
    }
}

struct WaitingCallsList_Previews: PreviewProvider {
    static var previews: some View {
        WaitingCallsList()
    }
}
