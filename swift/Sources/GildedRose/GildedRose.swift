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
