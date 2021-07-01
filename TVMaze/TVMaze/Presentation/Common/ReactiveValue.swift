import Foundation

typealias CompletionHandler<T> = ((T) -> Void)

class ReactiveValue<T> {
    
    var value: T? {
        didSet {
            self.notify()
        }
    }
    
    private var observers = [String: CompletionHandler<T>]()
    
    init(_ value: T? = nil) {
        self.value = value
    }
    
    public func postValue(_ newValue: T?) {
        DispatchQueue.main.async { [weak self] in
            self?.value = newValue
        }
    }
    
    public func addAndNotify(_ observer: NSObject, _ completionHandler: @escaping CompletionHandler<T>) {
        self.addObserver(observer, completionHandler)
        
        if let value = self.value {
            completionHandler(value)
        }
    }
    
    public func addObserver(_ observer: NSObject, _ completionHandler: @escaping CompletionHandler<T>) {
        observers[observer.description] = completionHandler
    }
    
    private func notify() {
        if let value = self.value {
            observers.forEach { itemKey in
                itemKey.value(value)
            }
        }
    }
    
    private func removeAllObservers() {
        observers.removeAll()
    }
    
    deinit {
        removeAllObservers()
    }
}
