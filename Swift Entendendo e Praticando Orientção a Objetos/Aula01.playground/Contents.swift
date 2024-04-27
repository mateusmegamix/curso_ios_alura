//struct
struct ContaCorrente {
    var saldo = 0.0
    var nome: String
    
    mutating func sacar(_ valor: Double) {
        saldo -= valor
    }
    
    mutating func depositar(_ valor: Double) {
        
        saldo += valor
    }
}

var contaCorrenteStruct01 = ContaCorrente(nome: "Mateus")
print(contaCorrenteStruct01.saldo)
contaCorrenteStruct01.depositar(100)
print(contaCorrenteStruct01.saldo)

var contaCorrentStruct02 = ContaCorrente(nome: "Elaine")
print(contaCorrentStruct02.saldo)
contaCorrentStruct02.depositar(50)
print(contaCorrentStruct02.saldo)

//====================================================//
//Classe
class ContaCorrenteClasse {
    var saldo: Double
    var nome: String
    
    func sacar(_ valor: Double) {
        saldo -= valor
    }
    
    func depositar(_ valor: Double) {
        
        saldo += valor
    }
    
    init(nome: String) {
        saldo = 0.0
        self.nome = nome
    }
}

var contaCorrenteMateusP = ContaCorrenteClasse(nome: "Mateus")
print(contaCorrenteMateusP.saldo)
contaCorrenteMateusP.depositar(1500)
print(contaCorrenteMateusP.saldo)

var contaCorrentElaineP = ContaCorrenteClasse(nome: "Elaine")
print(contaCorrentElaineP.saldo)
contaCorrentElaineP.depositar(500)
print(contaCorrentElaineP.saldo)

//===========================================================//

let contaCorrenteClasse01 = ContaCorrenteClasse(nome: "Ana")
contaCorrenteClasse01.depositar(60)
print("Saldo da conta corrent classe 01 = \(contaCorrenteClasse01.saldo)")




















