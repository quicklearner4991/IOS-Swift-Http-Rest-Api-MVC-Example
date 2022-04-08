//
//  PostsApiManagerDelegate.swift
//  IOS-Swift-Api-MVC-Example
//
//  Created by apple on 08/04/22.
//

import Foundation
protocol PostsApiManagerDelegate {
    func onPostsResponse(_ apiManager: PostsApiManager,responseModel:[PostsModel])
    func onError(_ error:Error)
}
