//
//  ViewController.swift
//  HttpPractice
//
//  Created by steven.chou on 2018/1/25.
//  Copyright © 2018年 steven.chou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        getData()
    }

/*
    // Test1
    // 可拿來練習 JSON parser 的 API
    // http://jsonplaceholder.typicode.com/
    func getData() {

        let urlString = "https://jsonplaceholder.typicode.com/posts"

        let headers = [
            "cache-control": "no-cache",
            "postman-token": "6bb2dd34-a9a9-a595-4dc9-09c01dc49951"
        ]

        // Set request
        let request = NSMutableURLRequest(url: NSURL(string: urlString)! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)

        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared

        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in

            if (error != nil) {
                print(String(describing: data))
            } else {

                do {
                    guard
                        let jsonData = try JSONSerialization.jsonObject(with: data!, options:.allowFragments) as? [[String : AnyObject]]
                        else {
                            print("Something is wrong.")
                            return
                        }

                    print(jsonData.count)

                    for eachData in jsonData {

                        guard
                            let userID = eachData["userId"] as? Int,
                            let id = eachData["id"] as? Int,
                            let title = eachData["title"] as? String,
                            let body = eachData["body"] as? String
                            else {
                                print("Can't parse the JSON.")
                                return
                            }

                        print("userID: \(userID)")
                        print("id: \(id)")
                        print("title: \(title)")
                        print("body: \(body)")

                        print("======================")
                    }

                } catch {
                    print(error)
                }

            }
        })

        dataTask.resume()
    }
*/

/*
    // Test2
    // 利用 可以用 google sheet 當 API 的 tool - Sheetsu
    // https://docs.sheetsu.com/?swift#introduction
    func getData() {
        // Read whole spreadsheet
        let url = String(format: "https://sheetsu.com/apis/v1.0su/39014b8c2cc4")
        let serviceUrl = URL(string: url)
        var request = URLRequest(url: serviceUrl!)

        request.httpMethod = "GET"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")    // set header

        let session = URLSession.shared

        session.dataTask(with: request) { (data, response, error) in
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
*/

    // Test3
    // 利用 Sheetsu 產生 API, 並指撈出特定值
    func getData() {
        // Get all rows where column 'score' is '42'
        let url = String(format: "https://sheetsu.com/apis/v1.0ds/020b2c0f/search?score=42")
        let serviceUrl = URL(string: url)

        var request = URLRequest(url: serviceUrl!)
        request.httpMethod = "GET"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")    // set header

        let session = URLSession.shared

        session.dataTask(with: request) { (data, response, error) in
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
}

