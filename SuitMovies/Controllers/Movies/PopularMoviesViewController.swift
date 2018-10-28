//
//  PopularMoviesViewController.swift
//  SuitMovies
//
//  Created by Bayu Paoh on 22/10/18.
//  Copyright © 2018 Rifat Firdaus. All rights reserved.
//

import UIKit

class PopularMoviesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter : ViewToPresenterPopularMoviesProtocol?
    var data = [PopularMovie]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.presenter?.fetchPopularMovies()
    }
    
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PopularMovieCell.loadNib(), forCellReuseIdentifier: PopularMovieCell.className())
        tableView.addPullToRefresh {
            self.presenter?.fetchPopularMovies()
        }

    }
}

extension PopularMoviesViewController : PresenterToViewPopularMoviesProtocol {
    
    func showProgress() {
        tableView.pullToRefreshView.startAnimating()
    }
    
    func hideProgress() {
        tableView.pullToRefreshView.stopAnimating()
    }
    
    func showData(data: [PopularMovie]) {
        self.data = data
        tableView.reloadData()
    }
    
    func showError(error: Error?) {
        let alert = AlertHelper.createAlert(title: "Error", message: error?.localizedDescription)
        self.present(alert, animated: true, completion: nil)
    }
}

extension PopularMoviesViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PopularMovieCell.className(), for: indexPath) as! PopularMovieCell
        cell.popularMovie = self.data[indexPath.row]
        return cell
    }
}

extension PopularMoviesViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = AlertHelper.createAlert(title: "Movie Detail", message: self.data[indexPath.row].title)
        self.present(alert, animated: true, completion: nil)
        
    }
}
