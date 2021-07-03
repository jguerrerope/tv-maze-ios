// MARK: - Mocks generated from file: TVMaze/Data/Networking/Service/MazeService.swift at 2021-07-03 08:52:28 +0000


import Cuckoo
@testable import TVMaze

import Combine
import Foundation


 class MockMazeService: MazeService, Cuckoo.ProtocolMock {
    
     typealias MocksType = MazeService
    
     typealias Stubbing = __StubbingProxy_MazeService
     typealias Verification = __VerificationProxy_MazeService

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: MazeService?

     func enableDefaultImplementation(_ stub: MazeService) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func getShows(page: Int) -> AnyPublisher<[TVShowTO], Error> {
        
    return cuckoo_manager.call("getShows(page: Int) -> AnyPublisher<[TVShowTO], Error>",
            parameters: (page),
            escapingParameters: (page),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getShows(page: page))
        
    }
    

	 struct __StubbingProxy_MazeService: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func getShows<M1: Cuckoo.Matchable>(page: M1) -> Cuckoo.ProtocolStubFunction<(Int), AnyPublisher<[TVShowTO], Error>> where M1.MatchedType == Int {
	        let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: page) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockMazeService.self, method: "getShows(page: Int) -> AnyPublisher<[TVShowTO], Error>", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_MazeService: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func getShows<M1: Cuckoo.Matchable>(page: M1) -> Cuckoo.__DoNotUse<(Int), AnyPublisher<[TVShowTO], Error>> where M1.MatchedType == Int {
	        let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: page) { $0 }]
	        return cuckoo_manager.verify("getShows(page: Int) -> AnyPublisher<[TVShowTO], Error>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class MazeServiceStub: MazeService {
    

    

    
     func getShows(page: Int) -> AnyPublisher<[TVShowTO], Error>  {
        return DefaultValueRegistry.defaultValue(for: (AnyPublisher<[TVShowTO], Error>).self)
    }
    
}



 class MockMazeServiceImpl: MazeServiceImpl, Cuckoo.ClassMock {
    
     typealias MocksType = MazeServiceImpl
    
     typealias Stubbing = __StubbingProxy_MazeServiceImpl
     typealias Verification = __VerificationProxy_MazeServiceImpl

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: MazeServiceImpl?

     func enableDefaultImplementation(_ stub: MazeServiceImpl) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    

	 struct __StubbingProxy_MazeServiceImpl: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	}

	 struct __VerificationProxy_MazeServiceImpl: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	}
}

 class MazeServiceImplStub: MazeServiceImpl {
    

    

    
}


// MARK: - Mocks generated from file: TVMaze/Domain/Common/QueryUseCase.swift at 2021-07-03 08:52:28 +0000


import Cuckoo
@testable import TVMaze

import Combine
import Foundation


public class MockQueryUseCase<P: UseCaseParams, R>: QueryUseCase<P, R>, Cuckoo.ClassMock {
    
    public typealias MocksType = QueryUseCase<P, R>
    
    public typealias Stubbing = __StubbingProxy_QueryUseCase
    public typealias Verification = __VerificationProxy_QueryUseCase

    public let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: QueryUseCase<P, R>?

    public func enableDefaultImplementation(_ stub: QueryUseCase<P, R>) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    public override func build(params: P?) -> AnyPublisher<R, Error> {
        
    return cuckoo_manager.call("build(params: P?) -> AnyPublisher<R, Error>",
            parameters: (params),
            escapingParameters: (params),
            superclassCall:
                
                super.build(params: params)
                ,
            defaultCall: __defaultImplStub!.build(params: params))
        
    }
    
    
    
    public override func execute(params: P?, delayInSeconds: Int?, onSuccess: ((R) -> Void)?, onError: ((Swift.Error) -> Void)?, onFinished: (() -> Void)?)  {
        
    return cuckoo_manager.call("execute(params: P?, delayInSeconds: Int?, onSuccess: ((R) -> Void)?, onError: ((Swift.Error) -> Void)?, onFinished: (() -> Void)?)",
            parameters: (params, delayInSeconds, onSuccess, onError, onFinished),
            escapingParameters: (params, delayInSeconds, onSuccess, onError, onFinished),
            superclassCall:
                
                super.execute(params: params, delayInSeconds: delayInSeconds, onSuccess: onSuccess, onError: onError, onFinished: onFinished)
                ,
            defaultCall: __defaultImplStub!.execute(params: params, delayInSeconds: delayInSeconds, onSuccess: onSuccess, onError: onError, onFinished: onFinished))
        
    }
    

