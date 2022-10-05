// Write your code here 🪴

enum Month {
  case january, february, march, april, may, june, july, august, september, october, november, december
}

protocol Plantable {
  var plantMonth: Month { get }
  var plantingInstructions: String { get }
}

protocol Waterable {
  var inchesOfWater: Int { get }
  var wateringFrequency: String { get }
  var wateringInstructions: String { get }
}

protocol Harvestable {
  var harvestMonth: Month { get }
  var harvestingInstructions: String { get }
}

protocol Gardenable: Plantable, Waterable, Harvestable {
  func printGardeningTips()
}

extension Gardenable {
  func printGardeningTips() {
    print("\nFollow these Gardening 101 tips for a bountiful harvest. 1) Make sure you always water your plant the exact amount that it needs. \(harvestingInstructions). 2) Make sure you know what zone that you're planting in to ensure that the plants you're planting are in their optimal environment.")
  }
}

struct Kale: Gardenable {
  var plantMonth: Month = .september
  var plantingInstructions: String {
    "Kale should be planted 6 to 8 weeks before the first frost in in-ground gardens, raised beds, or containers."
  }
  var inchesOfWater = 2
  var wateringFrequency = "weekly"
  var wateringInstructions: String {
    "Kale needs to be watered \(inchesOfWater) inches of water \(wateringFrequency)."
  }
  var harvestMonth: Month = .november
  var harvestingInstructions: String {
        "Kale should be harvested in \(harvestMonth)"
    }
}

func printTips<T: Gardenable>(for plants: [T]) { 
  for plant in plants {
    plant.printGardeningTips()
  }
}

let vegetables = [Kale(), Kale()]
printTips(for: vegetables)