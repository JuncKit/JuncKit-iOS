//
//  Constant.swift
//  JuncKit
//
//  Created by 박의서 on 2023/08/19.
//

import SwiftUI

struct APIEnvironment {
  static let serverUrl = Bundle.main.object(forInfoDictionaryKey: "ServerURL") as! String

}
