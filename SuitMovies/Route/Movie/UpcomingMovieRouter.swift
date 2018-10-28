//
//  UpcomingMovieRouter.swift
//  SuitMovies
//
//  Created by Bayu Paoh on 28/10/18.
//  Copyright © 2018 Rifat Firdaus. All rights reserved.
//

import Foundation
import UIKit

class UpcomingMovieRouter: PresenterToRouterUpcomingMovieProtocol {

    static func createModule() -> UIViewController {
        let view = UIStoryboard.movies.instantiateViewController(withIdentifier: UpcomingMovieViewController.className()) as? UpcomingMovieViewController
        let presenter : ViewToPresenterUpcomingMovieProtocol & InteractorToPresenterUpcomingMovieProtocol = UpcomingMoviePresenter()
        let interactor: PresenterToInteractorUpcomingMovieProtocol = UpcomingMovieInteractor()
        let router: PresenterToRouterUpcomingMovieProtocol = UpcomingMovieRouter()
        
        view?.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return view!
    }

}
