//
//  RestPablisher.swift
//  Georgia
//
//  Created by MOZI Development on 10/28/15.
//  Copyright (c) 2015 MOZI Development. All rights reserved.
//

import Foundation
import SwiftyJSON

class RestPublisher {
    
    let address: String?
    let createdAt: Int?
    let email: String?
    let logo: String?
    let name: String?
    let publDescription: String?
    let publisherId: Int?
    let publIsDeleted: Bool?
    let site: String?
    let telephone: String?
    let stream: String?
    let updatedAt: Int?
    
    init(publisherData: JSON) {
        if let address = publisherData["address"].string {
            self.address = address
        } else {
            self.address = nil
        }
        if let description = publisherData["description"].string {
           self.publDescription = description
        } else {
            self.publDescription = nil
        }
        if let email = publisherData["email"].string {
            self.email = email
        } else {
            self.email = nil
        }
        if let id = publisherData["id"].int {
            self.publisherId = id
        } else {
            self.publisherId = nil
        }
        if let isDeleted = publisherData["is_deleted"].bool{
            self.publIsDeleted = isDeleted
        } else {
            self.publIsDeleted = nil
        }
        if let logo = publisherData["logo"].string {
            self.logo = logo
        } else {
            self.logo = nil
        }
        if let phone = publisherData["phone"].string {
            self.telephone = phone
        } else {
            self.telephone = nil
        }
        if let name = publisherData["publisher_name"].string {
            self.name = name
        } else {
            self.name = nil
        }
        if let site = publisherData["site"].string {
            self.site = site
        } else {
            self.site = nil
        }
        if let createdAt = publisherData["created_at"].int{
            self.createdAt = createdAt
        } else {
            self.createdAt = nil
        }
        if let updatedAt = publisherData["updated_at"].int {
            self.updatedAt = updatedAt
        } else {
            self.updatedAt = nil
        }
        if let stream = publisherData["stream"].string {
            self.stream = stream
        } else {
            self.stream = nil
        }
    }
    
}