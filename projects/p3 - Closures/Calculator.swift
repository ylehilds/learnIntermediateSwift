struct Calculator {
    func reduce(_ nums: [Int], using nextPartialResult: (Int, Int) -> Int, startingAt initialResult: Int) -> Int {
      var total = initialResult
      for num in nums {
        total = nextPartialResult(total, num)
      }
      return total
    }

    func filter(_ nums: [Int], using isIncluded: (Int) -> Bool) -> [Int] {
      var filteredNums = [Int]()
      for num in nums {
        if isIncluded(num) {
          filteredNums.append(num)
        }
      }
      return filteredNums
    }

    func map(_ nums: [Int], using transform: (Int) -> Int) -> [Int] {
      var mappedNums = [Int]()
      for num in nums {
        mappedNums.append(transform(num))
      }
      return mappedNums
    }

    func sort(_ nums: [Int], by ascending: (Int, Int) -> Bool) -> [Int] {
      var nums = nums
        for indexOne in 1..<nums.count {
            var indexTwo = indexOne
            while indexTwo > 0 && ascending(nums[indexTwo], nums[indexTwo - 1]) {
                nums.swapAt(indexTwo - 1, indexTwo)
                indexTwo -= 1
            }
        }
        return nums
    }
}

let calculator = Calculator()
let numbers = [1,2,3,4,5,6,7,8,9]
let addition = { (num1: Int, num2: Int) -> Int in
  return num1 + num2
}
let sum = calculator.reduce(numbers, using: addition, startingAt: 0)
print(sum)

let grades = [6,0,9,10,4,7,3,0,5]
let classGrades = calculator.filter(grades, using: { grade in grade != 0})
print (classGrades)

let weights = [100, 150, 200, 250, 300, 400, 600, 99]
let groupWeights = calculator.map(weights) { $0 + 20}
print(groupWeights)


let calories = [400, 800, 500, 1000, 0,300]
let sortedCalories = calculator.sort(calories, by: <)
print(sortedCalories)

