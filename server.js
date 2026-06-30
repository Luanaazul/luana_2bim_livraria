const express = require('express');
const { Pool } = require('pg');
const path = require('path');
require('dotenv').config();

const app = express();
const PORT = process.env.PORT || 3000;

// Configuração da conexão com PostgreSQL
const pool = new Pool({
    user: process.env.DB_USER ,
    password: process.env.DB_PASSWORD ,
    host: process.env.DB_HOST ,
    port: Number(process.env.DB_PORT),
    database: process.env.DB_NAME 
});

// Middleware para receber JSON
app.use(express.json());

// Middleware CORS
app.use((req, res, next) => {
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Methods', 'GET, POST');
    res.header('Access-Control-Allow-Headers', 'Content-Type');
    next();
});

// Middleware para servir arquivos estáticos
app.use(express.static(path.join(__dirname)));


// ======================================================
// ROTA 1 - LISTAR TODOS OS LIVROS
// ======================================================

app.get('/livros', async (req, res) => {

    try {

        console.log('📚 GET /livros - Buscando todos os livros...');

        const result = await pool.query(
            'SELECT * FROM livros'
        );

        console.log(`✅ Sucesso! ${result.rows.length} livros encontrados`);

        res.json(result.rows);

    } catch (err) {

        console.error('❌ Erro ao consultar livros:', err.message);
        console.error('Stack:', err.stack);

        res.status(500).json({
            erro: 'Erro ao consultar livros',
            detalhes: err.message
        });

    }

});
// ======================================================
// ROTA 2 - PESQUISAR LIVROS POR GÊNERO
// ======================================================

app.post('/livros/genero', async (req, res) => {

    try {

        const generoRecebido = req.body.genero;

        console.log(`📚 POST /livros/genero - Buscando gênero: "${generoRecebido}"`);

        const result = await pool.query(
            `
            SELECT livros.*
            FROM livros
            JOIN generos
                ON livros.genero_id = generos.id_genero
            WHERE generos.nome_genero = $1
            `,
            [generoRecebido]
        );

        console.log(`✅ Sucesso! ${result.rows.length} livros do gênero "${generoRecebido}" encontrados`);

        res.json(result.rows);

    } catch (err) {

        console.error('❌ Erro ao pesquisar por gênero:', err.message);
        console.error('Stack:', err.stack);

        res.status(500).json({
            erro: 'Erro ao pesquisar por gênero',
            detalhes: err.message
        });

    }

});


// ======================================================
// ROTA 3 - PESQUISAR LIVROS POR NÚMERO DE PÁGINAS
// ======================================================

app.post('/livros/paginas', async (req, res) => {

    try {

        const paginasRecebidas = req.body.paginas;
       
        const result = await pool.query(
            ` SELECT * FROM livros
            WHERE paginas <= $1
            `,
            [paginasRecebidas]
        );


        res.json(result.rows);

    } catch (err) {

        console.error('❌ Erro ao pesquisar por páginas:', err.message);
        console.error('Stack:', err.stack);

        res.status(500).json({
            erro: 'Erro ao pesquisar por páginas',
            detalhes: err.message
        });

    }

});


// ======================================================
// INICIAR SERVIDOR
// ======================================================

app.listen(PORT, () => {

    console.log(`Servidor rodando em http://localhost:${PORT}`);

    console.log('\nRotas disponíveis:');

    console.log('GET  /livros');
    console.log('POST /livros/genero');
    console.log('POST /livros/paginas');

});