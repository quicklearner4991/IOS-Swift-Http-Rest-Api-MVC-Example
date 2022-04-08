//
//  PostsApiManager.swift
//  IOS-Swift-Api-MVC-Example
//
//  Created by apple on 08/04/22.
//

import Foundation
struct PostsApiManager {
    var delegate : PostsApiManagerDelegate?
    func getPosts(){
        let url = URL(string: K.GET_POSTS)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let safeData = data,
                let response = response as? HTTPURLResponse,
                error == nil else {                                              // check for fundamental networking error
                print("error", error ?? "Unknown error")
                delegate?.onError(error!)
                return
            }

            guard (200 ... 299) ~= response.statusCode else {                    // check for http errors
                print("statusCode should be 2xx, but is \(response.statusCode)")
                print("response = \(response)")
                return
            }

            let responseString = String(data: safeData, encoding: .utf8)
            do {
                let decoder = JSONDecoder()
            let loginResponseModel =  try decoder.decode([PostsModel].self, from: data!)
            delegate?.onPostsResponse(self, responseModel: loginResponseModel)
            }
            catch {
                delegate?.onError(error)
            }
            print("responseString = \(responseString)")
        }

        task.resume()
    }
}
