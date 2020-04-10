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
    if (req.query.username && req.query.password){
        res.send('Can login');
    } else {
        res.send('Cannot login');
    }
    // look up user 
    // check to make sure password matches 
    // if password matches, then return user json obj 
    
});

app.post('/signup', (req, res) => {
    // save user data 
    // db.ref('users/' + userID).set({
    //     firstName: req.query.firstName,
    //     lastName: req.query.lastName,
    //     username: req.query.username,
    //     email: req.query.email,
    //     password: req.query.password,
    //     securityQuestion: req.query.securityQuestion,
    //     securityAnswer: req.query.securityAnswer
    // })
    // res.send('User is signed up!');

    if (req.query.firstName && req.query.lastName && req.query.username && req.query.email 
        && req.query.password && req.query.securityQuestion && req.query.securityAnswer) {
        res.send('Can signUp');
    } else {
        res.send('Cannot signup');
    }
});

app.get('/forgot-password', (req, res) => {
    //check if user exists
    //look up password 
    //return as json

    if (eq.query.username &&req.query.securityAnswer) {
        res.send('Send forgotten password');
    } else {
        res.send('Cannot send forgotten password');
    }
    // res.send('forgot password!');
});

app.post('/save-car-info', (req, res) => {
    // save super important car info 
    // db.ref('cars/' + carID).set({
    //     make: req.query.make,
    //     model: req.query.model,
    //     year: req.query.year,
    //     mpg: req.query.mpg,
    //     milage: req.query.milage
    // })
    // res.send('Car info saved!');

    if (req.query.make && req.query.model && req.query.year && req.query.mpg && req.query.milage) {
        res.send('Send car price');
    } else {
        res.send('Cannot get car price');
    }
});

app.get('/lookup-history', (req, res) => {
    // get user history 
    // return it as json 
    // res.send('lookup !');

    if (req.query.username) {
        res.send('Send recent history');
    } else {
        res.send('Cannot send recent history');
    }
});

// end point for calc value of car
app.get('/car-value', (req, res) => {
    //get value of car from LR models
    //return it as json
});

// end point for judging car 
app.get('/car-info', (req, res) => {
    //get info about car from CNN models
    //return it as json
});





app.listen(port, () => console.log(`App listening at http://localhost:${port}`))

/**
 * Log in
 * Sign up
 * Forgot password
 * Write to database
 * Read recent car look ups
 */