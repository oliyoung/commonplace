//
//  commonplaceApp.swift
//  commonplace
//
//  Created by Oli Young on 25/1/2025.
//

import SwiftData
import SwiftUI

@main
struct commonplaceApp: App {
  var sharedModelContainer: ModelContainer = {
    let schema = Schema([
      Item.self
    ])
    let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

    do {
      return try ModelContainer(for: schema, configurations: [modelConfiguration])
    } catch {
      fatalError("Could not create ModelContainer: \(error)")
    }
  }()

  var body: some Scene {
    WindowGroup {
      Content()
    }
    .modelContainer(sharedModelContainer)
  }
}
