//: Playground - noun: a place where people can play

import UIKit
import XCPlayground
import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution

func request(url: NSURL) {
    
    let session = URLSession.shared
    let task = session.dataTask(with: url as URL) { data, response, error in
        if let http = response as? HTTPURLResponse {
            print("Recieved HTTP \(http.statusCode)")
            let body = String(data: data!, encoding: String.Encoding.utf8)!
            print(body)
        }
    }
    task.resume()
}

let baseURL = NSURL(string: "http://httpbin.org")!

enum Endpoint {
    
    case UserAgent
    case Links(Int)
    
    func url() -> NSURL {
        switch self {
        case .UserAgent:
            return baseURL.appendingPathComponent("/user-agent")! as NSURL
        case .Links(let n):
            return baseURL.appendingPathComponent("/links/\(n)")! as NSURL
        }
    }
    
    
}

request(url: Endpoint.UserAgent.url())
request(url: Endpoint.Links(5).url())

let url1 = Endpoint.UserAgent.url()

//Instead of String interpolation, an enum is used
let url3 = Endpoint.Links(5).url()

//Here is how it would look with String interpolation
let n = 5
let url2 = baseURL.appendingPathComponent("/links/\(n)")

