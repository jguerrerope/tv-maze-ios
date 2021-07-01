// MARK: - Mocks generated from file: TVMaze/Data/Networking/Service/MazeService.swift at 2021-07-01 21:50:31 +0000


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


// MARK: - Mocks generated from file: TVMaze/Domain/Repository/TVShowRepository.swift at 2021-07-01 21:50:31 +0000


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

