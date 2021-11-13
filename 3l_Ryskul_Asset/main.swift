//
//  main.swift
//  3l_Ryskul_Asset
//
//  Created by Asset Ryskul on 10.11.2021.
//

import Foundation

// MARK: - Перечисление состояние окон
enum WindowState {
    case open           // открыто
    case close          // закрыто
}
// MARK: - Перечисление состояние двигателя
enum EngineState{
    case start          // включен
    case stop           // заглушен
}
// MARK: - Перечисление описывающее погрузку/выгрузку из кузова/багажника
enum TrunkStateFill {
    case fill_in        // погрузить
    case fill_of        // выгрузить
}
// MARK: - Структура для спортивной машины
struct SportCar {
    /*-- Свойства --*/
    let model: String               // модель
    let releaseYear: Int            // год выпуска
    var trunkVolume: Double         // обьем багажника/кузова
    var windowState: WindowState    // состояние окон
    var engineState: EngineState    // состояние двигателя
    
    /*-- Конструктор --*/
    init(model: String, releaseYear: Int, windowState: WindowState, engineState: EngineState, trunkVolume: Double) {
        self.model = model
        self.releaseYear = releaseYear
        self.windowState = windowState
        self.engineState = engineState
        self.trunkVolume = trunkVolume
    }
    
    /*-- Метод для открытия/закрытия окон --*/
    mutating func windowControl(_ state: WindowState) {
        self.windowState = state
        switch self.windowState {
            case .open:
                print("Окна открыты")
            case .close:
                print("Окна закрыты")
        }
    }
    
    /*-- Метод для запуска/выключения двигателя --*/
    mutating func engineControl(_ state: EngineState) {
        self.engineState = state
        switch self.engineState {
            case .start:
                print("Двигатель заведен")
            case .stop:
                print("Двигатель выключен")
        }
    }
    
    /*-- Метод для погрузки/выгрузки из кузова/багажника груза с определенным обьемом --*/
    mutating func fill_to_trunk(fill state: TrunkStateFill, capacity volume: Double) {
        switch state {
            case .fill_in:
                self.trunkVolume += volume
                print("Загружено в багажник груз обьемом в \(volume) л/кг*3, еще свободно \(self.trunkVolume) л/кг*3 обьема")
            case .fill_of:
                self.trunkVolume -= volume
                print("Выгружено из багажника груз обьемом в \(volume) л/кг*3б , еще свободно \(self.trunkVolume) л/кг*3 обьема")
        }
    }
    
}

// MARK: - Структура для грузовой машины
struct TrunkCar {
    // свойства аналогичны SportCar
    let model: String
    let releaseYear: Int
    var trunkVolume: Double
    var windowState: WindowState
    var engineState: EngineState
    
    /*-- Конструктор --*/
    init(model: String, releaseYear: Int, windowState: WindowState, engineState: EngineState, trunkVolume: Double) {
        self.model = model
        self.releaseYear = releaseYear
        self.windowState = windowState
        self.engineState = engineState
        self.trunkVolume = trunkVolume
    }
    
    /*-- Метод для открытия/закрытия окон --*/
    mutating func windowControl(_ state: WindowState) {
        self.windowState = state
        switch self.windowState {
            case .open:
                print("Окна открыты")
            case .close:
                print("Окна закрыты")
        }
    }
    
    /*-- Метод для запуска/выключения двигателя --*/
    mutating func engineControl(_ state: EngineState) {
        self.engineState = state
        switch self.engineState {
            case .start:
                print("Двигатель заведен")
            case .stop:
                print("Двигатель выключен")
        }
    }
    
    /*-- Метод для погрузки/выгрузки из кузова/багажника груза с определенным обьемом --*/
    mutating func fill_to_trunk(fill state: TrunkStateFill, capacity volume: Double) {
        switch state {
            case .fill_in:
                self.trunkVolume += volume
                print("Загружено в багажник груз обьемом в \(volume) л/кг*3, еще свободно \(self.trunkVolume) л/кг*3 обьема")
            case .fill_of:
                self.trunkVolume -= volume
                print("Выгружено из багажника груз обьемом в \(volume) л/кг*3б , еще свободно \(self.trunkVolume) л/кг*3 обьема")
        }
    }
}

// Создаем обьект структуры SportCar (обьявляем экземпляр)
var honda = SportCar(model: "Honda", releaseYear: 1990, windowState: .close, engineState: .start, trunkVolume: 50)
//свойства обьекта honda
print(honda.model)
print(honda.releaseYear)
// методы обьекта honda
honda.windowControl(.close)
honda.engineControl(.start)
honda.fill_to_trunk(fill: .fill_of, capacity: 20)

// Создаем обьект структуры TrunkCar (обьявляем экземпляр)
var kamaz = TrunkCar(model: "Kamaz", releaseYear: 2000, windowState: .open, engineState: .stop, trunkVolume: 20)
//свойства обьекта kamaz
print(kamaz.model)
print(kamaz.releaseYear)
print(kamaz.windowState)
// методы обьекта kamaz
kamaz.windowControl(.close)
kamaz.engineControl(.start)
kamaz.fill_to_trunk(fill: .fill_in, capacity: 80)
