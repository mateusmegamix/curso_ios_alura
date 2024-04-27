//====================================================//

//for i in 1...1o
for _ in 1...10 {
    print("Eu amo a linguagem Swift")
}

//while
var count = 11

while count <= 10 {
    print("Eu amo a linguagem Swift")
    count += 1
}

repeat {
    print("Eu amo a linguagem Swift")
} while count <= 10


var soma = 0

for i in 1...10 {
    soma += i
}
print(soma)

//===================================================//

var contador = 1

while contador <= 10 {
    if contador == 5 {
        break
    }
    print(contador)
}
