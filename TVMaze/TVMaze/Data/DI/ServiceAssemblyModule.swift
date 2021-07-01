import Foundation

class ServiceAssemblyModule {

    private static let mazeBaseUrl = "http://api.tvmaze.com"

    static let mazeService: Provider<MazeService> = FactoryProvider {
        return MazeServiceImpl(
            service: NetworkService(baseUrl: ServiceAssemblyModule.mazeBaseUrl)
        )
    }
}
