//
//  ViewController.swift
//  swift_GraphQL_implementation
//
//  Created by shin seunghyun on 2020/07/03.
//  Copyright © 2020 shin seunghyun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Network.shared.apollo.fetch(query: RootQuery()) { result in
          switch result {
          case .success(let graphQLResult):
            if let name = graphQLResult.data?.books {
              print(name) // Luke Skywalker
            } else if let errors = graphQLResult.errors {
              // GraphQL errors
              print(errors)
            }
          case .failure(let error):
            // Network or response format errors
            print(error)
          }
        }
        
    
    }

                                                                            
}

