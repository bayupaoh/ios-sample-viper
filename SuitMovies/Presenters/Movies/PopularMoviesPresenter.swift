//
//  PopularMoviesPresenter.swift
//  SuitMovies
//
//  Created by Bayu Paoh on 22/10/18.
//  Copyright © 2018 Rifat Firdaus. All rights reserved.
//

import Foundation

class PopularMoviesPresenter : ViewToPresenterPopularMoviesProtocol {
    var view: PresenterToViewPopularMoviesProtocol?
    var interactor: PresenterToInteractorPopularMoviesProtocol?
    var router: PresenterToRouterPopularMoviesProtocol?
    
    func fetchPopularMovies() {
        view?.showProgress()
        interactor?.fetchPopularMovies(apiKey: "1b2f29d43bf2e4f3142530bc6929d341")
    }
    
    
}

extension PopularMoviesPresenter : InteractorToPresenterPopularMoviesProtocol {
    func PopularMoviesFetched(data: [PopularMovie]) {
        view?.hideProgress()
        view?.showData(data: data)
    }
    
    func PopularMoviesFailed(error: Error?) {
        view?.hideProgress()
        view?.showError(error: error)
    }
    
}

