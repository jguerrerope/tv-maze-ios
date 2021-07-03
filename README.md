# TVMaze Chanllenge

## Overview
Master-Details application displays a list of TV Shows from [Maze API](http://www.tvmaze.com/api). You can see the details of each TV Show, just by tapping on it ;). 

## Architecture
I wrote a Clean-Architecture based on layers, which uses the Repository Pattern on Data layer and the MMVM Pattern on Presentation Layer.

Dependencies:
* [AlamofireImage](https://github.com/Alamofire/AlamofireImage) to load image from url.
* [DeepDiff](https://github.com/onmyway133/DeepDiff) to find the difference between 2 collections.
* [Cuckoo](https://github.com/Brightify/Cuckoo) to generated mock/Spay/stub objects.
* [OHHTTPStubs](https://github.com/AliSoftware/OHHTTPStubs) to test the network services.

**APP Layer** 
This layer is used for StartUp logic such as DI's tree creation or other kind of processes that should be executed at the beginning of the App's lifecycle.

    StratUpLogic
    Product Packaging Type  
    DI's tree creation
    
**Presentation Layer** 
MVVM Model-View-ViewModel Pattern + Router.  using:

    ViewControllers


**Domain Layer** 
Holds all business logic. The domain layer starts with classes named UseCases used by Presentation Layer. 
    
    UseCases
    BussinesLogic
    
**Data** 
Repository Pattern from the base sample.

    Repository
    Service
    Others Datasources

Each layer has a DI Modoule Provider which provides an instance of available components.

Also, I have wrote some components to support this architecture in order to use the lowest amount of library.

**Factory Provider (DI):** this micro-system provides a simple way of injecting objects. Basically, it uses a Factory Pattern to create a generic provider, which can be implementented by needs. (DependecyInjection.swift)

**NetworkService:** a basic generic service, which follows the Moya style. (NetworkService.swift)

**ReactiveValue:** in a MVVM Pattern we need some kind of reactive mechanism to comunicate with the view. Therefore, this component provides a reactive mechanism to notify Object Change to subcribers.

## Testing
For the lower level of the Pyramid's testing, I have wrote UnitTests mainly using: 
* [Cuckoo](https://github.com/Brightify/Cuckoo).
* [OHHTTPStubs](https://github.com/AliSoftware/OHHTTPStubs).

For the top level, I created a BBD flow to provide E2E feature testing. Basically, it describes a high level test using natual language throught an abstraction layer.

Mainly, I used the following components:
**Feature**: natural language test.
**Steps**: Group of screen actions.
**Screens**: simple actions using XCTest.

I decided to test the "TV show details" feature.


## Notes: 

For timing reason I could not reach to the following points: 

* create a component to load image from url

## License
MIT


