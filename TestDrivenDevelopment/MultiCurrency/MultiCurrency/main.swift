protocol Expression {
    func reduce(_ bank: Bank, _ to: String) -> Money
}

struct Money {
    fileprivate var amount = 0
    fileprivate var currencyName = ""
    
    init(_ amount: Int, _ currency: String) {
        self.amount = amount
        self.currencyName = currency
    }
    
    func times(_ multiplier: Int) -> Money {
        Money(amount * multiplier, currencyName)
    }
    
    static func dollar(_ amount: Int) -> Money {
        Money(amount, "USD")
    }
    
    static func franc(_ amount: Int) -> Money {
        Money(amount, "CHF")
    }
    
    func currency() -> String {
        currencyName
    }
    
    func plus(_ addend: Money) -> Expression {
        Sum(self, addend)
    }
    
    func reduce(_ bank: Bank, _ to: String) -> Money {
        let rate = bank.rate(currencyName, to)
        return Money(amount / rate, to)
    }
}

extension Money: Equatable {
    static func == (lhs: Money, rhs: Money) -> Bool {
        lhs.amount == rhs.amount && lhs.currencyName == rhs.currencyName
    }
}

extension Money: Expression {
    
}

struct Bank {
    private struct Pair: Equatable, Hashable {
        private let from: String
        private let to: String
        
        init(_ from: String, _ to: String) {
            self.from = from
            self.to = to
        }
    }
    
    private var rates = [Pair: Int]()
    
    func reduce(_ source: Expression, _ to: String) -> Money {
        return source.reduce(self, to)
    }
    
    mutating func addRate(_ from: String, _ to: String, _ rate: Int) {
        let pair = Pair(from, to)
        rates[pair] = rate
    }
    
    func rate(_ from: String, _ to: String) -> Int {
        if from == to {
            return 1
        }
        
        let pair = Pair(from, to)
        let rate = rates[pair]!
        return rate
    }
}

struct Sum {
    let augend: Money
    let addend: Money
    
    init(_ augend: Money, _ addend: Money) {
        self.augend = augend
        self.addend = addend
    }
    
    func reduce(_ bank: Bank, _ to: String) -> Money {
        let amount = augend.amount + addend.amount
        return Money(amount, to)
    }
}

extension Sum: Expression {
    
}
