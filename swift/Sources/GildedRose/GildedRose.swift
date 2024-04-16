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
            if item.quality < 50 {
                item.quality = item.quality + 1
            }
            
            item.sellIn = item.sellIn - 1
            
            if item.sellIn < 0 {
                if item.quality < 50 {
                    item.quality = item.quality + 1
                }
            }
            
            return
        }
        else if item.name == "Backstage passes to a TAFKAL80ETC concert"{
            if item.quality < 50 {
                item.quality = item.quality + 1
                
                if item.name == "Backstage passes to a TAFKAL80ETC concert" {
                    if item.sellIn < 11 {
                        if item.quality < 50 {
                            item.quality = item.quality + 1
                        }
                    }
                    
                    if item.sellIn < 6 {
                        if item.quality < 50 {
                            item.quality = item.quality + 1
                        }
                    }
                }
            }
        }
        else {
            if item.quality > 0 {
                if item.name != "Sulfuras, Hand of Ragnaros" {
                    item.quality = item.quality - 1
                }
            }
        }
        
        if item.name != "Sulfuras, Hand of Ragnaros" {
            item.sellIn = item.sellIn - 1
        }
        
        if item.sellIn < 0 {
            if item.name == "Backstage passes to a TAFKAL80ETC concert" {
                item.quality = item.quality - item.quality
            }
            else {
                if item.quality > 0 {
                    if item.name != "Sulfuras, Hand of Ragnaros" {
                        item.quality = item.quality - 1
                    }
                }
            }
        }
    }
}
