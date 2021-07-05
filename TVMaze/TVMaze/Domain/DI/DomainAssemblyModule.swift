import Foundation
import UIKit

public typealias UseCaseProvider<Param: UseCaseParams, Result> = Provider<QueryUseCase<Param, Result>>

public class DomainAssemblyModule {
    
    public static let getTVShowsUseCase: UseCaseProvider<GetTVShowsUseCaseParams, [TVShow]> = FactoryProvider {
        return GetTVShowsUseCase(
            tvShowRepository: RepositoryAssemblyModule.tvShowRepository.instance(),
            dispacherHelper: HelperAssemblyModule.dispacherHelperProvider.instance()
        )
    }
}
