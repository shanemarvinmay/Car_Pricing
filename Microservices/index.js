const express = require('express');
const app = express();
const port = process.env.PORT | 3000;

//firebase stuff
const firebaseConfig = {
    apiKey: "AIzaSyDvrgVpxLNe5PfbisbAXgGvFeheFvnRwl8",
    authDomain: "senior-design-b2b93.firebaseapp.com",
    databaseURL: "https://senior-design-b2b93.firebaseio.com",
    projectId: "senior-design-b2b93",
    storageBucket: "senior-design-b2b93.appspot.com",
    messagingSenderId: "439726316771",
    appId: "1:439726316771:web:54a2b1f38dea07774b79d6",
    measurementId: "G-RJHPMWLQEX"
};
const firebase = require("firebase").initializeApp(firebaseConfig);
const db = firebase.database();


app.get('/login', (req, res) => {
    // look up user 
    // check to make sure password matches 
    // if password matches, then return user json obj 
    res.send('login!');
});

app.post('/signup', (req, res) => {
    // save user data 
    res.send('signup !');
});

app.get('/forgot-password', (req, res) => {
    // look up password 
    res.send('forgot password!');
});

app.post('/save', (req, res) => {
    // save super important car info 
    res.send('save !');
});

app.get('/lookup', (req, res) => {
    // get user history 
    // return it as json 
    res.send('lookup !');
});

// end point for calc value of car 

// end point for judging car 





app.listen(port, () => console.log(`App listening at http://localhost:${port}`))

/**
 * Log in
 * Sign up
 * Forgot password
 * Write to database
 * Read recent car look ups
 */