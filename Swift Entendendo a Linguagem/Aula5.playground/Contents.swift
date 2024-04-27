var notas: [Double] = [8.5, 9.0, 7.2, 6.0] //de forma implicita vc pode colocar outros valores tipo string
notas[0]

var arrayVazio = Array<String>()

notas.isEmpty
arrayVazio.isEmpty

notas.count
notas.min()
notas.max()
notas.contains(8.5)
notas.firstIndex(of: 9.0)

notas.append(10)
notas.insert(5.0, at: 2)
notas += [8.2]
print(notas)

var elementoRemovido = notas.remove(at: 3)
print(elementoRemovido)

print(notas)

for (index, elemento) in notas.enumerated() {
    print(index, elemento)
}

//===============================================//

var nomes: Set<String> = ["Mateus", "Camila", "Caroline", "Cleide"]

nomes.contains("Mateus")

nomes.insert("Crelio")
nomes.remove("Mateus")

//Tuplas
typealias Coordenadas = (x: Int, y: Double, z: Double)


var coordenadas: Coordenadas = (x: 5, y: 3.5, z: 8.0)
coordenadas.x
coordenadas.y
coordenadas.z

var pessoa = (nome: "Mateus", idade: 27)
pessoa.nome
pessoa.idade

var (_, idade) = pessoa
print(idade)

//dicionário
var pontuacao = [
    "joaosilva": 20,
    "felipesilva": 10,
    "mateuspereira": 15
]

var pessoas: [String: Int] = [:]
pessoas.reserveCapacity(10) //reserva na memória apenas 10 elementos

print(pontuacao["felipesilva"])
pontuacao.isEmpty
pontuacao.count
pontuacao["anaclara"] = 30
pontuacao["giovannamoeller"] = 50
print(pontuacao)
pontuacao.updateValue(60, forKey: "giovannamoeller")
pontuacao.updateValue(30, forKey: "pedrosantos")

print(pontuacao)
pontuacao["giovannamoeller"] = nil
print(pontuacao)
pontuacao.removeValue(forKey: "pedrosantos")
print(pontuacao)

for (nome, pontuacao) in pontuacao {
    print("O usuário \(nome) fez \(pontuacao) pontos.")
}

for nome in pontuacao.keys {
    print(nome)
}

for pontos in pontuacao.values {
    print(pontos)
}
