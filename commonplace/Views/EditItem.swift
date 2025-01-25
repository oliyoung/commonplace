//
//  EditItemView.swift
//  commonplace
//
//  Created by Oli Young on 25/1/2025.
//

import SwiftData
import SwiftUI

struct EditItem: View {
  @Bindable var item: Item

  var body: some View {
    GeometryReader {
      geometry in
      let parentHeight = geometry.size.height
      let parentWidth = geometry.size.width
      let rectangleWidth = parentWidth * 0.8
      let rectangleHeight = rectangleWidth * 0.618  // Golden ratio

      ZStack {
        CardStock()
        Text(item.body)
          .foregroundColor(.black)
          .font(.caption)
          .padding(20)

      }
      .frame(width: rectangleWidth, height: rectangleHeight)
      .position(x: parentWidth / 2, y: parentHeight / 2)
    }
    .navigationBarTitleDisplayMode(.inline)
  }
}

#Preview {
  do {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try ModelContainer(
      for: Item.self,
      configurations: config
    )
    let example = Item(
      body:
        "Combining Core Data’s proven persistence technology and Swift’s modern concurrency features, SwiftData enables you to add persistence to your app quickly, with minimal code and no external dependencies. Using modern language features like macros, SwiftData enables you to write code that is fast, efficient, and safe, enabling you to describe the entire model layer (or object graph) for your app. The framework handles storing the underlying model data, and optionally, syncing that data across multiple devices."
    )
    return EditItem(item: example).modelContainer(container)
  } catch {
    fatalError("Unable to create preview: \(error)")
  }
}
