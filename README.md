# Automação de Testes de UI com Selenium + Python

## Regras
### Primeira Etapa
1) Implementar 50 scripts de testes que manipulem uma aplicação web (sugestões: Mantis ou TestLink) com Page Objects.
2) Alguns scripts devem ler dados de uma planilha Excel para implementar Data-Driven.
</br>Caso se utilize Cucumber, SpecFlow ou outra ferramenta de BDD não será preciso implementar lendo de uma planilha Excel. Pode ser a implementação de um Scenario Outline.
3) Implementar 50 CTs usando data-driven não é a mesma coisa que implementar 50 scripts.
4) Os casos de testes precisam ser executados em no mínimo três navegadores, utilizando o Selenium Grid.
* Não é necessário executar em paralelo;
* Não é uma boa prática executar os testes em todos os browsers em uma única execução. A melhor forma é controlar o browser através de um arquivo de configuração.
  * .NET: normalmente utiliza-se app.config
  * Java: normalmente utiliza-se a classe Properties e cria-se um arquivo chamado environment.properties.

### Segunda Etapa
5) Gravar screenshots ou vídeo automaticamente dos casos de testes.
6) O projeto deverá gerar um relatório de testes automaticamente com screenshots ou vídeos embutidos. Sugestões: Allure Report ou ExtentReport.
7) A massa de testes deve ser preparada neste projeto, seja com scripts carregando massa nova no BD ou com restore de banco de dados.

### Terceira Etapa
8) Um dos scripts deve injetar Javascript para executar alguma operação na tela. O objetivo aqui é exercitar a injeção de Javascript dentro do código do Selenium.
Sugestão: fazer o login usando Javascript ao invés do código do Selenium.
9) Testes deverão ser agendados pelo Jenkins, CircleCI, TFS, TeamCity ou outra ferramenta de CI que preferir.

## Aplicação
A automação será feita sobre a ferramenta Mantis Bugtracker utilizando banco de dados MySQL.

## Cenários
### Login
1) Realizar login com sucesso
2) Realizar login com dados inválidos