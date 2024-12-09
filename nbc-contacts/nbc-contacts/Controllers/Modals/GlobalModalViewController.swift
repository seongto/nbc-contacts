//
//  GlobalModalViewController.swift
//  nbc-contacts
//
//  Created by MaxBook on 12/9/24.
//

import UIKit

final class GlobalModalViewController: UIViewController {

    private let targetView: UIView

    init(target: UIView) {
        self.targetView = target
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = .overFullScreen
        self.modalTransitionStyle = .crossDissolve
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupTargetView()
    }

    private func setupBackground() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    }

    private func setupTargetView() {
        view.addSubview(targetView)
        targetView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            targetView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            targetView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            targetView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            targetView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5)
        ])
    }
}
