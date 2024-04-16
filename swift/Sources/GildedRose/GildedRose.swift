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
            if item.quality < 50 {
                item.quality = item.quality + 1
                
                if item.sellIn < 11 && item.quality < 50 {
                    item.quality = item.quality + 1
                }
                
                if item.sellIn < 6 && item.quality < 50 {
                    item.quality = item.quality + 1
                }
            }
            
            item.sellIn = item.sellIn - 1
            
            if item.sellIn < 0 {
                item.quality = item.quality - item.quality
            }
            
            return
        }
        if item.name == "Sulfuras, Hand of Ragnaros" {
            return
        }
        
        if item.quality > 0 {
            item.quality = item.quality - 1
        }
        
        item.sellIn = item.sellIn - 1
        
        if item.sellIn < 0 && item.quality > 0 {
            item.quality = item.quality - 1
        }
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
        
        if item.sellIn < 0 && item.quality < 50 {
            item.quality = item.quality + 1
        }
    }
}
