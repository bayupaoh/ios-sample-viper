//
//  UpcomingMovieViewController.swift
//  SuitMovies
//
//  Created by Bayu Paoh on 22/10/18.
//  Copyright © 2018 Rifat Firdaus. All rights reserved.
//

import UIKit

class UpcomingMovieViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var presenter : ViewToPresenterUpcomingMovieProtocol?
    var data = [UpcomingMovie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.presenter?.fetchupcomingMovies()
    }
    
    func setupCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UpcomingMovieCell.loadNib(), forCellWithReuseIdentifier: UpcomingMovieCell.className())
        collectionView.addPullToRefresh {
            self.presenter?.fetchupcomingMovies()
        }
    }
}


extension UpcomingMovieViewController : PresenterToViewUpcomingMovieProtocol{
    func showProgress() {
        //                collectionView.pullToRefreshView.startAnimating()
    }
    
    func hideProgress() {
        collectionView.pullToRefreshView.stopAnimating()
    }
    
    func showData(data: [UpcomingMovie]) {
        self.data = data
        collectionView.reloadData()
    }
    
    func showError(error: Error?) {
        let alert = AlertHelper.createAlert(title: "Error", message: error?.localizedDescription)
        self.present(alert, animated: true, completion: nil)
    }
}

extension UpcomingMovieViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UpcomingMovieCell.className(), for: indexPath) as! UpcomingMovieCell
        cell.upcomingMovie = self.data[indexPath.row]
        return cell
    }
    
}

extension UpcomingMovieViewController : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}
