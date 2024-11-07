const express = require('express');
const mysql = require('mysql2');
const bodyParser = require('body-parser');

const app = express();
app.use(bodyParser.json());

// Konfigurasi koneksi database
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',        // Ganti dengan user MySQL Anda
    password: '',        // Ganti dengan password MySQL Anda
    database: 'BotolPintar'
});

db.connect(err => {
    if (err) throw err;
    console.log("Koneksi ke database berhasil!");
});

// Endpoint untuk menambahkan pengguna
app.post('/pengguna', (req, res) => {
    const { nama, usia, berat_badan, target_konsumsi_air } = req.body;
    const sql = 'INSERT INTO Pengguna (nama, usia, berat_badan, target_konsumsi_air) VALUES (?, ?, ?, ?)';
    db.query(sql, [nama, usia, berat_badan, target_konsumsi_air], (err, result) => {
        if (err) throw err;
        res.send({ message: 'Pengguna berhasil ditambahkan', id_pengguna: result.insertId });
    });
});

// Endpoint untuk mengambil semua pengguna
app.get('/pengguna', (req, res) => {
    const sql = 'SELECT * FROM Pengguna';
    db.query(sql, (err, results) => {
        if (err) throw err;
        res.send(results);
    });
});

// Endpoint untuk menambahkan data konsumsi air
app.post('/trackerKonsumsiAir', (req, res) => {
    const { id_pengguna, tanggal, jumlah_konsumsi } = req.body;
    const sql = 'INSERT INTO TrackerKonsumsiAir (id_pengguna, tanggal, jumlah_konsumsi) VALUES (?, ?, ?)';
    db.query(sql, [id_pengguna, tanggal, jumlah_konsumsi], (err, result) => {
        if (err) throw err;
        res.send({ message: 'Data konsumsi air berhasil ditambahkan', id_tracker: result.insertId });
    });
});

// Endpoint untuk mendapatkan data konsumsi air berdasarkan id pengguna
app.get('/trackerKonsumsiAir/:id_pengguna', (req, res) => {
    const { id_pengguna } = req.params;
    const sql = 'SELECT * FROM TrackerKonsumsiAir WHERE id_pengguna = ?';
    db.query(sql, [id_pengguna], (err, results) => {
        if (err) throw err;
        res.send(results);
    });
});

// Endpoint untuk menambahkan pengingat minum
app.post('/pengingatMinum', (req, res) => {
    const { id_pengguna, waktu, status } = req.body;
    const sql = 'INSERT INTO PengingatMinum (id_pengguna, waktu, status) VALUES (?, ?, ?)';
    db.query(sql, [id_pengguna, waktu, status], (err, result) => {
        if (err) throw err;
        res.send({ message: 'Pengingat minum berhasil ditambahkan', id_pengingat: result.insertId });
    });
});

// Endpoint untuk menambahkan data suhu air
app.post('/suhuAir', (req, res) => {
    const { id_pengguna, suhu_air } = req.body;
    const sql = 'INSERT INTO SuhuAir (id_pengguna, suhu_air) VALUES (?, ?)';
    db.query(sql, [id_pengguna, suhu_air], (err, result) => {
        if (err) throw err;
        res.send({ message: 'Data suhu air berhasil ditambahkan', id_suhu: result.insertId });
    });
});

// Endpoint untuk mendapatkan data suhu air berdasarkan id pengguna
app.get('/suhuAir/:id_pengguna', (req, res) => {
    const { id_pengguna } = req.params;
    const sql = 'SELECT * FROM SuhuAir WHERE id_pengguna = ?';
    db.query(sql, [id_pengguna], (err, results) => {
        if (err) throw err;
        res.send(results);
    });
});

// Server
const PORT = 3000;
app.listen(PORT, () => {
    console.log(`Server berjalan pada port ${PORT}`);
});
