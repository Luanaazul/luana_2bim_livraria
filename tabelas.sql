-- =====================================================
-- SCRIPT DDL - CRIAÇÃO DO BANCO DE DADOS
-- Projeto: Minha Estante - Catálogo de Livros
-- Disciplina: Desenvolvimento Web 1 (DW1)
-- Aluno: Luana
-- Data: 30/06/2026
-- =====================================================

DROP TABLE IF EXISTS generos, livros;
-- Criação da tabela generos
CREATE TABLE generos (
  id_genero SERIAL PRIMARY KEY,
  nome_genero VARCHAR(100) NOT NULL UNIQUE
);

-- Criação da tabela livros
CREATE TABLE livros (
  id_livro SERIAL PRIMARY KEY,
  imagem VARCHAR(300) NOT NULL,
  titulo VARCHAR(255) NOT NULL,
  autor VARCHAR(150) NOT NULL,
  paginas INTEGER NOT NULL,
  ano INTEGER NOT NULL,
  sinopse TEXT NOT NULL,
  genero_id INTEGER NOT NULL,
  FOREIGN KEY (genero_id) REFERENCES generos(id_genero)
);
-- Inserção de gêneros
INSERT INTO generos (nome_genero) VALUES
('Fantasia'),
('Romance'),
('Terror'),
('Clássico'),
('Ficção Científica'),
('Suspense'),
('Policial'),
('Distopia'),
('Poema'), 
('Biografia');
-- Inserção de livros
INSERT INTO livros (imagem,titulo, autor, paginas, ano, sinopse, genero_id) VALUES

('imagens/Império.jpeg','Império do Vampiro', 'Jay Kristoff', 976, 2021, 'Em um mundo onde os vampiros dominam após o desaparecimento do sol, o lendário caçador Gabriel de León narra sua vida e sua busca pelo Santo Graal, a única esperança de salvar a humanidade.', 1),
('imagens/milvezesamor.jpeg','Mil Vezes Amor', 'Lynn Painter', 368, 2022, 'Emilie Hornby revive repetidamente o Dia dos Namorados após sofrer uma decepção amorosa. Presa em um looping temporal, ela tenta descobrir como quebrar o ciclo enquanto repensa suas escolhas e seus sentimentos.', 2),
('imagens/itcoisa.jpeg','It: A Coisa', 'Stephen King', 1104, 1986, 'Na cidade de Derry, uma entidade maligna desperta a cada 27 anos para se alimentar do medo. Um grupo de amigos enfrenta o terrível palhaço Pennywise e precisa retornar anos depois para cumprir uma promessa.', 3),
('imagens/divinos.jpeg','Divinos Rivais', 'Rebecca Ross', 368, 2023, 'Enquanto uma guerra entre deuses ameaça o mundo, dois jornalistas rivais trocam cartas misteriosas que criam uma inesperada conexão entre eles, misturando romance, fantasia e esperança.', 1),
('imagens/neuro.jpeg','Neuromancer', 'William Gibson', 271, 1984, 'Case, um hacker brilhante impedido de acessar o ciberespaço, recebe uma última oportunidade de recuperar sua carreira ao participar de uma perigosa missão envolvendo inteligência artificial.', 5),
('imagens/corvo.jpeg','O Corvo', 'Edgar Allan Poe', 56, 1845, 'Um homem de luto pela morte de sua amada recebe a visita de um misterioso corvo que repete incessantemente a palavra "Nunca mais", levando-o ao desespero e à reflexão sobre a perda.', 3),
('imagens/mulherzinhas.jpeg','Mulherzinhas','Louisa May Alcott', 759, 1868, 'As irmãs Meg, Jo, Beth e Amy March enfrentam os desafios da juventude durante a Guerra Civil Americana, aprendendo sobre amor, amadurecimento, família e independência.', 4),
('imagens/demonios.jpeg','O Mundo Assombrado pelos Demônios', 'Carl Sagan', 442, 1995, 'Carl Sagan defende a importância do pensamento científico e do senso crítico para combater superstições, pseudociências e informações falsas na sociedade.', 5),
('imagens/orgulho.jpeg','Orgulho e Preconceito', 'Jane Austen', 432, 1813, 'Elizabeth Bennet conhece o reservado Sr. Darcy e, entre mal-entendidos e preconceitos, ambos aprendem importantes lições sobre amor, caráter e primeiras impressões.', 4),
('imagens/dungeonsdrama.jpeg','Dungeons and Drama', 'Kristy Boyce', 352, 2024, 'Após ser afastada do musical da escola, Riley começa a trabalhar na loja de jogos do pai. Entre partidas de RPG, amizades e um namoro de mentira, ela descobre novas paixões.', 2),
('imagens/jantar.jpeg', 'Jantar Secreto', 'Raphael Montes', 389, 2016, 'Quatro amigos universitários que se mudam do Paraná para o Rio de Janeiro. Afundados em dívidas, eles começam a promover jantares exclusivos para a elite carioca, cujo a iguaria é a carne de gaviota', 6),
('imagens/enaosobrounenhum.jpeg', 'E Não Sobrou Nenhum', 'Agatha Christie', 400, 1939, 'Dez pessoas que não se conhecem são convidadas para uma ilha misteriosa por um anfitrião desconhecido. Uma a uma, elas começam a ser assassinadas seguindo os versos de um antigo poema infantil.', 7), -- 7 = Policial
('imagens/1984.jpeg', '1984', 'George Orwell', 336, 1949, 'Em um Estado totalitário dominado pelo Grande Irmão, Winston Smith vive sob constante vigilância. Ele comete o crime supremo ao tentar pensar por si mesmo e se apaixonar.', 8), -- 8 = Distopia
('imagens/poemasmentais.jpeg', 'Eu Tenho Sérios Poemas Mentais', 'Pedro Salomão', 192, 2018, 'Uma coletânea de poemas que abordam com sensibilidade e afeto temas como o amor, a ansiedade, a autodescoberta e as complexidades da mente humana.', 9), -- 9 = Poema
('imagens/ritalee.jpeg', 'Rita Lee: Uma Autobiografia', 'Rita Lee', 296, 2016, 'A rainha do rock brasileiro narra sua própria história com total franqueza e humor, cobrindo desde a infância, os Mutantes, o sucesso solo, as prisões até a vida familiar.', 10); -- 10 = Biografia
