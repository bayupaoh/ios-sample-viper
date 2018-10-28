//
//  UpcomingMovieCell.swift
//  SuitMovies
//
//  Created by Bayu Paoh on 23/10/18.
//  Copyright © 2018 Rifat Firdaus. All rights reserved.
//

import UIKit
import AlamofireImage

class UpcomingMovieCell: UICollectionViewCell {

    @IBOutlet weak var imageUpcoming: UIImageView!
    @IBOutlet weak var titleUpcoming: UILabel!
    
    var upcomingMovie: UpcomingMovie? {
        didSet {
            if let upcomingMovie = upcomingMovie {
                titleUpcoming.text = upcomingMovie.title ?? " "
                let backdrop = upcomingMovie.backdropPath ?? ""
                if let url = URL(string:"https://image.tmdb.org/t/p/w185"+backdrop){
                    imageUpcoming.af_setImage(withURL: url)
                }
            }
        }
    }
}
