//
//  Promotion.swift
//  Pros
//
//  Created by Suwat Saegauy on 2/21/15.
//  Copyright (c) 2015 com.cpekmutt.project. All rights reserved.
//

import UIKit

class Promotion: NSObject {
   
    // ------------------------------
    // MARK: -
    // MARK: Properties
    // ------------------------------
    
//    var objectId: String!
//    var createdAt: NSDate!
//    var updatedAt: NSDate!
    
    var promotionID: String!
    var UserID: String!
    var promotionPublishPoint: String!
    var promotionPublishName: String!
    var promotionPublishType: String!
    var promotionPublishDescription: String!
    var promotionPublishPoster: String!
    var promotionPublishCreatedAt: String!
    var promotionPublishUpdatedAt: String!
    var promotionPublishPublishedAt: String!
    var promotionPublishExpiredAt: String!
    var shopName: String!
    var shopLogoURL: String!
    var shopType: String!

    // ------------------------------
    // MARK: -
    // MARK: Configuration
    // ------------------------------
    
    init(promotionID: String!,
        UserID: String!,
        promotionPublishPoint: String!,
        promotionPublishName: String!,
        promotionPublishType: String!,
        promotionPublishDescription: String!,
        promotionPublishPoster: String!,
        promotionPublishCreatedAt: String!,
        promotionPublishUpdatedAt: String!,
        promotionPublishPublishedAt: String!,
        promotionPublishExpiredAt: String!,
        shopName: String!,
        shopLogoURL: String!,
        shopType: String!) {
            
            super.init()
            
            self.promotionID = promotionID
            self.UserID = UserID
            self.promotionPublishPoint = promotionPublishPoint
            self.promotionPublishName = promotionPublishName
            self.promotionPublishType = promotionPublishType
            self.promotionPublishDescription = promotionPublishDescription
            self.promotionPublishPoster = promotionPublishPoster
            self.promotionPublishCreatedAt = promotionPublishCreatedAt
            self.promotionPublishUpdatedAt = promotionPublishUpdatedAt
            self.promotionPublishPublishedAt = promotionPublishPublishedAt
            self.promotionPublishExpiredAt = promotionPublishExpiredAt
            self.shopName = shopName
            self.shopLogoURL = shopLogoURL
            self.shopType = shopType
    }
}