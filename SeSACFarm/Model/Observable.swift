import Foundation

class Observable<T> {
  private var listner: ((T) -> Void)?
  
  var value: T {
    didSet {
      listner?(value)
    }
  }
  
  init(_ value: T) {
    self.value = value
  }
  
  func bind(_ closure: @escaping (T) -> Void) {
    closure(value)
    listner = closure
  }
}
