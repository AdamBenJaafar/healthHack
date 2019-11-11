const express = require('express');
const mongoose = require('mongoose');
const bodyParser = require('body-parser');


const app = express();

// body parser middleware
// middleware is marker by app.use()
app.use(bodyParser.json());

// DB config
const db = require('./config/keys').localmongo;

// Connect to Mongo
mongoose.connect(db, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
});
// use routes
const countries = require('./routes/api/countries');
app.use('/api/travel',  countries);



const port = process.env.PORT || 5000;

app.listen(port, () =>{
    console.log('Server start on port ', port);
});

export {};
