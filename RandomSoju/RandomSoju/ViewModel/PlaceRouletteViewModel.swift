//
//  PlaceRouletteViewModel.swift
//  RandomSoju
//
//  Created by 원준연 on 2023/08/14.
//

import Foundation

class PlaceRouletteViewModel: UpdateRouletteList {
    
    var rouletteList: Observable<[Document]>
    
    
    init() {
        self.rouletteList = Observable([])
        
    }
    
    func addPlace(place: Document) {
        self.rouletteList.value?.append(place)
    }
    
    func removePlace(place: Document) {
        
        guard let index = self.rouletteList.value?.firstIndex(where: {$0.placeName == place.placeName}) else { return }
        self.rouletteList.value?.remove(at: index)
        
    }
    
    func makeSectionList() -> [String] {
        var tempArray: [String] = []
        
        tempArray = self.rouletteList.value?.map({ place in
            return place.placeName
        }) as! [String]
        
        return tempArray
    }
    
    
}
