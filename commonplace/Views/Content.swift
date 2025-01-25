//
//  ContentView.swift
//  commonplace
//
//  Created by Oli Young on 25/1/2025.
//

import SwiftData
import SwiftUI

struct Content: View {
  @Environment(\.modelContext) private var modelContext
  @Query private var items: [Item]
  @State private var isAddItemViewPresented: Bool = false  // State to control the presentation of the add item view

  var body: some View {
    GeometryReader {
      geometry in
      let parentWidth = geometry.size.width
      let rectangleWidth = parentWidth * 0.8
      let rectangleHeight = rectangleWidth * 0.618  // Golden ratio
      let columns: [GridItem] = [
        GridItem()
      ]

      NavigationSplitView {
        ScrollView {
          LazyVGrid(columns: columns) {
            ForEach(items) { item in
              NavigationLink(value: item) {
                ListItem(item: item)
                  .frame(
                    width: rectangleWidth,
                    height: rectangleHeight
                  )
              }
            }
          }
        }
        .scrollIndicatorsFlash(onAppear: true)
        .navigationDestination(
          for: Item.self,
          destination: EditItem.init
        )
        .toolbar {
          ToolbarItem {
            Button(action: {
              isAddItemViewPresented = true  // Show the add item view
            }) {
              Label("Add Item", systemImage: "plus")
            }
          }
        }
        .navigationDestination(isPresented: $isAddItemViewPresented) {
          AddItem(isPresented: $isAddItemViewPresented)
        }
      } detail: {
        Text("Select an item")
      }
    }
  }

  private func addItem() {
    withAnimation {
      let newItem = Item(
        body: "Hello World",
        timestamp: Date()
      )
      modelContext.insert(newItem)
    }
  }
}

#Preview {
  Content()
    .modelContainer(for: Item.self, inMemory: true)
}
