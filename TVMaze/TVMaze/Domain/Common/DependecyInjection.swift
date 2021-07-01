import Foundation

// Mark: Provider
public protocol ProviderParametizable {
    associatedtype Param1
    associatedtype Param2
    associatedtype Param3
}

public enum InjectType {
    case create
    case singleton
}


public class Provider<T>: ProviderParametizable {
    public typealias Param1 = Any
    public typealias Param2 = Any
    public typealias Param3 = Any
  
    private var storedValue: T?
    
    public func instance() -> T {
        if let value = storedValue {
            return value
        }
        fatalError("Not implemented.")
    }
    
    public func instance(param: Param1) -> T {
        if let value = storedValue {
            return value
        }
        fatalError("Not implemented.")
    }
    
    public func instance(param: Param1, param2: Param2) -> T {
        if let value = storedValue {
            return value
        }
        
        fatalError("Not implemented.")
    }
    
    func applyInjectionType(type: InjectType, factory: () -> T) -> T {
        switch type {
        case .create:
            self.storedValue = nil
            return factory()
            
        case .singleton:
            if let value = self.storedValue {
                return value
            }
            
            let newValue = factory()
            self.storedValue = newValue
            
            return newValue
        }
    }
}

// Mark: Factory Provider
public class FactoryProvider<T>: Provider<T> {
    public typealias Result = T
    public typealias Param1 = Void
    public typealias Param2 = Void
    
    private let factory: () -> T
    private var type: InjectType = .create
    
    public init(type: InjectType = .create, factory: @escaping () -> T) {
        self.factory = factory
        self.type = type
    }

    public override func instance() -> T {
        return self.applyInjectionType(type: self.type, factory: self.factory)
    }
}

public class FactoryProvider1<T, Arg1>: Provider<T> {
    public typealias Result = T
    public typealias Param1 = Arg1
    public typealias Param2 = Void
    
    private let factory: (Arg1) -> T
    private var type: InjectType = .create
    
    public init(type: InjectType = .create, factory: @escaping (Arg1) -> T) {
        self.factory = factory
        self.type = type
    }

    public override func instance(param: Provider<T>.Param1) -> T {
        return self.applyInjectionType(type: self.type) {
            self.factory(param as! Arg1)
        }
    }
}
