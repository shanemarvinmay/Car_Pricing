const axios = require('axios');

const express = require('express');
const app = express();
const port = process.env.PORT || 8080;

// signup page post request

app.get('/', (req, res) => {
    
    
    axios({
        method: 'get',
        url: 'http://localhost:3000/',
        data: {
            firstName: 'Richarda',
            lastName: 'Butler',
            username: 'Rikki',
            password: 'password',
            securityQuestion: 'What is the name of my dog',
            securityAnswer: 'Sparky'
        }
    }).then((response) => {
        console.log(response);
        res.send('test root end point reached');
    }, (error) => {
        console.log(error);
    });
});

// axios({
//     method: 'post',
//     url: 'localhost:3000/signup?',
//     data: {
//         firstName: 'Richarda',
//         lastName: 'Butler',
//         username: 'Rikki',
//         password: 'password',
//         securityQuestion: 'What is the name of my dog',
//         securityAnswer: 'Sparky'
//     }
// }).then((response) => {
//     console.log(response);
// }, (error) => {
//     console.log(error);
// });


app.listen(port, () => console.log(`App listening at http://localhost:${port}`))
