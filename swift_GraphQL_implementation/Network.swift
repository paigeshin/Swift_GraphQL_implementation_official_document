//
//  Network.swift
//  swift_GraphQL_implementation
//
//  Created by shin seunghyun on 2020/07/03.
//  Copyright © 2020 shin seunghyun. All rights reserved.
//

import Apollo

// MARK: - Singleton Wrapper

class Network {
    
    static let shared: Network = Network()
    
    // Configure the network transport to use the singleton as the delegate.
    private lazy var networkTransport: HTTPNetworkTransport = {
      let transport = HTTPNetworkTransport(url: URL(string: "http://localhost:5000/graphql")!)
//      transport.delegate = self
      return transport
    }()
    
    private(set) lazy var apollo = ApolloClient(url: URL(string: "http://127.0.0.1:5000/graphql")!)
    
}

// MARK: - Pre-flight delegate

//extension Network: HTTPNetworkTransportPreflightDelegate {
//
//  func networkTransport(_ networkTransport: HTTPNetworkTransport,
//                          shouldSend request: URLRequest) -> Bool {
//    // If there's an authenticated user, send the request. If not, don't.
//    return UserManager.shared.hasAuthenticatedUser
//  }
//
//  func networkTransport(_ networkTransport: HTTPNetworkTransport,
//                        willSend request: inout URLRequest) {
//
//    // Get the existing headers, or create new ones if they're nil
//    var headers = request.allHTTPHeaderFields ?? [String: String]()
//
//    // Add any new headers you need
//    headers["Authorization"] = "Bearer \(UserManager.shared.currentAuthToken)"
//
//    // Re-assign the updated headers to the request.
//    request.allHTTPHeaderFields = headers
//
//    Logger.log(.debug, "Outgoing request: \(request)")
//  }
//}

// MARK: - Task Completed Delegate

//extension Network: HTTPNetworkTransportTaskCompletedDelegate {
//  func networkTransport(_ networkTransport: HTTPNetworkTransport,
//                        didCompleteRawTaskForRequest request: URLRequest,
//                        withData data: Data?,
//                        response: URLResponse?,
//                        error: Error?) {
//    Logger.log(.debug, "Raw task completed for request: \(request)")
//
//    if let error = error {
//      Logger.log(.error, "Error: \(error)")
//    }
//
//    if let response = response {
//      Logger.log(.debug, "Response: \(response)")
//    } else {
//      Logger.log(.error, "No URL Response received!")
//    }
//
//    if let data = data {
//      Logger.log(.debug, "Data: \(String(describing: String(bytes: data, encoding: .utf8)))")
//    } else {
//      Logger.log(.error, "No data received!")
//    }
//  }
//}

// MARK: - Retry Delegate

//extension Network: HTTPNetworkTransportRetryDelegate {
//
//  func networkTransport(_ networkTransport: HTTPNetworkTransport,
//                        receivedError error: Error,
//                        for request: URLRequest,
//                        response: URLResponse?,
//                        continueHandler: @escaping (_ action: HTTPNetworkTransport.ContinueAction) -> Void) {
//    // Check if the error and/or response you've received are something that requires authentication
//    guard UserManager.shared.requiresReAuthentication(basedOn: error, response: response) else {
//      // This is not something this application can handle, do not retry.
//      continueHandler(.fail(error))
//      return
//    }
//    
//    // Attempt to re-authenticate asynchronously
//    UserManager.shared.reAuthenticate { (reAuthenticateError: Error?) in
//      // If re-authentication succeeded, try again. If it didn't, don't.
//      if let reAuthenticateError = reAuthenticateError {
//        continueHandler(.fail(reAuthenticateError)) // Will return re authenticate error to query callback
//        // or (depending what error you want to get to callback)
//        continueHandler(.fail(error)) // Will return original error
//      } else {
//        continueHandler(.retry)
//      }
//    }
//  }
//}
