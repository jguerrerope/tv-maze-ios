import Foundation

typealias CompletionHandler<T> = ((T) -> Void)
typealias OperationExecutor = (() -> Void)
typealias WokerHandler = ((@escaping OperationExecutor) -> Void)

struct ReactiveCoreUtils {
    
    private var operationWokerHandler: WokerHandler = { operationExecutor in
        DispatchQueue.main.async(execute: operationExecutor)
    }

    #if DEBUG
    static var shared = ReactiveCoreUtils()
    
    public static func disableDispacher() {
        shared.operationWokerHandler = { operationExecutor in
            operationExecutor()
        }
    }
    
    public static func enabledDisapcher() {
        shared.operationWokerHandler = { operationExecutor in
            DispatchQueue.main.async(execute: operationExecutor)
        }
    }
    #endif
    
    public static func executeOperation(operation: @escaping OperationExecutor) {
        shared.operationWokerHandler(operation)
    }
}

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
        ReactiveCoreUtils.executeOperation(operation: {  [weak self] in
            self?.value = newValue
        })
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
