//
//  ViewController.swift
//  CocoaPodsExample
//
//  Created by Mathew Gacy on 3/6/23.
//  Copyright © 2022 Blue Triangle. All rights reserved.
//

import BlueTriangleSDK_Swift
import UIKit

class ViewController: UIViewController {
    var hasActiveTimer: Bool = false {
        didSet {
            submitButton.isEnabled = !hasActiveTimer
        }
    }

    // MARK: - Subviews

    private lazy var submitButton: UIButton = {
        let action = UIAction(title: "Submit Timer") { [weak self] _ in
            self?.submitTimer()
        }
        let control = UIButton(configuration: .filled(), primaryAction: action)
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()

    private lazy var buttonStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [submitButton])
        view.axis = .vertical
        view.alignment = .fill
        view.distribution = .fillEqually
        view.spacing = 16.0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(buttonStackView)

        NSLayoutConstraint.activate([
            buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

    // MARK: - Actions

    private func submitTimer() {
        guard !hasActiveTimer else {
            return
        }

        hasActiveTimer = true
        let page = Page(pageName: "CocoaPods Test")
        let timer = BlueTriangle.startTimer(page: page)

        Task {
            try await Task.sleep(nanoseconds: NSEC_PER_SEC)
            BlueTriangle.endTimer(timer)
            hasActiveTimer = false
        }
    }
}
