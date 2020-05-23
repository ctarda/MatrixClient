import Foundation
import Combine
import NetworkDispatcher

public struct MatrixClient {
    private let dispatcher: Dispatcher
    private let baseURL: URL
}

public extension MatrixClient {
    func publicRooms() -> AnyPublisher<[Room], Error> {
        let request = URLRequest(url: baseURL.appendingPathComponent("_matrix/client/r0/publicRooms"))
        
        return dispatcher.dispatch(request, JSONDecoder())
            .map(\.value)
            .eraseToAnyPublisher()
    }
}
