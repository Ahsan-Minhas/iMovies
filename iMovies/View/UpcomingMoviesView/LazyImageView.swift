//
//  LazyImageView.swift
//  iMovies
//
//  Created by Mac on 02/04/2022.
//

import Foundation
import UIKit


class lazyImageView:UIImageView
{
    func loadImageFromUrl(fromURL imageURL:URL,placeHolder:String){
        self.image = UIImage(named: placeHolder)
        DispatchQueue.global().async {
            [weak self] in
            if let imgData = try? Data(contentsOf: imageURL){
                if let image = UIImage(data: imgData){
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
            
        }
    }
}
