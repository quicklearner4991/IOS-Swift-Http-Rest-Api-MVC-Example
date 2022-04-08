//
//  PostsModel.swift
//  IOS-Swift-Api-MVC-Example
//
//  Created by apple on 08/04/22.
//

import Foundation

struct PostsModel : Decodable {
    let userId : Int?
    let id : Int?
    let title : String?
    let body : String?
}
