//
//  PopularMovieCell.swift
//  SuitMovies
//
//  Created by Bayu Paoh on 23/10/18.
//  Copyright © 2018 Rifat Firdaus. All rights reserved.
//

import UIKit
import AlamofireImage

class PopularMovieCell: UITableViewCell {
    @IBOutlet weak var imagePopular: UIImageView!
    @IBOutlet weak var descPopular: UILabel!
    @IBOutlet weak var titlePopular: UILabel!
    
    var popularMovie: PopularMovie? {
        didSet {
            if let popularMovie = popularMovie {
                titlePopular.text = popularMovie.title ?? " "
                descPopular.text = popularMovie.overview ?? ""
                let backdrop = popularMovie.backdropPath ?? ""
                if let url = URL(string:"https://image.tmdb.org/t/p/w185"+backdrop){
                    imagePopular.af_setImage(withURL: url)
                }
            }
        }
    }
}
