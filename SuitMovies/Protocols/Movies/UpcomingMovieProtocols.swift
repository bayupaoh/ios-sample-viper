//
//  UpcomingMovieProtocols.swift
//  SuitMovies
//
//  Created by Bayu Paoh on 28/10/18.
//  Copyright © 2018 Rifat Firdaus. All rights reserved.
//

import Foundation
import UIKit

protocol PresenterToViewUpcomingMovieProtocol : class {
    func showProgress()
    func hideProgress()
    func showData(data:[UpcomingMovie])
    func showError(error: Error?)
}

protocol InteractorToPresenterUpcomingMovieProtocol : class{
    func upcomingMoviesFetched(data:[UpcomingMovie])
    func upcomingMoviesFailed(error: Error?)
}

protocol PresenterToInteractorUpcomingMovieProtocol : class {
    var presenter:InteractorToPresenterUpcomingMovieProtocol? {get set}
    func fetchupcomingMovies(apiKey:String)
}

protocol ViewToPresenterUpcomingMovieProtocol : class {
    var view:PresenterToViewUpcomingMovieProtocol? {get set}
    var interactor:PresenterToInteractorUpcomingMovieProtocol? {get set}
    var router:PresenterToRouterUpcomingMovieProtocol? {get set}
    func fetchupcomingMovies()
}

protocol PresenterToRouterUpcomingMovieProtocol : class  {
    static func createModule() -> UIViewController
}


