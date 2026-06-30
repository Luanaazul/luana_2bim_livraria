# 📚 Minha Estante - Catálogo de Livros

**Projeto Acadêmico de Desenvolvimento Web 1 (DW1)**  
**2º Bimestre - 2026**  
**Aluna:** Luana Cazarin de Almeida
**Professor:** Radames Halmeman

---

## Descrição do Projeto

**Minha Estante** é uma aplicação web que funciona como um **catálogo pessoal de livros**. 

O usuário pode:
-  **Visualizar todos os livros** cadastrados
- **Filtrar por gênero** (Fantasia, Romance, Terror, Clássico, Ficção Científica, Suspense, Policial, Distopia, Poema, Biografia)
-  **Filtrar por número de páginas** (livros com até X páginas)
-  **Ver informações completas** de cada livro (título, autor, páginas, ano, sinopse, imagem)

A aplicação demonstra a **arquitetura Cliente/Servidor** com comunicação via **JSON** e requisições **HTTP**.

---

##  Tecnologias Utilizadas

### Frontend (Cliente - Browser)
- **HTML5** - Estrutura semântica da página
- **CSS3** - Estilização e design responsivo
- **JavaScript (ES6+)** - Lógica interativa e requisições ao servidor
- **Fetch API** - Comunicação HTTP com o servidor

### Backend (Servidor)
- **Node.js** - Runtime JavaScript para servidor
- **Express.js** - Framework web para criar rotas HTTP
- **PostgreSQL** - Banco de dados relacional
- **pg** - Driver de conexão com PostgreSQL
- **dotenv** - Gerenciamento de variáveis de ambiente

### DevOps e Versionamento
- **Git/GitHub** - Controle de versão
- **npm** - Gerenciador de pacotes Node.js
- **.env** - Variáveis de ambiente (segurança)
- **.gitignore** - Arquivos ignorados no versionamento

---

##  Estrutura do Projeto

```
luana_2bim_livraria/
│
├── cliente.html              # Página HTML principal (interface do usuário)
├── cliente.css               # Estilos CSS (design e layout)
├── server.js                 # Servidor Express (backend)
│
├── package.json              # Dependências do projeto
├── package-lock.json         # Versões exatas das dependências
├── .env                      # Variáveis de ambiente (NÃO commitado!)
├── .gitignore               # Arquivos ignorados no Git
│
├── script_criar_tabelas.sql  # DDL - Criação do banco de dados
├── README.md                 # Este arquivo (documentação)
│
└── imagens/                  # Pasta com imagens
    ├── estante.jpeg         # Banner do header
    └── livroaberto.jpeg     # Imagem inicial dos resultados
    ├── Império.jpeg         # Capa: Império do Vampiro
    ├── milvezesamor.jpeg    # Capa: Mil Vezes Amor
    ├── itcoisa.jpeg         # Capa: It - A Coisa
    ├── divinos.jpeg         # Capa: Divinos Rivais
    ├── neuro.jpeg           # Capa: Neuromancer
    ├── corvo.jpeg           # Capa: O Corvo
    ├── mulherzinhas.jpeg    # Capa: Mulherzinhas
    ├── demonios.jpeg        # Capa: O Mundo Assombrado pelos Demônios
    ├── orgulho.jpeg         # Capa: Orgulho e Preconceito
    ├── dungeonsdrama.jpeg   # Capa: Dungeons and Drama
    ├── jantar.jpeg          # Capa: Jantar Secreto
    ├── enaosobrounenhum.jpeg # Capa: E Não Sobrou Nenhum
    ├── 1984.jpeg            # Capa: 1984
    ├── poemasmentais.jpeg   # Capa: Eu Tenho Sérios Poemas Mentais
    └── ritalee.jpeg         # Capa: Rita Lee - Uma Autobiografia
```

---

##  Como Rodar o Projeto

### 1 Pré-requisitos

Antes de começar, certifique-se de ter instalado:

