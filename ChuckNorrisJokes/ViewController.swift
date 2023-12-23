//
//  ViewController.swift
//  ChuckNorrisJokes
//
//  Created by Cecilia Andrea Pesce on 22/12/23.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var jokeText: UILabel = {
        let label = UILabel()
        label.text = "Joke"
        label.textColor = .black
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var generateJokeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Go!", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
//        button.addTarget(self, action: #selector(didTapFavoriteButton), for: .touchDown)
        return button
    }()
    
    init() {
            super.init(nibName: nil, bundle: nil)
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        setUpConstraints()
    }
    
    func configureViews() {
        view.backgroundColor = .white
        view.addSubview(jokeText)
        view.addSubview(generateJokeButton)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            jokeText.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            jokeText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            generateJokeButton.topAnchor.constraint(equalTo: self.jokeText.bottomAnchor, constant: 32),
            generateJokeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

