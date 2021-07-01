import Foundation

class HomeViewModel {
    
    private let getTVShowsUseCase: QueryUseCase<GetTVShowsUseCaseParams, [TVShow]>
    
    let homeItems = ReactiveValue<Resource<[TVShowItemViewPayload]>>()
    
    init(getTVShowsUseCase: QueryUseCase<GetTVShowsUseCaseParams, [TVShow]>) {
        self.getTVShowsUseCase = getTVShowsUseCase
    }
    
    func setUp() {
        loadTvShows()
    }
    
    private func loadTvShows() {
        homeItems.value = Resource.loading()
        getTVShowsUseCase.execute(
            params: GetTVShowsUseCaseParams(page: 1),
            onSuccess: { [unowned self] tvShowList in
                let items = tvShowList.map { $0.toTVShowItemViewPayload() }
                homeItems.value = Resource.success(items)
            },
            onError: { error in
                print(error)
            }
        )
    }
}
