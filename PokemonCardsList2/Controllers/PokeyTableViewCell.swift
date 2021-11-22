//
//  PokeyTableViewCell.swift
//  PokemonCardsList2
//
//  Created by janis.miltins on 21/11/2021.
//

//
//  PokeyTableViewCell.swift
//  PokemonCardsList
//
//  Created by janis.miltins on 19/11/2021.
//

import UIKit
import SDWebImage

class PokeyTableViewCell: UITableViewCell {
    @IBOutlet weak var pokeyImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var supertypeLabel: UILabel!
    
    @IBOutlet weak var subtypeLabel: UILabel!
    @IBOutlet weak var hpLabel: UILabel!
    

    
    func setupUI(withDataFrom: Pokemon){
        nameLabel.text = "Name" + withDataFrom.name
        hpLabel.text = "Card value: " + withDataFrom.number
// to display image
        self.pokeyImageView.sd_setImage(with: URL(string: withDataFrom.image), placeholderImage: UIImage(systemName: "applelogo"))
        
//        subtypeLabel.text = "Subtype: " + withDataFrom.subtype!
//        supertypeLabel.text = "Supertype " + withDataFrom.supertype!
        //        seriesLabel.text = "Series: " + withDataFrom.series!
        // subtype, supertype and series are optionals, must check, do they contain data
        if let subtype = withDataFrom.subtype {
            subtypeLabel.text = "Card: " + subtype
        }
        
        if let supertype = withDataFrom.supertype {
            supertypeLabel.text = "Type: " + supertype
            
        }

        
        
        
        
    }
    
}
