//propriedades computadas
class Conta {
    var saldo = 0.0
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

extension Conta {
    func transferir(_ contaDestino: Conta, _ valor: Double){
        sacar(valor)
        contaDestino.depositar(valor)
    }
}

var contaMateus = Conta(nome: "Mateus")
contaMateus.depositar(200)

var contaElaine = Conta(nome: "Elaine")
contaMateus.transferir(contaElaine, 50)

print(contaMateus.saldo)
print(contaElaine.saldo)

func contaCaracteresString(_ texto: String) -> Int {
    return texto.count
}
let texto = "Mateus"
contaCaracteresString(texto)

extension String {
    func contaCaracteresString() -> Int {
        return self.count
    }
}
print(texto.contaCaracteresString())


//protocolos
enum FormaPagamento {
    case pix
    case boleto
    case saldoEmConta
}

protocol Contas {
    var saldos: Double { get set }
    var nomes: String {get set}
    
    func sacar(_ valor: Double)
    
    func depositar(_ valor: Double)
    
}

enum ResultadoSaque {
    case sucesso(novoValor: Double)
    case falha(erro: String)
}


class ContasCorrentes{
    
    var saldos: Double = 0.0
    var nomes: String
    
    func sacar(_ valor: Double) -> ResultadoSaque {
        
        if valor > saldos {
            return .falha(erro: "O valor é maior do que o seu saldo")
        } else {
            saldos -= valor
            return .sucesso(novoValor: saldos)
        }
    }
    
    func depositar(_ valor: Double) {
        saldos += valor
    }
    
    func pagamentoCartao(_ tipoPagamento: FormaPagamento) {
        switch tipoPagamento {
        case .pix: print("O pagamento será efetuado por pix")
        case .boleto: print("O pagamento será efetuado por boleto")
        case .saldoEmConta: print("O pagamento será efetuado em conta")
        }
    }
    
    init(nomes: String) {
        self.nomes = nomes
    }
}

var contasMateus: ContasCorrentes = .init(nomes: "Mateus")
contasMateus.pagamentoCartao(.saldoEmConta)
contaMateus.depositar(100)
let resultado: () = contaMateus.sacar(20)

switch resultado {
case .sucesso(let novoValor):
    print("O saque foi um sucesso, e o novo saldo é de \(novoValor)")
case .falha(let erro): 
    print(erro)
}

//======================================================================//
enum Mes: Int {
    case janeiro, fevereiro, marco, abril, maio, junho, julho, agosto, setembro, outubro, novembro, dezembro
}

var janeiro = Mes.janeiro
print(janeiro.rawValue)
var fevereiro: Mes = .fevereiro
print(fevereiro.rawValue)

enum Moeda: Double {
    case umCentavo = 0.01
    case cincoCentavos = 0.05
    case dezCentavos = 0.10
    case vinCincoCentavos = 0.25
    case cinquentaCentavos = 0.5
    case umReal = 1.0
}

var moedaCincoCentavos = Moeda.cincoCentavos
print(moedaCincoCentavos.rawValue)
