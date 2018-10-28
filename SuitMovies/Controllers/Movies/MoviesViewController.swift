//
//  MoviesViewController.swift
//  SuitMovies
//
//  Created by Bayu Paoh on 22/10/18.
//  Copyright © 2018 Rifat Firdaus. All rights reserved.
//

import UIKit

class MoviesViewController: MXSegmentedPagerController {
    
    enum PagerItemType: String {
        case upcoming = "Upcoming"
        case popular = "Popular"
    }
    
    private var upcomingController = UpcomingMovieRouter.createModule()
    private var popularController = PopularMovieRouter.createModule()
    
    var pagerItems: [PagerItemType] {
        return [.upcoming, .popular]
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildViewController(upcomingController)
        addChildViewController(popularController)

        setupPagerStyleWith(bgColor: UIColor.blue, titleColor: UIColor.white, selectedTitleColor: UIColor.white, borderColor: UIColor.white)
        
        // Do any additional setup after loading the view.
    }
    
    override func segmentedPager(_ segmentedPager: MXSegmentedPager, titleForSectionAt index: Int) -> String {
        return pagerItems[index].rawValue
    }
    
    override func numberOfPages(in segmentedPager: MXSegmentedPager) -> Int {
        return pagerItems.count
    }
    
    override func segmentedPager(_ segmentedPager: MXSegmentedPager, viewForPageAt index: Int) -> UIView {
        if(pagerItems[index] == .upcoming){
            return upcomingController.view
        }else{
            return popularController.view
        }
    }
    
    override func heightForSegmentedControl(in segmentedPager: MXSegmentedPager) -> CGFloat {
        return 75
    }
    
    
}
