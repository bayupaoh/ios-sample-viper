//
//  UpcomingMovieInteractor.swift
//  SuitMovies
//
//  Created by Bayu Paoh on 28/10/18.
//  Copyright © 2018 Rifat Firdaus. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class UpcomingMovieInteractor: BaseInteractor, PresenterToInteractorUpcomingMovieProtocol {
    
    var presenter: InteractorToPresenterUpcomingMovieProtocol?
    
    func fetchupcomingMovies(apiKey:String) {
        Observable.just(apiKey)
            .flatMapLatest { apiKey in self.service.getUpcomingMovies(apiKey: apiKey) }
            .do(onNext:{ data in
                self.removeAllModelsOf(type: UpcomingMovie.self)
                self.saveListOfModels(data: data.detached())
                self.presenter?.upcomingMoviesFetched(data: data)
            })
            .do(onError: { error in
                self.presenter?.upcomingMoviesFailed(error: error)
            })
            .subscribe()
            .disposed(by: disposeBag)
    }
    
}
