import Foundation

public class RepositoryAssemblyModule {
    
    public static let tvShowRepository: Provider<TVShowRepository> = FactoryProvider {
        return TVShowRepositoryImpl(
            mazeService: ServiceAssemblyModule.mazeService.instance()
        )
    }
}
