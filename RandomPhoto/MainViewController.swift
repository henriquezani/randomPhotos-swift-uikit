//
//  ViewController.swift
//  RandomPhoto
//
//  Created by zani on 13/06/22.
//

import UIKit

class MainViewController: UIViewController {
    
    private let titleLabel = UILabel()
    private let imageView = UIImageView()
    private let buttonView = UIButton(type: .system)
    
    
    let colors: [UIColor] = [
        .systemRed,
        .systemTeal,
        .systemPink,
        .systemTeal,
        .systemGreen,
        .systemOrange,
        .systemPurple
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        style()
        layout()
        getRandomPhoto()
    }

}

extension MainViewController {
    private func style(){
        //titleLabel
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        titleLabel.text = "Random Photo"
        
        //imageView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .systemRed
        
        
        //buttonView
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        buttonView.configuration = .filled()
        buttonView.configuration?.imagePadding = 8
        buttonView.setTitle("Random Photo", for: [])
        buttonView.addTarget(self, action: #selector(randomBtnTapped), for: .touchUpInside)
    }
    
    private func layout(){
        view.addSubview(titleLabel)
        view.addSubview(imageView)
        view.addSubview(buttonView)
        
        //titleLabel
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 3),
            titleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2)
        ])
        
        //imageView
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 300),
            imageView.widthAnchor.constraint(equalToConstant: 300),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        //buttonView
        NSLayoutConstraint.activate([
            buttonView.heightAnchor.constraint(equalToConstant: 50),
            buttonView.topAnchor.constraint(equalToSystemSpacingBelow: imageView.bottomAnchor, multiplier: 12),
            buttonView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: buttonView.trailingAnchor, multiplier: 4)
        ])
    }
    
  
}


// MARK: Actions
extension MainViewController{
    @objc func randomBtnTapped(sender:UIButton){
        getRandomBgColor()
        getRandomPhoto()
    }
    
    func getRandomPhoto(){
        let urlString = "https://source.unsplash.com/random/600x600"
        
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        
        imageView.image = UIImage(data: data)
        
    }
    
    func getRandomBgColor(){
        view.backgroundColor = colors.randomElement()
    }
}
