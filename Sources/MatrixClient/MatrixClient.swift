import Foundation
import Combine
import NetworkDispatcher

public struct MatrixClient {
    private let baseURL: URL
    private let dispatcher: Dispatcher
    
    public init(baseURL: URL, dispatcher: Dispatcher) {
        self.baseURL = baseURL
        self.dispatcher = dispatcher
    }
}

public extension MatrixClient {
    func publicRooms() -> AnyPublisher<[Room], Error> {
        let request = URLRequest(url: baseURL.appendingPathComponent("_matrix/client/r0/publicRooms"))
        
        return dispatcher.dispatch(request, JSONDecoder())
            .map(\.value)
            .eraseToAnyPublisher()
    }
}
