//
//  OrderCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Илья Акулов on 18.02.2024.
//

import UIKit

class OrderCoordinator: Coordinator {
    override func start() {
        let vc = ViewController()
        vc.view.backgroundColor = .green
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}
