//
//  RouletteViewController.swift
//  RandomSoju
//
//  Created by 원준연 on 2023/08/14.
//

import UIKit

class RouletteViewController: UIViewController {
   
    var rouletteViewModel: PlaceRouletteViewModel?
    
    var rouletteView = RouletteView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        print("rouletteList", self.rouletteViewModel?.rouletteList.value?.count)
        setupRouletteView()
    }
    
    func setupRouletteView() {
        rouletteView.delegate = self
        
        self.view.addSubview(rouletteView)
        self.rouletteView.backgroundColor = .clear
        self.rouletteView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.rouletteView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.rouletteView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.rouletteView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9),
            self.rouletteView.heightAnchor.constraint(equalTo: self.rouletteView.widthAnchor, multiplier: 1.0)
                                    ])
        
        guard let rouletteViewModel = rouletteViewModel else { return }
    
        rouletteView.sections = rouletteViewModel.makeSectionList()
        print("sections",rouletteView.sections)
        
        
    }
    
}

extension RouletteViewController: RouletteViewDelegate {
    
    func getResultFromRoulette(_ place: String) {
        let resultVC = ResultViewController()
        resultVC.modalPresentationStyle = .overFullScreen
        let placeModel = self.rouletteViewModel?.getPlaceWithName(placeName: place)
        resultVC.viewModel = ResultViewModel(place: placeModel)
        self.present(resultVC, animated: true)
    }
    
    
}
