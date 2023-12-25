//
//  ViewController.swift
//  ChuckNorrisJokes
//
//  Created by Cecilia Andrea Pesce on 22/12/23.
//

import UIKit

class ViewController: UIViewController {
    
    private var viewModel: ChuckNorrisJokeViewModelProtocol
    
    func setUpBind() {
        viewModel.showLoading = { [weak self] in
            self?.generateJokeButton.configuration?.showsActivityIndicator = true
            self?.generateJokeButton.configuration?.title = nil
            self?.generateJokeButton.isEnabled = false
        }
        
        viewModel.hideLoading = { [weak self] in
            self?.generateJokeButton.configuration?.showsActivityIndicator = false
            self?.generateJokeButton.isEnabled = true
            self?.generateJokeButton.configuration?.title = "Get joke!"
        }
        
        viewModel.showMessage = { [weak self] value in
            self?.jokeText.text = value
        }
    }
    
    private lazy var jokeText: UILabel = {
        let label = UILabel()
//        label.text = ""
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 10
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var generateJokeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Go!", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(didTapGetRandomJoke), for: .touchDown)
        return button
    }()
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented. Use init(viewModel:) instead.")
    }

    init(viewModel: ChuckNorrisJokeViewModel = ChuckNorrisJokeViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        setUpConstraints()
        setUpBind()
    }
    
    func configureViews() {
        view.backgroundColor = .white
        view.addSubview(jokeText)
        view.addSubview(generateJokeButton)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            
            jokeText.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            jokeText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            jokeText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            
            generateJokeButton.topAnchor.constraint(equalTo: self.jokeText.bottomAnchor, constant: 32),
            generateJokeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc
    func didTapGetRandomJoke() {
        viewModel.getRandomJoke()
    }
}

