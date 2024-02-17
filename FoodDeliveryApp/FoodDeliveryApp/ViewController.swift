//
//  ViewController.swift
//  FoodDeliveryApp
//
//  Created by Илья Акулов on 18.02.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemPink
        
        let label = UILabel()
        label.text = "Hello world!"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 20)
        ])
        label.font = .systemFont(ofSize: 40, weight: UIFont.Weight(rawValue: 20))
        label.textColor = .white
        label.center = view.center
    }


}

