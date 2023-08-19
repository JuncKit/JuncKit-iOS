//
//  Client.swift
//  JuncKit
//
//  Created by 박의서 on 2023/08/19.
//

import StompClientLib

// Socket Client instance
var socketClient = StompClientLib()

// Socket Connection URL
private let url = URL(string: "ws://[도메인]/[api]/websocket")!
