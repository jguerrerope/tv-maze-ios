import Foundation

class HomeViewModel {
    private static let defaultNextPageId = "DEFAULT_ID"
    
    private let getTVShowsUseCase: QueryUseCase<GetTVShowsUseCaseParams, [TVShow]>
    
    let homeItems = ReactiveValue<Resource<[HomeSectionViewPayload]>>()
    let navigateToTVShowDetails = ReactiveValue<TVShow>()
    
    private var currentTvShowList: [TVShow] = []
    private var currentPage: Int = 0
    private var currentNextPageId: String? = nil
  
    init(getTVShowsUseCase: QueryUseCase<GetTVShowsUseCaseParams, [TVShow]>) {
        self.getTVShowsUseCase = getTVShowsUseCase
    }
    
    func setUp() {
        currentTvShowList = []
        currentPage = 0
        currentNextPageId = nil
        homeItems.value = Resource.success([.nextPage(HomeViewModel.defaultNextPageId)] )
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
     
        loadTvShows()
    }
    
    func onTVShowselected(id: String){
        guard let tvShow = currentTvShowList.first(where: { $0.id == id }) else {
            return
        }
        navigateToTVShowDetails.value = tvShow
    }
}

extension HomeViewModel {
    
    private func loadTvShows() {
        homeItems.value = Resource.loading()
        getTVShowsUseCase.execute(
            params: GetTVShowsUseCaseParams(page: self.currentPage),
            onSuccess: { [unowned self] tvShowList in
                self.updateHomeItemsWithNewPage(tvShowList)
            },
            onError: { error in
                print(error)
            }
        )
    }
    
    private func updateHomeItemsWithNewPage(_ newTvShowList: [TVShow]) {
        self.currentTvShowList += newTvShowList
        let tvShowItems = self.currentTvShowList.map { $0.toHomeSectionViewPayload() }
        
        if !newTvShowList.isEmpty {
            let latIdToSeen = newTvShowList.last?.id ?? HomeViewModel.defaultNextPageId
            homeItems.value = Resource.success(tvShowItems + [.nextPage(latIdToSeen)] )
            
        } else {
            homeItems.value = Resource.success(tvShowItems)
        }
    }
}
