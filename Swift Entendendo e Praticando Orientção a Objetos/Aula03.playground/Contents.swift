//propriedades computadas
class Conta {
    var saldo = 0.0 {
        willSet {
            print("O saldo está sendo alterado! O seu novo valor será \(newValue)")
        }
        
        didSet {
            print("O seu valor antigo era \(oldValue)")
        }
    }
    var nome: String
    
    static var taxaTransferencia = 0.1
    
    var negativado: Bool {
        return saldo < 0
    }
    
    func sacar(_ valor: Double) {
        saldo -= valor
    }
    
    func depositar(_ valor: Double) {
        saldo += valor
    }
    
    init(nome: String) {
        self.nome = nome
    }
}

var contaMateus = Conta(nome: "Mateus")
contaMateus.depositar(20)
//contaMateus.sacar(20)
//print(contaMateus.negativado)
//contaMateus.depositar(100)
//print(contaMateus.negativado)
//print(Conta.taxaTransferencia)
