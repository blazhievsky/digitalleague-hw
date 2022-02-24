import UIKit

//MARK: Задание #1

// Все доступные рассы
enum Race {
    case human
    case orc
    case nightElf
    case undead
}


// Протокол для рас, общие характеристики
protocol RaceDescription  {
    typealias Statistics = (armor: Float, attackPower: Float, strength: Float, agility: Float, intelligence: Float, hitPoints: Float, mana: Float)
    
    var armor: Float {get}
    var attackPower: Float {get}
    var strength: Float {get}
    var agility: Float {get}
    var intelligence: Float {get}
    var hitPoints: Float {get}
    var mana: Float {get}
    
    func attack()
    
    func move()
    
    func stop()
    
    mutating func updateStatistics(_ statistics: Statistics)
    
    func ultimate()
    
    func info()
    
}


//MARK: Протоколы описывающие особенности рас

// Люди
protocol Human: RaceDescription {}

// Подписавшись под протокол, автоматически будет инциализирована соответствующая раса
extension Human {
    var race: Race {.human}
}

// Орки
protocol Orc: RaceDescription {}

// Подписавшись под протокол, автоматически будет инциализирована соответствующая раса
extension Orc {
    var race: Race {.orc}
}

// Эльфы
protocol NightElf: RaceDescription {}


// Подписавшись под протокол, автоматически будет инциализирована соответствующая раса
extension NightElf {
    var race: Race {.nightElf}
}

// Нежить
protocol Undead: RaceDescription {}

// Подписавшись под протокол, автоматически будет инциализирована соответствующая раса
extension Undead {
    var race: Race {.undead}
}



// MARK: Создание героев
struct HeroHuman: Human {
    typealias Statistics = (armor: Float, attackPower: Float, strength: Float, agility: Float, intelligence: Float, hitPoints: Float, mana: Float)
    
    var armor: Float
    var attackPower: Float
    var strength: Float
    var agility: Float
    var intelligence: Float
    var hitPoints: Float
    var mana: Float
    
    func attack() {
        print("ОПЯТЬ РАБОТАТЬ?!?")
    }
    
    func move() {
        print("move")
    }
    
    func stop() {
        print("stop")
    }
    
    mutating func updateStatistics(_ statistics: Statistics) {
        armor = statistics.armor
        attackPower = statistics.attackPower
        strength = statistics.strength
        agility = statistics.agility
        intelligence = statistics.intelligence
        hitPoints = statistics.hitPoints
        mana = statistics.mana
    }
    
    func ultimate() {
    }
    
    func info() {
        print("\(String(describing: self))")
    }
}

struct HeroOrc: Orc {
    typealias Statistics = (armor: Float, attackPower: Float, strength: Float, agility: Float, intelligence: Float, hitPoints: Float, mana: Float)
    
    var armor: Float
    var attackPower: Float
    var strength: Float
    var agility: Float
    var intelligence: Float
    var hitPoints: Float
    var mana: Float
    
    func attack() {
        print("МОЯ ЖИЗНЬ ПРИНАДЛЕЖИТ ОРДЕ")
    }
    
    func move() {
        print("move")
    }
    
    func stop() {
        print("stop")
    }
    
    mutating func updateStatistics(_ statistics: Statistics) {
        armor = statistics.armor
        attackPower = statistics.attackPower
        strength = statistics.strength
        agility = statistics.agility
        intelligence = statistics.intelligence
        hitPoints = statistics.hitPoints
        mana = statistics.mana
    }
    
    func ultimate() {
    }
    
    func info() {
        print("\(String(describing: self))")
    }
}


struct HeroNightElf: NightElf {
    typealias Statistics = (armor: Float, attackPower: Float, strength: Float, agility: Float, intelligence: Float, hitPoints: Float, mana: Float)
    
    var armor: Float
    var attackPower: Float
    var strength: Float
    var agility: Float
    var intelligence: Float
    var hitPoints: Float
    var mana: Float
    
    func attack() {
        print("МУДРЫЕ СЛОВА ТВОИ")
    }
    
    func move() {
        print("move")
    }
    
    func stop() {
        print("stop")
    }
    
    mutating func updateStatistics(_ statistics: Statistics) {
        armor = statistics.armor
        attackPower = statistics.attackPower
        strength = statistics.strength
        agility = statistics.agility
        intelligence = statistics.intelligence
        hitPoints = statistics.hitPoints
        mana = statistics.mana
    }
    
    func ultimate() {
    }
    
    func info() {
        print("\(String(describing: self))")
    }
}

struct HeroUndead: Undead {
    typealias Statistics = (armor: Float, attackPower: Float, strength: Float, agility: Float, intelligence: Float, hitPoints: Float, mana: Float)
    
    var armor: Float
    var attackPower: Float
    var strength: Float
    var agility: Float
    var intelligence: Float
    var hitPoints: Float
    var mana: Float
    
    func attack() {
        print("Постройте Зиккурат")
    }
    
    func move() {
        print("move")
    }
    
    func stop() {
        print("stop")
    }
    
    mutating func updateStatistics(_ statistics: Statistics) {
        armor = statistics.armor
        attackPower = statistics.attackPower
        strength = statistics.strength
        agility = statistics.agility
        intelligence = statistics.intelligence
        hitPoints = statistics.hitPoints
        mana = statistics.mana
    }
    
    func ultimate() {
    }
    
    func info() {
        print("\(String(describing: self))")
    }
}


//MARK: Проверка работы кода
var MountainKing = HeroHuman(armor: 5, attackPower: 5, strength: 5, agility: 5, intelligence: 5, hitPoints: 5, mana: 5)

var blademaster = HeroOrc(armor: 10, attackPower: 10, strength: 5, agility: 5, intelligence: 5, hitPoints: 5, mana: 1)

var demonHunter = HeroNightElf(armor: 0, attackPower: 5, strength: 5, agility: 15, intelligence: 5, hitPoints: 5, mana: 5)

var deathKnight = HeroUndead(armor: 5, attackPower: 5, strength: 5, agility: 5, intelligence: 5, hitPoints: 5, mana: 5)

print(MountainKing.race)
print(blademaster.race)
print(demonHunter.race)
print(deathKnight.race)

MountainKing.attack()
blademaster.attack()
demonHunter.attack()
deathKnight.attack()
