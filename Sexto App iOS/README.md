# ios-server-driven-swift-bank

Importante: siga os procedimentos desta atividade antes de prosseguir com o curso. As ferramentas são necessárias para seus estudos.

1. Como utilizar um JSON do Apiary?
Para simular um servidor back-end, vamos utilizar o site Apiary.

1) Acesse o site Apiary;

2) Crie uma conta ou faça login utilizando o GitHub;

3) Cole o seguinte arquivo JSON no corpo do Apiary:

{
    "header": {
        "title": "Olá, Pedro"
    },
    "items": [
        {
            "id": "balance",
            "amount": "88,67"
        },
        {
            "id": "card",
            "amount_available": "9.047,98",
            "invoice_due_date": "04/05"
        },
        {
            "id": "latest_transactions",
            "results": [
                {
                    "id": "23847919",
                    "title": "Compra realizada no iFood",
                    "amount": "22,70",
                    "icon": "restaurante-icon"
                },
                {
                    "id": "34843928",
                    "title": "Pagamento mensal Academia",
                    "amount": "99,90",
                    "icon": "gym-icon"
                },
                {
                    "id": "42534928",
                    "title": "Compra supermercado popular",
                    "amount": "45,90",
                    "icon": "supermarket-icon"
                }
            ] 
        }
    ]
}
COPIAR CÓDIGO
4) Salve as modificações no botão “save” no lado direito da tela;

5) Selecione a opção “Mock Server”;

6) Copie a URL no menu lateral direito;

7) Cole-a em seu projeto na classe HTTP Cliente.

Pronto! Agora você pode prosseguir com o curso.

2. Requisições HTTP
Se alguns conceitos (HTTP, JSON, requisição) parecem estranhos a você, recomendamos que acesse cursos sobre esse tema.

iOS com SwiftUI: fazendo requisições HTTP e conexão com API: aborda conhecimentos e habilidades básicas relacionadas a requisições HTTP e conexão com API em desenvolvimento iOS com SwiftUI;
iOS com SwiftUI: construindo aplicações interativas com CRUD e APIs REST: aprofunda os conhecimentos vistos no primeiro curso da lista.
Bons estudos!