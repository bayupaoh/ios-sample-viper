//
//  UpcomingMoviePresenter.swift
//  SuitMovies
//
//  Created by Bayu Paoh on 23/10/18.
//  Copyright © 2018 Rifat Firdaus. All rights reserved.
//

import Foundation

class UpcomingMoviePresenter: ViewToPresenterUpcomingMovieProtocol {
    var view: PresenterToViewUpcomingMovieProtocol?
    
    var interactor: PresenterToInteractorUpcomingMovieProtocol?
    
    var router: PresenterToRouterUpcomingMovieProtocol?
    
    func fetchupcomingMovies() {
        view?.showProgress()
        self.interactor?.fetchupcomingMovies(apiKey: "1b2f29d43bf2e4f3142530bc6929d341")
    }
    
    
}

extension UpcomingMoviePresenter: InteractorToPresenterUpcomingMovieProtocol{
    func upcomingMoviesFetched(data: [UpcomingMovie]) {
        view?.hideProgress()
        view?.showData(data: data)
    }
    
    func upcomingMoviesFailed(error: Error?) {
        view?.hideProgress()
        view?.showError(error: error)
    }
    
    
}
