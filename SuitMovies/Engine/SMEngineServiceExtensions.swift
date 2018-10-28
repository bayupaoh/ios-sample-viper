//
//  SMEngineServiceExtensions.swift
//  SuitMovies
//
//  Created by Rifat Firdaus on 10/1/18.
//  Copyright © 2018 Rifat Firdaus. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

import RxSwift
import RxCocoa

struct APIResponse {
    var message: String?
    var code: Int?
    var result: JSON?
}

extension SMEngineService {
    
    func getUpcomingMovies(apiKey:String) -> Observable<[UpcomingMovie]> {
        return manager.requestJSON(.get, home + "/3/movie/upcoming?api_key=\(apiKey)", parameters: nil, headers: nil)
            .mapJson()
            .do(onError: { error in
                print("🚫 \(error.localizedDescription)")
            })
            .map({ data in
                var dataList = [UpcomingMovie]()
                for item in data["results"].arrayValue {
                    if let match = UpcomingMovie.with(json: item) {
                        dataList.append(match)
                    }
                }
                return dataList
            })
    }
    
    
    func getPopularMovies(apiKey:String) -> Observable<[PopularMovie]> {
        return manager.requestJSON(.get, home + "/3/discover/movie?api_key=\(apiKey)", parameters: nil, headers: nil)
            .mapJson()
            .do(onError: { error in
                print("🚫 \(error.localizedDescription)")
            })
            .map({ data in
                var dataList = [PopularMovie]()
                for item in data["results"].arrayValue {
                    if let match = PopularMovie.with(json: item) {
                        dataList.append(match)
                    }
                }
                return dataList
            })
    }
    
    func searchRepo(user:String, params: [String:Any], page: Int = 1, perPage: Int = 10) -> Observable<Pagination<[Repo]>> {
        var parameters: [String:Any] = [
            "per_page" : perPage,
            "page" : page
        ]
        for (key, value) in params {
            parameters[key] = value as Any?
        }
        // Access token here
//        if let token = PreferenceManager.instance.token {
//            parameters["access_token"] = token
//        }
        return manager.requestJSON(.get, home + "/users/\(user)/repos", parameters: parameters, headers: headers)
            .mapJson()
            .do(onError: { error in
                print("🚫 \(error.localizedDescription)")
            })
            .map({ data in
                // pagination
                let pageStatus = PageStatus(total: 0, currentPage: page, lastPage: 0, hasNext: true)
                var dataList = [Repo]()
                for item in data.arrayValue {
                    if let match = Repo.with(json: item) {
                        dataList.append(match)
                    }
                }
                let pagination = Pagination<[Repo]>(pageStatus: pageStatus, data: dataList)
                return pagination
            })
    }
}
