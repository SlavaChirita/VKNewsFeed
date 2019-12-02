//
//  NewsfeedModels.swift
//  VKNewsFeed
//
//  Created by Veaceslav Chirita on 11/29/19.
//  Copyright (c) 2019 Veaceslav Chirita. All rights reserved.
//

import UIKit

enum Newsfeed {
   
  enum Model {
    struct Request {
      enum RequestType {
        case getNewsFeed
      }
    }
    struct Response {
      enum ResponseType {
        case presentNewsfeed(feed: FeedResponse)
      }
    }
    struct ViewModel {
      enum ViewModelData {
        case displayNewsfeed(feedViewModel: FeedViewModel)
      }
    }
  }
}

struct FeedViewModel {
    struct Cell: FeedCellViewModel {
        var photoAttachment: FeedCellPhotoAttachementViewModel?
        var iconURLString: String
        var name: String
        var date: String
        var text: String?
        var likes: String?
        var comments: String?
        var shares: String?
        var views: String?
        var sizes: FeedCellSizes
    }
    
    struct FeedCellPhotoAttachment: FeedCellPhotoAttachementViewModel {
        var photoURLString: String?
        var height: Int
        var width: Int
    }
    
    let cells: [Cell]
}
