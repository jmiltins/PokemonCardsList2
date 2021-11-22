//
//  DetailViewController.swift
//  PokemonCardsList2
//
//  Created by janis.miltins on 22/11/2021.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    //?, because may not contain the image
    var pokemon: Pokemon?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let pokey = pokemon{
            self.imageView.sd_setImage(with: URL(string: pokey.image), placeholderImage: UIImage(systemName: "applelogo"))
        }
    }
    



}
