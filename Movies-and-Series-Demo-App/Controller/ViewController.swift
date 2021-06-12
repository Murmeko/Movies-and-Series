//
//  ViewController.swift
//  Movies-and-Series-Demo-App
//
//  Created by Yiğit Erdinç on 12.06.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var manager = PopularMoviesManager()
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        manager.listPopularMovies()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

