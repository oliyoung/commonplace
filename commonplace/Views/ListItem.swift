//
//  ListItemView.swift
//  commonplace
//
//  Created by Oli Young on 25/1/2025.
//

import SwiftData
import SwiftUI

struct ListItem: View {
  @Bindable var item: Item

  var body: some View {
    ZStack {
      CardStock()
      Text(item.body)
        .foregroundColor(.black)
        .font(.caption)
    }
  }
}

#Preview {
  let example = Item(body: "Hello, World!")
  ListItem(item: example)
}
