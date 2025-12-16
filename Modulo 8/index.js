const express = require('express');
const { Pool } = require('pg');
const app = express();
app.use(express.json());

const pool = new Pool({
  user: 'postgres',
  password: 'postgres',
  host: 'localhost',
  database: 'partners_db',
  port: 5432,
});

app.post('/partners', async (req, res) => {
  const p = req.body;
  await pool.query(
    `INSERT INTO partners VALUES ($1,$2,$3,$4,
     ST_GeomFromGeoJSON($5), ST_GeomFromGeoJSON($6))`,
    [p.id, p.tradingName, p.ownerName, p.document,
     JSON.stringify(p.coverageArea), JSON.stringify(p.address)]
  );
  res.sendStatus(201);
});

app.get('/partners/:id', async (req, res) => {
  const r = await pool.query('SELECT * FROM partners WHERE id=$1',[req.params.id]);
  res.json(r.rows[0]);
});

app.get('/partners/search', async (req, res) => {
  const { lng, lat } = req.query;
  const r = await pool.query(`
    SELECT * FROM partners
    WHERE ST_Contains(coverage_area, ST_SetSRID(ST_Point($1,$2),4326))
    ORDER BY ST_Distance(address, ST_SetSRID(ST_Point($1,$2),4326))
    LIMIT 1`, [lng, lat]);
  res.json(r.rows[0]);
});

app.listen(3000,()=>console.log('API rodando'));
