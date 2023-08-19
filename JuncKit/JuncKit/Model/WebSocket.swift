//
//  WebSocket.swift
//  JuncKit
//
//  Created by 박의서 on 2023/08/19.
//

import Foundation


enum WebSocketError: Error {
  case invalidURL
}

final class WebSocket: NSObject {
  static let shared = WebSocket()
  
  private override init() {}
  
  
  var url: URL?
  var onReceiveClosure: ((String?, Data?) -> ())?
  weak var delegate: URLSessionWebSocketDelegate?
  
  lazy var urlSession = URLSession(
    configuration: .default,
    delegate: self,
    delegateQueue: OperationQueue()
  )
  
  private var webSocketTask: URLSessionWebSocketTask? {
    didSet { oldValue?.cancel(with: .goingAway, reason: nil) }
  }

  private var timer: Timer?

}

extension WebSocket: URLSessionWebSocketDelegate {
  func urlSession(
    _ session: URLSession,
    webSocketTask: URLSessionWebSocketTask,
    didOpenWithProtocol protocol: String?
  ) {
    self.delegate?.urlSession?(
      session,
      webSocketTask: webSocketTask,
      didOpenWithProtocol: `protocol`
    )
  }
  
  func urlSession(
    _ session: URLSession,
    webSocketTask: URLSessionWebSocketTask,
    didCloseWith closeCode: URLSessionWebSocketTask.CloseCode,
    reason: Data?
  ) {
    self.delegate?.urlSession?(
      session,
      webSocketTask: webSocketTask,
      didCloseWith: closeCode,
      reason: reason
    )
  }
  
  func openWebSocket() throws {
    guard let url = url else { throw WebSocketError.invalidURL }
    
    let urlSession = URLSession(
      configuration: .default,
      delegate: self,
      delegateQueue: OperationQueue()
    )
    let webSocketTask = urlSession.webSocketTask(with: url)
    webSocketTask.resume()
    
    self.webSocketTask = webSocketTask
    
    self.startPing()
  }
  
  private func startPing() {
    self.timer?.invalidate()
    self.timer = Timer.scheduledTimer(
      withTimeInterval: 10,
      repeats: true,
      block: { [weak self] _ in self?.ping() }
    )
  }
  private func ping() {
    self.webSocketTask?.sendPing(pongReceiveHandler: { [weak self] error in
      guard let error = error else { return }
      print("Ping failed \(error)")
      self?.startPing()
    })
  }
  
  func send(message: String) {
     self.send(message: message, data: nil)
   }
   
   func send(data: Data) {
     self.send(message: nil, data: data)
   }
   
   private func send(message: String?, data: Data?) {
     let taskMessage: URLSessionWebSocketTask.Message
     if let string = message {
       taskMessage = URLSessionWebSocketTask.Message.string(string)
     } else if let data = data {
       taskMessage = URLSessionWebSocketTask.Message.data(data)
     } else {
       return
     }
     
     print("Send message \(taskMessage)")
     self.webSocketTask?.send(taskMessage, completionHandler: { error in
       guard let error = error else { return }
       print("WebSOcket sending error: \(error)")
     })
   }
  
  func closeWebSocket() {
     self.webSocketTask = nil
     self.onReceiveClosure = nil
     self.timer?.invalidate()
     self.delegate = nil
   }

 // 위에서 didSet에 cancel()되게끔 해놓았으므로, webSocketTask = nil 하면 cancel도 실행
//   private var webSocketTask: URLSessionWebSocketTask? {
//     didSet { oldValue?.cancel(with: .goingAway, reason: nil) }
//   }
}
