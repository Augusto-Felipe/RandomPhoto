//
//  ViewController.swift
//  RandomPhoto
//
//  Created by Felipe Augusto Correia on 27/01/23.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let button: UIButton = {
       let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Random Photo", for: UIControl.State.normal)
        button.setTitleColor(UIColor.black, for: UIControl.State.normal)
        return button
    }()
    
    let colors: [UIColor] = [
        .systemRed,
        .systemPink,
        .systemGreen,
        .systemGray,
        .systemBlue,
        .systemOrange,
        .systemYellow
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Mudando a cor do background
        view.backgroundColor = .green
        
        // Adicionando imagem na nossa view
        view.addSubview(imageView)
        
        // Posição da Imagem na tela
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        
        // Imagem  Centralizada
        imageView.center = view.center
        
        getRandomPhoto()
        
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        
        // Adicionando botão
        view.addSubview(button)
        button.frame = CGRect(x: 30, y: view.frame.self.height-150-view.safeAreaInsets.bottom, width: view.frame.size.width-60, height: 55)
    }
    
    @objc func didTapButton() {
        getRandomPhoto()
        view.backgroundColor = colors.randomElement()
    }

    func getRandomPhoto() {
        // Peguei um site que gera imagens e passei a URL como String
        let urlString = "https://source.unsplash.com/random/600x600"
        
        // Agora eu preciso pegar essa URL String e transforma-la em uma URL  de verdade
        let url = URL(string: urlString)!
        
        // Agora eu vou pegar o que tem nessa URL  e guardar
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        
        // Agora vou passar o conteudo da URL para minha ImageView
        imageView.image = UIImage(data: data)
    }
}

