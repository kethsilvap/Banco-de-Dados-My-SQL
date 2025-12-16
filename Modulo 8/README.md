# Partner API

## Como rodar
1. Instale Node.js e PostgreSQL com PostGIS
2. Crie o banco:
```sql
CREATE DATABASE partners_db;
CREATE EXTENSION postgis;
```
3. Rode:
```bash
npm install
npm start
```

## Endpoints
POST /partners
GET /partners/:id
GET /partners/search?lng=&lat=
