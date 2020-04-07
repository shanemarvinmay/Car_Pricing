const express = require('express');
const app = express();
const port = process.env.PORT | 3000;

//firebase stuff
import * as firebase from "firebase/app";
import "firebase/firestore";

var firebaseConfig = {
    apiKey: "api-key",
    authDomain: "project-id.firebaseapp.com",
    databaseURL: "https://project-id.firebaseio.com",
    projectId: "project-id",
    storageBucket: "project-id.appspot.com",
    messagingSenderId: "sender-id",
    appId: "app-id",
    measurementId: "G-measurement-id",
};

var firebase = require("firebase/app");

require("firebase/firestore");


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