- **Node.js** (v14 ou superior) - [Download](https://nodejs.org/)
- **PostgreSQL** (v12 ou superior) - [Download](https://www.postgresql.org/)
- **Git** - [Download](https://git-scm.com/)
- **PGAdmin4** ou **DBeaver** (ferramentas para gerenciar PostgreSQL)

### 2️ Clonar o Repositório

```bash
git clone https://github.com/seu-usuario/luana_2bim_livraria.git
cd luana_2bim_livraria
```

### 3️ Instalar Dependências

```bash
npm install
```

Isto instalará:
- `express` - Servidor web
- `pg` - Cliente PostgreSQL
- `dotenv` - Variáveis de ambiente
- `nodemon` - Reload automático em desenvolvimento

### 4️ Configurar o Banco de Dados

#### A) Criar o banco de dados no PostgreSQL

**Opção 1: Via PGAdmin4**
1. Abra o PGAdmin4 no navegador (geralmente em http://localhost:5050)
2. Clique com botão direito em "Databases"
3. Selecione "Create" → "Database"
4. Nome: `livrariaDW1-projeto`
5. Clique "Save"

**Opção 2: Via Terminal**
```bash
psql -U postgres
CREATE DATABASE "livrariaDW1-projeto";
\q
```

#### B) Executar o script DDL

1. Abra o PGAdmin4 ou DBeaver
2. Conecte no banco `livrariaDW1-projeto`
3. Abra a ferramenta "Query Tool" ou "SQL Editor"
4. Abra o arquivo `script_criar_tabelas.sql`
5. Copie TODO o código
6. Cole na ferramenta SQL
7. Clique em **Execute** (ou Ctrl+Enter)

**Resultado esperado:**
```
Query returned successfully in X ms.
```

**Se der erro:**
- Verifique se selecionou o banco correto
- Verifique se o PostgreSQL está rodando
- Veja a mensagem de erro e pesquise

### 5️ Configurar Variáveis de Ambiente

Crie um arquivo `.env` na **raiz do projeto**:

```bash
# Arquivo: .env
PORT=3000
DB_USER=postgres
DB_PASSWORD=sua_senha_do_postgres
DB_HOST=localhost
DB_PORT=5432
DB_NAME=livrariaDW1-projeto
```

⚠️ **IMPORTANTE:**
- Substitua `sua_senha_do_postgres` pela sua senha REAL
- Esse arquivo NÃO deve ser commitado no Git (já está em `.gitignore`)
- Se esquecer a senha, resete no PGAdmin4

### 6️ Iniciar o Servidor

```bash
npm start
```

Ou em modo desenvolvimento (com auto-reload):
```bash
npm run dev
```

**Output esperado:**
```
Servidor rodando em http://localhost:3000

Rotas disponíveis:
GET  /livros
POST /livros/genero
POST /livros/paginas
```

### 7️ Acessar a Aplicação

Abra seu navegador e acesse:

```
http://localhost:3000
```

Você verá:
- Banner "📚 Minha Estante" no topo
- 3 filtros para buscar livros
-  Área de resultados (inicialmente vazia com mensagem)
- 15 livros aparecem quando clica em um botão

---

##  Rotas Disponíveis (API)

### 1️ GET `/livros` - Todos os Livros

**O que faz:** Retorna todos os 15 livros cadastrados

**Requisição:**
```javascript
const response = await fetch(
    'http://localhost:3000/livros',
    { method: 'GET' }
);
```

**Resposta (JSON):**
```json
[
  {
    "id_livro": 1,
    "imagem": "imagens/Império.jpeg",
    "titulo": "Império do Vampiro",
    "autor": "Jay Kristoff",
    "paginas": 976,
    "ano": 2021,
    "sinopse": "Em um mundo onde os vampiros dominam após o desaparecimento do sol...",
    "genero_id": 1
  },
  { ... mais livros ... }
]
```

**Usado por:** Botão "Mostrar todos os livros"

---

### 2️ POST `/livros/genero` - Livros de um Gênero

**O que faz:** Retorna livros de um gênero específico

**Requisição:**
```javascript
const pacoteJSON = { genero: "Fantasia" };

const response = await fetch(
    'http://localhost:3000/livros/genero',
    {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(pacoteJSON)
    }
);
```

**Resposta:** Todos os livros do gênero selecionado

**Gêneros disponíveis:**
- Fantasia
- Romance
- Terror
- Clássico
- Ficção Científica
- Suspense
- Policial
- Distopia
- Poema
- Biografia

**Usado por:** Botão "Pesquisar" (ao lado do select de gênero)

---

### 3️ POST `/livros/paginas` - Livros com até N Páginas

**O que faz:** Retorna livros com número de páginas ≤ ao valor enviado

**Requisição:**
```javascript
const pacoteJSON = { paginas: 300 };

const response = await fetch(
    'http://localhost:3000/livros/paginas',
    {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(pacoteJSON)
    }
);
```

**Resposta:** Todos os livros com até 300 páginas

**Usado por:** Botão "Pesquisar" (ao lado do input de páginas)

---

## 🗄️ Banco de Dados

### Tabela: `generos`

Armazena os 10 gêneros de livros disponíveis.

| Campo | Tipo | Descrição |
|-------|------|-----------|
| `id_genero` | SERIAL (PK) | Identificador único |
| `nome_genero` | VARCHAR(100) | Nome do gênero (UNIQUE) |

**Dados (10 gêneros):**
- Fantasia
- Romance
- Terror
- Clássico
- Ficção Científica
- Suspense
- Policial
- Distopia
- Poema
- Biografia

---

### Tabela: `livros`

Armazena os 15 livros cadastrados.

| Campo | Tipo | Descrição |
|-------|------|-----------|
| `id_livro` | SERIAL (PK) | Identificador único |
| `imagem` | VARCHAR(300) | Caminho da imagem da capa |
| `titulo` | VARCHAR(255) | Título do livro |
| `autor` | VARCHAR(150) | Nome do autor |
| `paginas` | INTEGER | Número de páginas |
| `ano` | INTEGER | Ano de publicação |
| `sinopse` | TEXT | Resumo do livro |
| `genero_id` | INTEGER (FK) | Referência ao gênero |

**Relacionamento:**
```
generos (1) -------- (N) livros
```
Um gênero pode ter vários livros.

---

##  Fluxo de Dados: Cliente → Servidor → Banco

### Exemplo: Usuário pesquisa por gênero "Fantasia"

```
1. USUÁRIO CLICA
   └─ Clica no botão "Pesquisar" do select de gênero

2. JAVASCRIPT (cliente.html)
   └─ addEventListener detecta o clique
   └─ Executa pesquisarGenero()
   └─ Extrai generoSelecionado = "Fantasia"
   └─ Cria pacoteJSON = { genero: "Fantasia" }
   └─ Transforma: JSON.stringify(pacoteJSON)
   └─ Envia fetch POST /livros/genero

3. INTERNET
   └─ Requisição HTTP viaja pela rede
   └─ De: 127.0.0.1:XXXX (seu navegador)
   └─ Para: localhost:3000 (seu servidor)

4. SERVIDOR (server.js)
   └─ Express recebe POST /livros/genero
   └─ Extrai req.body.genero = "Fantasia"
   └─ Executa query SQL:
      SELECT livros.* FROM livros
      JOIN generos ON livros.genero_id = generos.id_genero
      WHERE generos.nome_genero = 'Fantasia'

5. POSTGRESQL (Banco de Dados)
   └─ Procura todos os livros do gênero "Fantasia"
   └─ Encontra: Império do Vampiro, Divinos Rivais
   └─ Retorna os dados para o servidor

6. SERVIDOR (server.js)
   └─ Converte resultado em JSON
   └─ Envia res.json(resultado)

7. INTERNET
   └─ Resposta HTTP viaja de volta
   └─ De: localhost:3000
   └─ Para: seu navegador

8. JAVASCRIPT (cliente.html)
   └─ await fetch termina
   └─ response chega com sucesso
   └─ Executa: const data = await response.json()
   └─ Transforma JSON string em objeto JavaScript
   └─ Chama exibirLivros(data)

9. JAVASCRIPT (função exibirLivros)
   └─ Limpa a área: innerHTML = ""
   └─ Para cada livro em data (forEach)
   └─ Cria um card HTML com template string
   └─ Adiciona na página: innerHTML += cardLivro

10. PÁGINA WEB
    └─ 2 livros de Fantasia aparecem na tela!
```

---

##  Testando as Rotas

### Com Postman

Se tiver Postman instalado, você pode testar facilmente:

**Teste 1: GET todos os livros**
```
Método: GET
URL: http://localhost:3000/livros
Headers: Content-Type: application/json
Body: (vazio)
```

**Teste 2: POST com gênero**
```
Método: POST
URL: http://localhost:3000/livros/genero
Headers: Content-Type: application/json
Body (JSON):
{
    "genero": "Fantasia"
}
```

**Teste 3: POST com páginas**
```
Método: POST
URL: http://localhost:3000/livros/paginas
Headers: Content-Type: application/json
Body (JSON):
{
    "paginas": 300
}
```

### Com cURL (Terminal)

```bash
# GET todos os livros
curl -X GET http://localhost:3000/livros

# POST com gênero
curl -X POST http://localhost:3000/livros/genero \
  -H "Content-Type: application/json" \
  -d '{"genero":"Fantasia"}'

# POST com páginas
curl -X POST http://localhost:3000/livros/paginas \
  -H "Content-Type: application/json" \
  -d '{"paginas":300}'
```

---

## 🐛 Troubleshooting (Solução de Problemas)

### Erro: "Cannot GET /livros"
- ✅ Verifique se o servidor está rodando (`npm start`)
- ✅ Verifique se a URL está correta (http://localhost:3000)
- ✅ Verifique se não tem erro no console do PowerShell

### Erro: "Connection refused" ou "ECONNREFUSED"
- ✅ PostgreSQL não está rodando
- ✅ Credenciais do `.env` estão erradas
- ✅ Banco de dados não existe

### Erro: "Relation 'livros' does not exist"
- ✅ Execute o arquivo `script_criar_tabelas.sql` no PGAdmin4
- ✅ Verifique se executou no banco correto (`livrariaDW1-projeto`)

### Livros não aparecem mas a página carrega
- ✅ Abra F12 (Console do navegador) para ver erros
- ✅ Verifique se as imagens existem na pasta `imagens/`
- ✅ Execute uma query no PGAdmin4: `SELECT COUNT(*) FROM livros;`
  - Resultado deve ser 15

### "Nenhum livro encontrado" ao clicar em um filtro
- ✅ Os dados não foram inseridos no banco
- ✅ Execute novamente o `script_criar_tabelas.sql`
- ✅ Verifique se o gênero selecionado existe

---

## 📚 Conceitos de Arquitetura Cliente/Servidor

### Cliente (Browser)
- Executa HTML, CSS, JavaScript
- Cria interface para o usuário
- Envia requisições ao servidor
- Processa respostas do servidor
- Não tem acesso direto ao banco de dados

### Servidor (Node.js)
- Executa código JavaScript no servidor
- Processa requisições HTTP
- Consulta o banco de dados
- Envia respostas JSON
- Valida dados antes de processar

### Banco de Dados (PostgreSQL)
- Armazena dados persistentes
- Retorna dados estruturados
- Garante integridade dos dados
- NUNCA é acessado diretamente pelo cliente

### Comunicação (HTTP + JSON)
- Cliente → Servidor: requisição HTTP com JSON no body
- Servidor → Cliente: resposta HTTP com JSON
- JSON é um formato universal que todos entendem

---

##  Aprendizados Principais //Tortura

Este projeto ensina:

1. **HTML Semântico** - Tags como `<header>`, `<main>`, `<section>`, `<footer>`
2. **CSS Responsivo** - Layout que se adapta a diferentes telas
3. **JavaScript Moderno** - async/await, fetch, destructuring
4. **Eventos** - addEventListener, tratamento de cliques
5. **Fetch API** - Requisições HTTP (GET, POST)
6. **JSON** - Formato de dados para comunicação
7. **Node.js** - Servidor JavaScript
8. **Express** - Framework para rotear requisições
9. **PostgreSQL** - Banco de dados relacional
10. **Arquitetura Cliente/Servidor** - Como web funciona!

---

##  Como Contribuir

1. Faça um fork do repositório
2. Crie uma branch para sua feature (`git checkout -b feature/MinhaFeature`)
3. Commit suas mudanças (`git commit -m 'Add MinhaFeature'`)
4. Push para a branch (`git push origin feature/MinhaFeature`)
5. Abra um Pull Request

---

## 📄 Licença

Este projeto é um trabalho acadêmico de Desenvolvimento Web 1 (DW1).

---
- [x] Frontend funcional (HTML, CSS, JavaScript)
- [x] Backend funcionando (Node.js, Express)
- [x] Banco de dados criado (PostgreSQL)
- [x] 3 rotas implementadas (GET, POST, POST)
- [x] 10 gêneros cadastrados
- [x] 15 livros cadastrados (mínimo 10 atendido)
- [x] Arquivo DDL criado (`script_criar_tabelas.sql`)
- [x] README completo e documentado
- [x] .gitignore configurado
- [x] Código comentado e limpo
- [x] Repositório no GitHub

---

Radames que pavor, mas ao mesmo tempo é legal.