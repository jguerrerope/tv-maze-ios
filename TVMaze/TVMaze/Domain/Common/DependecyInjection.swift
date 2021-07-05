import Foundation

private protocol ProviderParametizable {
    associatedtype Param1
    associatedtype Param2
    associatedtype Param3
}

public enum InjectType {
    case create
    case singleton
    case weak
}

public class Provider<T>: ProviderParametizable {
    public typealias Param1 = Any
    public typealias Param2 = Any
    public typealias Param3 = Any
  
    private let type: InjectType
    private var storedValue: T?
    private var storedValueWeak: Weak<T>?
    
    init(type: InjectType = .create) {
        self.type = type
    }
    
    public func instance() -> T {
        if let value = getStoredInstance() {
            return value
        }
        fatalError("any instance stored.")
    }
    
    public func instance(param: Param1) -> T {
        if let value = getStoredInstance() {
            return value
        }
        fatalError("any instance stored.")
    }
    
    public func instance(param: Param1, param2: Param2) -> T {
        if let value = getStoredInstance() {
            return value
        }
        fatalError("any instance stored.")
    }
    
    func applyInjectionType(factory: () -> T) -> T {
        switch self.type {
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
            
        case .weak:
            if let value = storedValueWeak?.value {
                return value
            }
            
            let newValue = factory()
            let newWeakWrapper = Weak<T>()
            newWeakWrapper.value = newValue
            
            self.storedValueWeak = newWeakWrapper
            return newValue
        }
    }
    
    func getStoredInstance() -> T? {
        if let value = storedValue {
            return value
        } else if let value = storedValueWeak?.value {
            return value
        }
        return .none
    }
}

public class FactoryProvider<T>: Provider<T> {
    public typealias Result = T
    public typealias Param1 = Void
    public typealias Param2 = Void
    
    private let factory: () -> T
   
    
    public init(type: InjectType = .create, factory: @escaping () -> T) {
        self.factory = factory
        super.init(type: type)
    }

    public override func instance() -> T {
        if let value = getStoredInstance() {
            return value
        }
        return self.applyInjectionType(factory: self.factory)
    }
}

public class FactoryProvider1<T, Arg1>: Provider<T> {
    public typealias Result = T
    public typealias Param1 = Arg1
    public typealias Param2 = Void
    
    private let factory: (Arg1) -> T
    
    public init(type: InjectType = .create, factory: @escaping (Arg1) -> T) {
        self.factory = factory
        super.init(type: type)
    }
    
    public override func instance(param: Provider<T>.Param1) -> T {
        if let value = getStoredInstance() {
            return value
        }
        
        return self.applyInjectionType() {
            self.factory(param as! Arg1)
        }
    }
}

public class ComponentFactoryProvider<T>: Provider<T> {
    public typealias Result = T
    public typealias Param1 = Void
    public typealias Param2 = Void
    
    public override func instance() -> T {
        if let value = getStoredInstance() {
            return value
        }
        
        return self.applyInjectionType() {
            internalFactory()
        }
    }
    
    public func internalFactory() -> T {
        fatalError("Not implemented.")
    }
}

public class ComponentFactoryProvider1<T, Arg1>: Provider<T> {
    public typealias Result = T
    public typealias Param1 = Arg1
    public typealias Param2 = Void
    
    
    public override func instance(param: Provider<T>.Param1) -> T {
        if let value = getStoredInstance() {
            return value
        }
        
        return self.applyInjectionType() {
            internalFactory(param: param as! Arg1)
        }
    }
    
    public func internalFactory(param: Arg1) -> T {
        fatalError("Not implemented.")
    }
}

private class Weak<Wrapped> {
    private weak var object: AnyObject?

    var value: Wrapped? {
        get {
            guard let object = object else { return .none }
            return object as? Wrapped
        }
        set { object = newValue as AnyObject? }
    }
}
