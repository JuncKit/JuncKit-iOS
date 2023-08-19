//
//  WaitingBusImageView.swift
//  JuncKit
//
//  Created by 박의서 on 2023/08/19.
//

import SwiftUI

struct WaitingBusImageView: View {
  @Binding var waitingBusState: WaitingBusState
  
  var body: some View {
    switch(waitingBusState) {
    case .connecting:
      Image("connecting")
        .padding(.bottom, 97)
    case .success:
      Image("success")
        .padding(.bottom, 97)
    case .failure:
      VStack(spacing: 0) {
        
      }
    }
  }
}

struct WaitingBusImageView_Previews: PreviewProvider {
    static var previews: some View {
      WaitingBusImageView(waitingBusState: .constant(.connecting))
    }
}
