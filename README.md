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
1. Realizar login com sucesso
2. Realizar login com dados inválidos
3. Validar perfis de acesso

### Gerenciar Usuários
4. Criar conta pela tela de login
5. Criar conta pela tela de login com dados inválidos
6. Criar conta
7. Criar conta com dados inválidos
8. Alterar usuário
9. Alterar usuário com dados inválidos
10. Desabilitar usuário
11. Habilitar usuário
12. Excluir usuário

### Gerenciar Projetos
13. Cadastrar projeto
14. Cadastrar projeto com dados inválidos
15. Alterar projeto
16. Alterar projeto com dados inválidos
17. Desabilitar projeto
18. Habilitar projeto
19. Cadastrar subprojeto
20. Incluir projeto existente como subprojeto
21. Adicionar categoria ao projeto
22. Adicionar categoria com dados inválidos
23. Alterar categoria
24. Alterar categoria com dados inválidos
25. Adicionar e editar categoria
26. Deletar categoria
27. Importar categorias de outro projeto
28. Adicionar versão ao projeto
29. Adicionar versão com dados inválidos
30. Alterar versão
31. Alterar versão com dados inválidos
32. Adicionar e alterar versão
33. Deletar versão
34. Importar versões de outro projeto

### Gerenciar Tarefas
35. Pesquisar tarefa por número
36. Pesquisar tarefa com filtros
37. Exportar tarefas
38. Criar terafa
39. Criar tarefa com dados inválidos
40. Criar tarefa com anexo de arquivo
41. Alterar tarefa
42. Alterar tarefa com dados inválidos
43. Alterar tarefa para privado
44. Alterar tarefa para público
45. Atribuir tarefa
46. Alterar status da tarefa
47. Adicionar anotação à tarefa
48. Adicionar tarefa relacionada
49. Remover tarefa relacionada
50. Deletar tarefa