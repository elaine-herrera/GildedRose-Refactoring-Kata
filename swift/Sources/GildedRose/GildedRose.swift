public class GildedRose {
    var items: [Item]
    
    public init(items: [Item]) {
        self.items = items
    }
    
    public func updateQuality() {
        for i in 0 ..< items.count {
            updateQuality(item: items[i])
        }
    }
    
    private func updateQuality(item: Item) {
        if item.name == "Aged Brie" {
            AgedBrieCalulator(item: item).updateQuality()
            return
        }
        if item.name == "Backstage passes to a TAFKAL80ETC concert"{
            BackstageCalulator(item: item).updateQuality()
            return
        }
        if item.name == "Sulfuras, Hand of Ragnaros" {
            return
        }
        if item.name == "Conjured Mana Cake" {
            ConjuredCalulator(item: item).updateQuality()
            return
        }
        ItemCalulator(item: item).updateQuality()
    }
}

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
