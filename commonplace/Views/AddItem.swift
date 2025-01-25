import SwiftUI

struct AddItem: View {
  @Environment(\.modelContext) private var modelContext
  @Binding var isPresented: Bool
  @State private var isUsingPencil: Bool = false
  @State private var newItemBody: String = ""

  var body: some View {
    ZStack {
      PencilDetection(isUsingPencil: $isUsingPencil)
        .frame(width: 0, height: 0)
      CardStock()
      VStack {
        TextEditor(text: $newItemBody)
          .scrollContentBackground(.hidden)
          .onSubmit { saveItem() }
          .padding()
        if isUsingPencil {
          Text("Using Apple Pencil")
        } else {
          Text("Not using Apple Pencil")
        }
        Button("Save") { saveItem() }
          .padding()
      }
    }
    .padding()
  }

  private func saveItem() {
    withAnimation {
      guard !newItemBody.isEmpty else { return }
      let newItem = Item(
        body: newItemBody,
        timestamp: Date()
      )
      modelContext.insert(newItem)
      isPresented = false
    }
  }
}

#Preview {
  @Previewable @State var isOpen = true
  AddItem(isPresented: $isOpen)
}
