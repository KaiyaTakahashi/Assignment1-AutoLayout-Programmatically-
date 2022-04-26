//
//  ViewController.swift
//  AutoLayoutStarter
//
//  Created by Derrick Park on 2019-04-17.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
  lazy var vStackView: UIStackView = {
      let vSView = UIStackView(arrangedSubviews: [blueSquare1, blueSquare2, blueSquare3])
      vSView.axis = .vertical
      vSView.distribution = .equalSpacing
      vSView.alignment = .center
      vSView.translatesAutoresizingMaskIntoConstraints = false
//      NSLayoutConstraint.activate([
//          vSView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
//        vSView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor)
//      ])
      return vSView
  }()
    
    lazy var hStackView: UIStackView = {
        let hSView = UIStackView(arrangedSubviews: [orangeSquare1, orangeSquare2])
        hSView.alignment = .center
        hSView.spacing = 10
        hSView.axis = .horizontal
        hSView.backgroundColor = .red
        hSView.translatesAutoresizingMaskIntoConstraints = false
        return hSView
    }()
    
    let orangeSquare1: UIView = {
        let oS = UIView()
        oS.backgroundColor = .orange
        NSLayoutConstraint.activate([
            oS.widthAnchor.constraint(equalToConstant: 100),
            oS.heightAnchor.constraint(equalToConstant: 50)
        ])
        oS.translatesAutoresizingMaskIntoConstraints = false
        return oS
    }()
    
    let orangeSquare2: UIView = {
        let oS = UIView()
        oS.backgroundColor = .orange
        NSLayoutConstraint.activate([
            oS.widthAnchor.constraint(equalToConstant: 45),
            oS.heightAnchor.constraint(equalToConstant: 50)
        ])
        oS.translatesAutoresizingMaskIntoConstraints = false
        return oS
    }()
    
  let purpleSquare: UIView = {
    let ps = UIView(frame: CGRect.zero)
    ps.translatesAutoresizingMaskIntoConstraints = false
    ps.backgroundColor = .purple
    return ps
  }()

  let blueSquare1: UIView = {
    let bl = UIView()
      NSLayoutConstraint.activate([
          bl.widthAnchor.constraint(equalToConstant: 60),
          bl.heightAnchor.constraint(equalToConstant: 60)
      ])
    bl.translatesAutoresizingMaskIntoConstraints = false
    bl.backgroundColor = .blue
    return bl
  }()
    
  let blueSquare2: UIView = {
    let bl = UIView()
      NSLayoutConstraint.activate([
          bl.widthAnchor.constraint(equalToConstant: 60),
          bl.heightAnchor.constraint(equalToConstant: 60)
      ])
    bl.translatesAutoresizingMaskIntoConstraints = false
    bl.backgroundColor = .blue
    return bl
  }()
    
  let blueSquare3: UIView = {
    let bl = UIView()
      NSLayoutConstraint.activate([
        bl.widthAnchor.constraint(equalToConstant: 60),
        bl.heightAnchor.constraint(equalToConstant: 60)
      ])
    bl.translatesAutoresizingMaskIntoConstraints = false
    bl.backgroundColor = .blue
    return bl
  }()

  let mainView: UIView = {
    let main = UIView()
    // important when setting contraints programmatically
    main.translatesAutoresizingMaskIntoConstraints = false
    main.backgroundColor = .green
    return main
  }()
  
  let squareButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Square", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(squareTapped), for: .touchUpInside)
    return butt
  }()
  
  let portraitButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Portrait", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(portraitTapped), for: .touchUpInside)
    return butt
  }()
  
  let landScapeButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Landscape", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(landscapeTapped), for: .touchUpInside)
    return butt
  }()
  
  var widthAnchor: NSLayoutConstraint?
  var heightAnchor: NSLayoutConstraint?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    view.addSubview(mainView)
    mainView.addSubview(purpleSquare)
    mainView.addSubview(vStackView)
    mainView.addSubview(hStackView)
    NSLayoutConstraint.activate([
      vStackView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
      vStackView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
      hStackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20),
      hStackView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 20),
      hStackView.widthAnchor.constraint(equalToConstant: 200),
      hStackView.heightAnchor.constraint(equalToConstant: 70),
      hStackView.leadingAnchor.constraint(equalTo: orangeSquare1.leadingAnchor, constant: -10),
      orangeSquare2.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -30)
    ])
    setupLayout()
  }

  fileprivate func setupLayout() {
    mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    widthAnchor = mainView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7, constant: 0)
    widthAnchor?.isActive = true
    
    heightAnchor = mainView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7, constant: 0)
    heightAnchor?.isActive = true
      
    NSLayoutConstraint.activate([
      purpleSquare.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20),
      purpleSquare.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -20),
      purpleSquare.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.65),
      purpleSquare.heightAnchor.constraint(equalTo: mainView.heightAnchor, multiplier: 0.1)
    ])
      
    vStackView.heightAnchor.constraint(equalTo: mainView.heightAnchor, multiplier: 0.6).isActive = true

    let buttStackView = UIStackView(arrangedSubviews: [
      squareButton, portraitButton, landScapeButton])
    buttStackView.translatesAutoresizingMaskIntoConstraints = false
    buttStackView.axis = .horizontal
    buttStackView.alignment = .center
    buttStackView.distribution = .fillEqually
    
    view.addSubview(buttStackView)
    NSLayoutConstraint.activate([
      buttStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
      buttStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      buttStackView.heightAnchor.constraint(equalToConstant: 50),
      buttStackView.widthAnchor.constraint(equalTo: view.widthAnchor)
      ])
  }

  @objc private func squareTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
      self.widthAnchor?.isActive = true
      
      self.vStackView.heightAnchor.constraint(equalTo: self.mainView.heightAnchor, multiplier: 0.7).isActive = true
        
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
  }
  
  @objc private func portraitTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7)
      self.widthAnchor?.isActive = true
        
      self.vStackView.heightAnchor.constraint(equalTo: self.mainView.heightAnchor, multiplier: 0.6).isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.7)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
    
  }
  
  @objc private func landscapeTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.95)
      self.widthAnchor?.isActive = true
        
      self.vStackView.heightAnchor.constraint(equalTo: self.mainView.heightAnchor, multiplier: 0.8).isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
  }
}

