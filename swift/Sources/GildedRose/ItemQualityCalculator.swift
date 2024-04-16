//
//  ItemQualityCalculator.swift
//
//
//  Created by Elaine Herrera on 16/4/24.
//

protocol ItemQualityCalculator {
    func updateQuality()
}

struct AgedBrieCalulator: ItemQualityCalculator {
    var maxValue: Int = 50
    
    var item: Item
    
    func updateQuality() {
        item.sellIn = item.sellIn - 1
        
        increaseQualityIfPosible()
        
        if item.isExpired { increaseQualityIfPosible() }
    }
    
    private func increaseQualityIfPosible(){
        guard item.quality < maxValue else { return }
        item.quality += 1
    }
}

struct BackstageCalulator: ItemQualityCalculator {
    var maxValue: Int = 50
    
    var item: Item
    
    func updateQuality() {
        item.sellIn = item.sellIn - 1
        
        if item.isExpired {
            item.quality = 0
            return
        }
        
        increaseQualityIfPosible()
        
        if item.sellIn < 10 {
            increaseQualityIfPosible()
        }
        
        if item.sellIn < 5 {
            increaseQualityIfPosible()
        }
    }
    
    private func increaseQualityIfPosible(){
        guard item.quality < maxValue else { return }
        item.quality += 1
    }
}

struct ItemCalulator: ItemQualityCalculator {
    var item: Item
    
    func updateQuality() {
        item.sellIn = item.sellIn - 1
        
        decreaseQualityIfPosible()
        
        if item.isExpired {
            decreaseQualityIfPosible()
        }
    }
    
    private func decreaseQualityIfPosible(){
        guard item.quality > 0 else { return }
        item.quality -= 1
    }
}

struct ConjuredCalulator: ItemQualityCalculator {
    var item: Item
    
    func updateQuality() {
        item.sellIn = item.sellIn - 1
        
        item.quality -= 2
        
        if item.quality < 0 { item.quality = 0 }
    }
}

