//
//  MXSegmentedPagerController+Extensions.swift
//  Bali United
//
//  Created by Rifat Firdaus on 1/13/17.
//  Copyright © 2017 Suitmedia. All rights reserved.
//

import UIKit

extension MXSegmentedPagerController {
    
    func defaultPagerStyle(selectionStyle: HMSegmentedControlSelectionStyle = .fullWidthStripe,
                           segmentWidthStyle: HMSegmentedControlSegmentWidthStyle = .fixed, includeInset: Bool = false) {
        let barbuttonFont = UIFont(name: "HelveticaNeue-Bold", size: 13) ?? UIFont.boldSystemFont(ofSize: 13)
        segmentedPager.segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocation.down;
        segmentedPager.segmentedControl.backgroundColor = UIColor.primary()
        segmentedPager.segmentedControl.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white(alpha: 0.5), NSAttributedStringKey.font: barbuttonFont];
        segmentedPager.segmentedControl.selectedTitleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        segmentedPager.segmentedControl.selectionStyle = selectionStyle
        segmentedPager.segmentedControl.selectionIndicatorColor = UIColor.orange
        segmentedPager.segmentedControl.segmentWidthStyle = segmentWidthStyle
        if includeInset {
            segmentedPager.segmentedControl.segmentEdgeInset = UIEdgeInsetsMake(0, 20, 0, 20)
        }
    }
    
    func setupPagerStyleWith(bgColor: UIColor = UIColor.primary(), titleColor: UIColor = UIColor.groupTableViewBackground, selectedTitleColor: UIColor = UIColor.white) {
        // Segmented Control customization
        let titleFont = UIFont(name: "HelveticaNeue", size: 13) ?? UIFont.systemFont(ofSize: 13)
        let selectedTitleFont = UIFont(name: "HelveticaNeue-Bold", size: 13) ?? UIFont.boldSystemFont(ofSize: 13)
        segmentedPager.segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocation.down;
        segmentedPager.segmentedControl.backgroundColor = bgColor
        segmentedPager.segmentedControl.titleTextAttributes = [NSAttributedStringKey.foregroundColor : titleColor, NSAttributedStringKey.font: titleFont]
        segmentedPager.segmentedControl.selectedTitleTextAttributes = [NSAttributedStringKey.foregroundColor : selectedTitleColor, NSAttributedStringKey.font: selectedTitleFont]
        segmentedPager.segmentedControl.selectionStyle = HMSegmentedControlSelectionStyle.fullWidthStripe
        segmentedPager.segmentedControl.selectionIndicatorColor = UIColor.orange
        segmentedPager.segmentedControl.selectionIndicatorHeight = 1.5
        //        segmentedPager.segmentedControl.segmentWidthStyle = .dynamic
    }
    
    func setupPagerStyleWith(bgColor: UIColor = UIColor.primary(), titleColor: UIColor = UIColor.groupTableViewBackground, selectedTitleColor: UIColor = UIColor.white, borderColor: UIColor = UIColor.white) {
        // Segmented Control customization
        let titleFont = UIFont(name: "HelveticaNeue", size: 13) ?? UIFont.systemFont(ofSize: 13)
        let selectedTitleFont = UIFont(name: "HelveticaNeue-Bold", size: 13) ?? UIFont.boldSystemFont(ofSize: 13)
        segmentedPager.segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocation.down;
        segmentedPager.segmentedControl.backgroundColor = bgColor
        segmentedPager.segmentedControl.titleTextAttributes = [NSAttributedStringKey.foregroundColor : titleColor, NSAttributedStringKey.font: titleFont]
        segmentedPager.segmentedControl.selectedTitleTextAttributes = [NSAttributedStringKey.foregroundColor : selectedTitleColor, NSAttributedStringKey.font: selectedTitleFont]
        segmentedPager.segmentedControl.selectionStyle = HMSegmentedControlSelectionStyle.fullWidthStripe
        segmentedPager.segmentedControl.selectionIndicatorColor = borderColor
        segmentedPager.segmentedControl.selectionIndicatorHeight = 1.5
        //        segmentedPager.segmentedControl.segmentWidthStyle = .dynamic
    }
    
    func defaultPagerStyleWithParallax() {
        
        // Parallax Header
//        segmentedPager.parallaxHeader.view = HeaderMX.instanceFromNib()
//        segmentedPager.parallaxHeader.mode = MXParallaxHeaderMode.fill
//        segmentedPager.parallaxHeader.height = UIScreen.main.bounds.width / 1.5
//        segmentedPager.parallaxHeader.minimumHeight = 20
        
        
        // Segmented Control customization
        segmentedPager.segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocation.down
        // will be used
        //        segmentedPager.segmentedControl.backgroundColor = UIColor(hex:0xD91A31)
        segmentedPager.segmentedControl.backgroundColor = UIColor.clear
        segmentedPager.segmentedControl.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor(hex:0x646464), NSAttributedStringKey.font: UIFont.PFBeauFont(size: 13)]
        segmentedPager.segmentedControl.selectedTitleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor(hex:0xfcb61e), NSAttributedStringKey.font: UIFont.PFBeauFont(size: 13)]
        segmentedPager.segmentedControl.selectionStyle = HMSegmentedControlSelectionStyle.textWidthStripe
        segmentedPager.segmentedControl.selectionIndicatorColor = UIColor(hex:0xfcb61e)
        segmentedPager.segmentedControl.selectionIndicatorHeight = 1.5
        segmentedPager.segmentedControl.selectionIndicatorEdgeInsets = UIEdgeInsetsMake(0, 0, -11, 0)
        segmentedPager.segmentedControl.type = .fixed
        segmentedPager.segmentedControl.widthFixedType = 12
    }
    
}
