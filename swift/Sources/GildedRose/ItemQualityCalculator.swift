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
        if item.quality < 50 {
            item.quality = item.quality + 1
        }
        
        item.sellIn = item.sellIn - 1
        
        if item.isExpired && item.quality < 50 {
            item.quality = item.quality + 1
        }
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
        if item.quality > 0 {
            item.quality = item.quality - 1
        }
        
        item.sellIn = item.sellIn - 1
        
        if item.isExpired && item.quality > 0 {
            item.quality = item.quality - 1
        }
    }
}

struct ConjuredCalulator: ItemQualityCalculator {
    var item: Item
    
    func updateQuality() {
        if item.quality > 0 {
            item.quality = item.quality - 1
        }
        
        item.sellIn = item.sellIn - 1
        
        if item.quality > 0 {
            item.quality = item.quality - 1
        }
    }
}

