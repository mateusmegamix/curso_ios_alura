var pontuacao1 = 8.0
var pontuacao2 = 10.0

pontuacao1 > pontuacao2
pontuacao1 >= pontuacao2
pontuacao1 < pontuacao2
pontuacao1 <= pontuacao2
pontuacao1 == pontuacao2
pontuacao1 != pontuacao2

var usuario1Venceu = pontuacao1 > pontuacao2
var usuario2Venceu = pontuacao2 > pontuacao1

var idade = 22
var adulto = idade >= 18
var possuiCNHValida = true

var podeDirigir = adulto && possuiCNHValida
!adulto

//====================================================//

if idade >= 18 {
    print("Pode iniciar o processo de tirar carta.")
} else {
    print("Você não pode tirar carta ainda")
}

var possuCNHValida = true
if idade >= 18 || possuiCNHValida {
    print("Pode dirigir.")
} else {
    ("Não pode dirigir")
}

var numero1 = 5
var numero2 = 5

if numero2 > numero1 {
    print("Número 2 é maior que número 1.")
} else if numero1 > numero2 {
    print("Número 1 é maior que número 2.")
} else {
    print("Número 1 é igual a número 2.")
}

//====================================================//

var intervaloFechado = 10...20
var intervaloSemiAberto = 10..<20

var numero = 20

switch numero {
    case 0...10: print("Número está entre 0 e 10")
    case 10...20: print("Número está entre 0 e 20")
default: print("Número é maior do que 20")
}

var animal = "Cachorro"

switch animal {
    case "Cachorro", "Gato": print("Animal doméstico")
default: print("Animal Selvagem")
}

switch numero {
    case _ where numero % 2 == 0: print("Número é par")
    case _ where numero % 2 != 0: print("Número é ímpar")
    //case let x where x % 2 =0 ......
    //case _ where x % 2 =0 ......
default: break
}


