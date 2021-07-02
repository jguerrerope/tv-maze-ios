import Foundation

public protocol DomainError: Error {}

public enum GeneralDomainError: DomainError {
    case noFound
    case notConnection
    case notParams
    case mapping
}

