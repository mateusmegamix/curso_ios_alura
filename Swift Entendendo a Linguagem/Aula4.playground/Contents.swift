//função argument label "com"
func soma(_ numero1: Int, _ numero2: Int) -> Int {
    var resultado = numero1 + numero2
    return (resultado)
}

print(soma(5, 3))

func verificaAdulto(_ idade: Int) -> Bool {
    return idade >= 18
}

verificaAdulto(22)
verificaAdulto(15)

//================================================//

var telefone: String?
telefone = "993058728"
print(telefone!)// ! garante que tem um número

var numeroEmString = "45" //se escrever um valor em string o valor retorna como nil
var numero = Int(numeroEmString)
print(numero)

//================================================//

if telefone != nil {
    print(telefone!)
}

var celular: String?
celular = "000000000"

//optional binding
if let telefone = telefone,
   let celular = celular {
    print(telefone)
    print(celular)
}

//Guard let
func autenticar(usuario: String?, senha: String?) {
    //se caso vier um retorno nil ele sai da função
    guard let usuario = usuario, let senha =
    senha else { return }
    print(usuario)
    print(senha)
}
autenticar(usuario: "joao", senha: "1234") //nil

//optionalChaining
if let primeiroCaractere = telefone?.first {
    print(primeiroCaractere)
}
print(telefone?.first)

print(telefone ?? "Não à valor para telefone")