	public struct __StubbingProxy_QueryUseCase: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    public init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func build<M1: Cuckoo.OptionalMatchable>(params: M1) -> Cuckoo.ClassStubFunction<(P?), AnyPublisher<R, Error>> where M1.OptionalMatchedType == P {
	        let matchers: [Cuckoo.ParameterMatcher<(P?)>] = [wrap(matchable: params) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockQueryUseCase.self, method: "build(params: P?) -> AnyPublisher<R, Error>", parameterMatchers: matchers))
	    }
	    
	    func execute<M1: Cuckoo.OptionalMatchable, M2: Cuckoo.OptionalMatchable, M3: Cuckoo.OptionalMatchable, M4: Cuckoo.OptionalMatchable, M5: Cuckoo.OptionalMatchable>(params: M1, delayInSeconds: M2, onSuccess: M3, onError: M4, onFinished: M5) -> Cuckoo.ClassStubNoReturnFunction<(P?, Int?, ((R) -> Void)?, ((Swift.Error) -> Void)?, (() -> Void)?)> where M1.OptionalMatchedType == P, M2.OptionalMatchedType == Int, M3.OptionalMatchedType == ((R) -> Void), M4.OptionalMatchedType == ((Swift.Error) -> Void), M5.OptionalMatchedType == (() -> Void) {
	        let matchers: [Cuckoo.ParameterMatcher<(P?, Int?, ((R) -> Void)?, ((Swift.Error) -> Void)?, (() -> Void)?)>] = [wrap(matchable: params) { $0.0 }, wrap(matchable: delayInSeconds) { $0.1 }, wrap(matchable: onSuccess) { $0.2 }, wrap(matchable: onError) { $0.3 }, wrap(matchable: onFinished) { $0.4 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockQueryUseCase.self, method: "execute(params: P?, delayInSeconds: Int?, onSuccess: ((R) -> Void)?, onError: ((Swift.Error) -> Void)?, onFinished: (() -> Void)?)", parameterMatchers: matchers))
	    }
	    
	}

	public struct __VerificationProxy_QueryUseCase: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    public init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func build<M1: Cuckoo.OptionalMatchable>(params: M1) -> Cuckoo.__DoNotUse<(P?), AnyPublisher<R, Error>> where M1.OptionalMatchedType == P {
	        let matchers: [Cuckoo.ParameterMatcher<(P?)>] = [wrap(matchable: params) { $0 }]
	        return cuckoo_manager.verify("build(params: P?) -> AnyPublisher<R, Error>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func execute<M1: Cuckoo.OptionalMatchable, M2: Cuckoo.OptionalMatchable, M3: Cuckoo.OptionalMatchable, M4: Cuckoo.OptionalMatchable, M5: Cuckoo.OptionalMatchable>(params: M1, delayInSeconds: M2, onSuccess: M3, onError: M4, onFinished: M5) -> Cuckoo.__DoNotUse<(P?, Int?, ((R) -> Void)?, ((Swift.Error) -> Void)?, (() -> Void)?), Void> where M1.OptionalMatchedType == P, M2.OptionalMatchedType == Int, M3.OptionalMatchedType == ((R) -> Void), M4.OptionalMatchedType == ((Swift.Error) -> Void), M5.OptionalMatchedType == (() -> Void) {
	        let matchers: [Cuckoo.ParameterMatcher<(P?, Int?, ((R) -> Void)?, ((Swift.Error) -> Void)?, (() -> Void)?)>] = [wrap(matchable: params) { $0.0 }, wrap(matchable: delayInSeconds) { $0.1 }, wrap(matchable: onSuccess) { $0.2 }, wrap(matchable: onError) { $0.3 }, wrap(matchable: onFinished) { $0.4 }]
	        return cuckoo_manager.verify("execute(params: P?, delayInSeconds: Int?, onSuccess: ((R) -> Void)?, onError: ((Swift.Error) -> Void)?, onFinished: (() -> Void)?)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

public class QueryUseCaseStub<P: UseCaseParams, R>: QueryUseCase<P, R> {
    

    

    
    public override func build(params: P?) -> AnyPublisher<R, Error>  {
        return DefaultValueRegistry.defaultValue(for: (AnyPublisher<R, Error>).self)
    }
    
    public override func execute(params: P?, delayInSeconds: Int?, onSuccess: ((R) -> Void)?, onError: ((Swift.Error) -> Void)?, onFinished: (() -> Void)?)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: TVMaze/Domain/Repository/TVShowRepository.swift at 2021-07-03 08:52:28 +0000


import Cuckoo
@testable import TVMaze

import Combine
import Foundation


public class MockTVShowRepository: TVShowRepository, Cuckoo.ProtocolMock {
    
    public typealias MocksType = TVShowRepository
    
    public typealias Stubbing = __StubbingProxy_TVShowRepository
    public typealias Verification = __VerificationProxy_TVShowRepository

    public let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: TVShowRepository?

    public func enableDefaultImplementation(_ stub: TVShowRepository) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    public func getTVShows(page: Int) -> AnyPublisher<[TVShow], Error> {
        
    return cuckoo_manager.call("getTVShows(page: Int) -> AnyPublisher<[TVShow], Error>",
            parameters: (page),
            escapingParameters: (page),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getTVShows(page: page))
        
    }
    

	public struct __StubbingProxy_TVShowRepository: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    public init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func getTVShows<M1: Cuckoo.Matchable>(page: M1) -> Cuckoo.ProtocolStubFunction<(Int), AnyPublisher<[TVShow], Error>> where M1.MatchedType == Int {
	        let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: page) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockTVShowRepository.self, method: "getTVShows(page: Int) -> AnyPublisher<[TVShow], Error>", parameterMatchers: matchers))
	    }
	    
	}

	public struct __VerificationProxy_TVShowRepository: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    public init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func getTVShows<M1: Cuckoo.Matchable>(page: M1) -> Cuckoo.__DoNotUse<(Int), AnyPublisher<[TVShow], Error>> where M1.MatchedType == Int {
	        let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: page) { $0 }]
	        return cuckoo_manager.verify("getTVShows(page: Int) -> AnyPublisher<[TVShow], Error>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

public class TVShowRepositoryStub: TVShowRepository {
    

    

    
    public func getTVShows(page: Int) -> AnyPublisher<[TVShow], Error>  {
        return DefaultValueRegistry.defaultValue(for: (AnyPublisher<[TVShow], Error>).self)
    }
    
}

