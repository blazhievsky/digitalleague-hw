import UIKit

//MARK: Задание №1
// Написать код, где можно будет сравнивать перечисления.
// Где перечисления могут быть =>, >, <=, < исходя их rating и их названия самого перечисления

enum Song {
    case songOne(duration: Double)
    case songTwo(duration: Double)
    case songThree(duration: Double)
    case songFour(duration: Double)
}

extension Song: Comparable {
    static func < (lhs: Self, rhs: Self) -> Bool {
        switch(lhs, rhs) {
        case (.songOne(let a), .songOne(let b)):
            return a < b
        case (.songTwo(let a),.songTwo(let b)):
            return a < b
        case (.songThree(let a), .songThree(let b)):
            return a < b
        case (.songFour(let a), .songFour(let b)):
            return a < b
        default:
            return false
        }
    }
    static func <= (lhs: Self, rhs: Self) -> Bool {
        switch(lhs, rhs) {
        case (.songOne(let a), .songOne(let b)):
            return a <= b
        case (.songTwo(let a),.songTwo(let b)):
            return a <= b
        case (.songThree(let a), .songThree(let b)):
            return a <= b
        case (.songFour(let a), .songFour(let b)):
            return a <= b
        default:
            return false
        }

    }
    static func >= (lhs: Self, rhs: Self) -> Bool {
        switch(lhs, rhs) {
        case (.songOne(let a), .songOne(let b)):
            return a >= b
        case (.songTwo(let a),.songTwo(let b)):
            return a >= b
        case (.songThree(let a), .songThree(let b)):
            return a >= b
        case (.songFour(let a), .songFour(let b)):
            return a >= b
        default:
            return false
        }

    }
    static func > (lhs: Self, rhs: Self) -> Bool {
        switch(lhs, rhs) {
        case (.songOne(let a), .songOne(let b)):
            return a > b
        case (.songTwo(let a),.songTwo(let b)):
            return a > b
        case (.songThree(let a), .songThree(let b)):
            return a > b
        case (.songFour(let a), .songFour(let b)):
            return a > b
        default:
            return false
        }

    }
    }

//MARK: Задание №2
// Реализуйте протокол Equitable у LessonType

enum LessonType {
    case math(rating: Int)
    case ntiveLanguage(rating: Int)
    case computerSince(rating: Int)
    case literature(rating: Int)
}

extension LessonType: Equatable {
    static func == (lhs: LessonType, rhs: LessonType) -> Bool {
        switch(lhs, rhs) {
        case (.math(let a), .math(let b)):
            return a == b
        case (.ntiveLanguage(let a),.ntiveLanguage(let b)):
            return a == b
        case (.computerSince(let a), .computerSince(let b)):
            return a == b
        case (.literature(let a), .literature(let b)):
            return a == b
        default:
            return false
        }
    }
}



// Проверка работы кода, задание 1
var mySong = Song.self
let isComparison = Song.songFour(duration: 3) >= Song.songFour(duration: 3)
print(isComparison)


// Проверка работы кода, задание 2
let myLessonType = LessonType.self
let isEqual = myLessonType.computerSince(rating: 5) == myLessonType.computerSince(rating: 5)
print(isEqual)


