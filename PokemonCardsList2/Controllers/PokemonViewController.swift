//
//  ViewController.swift
//  PokemonCardsList2
//
//  Created by janis.miltins on 21/11/2021.
//

import UIKit

class PokemonViewController: UIViewController {
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    var pokey: [Pokemon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPokemonData()
    }
    
    func getPokemonData(){
        let jsonUrl = "https://api.pokemontcg.io/v1/cards"
        guard let url = URL(string: jsonUrl) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let config = URLSessionConfiguration.default
        config.waitsForConnectivity = true
        
        URLSession(configuration: config).dataTask(with: request) { (dataPok, response, err)  in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }
            
            guard let data = dataPok else {
                print(String(describing: err))
                return
            }
            do{
                let jsonData = try JSONDecoder().decode(Card.self, from: data)
                self.pokey = jsonData.cards
                
                DispatchQueue.main.async {
                    print("jsonData", jsonData)
                    self.tableViewOutlet.reloadData()
                }
                
            }catch{
                print("err:", error)
            }
        }.resume()
    }
    
}


extension PokemonViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokey.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "pokeyCell", for: indexPath) as? PokeyTableViewCell else { return UITableViewCell()}
        
        let poke = pokey[indexPath.row]
        cell.setupUI(withDataFrom: poke)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == "pokey"{
     // Get the new view controller using segue.destination.
             guard let destinationVC = segue.destination as? DetailViewController, let row = tableViewOutlet.indexPathForSelectedRow?.row else {return}
             
     // Pass the selected object to the new view controller.
             destinationVC.pokemon = pokey[row]
     }
     }
}
