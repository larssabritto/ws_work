# ws_work

A new Flutter project.

## Estrutura do Projeto 

Com o objetivo de organizar e compor responsabilidades a cada repositório, o projeto
esta estruturado da seguinte forma:

- Store: Diretório com as classes responsáveis pela camada lógica, gerenciamento de estado, que se comunica com a view e
  seus respectivos services.

- Data: Diretório que armazena dados fictícios ou storages locais que são abertos com a aplicação
  sem a necessidade de estar em um servidor externo, por exemplo.

- Model: Os models são classes com propriedades específicas de um determinado objeto. Essas classes
  possuem métodos essências para mapear o retorno de dados da API, por exemplo.

- Features: O diretório Features compõe os Widgets responsáveis pelas telas da aplicação. o sufixo _Features define que
  o Widget é uma tela, já o sufixo _view define que o Widget é uma aba de uma tela específica, ou seja, uuma sub-tela.

- Service: Nesse diretório estão os arquivos do tipo service que fazem comunicação com serviços externos ou alguma base de dados.

- Core: Nesse diretótio se encontra toda parte de componentização de widgets reutilizaveis no projeto.

- Service_Initializer: aquivo responsavel por integrar o Timer Periódico.

## Configuração

Baixe o SDK do [Flutter](https://flutter.dev/docs/get-started/install/windows) específico para o Windows e extraia o arquivo zip em um diretório do seu interesse. Exemplo: c:\src\flutter.

Após isso, adicione o caminho flutter/bin nas variáveis de ambiente e rode o comando:

```bash
flutter doctor
```
Observação: Não instale o Flutter em um diretório que exija privilégios.

[Flutter Release](https://flutter.dev/docs/development/tools/sdk/releases)

[Flutter Tutorial](https://flutter.dev/docs/cookbook)





