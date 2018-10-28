//
//  PopularMovieInteractor.swift
//  SuitMovies
//
//  Created by Bayu Paoh on 28/10/18.
//  Copyright © 2018 Rifat Firdaus. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class PopularMovieInteractor: BaseInteractor,PresenterToInteractorPopularMoviesProtocol {
    var presenter: InteractorToPresenterPopularMoviesProtocol?
    
    func fetchPopularMovies(apiKey: String) {
        Observable.just(apiKey)
            .flatMapLatest { apiKey in self.service.getPopularMovies(apiKey: apiKey)}
            .do(onNext:{ data in
                self.removeAllModelsOf(type: PopularMovie.self)
                self.saveListOfModels(data: data.detached())
                self.presenter?.PopularMoviesFetched(data: data)
            })
            .do(onError: { error in
                self.presenter?.PopularMoviesFailed(error: error)
                
            })
            .subscribe()
            .disposed(by: disposeBag)
    }
}
