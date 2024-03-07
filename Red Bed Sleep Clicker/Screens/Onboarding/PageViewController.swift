//
//  PageViewController.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 07.03.2024.
//
import UIKit

final class PageViewController: UIPageViewController {
    var pages: [UIViewController] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        
        let pageData: [(String, String, UIColor)] = [
            ("RedBed Sleep Clicker", "a game where you need to control minecraft characters sleep by tap", UIColor.systemGray),
            ("Try it out!", "", UIColor.systemGray)
        ]

        for (text, subtext, color) in pageData {
            let contentVC = OnboardingViewController()
            contentVC.configure(with: text, subtitle: subtext, backgroundColor: color)
            pages.append(contentVC)
        }

        if let firstPage = pages.first {
            setViewControllers([firstPage], direction: .forward, animated: true, completion: nil)
        }
        
        pages.append(RoomsAssembly.build())
    }
}
extension PageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let contentVC = viewController as? OnboardingViewController,
              let currentIndex = pages.firstIndex(of: contentVC),
              currentIndex > 0 else {
            return nil
        }
        return pages[currentIndex - 1]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let contentVC = viewController as? OnboardingViewController,
              let currentIndex = pages.firstIndex(of: contentVC),
              currentIndex < pages.count - 1 else {
            return nil
        }
        return pages[currentIndex + 1]
    }
}
