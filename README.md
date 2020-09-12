## Trabalho da Matéria "ACH2006 - Engenharia de Sistemas de Informação I" da Universidade de São Paulo

[![Build Status](https://travis-ci.org/pedrofurtado/trabalho-ach2006.svg?branch=master)](https://travis-ci.org/pedrofurtado/trabalho-ach2006)
[![Code Climate](https://codeclimate.com/github/pedrofurtado/trabalho-ach2006/badges/gpa.svg)](https://codeclimate.com/github/pedrofurtado/trabalho-ach2006)
[![Coverage Status](https://coveralls.io/repos/github/pedrofurtado/trabalho-ach2006/badge.svg?branch=master)](https://coveralls.io/github/pedrofurtado/trabalho-ach2006?branch=master)

### Membros do grupo
- Pedro Felipe de Azevedo Furtado nº USP 9277194
- Bruno Vinícius Brandão da Silva nº 9424058
- Gustavo Xavier Moreira nº USP 8623757
- Lucas Paulon Gonçalves nº USP 9277750
- Felipe Fernandes dos Santos nº USP 9276922
- Victor Taendy Sousa Emerenciano nº USP 8921412

### Link para aplicação online (via Heroku)

https://trabalho-ach2006.herokuapp.com

### Emails usados para criar login no PivotalTracker

- gustavoxavier94@icloud.com
- lucaspgon1997@gmail.com
- bruno-brandao@hotmail.com.br
- taendy.s@usp.br
- pedro.felipe.furtado@usp.br
- felipe.fernandes.snt@gmail.com

### Link para o projeto no PivotalTracker

- https://www.pivotaltracker.com/projects/2092239 (Antigo)
- https://www.pivotaltracker.com/projects/2107223 (Novo, criado pelo professor Daniel)

### Descrição do projeto

Sistema de gestão de um hotel.

### Roadmap

- Controle básico de funcionários, ambientes, serviços, quartos, produtos-cortesias, hóspedes
- Controle de reservas
- Visualização de reservas
- Controle básico das faturas (pagamentos das reservas)

### Iterações

#### Iteração 0 (Responsável: Pedro Furtado)

- Configuração do ambiente de desenvolvimento (Linux, Cloud9, etc.)
- Integração com Travis CI, Heroku, CodeClimate
- Criação do projeto no PivotalTracker
- Criação e configuração do projeto no GitHub

#### Iteração 1
- Criação da página inicial do sistema com algumas informações básicas (Responsável: Pedro Furtado)
- Criação dos CRUD's básicos iniciais. São eles:
  - Cadastro de hóspedes (Responsável: Pedro Furtado)
    - ID, Nome, Telefone e Email
  - Cadastro de ambientes (Responsável: Victor Taendy)
    - ID, Nome, Descrição, Preço
  - Cadastro de serviços (Responsável: Lucas Paulon)
    - ID, Nome, Descrição, Preço
  - Cadastro de quartos (Responsável: Gustavo Xavier)
    - ID, Número, Capacidade máxima
  - Cadastros de funcionários (Responsável: Bruno Brandão)
    - ID, Nome, Telefone, Cargo
  - Cadastro de produtos-cortesia (Responsável: Felipe Fernandes)
    - ID, Nome, Descrição, Preço
  
#### Iteração 2
- Permitir que o Usuário possa editar somente o seu cadastro de Usuário (Responsável: Pedro Furtado)
- Criar página de visualização e edição do Usuário (Responsável: Pedro Furtado)
- Configurar envio de email para "Esqueci minha senha" (Responsável: Bruno Brandão)
- Adicionar Produtos-cortesia aos Serviços (Responsável: Felipe Fernandes)
- Adicionar Serviços aos Quartos (Responsável: Victor Taendy)

- Criar CRUD da Reserva (Responsável: Gustavo Xavier)
  - ID, Check-in, Check-out, Hóspede
- Criar CRUD de Refeições oferecidas pelo Hotel (Responsável: Lucas Paulon)
  - ID, Nome, Preço

#### Iteração 3
- Adicionar vários Quartos a uma reserva (Responsável: Pedro Furtado)
- Criar CRUD de Fatura (Responsável: Bruno Brandão)
  - ID, Valor total, Forma de pagamento, Reserva
- Nas páginas de visualização de cada uma das entidades, adicionar um link para editar aquele registro e um link para ir para a página de listagem daquela entidade. (Responsável: Lucas Paulon)
- Nas páginas de listagem das entidades (Página de Lista de Ambientes, Página de Lista das Refeições), adicionar um botão de atalho com um link para a página ".../novo" daquela entidade. (Responsável: Gustavo Xavier)
- Criar CRUD de Limpeza dos Quartos (Responsável: Felipe Fernandes)
  - ID, Data da limpeza, Quarto
- Criar CRUD de Limpeza dos Ambientes (Responsável: Victor Taendy)
  - ID, Data da limpeza, Ambiente
  
#### Iteração 4
- Criar CRUD de Utilização dos Serviços pelas Reservas (Responsável: Pedro Furtado)
- Criar CRUD de Consumo de Refeições pelas Reservas (Responsável: Felipe Fernandes)
- Adicionar o campo "Funcionário" no cadastro da Fatura (Responsável: Pedro Furtado)
- Criar CRUD de Utilização dos Ambientes pelas Reservas (Responsável: Bruno Brandão)
- Criar CRUD de Utilização dos Produtos-Cortesia pelas Reservas (Responsável: Lucas Paulon)
- Adicionar o campo "Acompanhantes" no cadastro da Reserva (Responsável: Gustavo Xavier)

#### Iteração 5
- Na página de visualização de uma Reserva, criar aba "Consumo de Refeições" e listar as Refeições realizadas por essa Reserva (Responsável: Pedro Furtado)
- Na página de visualização de uma Reserva, criar aba "Uso dos Ambientes" e listar os Ambientes frequentados por essa Reserva (Responsável: Bruno Brandão)
- Na página de visualização de uma Reserva, criar aba "Fatura" e listar as informações da Fatura paga pela Reserva, caso tenha uma (Responsável: Gustavo Xavier)
- Na página de visualização de uma Reserva, criar aba "Consumo dos Produtos-Cortesia" e listar os Produtos-Cortesia consumidos por essa Reserva (Responsável: Lucas Paulon)
- Na página de visualização de uma Reserva, criar aba "Uso dos Serviços" e listar os Serviços consumidos por essa Reserva (Responsável: Felipe Fernandes)
- Na página de visualização de uma Reserva, criar aba "Limpeza dos Quartos" e listar as Limpezas realizadas nos quartos da Reserva (Responsável: Pedro Furtado)

#### Iteração 6
- Adicionar um "Calendário de Reservas", na página que lista todas as Reservas (Responsável: Pedro Furtado)
- Criar uma aba "Histórico de Limpeza" na página de visualização do Ambiente (Responsável: Felipe Fernandes)
- Criar uma aba "Histórico de Limpeza" na página de visualização de um Quarto, com a tabela de todas as limpezas realizadas naquele quarto (Responsável: Gustavo Xavier)
- Criar aba "Consumo neste dia" na página da refeicao para listar os Hóspedes que consumiram aquela refeição no dia de hoje (Responsável: Lucas Paulon)
- Criar aba "Uso neste dia" na página do ambiente para listar os Hóspedes que usaram aquele ambiente no dia de hoje (Responsável: Pedro Furtado)
- Novos Usuários devem confirmar o seu email (Usar o "Confirmable" do Devise), acessando-o e clicando no link de ativação da conta, para evitar fraudes (Responsável: Bruno Brandão)

#### Iteração 7
- Criar uma página padrão para erro 404 (Not Found) e 500 (Server Error) (Responsável: Pedro Furtado)
- Criar uma aba "Histórico de Reservas" na página de visualização do Hóspede (Responsável: Felipe Fernandes)
- Criar aba "Reserva atual para este quarto" na página de visualização do Quarto (Responsável: Gustavo Xavier)
- Criar aba "Faturas realizadas" na página de visualização do Funcionário (Responsável: Lucas Paulon)
- Criar uma aba "Hóspedes que consumiram hoje" na página de visualização do Produto-Cortesia (Responsável: Bruno Brandão)
- Criar uma aba "Hóspedes que utilizaram hoje" na página de visualização do Serviço (Responsável: Pedro Furtado)
