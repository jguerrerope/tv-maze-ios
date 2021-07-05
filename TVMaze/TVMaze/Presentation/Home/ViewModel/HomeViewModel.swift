import Foundation

class HomeViewModel {
    public static let defaultNextPageId = "DEFAULT_ID"
    private static let defaultDebounceCallInMills = 300
    
    private let getTVShowsUseCase: QueryUseCase<GetTVShowsUseCaseParams, [TVShow]>
    
    let homeItems = ReactiveValue<Resource<[HomeSectionViewPayload]>>()
    let navigateToTVShowDetails = ReactiveValue<TVShow>()
    let showEmptyListMessage = ReactiveValue<Bool>(false)
    
    private var currentTVShowList: [TVShow] = []
    private var currentPage: Int = 0
    private var currentNextPageId: String? = .none
    
    private var debounceCallInMills: Int
    
    init(debounceCallInMills: Int = HomeViewModel.defaultDebounceCallInMills,
         getTVShowsUseCase: QueryUseCase<GetTVShowsUseCaseParams, [TVShow]>) {
        self.debounceCallInMills = debounceCallInMills
        self.getTVShowsUseCase = getTVShowsUseCase
    }
    
    func setUp() {
        currentTVShowList = []
        currentPage = 0
        currentNextPageId = .none
        homeItems.value = Resource.success([.nextPage(HomeViewModel.defaultNextPageId)])
        showEmptyListMessage.value = false
    }
    
    func loadNextPage(from lastIdSeen: String) {
        if case .loading = homeItems.value  {
            return
        }
        
        if lastIdSeen == currentNextPageId {
            return
        }
        
        self.currentNextPageId = lastIdSeen
        currentPage += 1
        
        loadTVShows(isFirstTime: lastIdSeen == HomeViewModel.defaultNextPageId)
    }
    
    func onTVShowselected(id: String){
        guard let tvShow = currentTVShowList.first(where: { $0.id == id }) else {
            return
        }
        navigateToTVShowDetails.value = tvShow
    }
}

// MARK: Helper methods
extension HomeViewModel {
    
    private func loadTVShows(isFirstTime: Bool = false) {
        homeItems.value = Resource.loading()
        getTVShowsUseCase.execute(
            params: GetTVShowsUseCaseParams(page: self.currentPage),
            delayInMillis: isFirstTime ? debounceCallInMills : .none,
            onSuccess: { [unowned self] tvShowList in
                self.updateHomeItemsWithNewPage(tvShowList)
            },
            onError: { error in
                self.updateHomeItemsWithNewPage([])
            }
        )
    }
    
    private func updateHomeItemsWithNewPage(_ newTvShowList: [TVShow]) {
        self.currentTVShowList += newTvShowList
        
        let tvShowItems = self.currentTVShowList.toHomeSectionViewPayloadList()
        
        if !newTvShowList.isEmpty {
            showEmptyListMessage.value = false
            let latIdToSeen = newTvShowList.last?.id ?? HomeViewModel.defaultNextPageId
            homeItems.postValue(Resource.success(tvShowItems + [.nextPage(latIdToSeen)]))
            
        } else {
            if tvShowItems.isEmpty {
                showEmptyListMessage.value = true
                homeItems.postValue(Resource.failUnknown())
            } else {
                homeItems.postValue(Resource.success(tvShowItems))
            }
        }
    }
}
