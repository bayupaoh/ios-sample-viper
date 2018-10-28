//
//  File.swift
//  SuitMovies
//
//  Created by Bayu Paoh on 28/10/18.
//  Copyright © 2018 Rifat Firdaus. All rights reserved.
//

import Foundation
import UIKit

protocol PresenterToViewPopularMoviesProtocol : class {
    func showProgress()
    func hideProgress()
    func showData(data:[PopularMovie])
    func showError(error: Error?)
}

protocol InteractorToPresenterPopularMoviesProtocol : class{
    func PopularMoviesFetched(data:[PopularMovie])
    func PopularMoviesFailed(error: Error?)
}

protocol PresenterToInteractorPopularMoviesProtocol : class {
    var presenter:InteractorToPresenterPopularMoviesProtocol? {get set}
    func fetchPopularMovies(apiKey:String)
}

protocol ViewToPresenterPopularMoviesProtocol : class {
    var view:PresenterToViewPopularMoviesProtocol? {get set}
    var interactor:PresenterToInteractorPopularMoviesProtocol? {get set}
    var router:PresenterToRouterPopularMoviesProtocol? {get set}
    func fetchPopularMovies()
}

protocol PresenterToRouterPopularMoviesProtocol : class  {
    static func createModule() -> UIViewController
}
