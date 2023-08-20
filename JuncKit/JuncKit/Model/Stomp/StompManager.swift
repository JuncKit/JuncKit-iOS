//
//  StompManager.swift
//  JuncKit
//
//  Created by 박의서 on 2023/08/19.
//

import Foundation
import StompClientLib

enum MessageType: String {
  case enter = "ENTER"
  case talk = "TALK"
}

class StompManager: StompClientLibDelegate, ObservableObject {
  
  // Socket Client instance
  var socketClient = StompClientLib()
  
  // Socket Connection URL
  private lazy var url = URL(string: "ws://52.78.148.42:8080/chat/room/\(roomId)/websocket")!
  
  var roomId = "fc07da6d-6183-4ef5-a3a6-2bc8c708347e"
  var room: [String: Any] = [:]
  var sender = ""
  var message = ""
  var messages: [String] = []
  
  // Socket Connection
  func registerSockect() {
    socketClient.openSocketWithURLRequest(
      request: NSURLRequest(url: url),
      delegate: self
      //              connectionHeaders: [ "X-AUTH-TOKEN" : accessToken ]
    )
  }
  func subscribe() {
    socketClient.subscribe(destination: "/app/chat/room/\(self.roomId)")
  }
  
  // Publish Message
  func sendMessage() {
    let payloadObject: [String: Any] = [
      "type": MessageType.talk.rawValue,
      "roomId": self.roomId,
      "sender": self.sender,
      "message": self.message
    ]
    
    
    socketClient.sendJSONForDict(
        dict: payloadObject as AnyObject,
        toDestination: "/chat/room/enter/\(self.roomId)"
    )
  }
  
  // Unsubscribe
  func disconnect() {
    socketClient.disconnect()
  }
}

extension StompManager {
  func stompClient(
    client: StompClientLib!,
    didReceiveMessageWithJSONBody jsonBody: AnyObject?,
    akaStringBody stringBody: String?,
    withHeader header: [String : String]?,
    withDestination destination: String
  ) {
    // 구현 필요
    if let jsonBody = jsonBody as? [String: Any] {
      if let typeString = jsonBody["type"] as? String,
         let messageType = MessageType(rawValue: typeString),
         let roomId = jsonBody["roomId"] as? String,
         let sender = jsonBody["sender"] as? String,
         let message = jsonBody["message"] as? String {
        
        // Handle the received message here
        let formattedMessage = "\(sender) - \(message)"
        messages.append(formattedMessage)
        
        // Optionally, you can update your UI here if necessary
        // For example, if you're using SwiftUI, you can use ObservableObject and @Published properties
        // to automatically update the UI when the messages array changes.
      }
    }
  }
  
  func stompClientJSONBody(
    client: StompClientLib!,
    didReceiveMessageWithJSONBody jsonBody: String?,
    withHeader header: [String : String]?,
    withDestination destination: String
  ) {
    // 구현 필요
  }
  
  // Unsubscribe Topic
  func stompClientDidDisconnect(client: StompClientLib!) {
    print("Stomp socket is disconnected")
  }
  
  // Subscribe Topic after Connection
  func stompClientDidConnect(client: StompClientLib!) {
    print("Stomp socket is connected")
    
    subscribe()
  }
  // register 함수가 실행되어 socket이 연결이되면 실행되는 함수입니다.
  // socket 연결과 동시에 토픽을 subscribe 하기위해 이 함수에서 subscribe 함수를 실행하도록 했습니다.
  // 해당 부분을 지워 socket 연결과 subscribe 를 분리할 수 있습니다.
  
  // Error - disconnect and reconnect socket
  func serverDidSendError(client: StompClientLib!, withErrorMessage description: String, detailedErrorMessage message: String?) {
    print("Error send : " + description)
    
    socketClient.disconnect()
    registerSockect()
  }
  
  func serverDidSendPing() {
    print("Server ping")
  }
  
  func serverDidSendReceipt(client: StompClientLib!, withReceiptId receiptId: String) {
    print("Receipt : \(receiptId)")
  }
}
