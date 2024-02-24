//
//  ProfileCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Илья Акулов on 18.02.2024.
//

import UIKit

class ProfileCoordinator: Coordinator {
    override func start() {
        let vc = ViewController()
        vc.view.backgroundColor = .orange
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}
