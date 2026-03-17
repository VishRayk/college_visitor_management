# College Visitor Management (Visitory)

Full-stack visitor management system with:
- **Frontend**: React + Vite (`frontend/`)
- **Backend API**: Node.js + Express (`backend/`)
- **Database**: MySQL (recommended via Docker Compose)
- **Optional AI camera service**: Flask + OpenCV (`python/`) used by the image capture flow

## Prerequisites

- Node.js (LTS recommended)
- Docker Desktop (for MySQL) OR a local MySQL 8.x server
- Python 3.10+ (only if you want the AI camera service)

## Quick start (recommended: Docker MySQL)

### 1) Clone and install deps

```bash
npm install
cd frontend && npm install
```

### 2) Create your `.env`

Copy the example and edit secrets:

```bash
cp .env.example .env
```

On Windows PowerShell, use:

```powershell
Copy-Item .env.example .env
Copy-Item .\frontend\.env.example .\frontend\.env
```

Defaults assume the backend runs on **port 3000** and MySQL is on **3306**.

### 3) Start MySQL (auto-creates schema)

```bash
docker compose up -d
```

This will create the DB + tables from `db/init.sql`.

If you already have local MySQL running on port **3306**, stop it first (recommended), or change the host port mapping in `docker-compose.yml` (for example `3307:3306`) and set `SQL_PORT` accordingly in your `.env`.

### 4) Run the backend (Express)

From repo root:

```bash
npm run dev
```

Backend should start on `http://localhost:3000`.

### 5) Run the frontend (Vite)

In another terminal:

```bash
cd frontend
npm run dev
```

Frontend will show a local URL (usually `http://localhost:5173`).

### 6) (Optional) Run the Python AI service

In another terminal:

```bash
cd python
python -m venv .venv
.\.venv\Scripts\activate
pip install -r requirements.txt
python app.py
```

Python service runs on `http://localhost:5000`.

## Configuration

- **Backend env**: `.env` (see `.env.example`)
  - MySQL: `SQL_HOST`, `SQL_PORT`, `SQL_USERNAME`, `SQL_PASSWORD`, `SQL_DATABASE`
  - Auth: `JWT_SECRET`
  - Twilio (OTP): `TWILIO_*` (optional; required if you want real SMS OTP)
- **Frontend env**: `frontend/.env` (see `frontend/.env.example`)
  - `VITE_API_BASE_URL` (default `http://localhost:3000`)
  - `VITE_PY_BASE_URL` (default `http://localhost:5000`)
