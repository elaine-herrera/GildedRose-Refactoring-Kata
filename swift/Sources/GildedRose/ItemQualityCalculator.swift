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
        if item.quality < maxValue {
            item.quality = item.quality + 1
            
            if item.sellIn < 11 && item.quality < maxValue {
                item.quality = item.quality + 1
            }
            
            if item.sellIn < 6 && item.quality < maxValue {
                item.quality = item.quality + 1
            }
        }
        
        item.sellIn = item.sellIn - 1
        
        if item.isExpired {
            item.quality = 0
        }
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

