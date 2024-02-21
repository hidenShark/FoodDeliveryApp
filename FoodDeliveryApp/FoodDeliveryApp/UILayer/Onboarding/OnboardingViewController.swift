//
//  OnboardingViewController.swift
//  FoodDeliveryApp
//
//  Created by Илья Акулов on 19.02.2024.
//

import UIKit

// MARK: - OnboardingViewController

class OnboardingViewController: UIViewController {
    
    // MARK: - Properties
    private var pages = [OnboardingPartViewController]()
    
    // MARK: - Views
    private let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    private let pageControl = UIPageControl()
    private let bottomButton = UIButton()
    weak var viewOutput: OnboardingViewOutput!
    
    init(pages: [OnboardingPartViewController] = [OnboardingPartViewController](), viewOutput: OnboardingViewOutput!) {
        super.init(nibName: nil, bundle: nil)
        self.pages = pages
        self.viewOutput = viewOutput
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()

        
    }
}

// MARK: - Action

private extension OnboardingViewController {
    @objc func buttonPressed() {
        switch pageControl.currentPage {
        case 0:
            pageControl.currentPage = 1
            pageViewController.setViewControllers([pages[1]], direction: .forward, animated: true, completion: nil)
            bottomButton.setTitle(pages[1].buttonText, for: .normal)
        case 1:
            pageControl.currentPage = 2
            pageViewController.setViewControllers([pages[2]], direction: .forward, animated: true, completion: nil)
            bottomButton.setTitle(pages[2].buttonText, for: .normal)
        case 2:
            pageControl.currentPage = 3
            pageViewController.setViewControllers([pages[3]], direction: .forward, animated: true, completion: nil)
            bottomButton.setTitle(pages[3].buttonText, for: .normal)
        case 3:
            print("Exit")
        default:
            break
        }
    }
}


// MARK: - Layout
private extension OnboardingViewController {
    
    func setupLayout() {
        setupPageViewController()
        setupPageControl()
        setupButton()
    }
    
    func setupPageViewController() {
        
        pageViewController.delegate = self
        pageViewController.dataSource = self
        pageViewController.view.backgroundColor = AppColors.accentOrange
        pageViewController.setViewControllers([pages.first!], direction: .forward, animated: true)
        
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
    }
    
    func setupPageControl() {
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = 0
        let page = pages[0]
        let title = page.buttonText
        bottomButton.setTitle(title, for: .normal)
        
        
        pageControl.isUserInteractionEnabled = false
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(pageControl)
        
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -45)
        ])
    }
    
    func setupButton() {
        view.addSubview(bottomButton)
        bottomButton.translatesAutoresizingMaskIntoConstraints = false
        bottomButton.backgroundColor = AppColors.grey
        bottomButton.titleLabel?.font = .Roboto.bold.size(of: 18)
        bottomButton.setTitleColor(AppColors.black, for: .normal)
        bottomButton.layer.cornerRadius = 25
        bottomButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            bottomButton.bottomAnchor.constraint(equalTo: pageControl.topAnchor, constant: -44),
            bottomButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            bottomButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            bottomButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}


// MARK: - UIPageViewControllerDataSource

extension OnboardingViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController as! OnboardingPartViewController), currentIndex > 0 else { return nil }
        
        return pages[currentIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController as! OnboardingPartViewController), currentIndex < pages.count - 1 else { return nil }
        
        return pages[currentIndex + 1]
    }

}

// MARK: - UIPageViewControllerDelegate

extension OnboardingViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        if let index = pages.firstIndex(of: pendingViewControllers.first! as! OnboardingPartViewController) {
            pageControl.currentPage = index
            let page = pages[index]
                let title = page.buttonText
                bottomButton.setTitle(title, for: .normal)
            
        }
    }
}
