import SwiftUI
import UIKit

extension Notification.Name {
  static let pencilDidTap = Notification.Name("pencilDidTap")
  static let pencilDidLift = Notification.Name("pencilDidLift")
}

struct PencilDetectionView: UIViewControllerRepresentable {
  @Binding var isUsingPencil: Bool

  class Coordinator: NSObject {
    var parent: PencilDetectionView

    init(parent: PencilDetectionView) {
      self.parent = parent
      super.init()
      // Add observers for pencil notifications
      NotificationCenter.default.addObserver(
        self, selector: #selector(pencilDidTap), name: .pencilDidTap, object: nil)
      NotificationCenter.default.addObserver(
        self, selector: #selector(pencilDidLift), name: .pencilDidLift, object: nil)
    }

    deinit {
      // Remove observers when the coordinator is deallocated
      NotificationCenter.default.removeObserver(self)
    }

    @objc func pencilDidTap() {
      parent.isUsingPencil = true
    }

    @objc func pencilDidLift() {
      parent.isUsingPencil = false
    }
  }

  func makeCoordinator() -> Coordinator {
    Coordinator(parent: self)
  }

  func makeUIViewController(context: Context) -> UIViewController {
    let viewController = UIViewController()
    let pencilInteraction = UIPencilInteraction()
    viewController.view.addInteraction(pencilInteraction)
    return viewController
  }

  func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    // No updates needed
  }
}
