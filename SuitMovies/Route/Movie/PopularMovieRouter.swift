//
//  PopularMovieRouter.swift
//  SuitMovies
//
//  Created by Bayu Paoh on 29/10/18.
//  Copyright © 2018 Rifat Firdaus. All rights reserved.
//

import Foundation
import UIKit

class PopularMovieRouter: PresenterToRouterPopularMoviesProtocol {
    
    static func createModule() -> UIViewController {
        let view = UIStoryboard.movies.instantiateViewController(withIdentifier: PopularMoviesViewController.className()) as? PopularMoviesViewController
        let presenter : ViewToPresenterPopularMoviesProtocol & InteractorToPresenterPopularMoviesProtocol = PopularMoviesPresenter()
        let interactor: PresenterToInteractorPopularMoviesProtocol = PopularMovieInteractor()
        let router: PresenterToRouterPopularMoviesProtocol = PopularMovieRouter()
        
        view?.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return view!
    }
    
}
