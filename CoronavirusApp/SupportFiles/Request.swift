//
//  Request.swift
//  DemoTest
//
//  Created by Jędrzej Chołuj on 30/03/2020.
//  Copyright © 2020 Jędrzej Chołuj. All rights reserved.
//

import Foundation

struct Request {
    let endpoint = Endpoint()
    let headers = [
        "x-rapidapi-host": "coronavirus-monitor.p.rapidapi.com",
        "x-rapidapi-key": "ced969f9c4mshc2fa80c47a83adcp173318jsn4b195faecbd2"
    ]
    var request: URLRequest

    init(endpoint: String) {
        request = URLRequest(url: URL(string: endpoint)!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
    }
}
