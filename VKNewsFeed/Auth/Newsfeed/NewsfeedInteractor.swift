//
//  NewsfeedInteractor.swift
//  VKNewsFeed
//
//  Created by Veaceslav Chirita on 11/29/19.
//  Copyright (c) 2019 Veaceslav Chirita. All rights reserved.
//

import UIKit

protocol NewsfeedBusinessLogic {
    func makeRequest(request: Newsfeed.Model.Request.RequestType)
}

class NewsfeedInteractor: NewsfeedBusinessLogic {
    
    var presenter: NewsfeedPresentationLogic?
    var service: NewsfeedService?
    private var fetcher: DataFetcher = NetwordDataFetcher(networking: NetworkService())
    
    func makeRequest(request: Newsfeed.Model.Request.RequestType) {
        if service == nil {
            service = NewsfeedService()
        }
        
        switch request {
        case .getNewsFeed:
            fetcher.getFeed { [weak self] (feedResponse) in
                guard let feedResponse = feedResponse else { return }
                self?.presenter?.presentData(response: Newsfeed.Model.Response.ResponseType.presentNewsfeed(feed: feedResponse))
            }
        }
    }
}
