// MARK:  Пример полиморфизма 1.

protocol CarProtocol  {
    var model: String {get set}
    var color: String {get set}
    var buildDate: Int {get set}
    var price: Int {get set}
    var isServiced: Bool {get set}
    func BibBib()
}

struct BMWCars: CarProtocol {
    var model: String
    var color: String
    var buildDate: Int
    var price: Int
    var isServiced: Bool
    
    func BibBib() {
        print("The car says bibi! I'm a BMW!")
    }
    
}

struct AudiCars: CarProtocol {
    var model: String
    var color: String
    var buildDate: Int
    var price: Int
    var isServiced: Bool
    func BibBib() {
        print("The car says bibi! I'm a Audi!")
    }
    
}

let bmwIx = BMWCars(model: "BMW iX", color: "Red", buildDate: 2021, price: 8500000, isServiced: false)
let audiEtron = AudiCars(model: "Audi E-tron", color: "Black", buildDate: 2021, price: 6610000, isServiced: false)


bmwIx.BibBib()
audiEtron.BibBib()

// MARK: Пример полиморфизма 2.

protocol CarInfoProtocol {
    associatedtype Operand
    func add(operand1: Operand, operand2: Operand) -> Operand
}


extension CarInfoProtocol where Operand == String {
    func add(operand1: Operand, operand2: Operand) -> Operand {
        return "Модель автомобиля: \(operand1) Цвет автомобиля: \(operand2)"
    }
}

extension CarInfoProtocol where Operand == Int {
    func add(operand1: Operand, operand2: Operand) -> Operand {
        return operand1 + operand2
    }
}

extension BMWCars: CarInfoProtocol {
    typealias Operand = Int
}

extension AudiCars: CarInfoProtocol {
    typealias Operand = String
}

//название аксессуаров и их стоимость
let accessoriesAirFreshener: [String : Int] = ["ChristmasTree" : 2000, "Donut" : 5000]

// Вывод цены авто с учетом стоимость аксессуара, если аксессуар не будет найден цена на авто не изменится и пользователь получит сообщение об этом
let bmwBuildDateAndPrice = bmwIx.add(operand1: bmwIx.price, operand2: accessoriesAirFreshener["Donut"] ?? 0)
if bmwBuildDateAndPrice == bmwIx.price {
    print("Аксессуар не был найден, цена не изменилась: \(bmwIx.price)")}
else {
    print("Цена с учетом приобретения аксессуара: \(bmwBuildDateAndPrice)") }


// Вывод модели автомобиля и его цвет
let audiModelAndColor = audiEtron.add(operand1: audiEtron.model, operand2: audiEtron.color)
print(audiModelAndColor)


// MARK: Пример добавления методов с реализацией по умолчанию через пртокол

//Создал протокол
protocol ShoutingAtTrafficFromCarProtocol {
    //func Shouting()
}
//Добавил реализацию метода
extension ShoutingAtTrafficFromCarProtocol {
    func Shouting() {
        print("ааааааааааааааааааааааааааааа")}
}

extension BMWCars: ShoutingAtTrafficFromCarProtocol {
    
}
extension AudiCars: ShoutingAtTrafficFromCarProtocol {
    
}

// Вызываю метод
bmwIx.Shouting()
audiEtron.Shouting()


// MARK: Доработка

class Service {
    var car: CarProtocol
    
    //Проверяет проводилось ли обслуживание автомобиля
    func isServiced(){
        print("Статус проведения обслуживания автомобиля \(car.model):  \(car.isServiced)")
    }
    // Проводит обслуживание автомобиля
    func getService()  {
        car.isServiced = true
    }
    
    init(car: CarProtocol ) {
        self.car = car
    }
    
}

// Инициализируем класс для BMW
var serviceCarBmwIx = Service.init(car: bmwIx)
// Проверяем проводилось ли обслуживание
serviceCarBmwIx.isServiced()
// Проводим обслуживание
serviceCarBmwIx.getService()
// Проверяем проводилось ли обслуживание
serviceCarBmwIx.isServiced()

// Инициализируем класс для Audi
var serviceCarAudiEtron = Service.init(car: audiEtron)
// Проверяем проводилось ли обслуживание
serviceCarAudiEtron.isServiced()
// Проводим обслуживание
serviceCarAudiEtron.getService()
// Проверяем проводилось ли обслуживание
serviceCarAudiEtron.isServiced()



struct Manager {
    var a = 2
    func change() {
        
    }
}

class Managere {
    var a = 2
    func change() {
        self.a = 4
    }
}

var df = Manager()
var asf = Managere()

df.a = 5

asf.a = 10

print(df.a)
print(asf.a)
