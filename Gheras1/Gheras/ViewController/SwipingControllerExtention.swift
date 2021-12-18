//
//  SwipingControllerExtention.swift
//  Gheras
//
//  Created by AlDanah Aldohayan on 18/12/2021.
//

import Foundation
import UIKit

extension SwipingController {
   
  override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
     
    coordinator.animate(alongsideTransition: { (_) in
      self.collectionViewLayout.invalidateLayout()
      if self.pageControl.currentPage == 0 {
        self.collectionView.contentOffset = .zero
      }else{
        let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
        self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
      }
       
    }, completion: nil)
  }
   
  
   
}
