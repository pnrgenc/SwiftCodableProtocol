//
//  HeroListViewModel.swift
//  SwiftCodableProtocol
//
//  Created by Pınar Genç on 3.05.2020.
//  Copyright © 2020 Pınar Genç. All rights reserved.
//

import Foundation

struct HeroListViewModel {
    let heroList : [Hero]
    
    func numberOfRowsInSection() -> Int{
        return self.heroList.count
    }
    
    func currencyAtIndex(_ index: Int) ->HeroViewModel{
        let hero = self.heroList[index]
        return HeroViewModel(_hero: hero)
    }
}

struct HeroViewModel {
    let _hero : Hero
    
    var name : String{
       
        return self._hero.localizedName
    }
    
    var imageURL : String{
        return self._hero.urlLargePortrait
     
    }
}
