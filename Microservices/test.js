const axios = require('axios');

//signup page post request

axios({
    method: 'post',
    url: 'localhost:3000/signup?',
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
}, (error) => {
    console.log(error);
});