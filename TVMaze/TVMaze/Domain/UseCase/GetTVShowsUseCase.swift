import Foundation
import Combine

public struct GetTVShowsUseCaseParams: UseCaseParams {
    let page: Int
    
    public init(page: Int) {
        self.page = page
    }
}

public class GetTVShowsUseCase: QueryUseCase<GetTVShowsUseCaseParams, [TVShow]> {
     private let tvShowRepository: TVShowRepository
    
    public init(tvShowRepository: TVShowRepository,
                dispacherHelper: DispacherHelper) {
        self.tvShowRepository = tvShowRepository
        super.init(dispacherHelper: dispacherHelper)
    }
   
    public override func build(params: GetTVShowsUseCaseParams?) ->  AnyPublisher<[TVShow], Error>  {
        
        guard let params = params else {
            return Fail(error: GeneralDomainError.notParams)
                .eraseToAnyPublisher()
        }
        
        return tvShowRepository.getTVShows(page: params.page)
    }
}
