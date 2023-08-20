//
//  TestView.swift
//  JuncKit
//
//  Created by 박의서 on 2023/08/20.
//

import SwiftUI

struct TestView: View {
  @ObservedObject var stompManager = StompManager()
  var body: some View {
    VStack {
      Text("Received Messages:")
        .font(.headline)
      
      List(stompManager.messages, id: \.self) { message in
        Text(message)
      }
      
      Button("Connect") {
        stompManager.registerSockect() // 소켓 연결
      }
      
      Button("Send Message") {
        stompManager.sendMessage() // 메시지 전송
      }
      
      Button("Disconnect") {
        stompManager.disconnect() // 연결 해제
      }
    }
    .padding()
  }
}

struct TestView_Previews: PreviewProvider {
  static var previews: some View {
    TestView()
  }
}
