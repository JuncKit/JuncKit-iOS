//
//  HalfSheetController.swift
//  JuncKit
//
//  Created by 박의서 on 2023/08/20.
//

import SwiftUI

class HalfSheetController<Content>: UIHostingController<Content> where Content : View {
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    if let presentation = sheetPresentationController {
      presentation.detents = [.medium(), .large()]
      presentation.prefersGrabberVisible = true
      presentation.largestUndimmedDetentIdentifier = .medium
    }
  }
}
