//
//  CardStockView.swift
//  commonplace
//
//  Created by Oli Young on 25/1/2025.
//
import SwiftUI

struct CardStock: View {
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 16)
        .fill(Color.white)
        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 4)
      LinedBackground()
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
  }
}

struct LinedBackground: View {
  var body: some View {
    GeometryReader { geometry in
      let spacing: CGFloat = 10  // Adjust line spacing
      let numberOfLines = Int(geometry.size.height / spacing)

      Path { path in
        for i in 0...numberOfLines {
          let y = CGFloat(i) * spacing
          path.move(to: CGPoint(x: 0, y: y))
          path.addLine(to: CGPoint(x: geometry.size.width, y: y))
        }
      }
      .stroke(Color.gray.opacity(0.2), lineWidth: 0.5)
    }
  }
}

#Preview {
  CardStock()
}
