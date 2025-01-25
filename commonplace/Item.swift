//
//  Item.swift
//  commonplace
//
//  Created by Oli Young on 25/1/2025.
//

import Foundation
import SwiftData

@Model
final class Item {
  var drawingData: Data?
  var body: String
  var timestamp: Date

  init(
    body: String = "",
    timestamp: Date = Date()
  ) {
    self.body = body
    self.timestamp = timestamp
    self.drawingData = nil
  }
}
