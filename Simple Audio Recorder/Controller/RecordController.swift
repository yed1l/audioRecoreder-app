//
//  RecordController.swift
//  Simple Audio Recorder
//
//  Created by Савелий Сакун on 16.09.2020.
//  Copyright © 2020 Savely Sakun. All rights reserved.
//

import UIKit

class RecordController: UIViewController {
    
    // MARK: - Properties
    fileprivate let gradiendLayer = CAGradientLayer()
    
    let recordButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.tintColor = #colorLiteral(red: 0.7403952479, green: 0.7989125848, blue: 0.9927873015, alpha: 1)
        button.layer.borderWidth = 15
        button.layer.borderColor = #colorLiteral(red: 0.7403952479, green: 0.7989125848, blue: 0.9927873015, alpha: 1)
        button.contentEdgeInsets = .init(top: 60, left: 60, bottom: 60, right: 60)
        button.setImage(UIImage(named: K.imageName.microphone)?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.setDimensions(height: 160, width: 160)
        button.layer.cornerRadius = 80
        return button
    }()
    
    let informationLabel: UILabel = {
        let label = UILabel()
        label.text = "Let's start"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    let timerlabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 50, weight: .ultraLight)
        label.text = "00:00"
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    let stopButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: K.imageName.stop)?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.contentEdgeInsets = .init(top: 30, left: 30, bottom: 30, right: 30)
        button.setDimensions(height: 90, width: 90)
        button.tintColor = #colorLiteral(red: 0.7403952479, green: 0.7989125848, blue: 0.9927873015, alpha: 1)
        button.layer.cornerRadius = 45
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
    }

    
    // MARK: - Helpers
    fileprivate func setupLayout() {
        
        view.backgroundColor = #colorLiteral(red: 0.480398953, green: 0.6938122511, blue: 0.9878255725, alpha: 1)
        
        let informationAndTimerStack = UIStackView(arrangedSubviews: [informationLabel, timerlabel])
        
        informationAndTimerStack.axis = .vertical
        informationAndTimerStack.spacing = 10
   
        view.addSubview(informationAndTimerStack)
        informationAndTimerStack.anchor(top: view.topAnchor, paddingTop: 100)
        informationAndTimerStack.centerX(inView: view)
        
        view.addSubview(recordButton)
        recordButton.anchor(top: informationAndTimerStack.bottomAnchor, paddingTop: 30)
        recordButton.centerX(inView: informationAndTimerStack)
        
        view.addSubview(stopButton)
        stopButton.anchor(bottom: view.bottomAnchor, paddingBottom: 40)
        stopButton.centerX(inView: view)
    }
    
    fileprivate func setupGradientLayer() {
        let topColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        let bottomColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        gradiendLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradiendLayer.locations = [0, 1]
        gradiendLayer.frame = view.frame
        
        view.layer.addSublayer(gradiendLayer)
    }
}
