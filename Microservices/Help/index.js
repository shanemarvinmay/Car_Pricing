const express = require('express');
const app = express();
const port = process.env.PORT | 3000;

app.get('/login', (req, res) => {
    res.send('login!');
});

app.post('/signup', (req, res) => {
    res.send('signup !');
});

app.get('/forgot-password', (req, res) => {
    res.send('forgot password!');
});

app.post('/save', (req, res) => {
    res.send('save !');
});

app.get('/lookup', (req, res) => {
    res.send('lookup !');
});

app.listen(port, () => console.log(`App listening at http://localhost:${port}`))

/**
 * Log in
 * Sign up
 * Forgot password
 * Write to database
 * Read recent car look ups
 */