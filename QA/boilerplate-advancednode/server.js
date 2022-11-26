'use strict';
require('dotenv').config();

const express = require('express');
const myDB = require('./connection');
const fccTesting = require('./freeCodeCamp/fcctesting.js');

const routes = require('./routes.js');
const auth = require('./auth.js');

const app = express();

app.set('view engine', 'pug');
app.set('views', './views/pug');

fccTesting(app); //For FCC testing purposes
app.use('/public', express.static(process.cwd() + '/public'));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

myDB(async client => {
  const myDataBase = await client.db('test').collection('users');

  auth(app, myDataBase);

  routes(app, myDataBase);

  app.use((req, res, next) => {
    res.status(404)
      .type('text')
      .send('Not Found');
  });
}).catch(e => {
  app
    .route('/')
    .get((req, res) => {
      res.render('index', { title: e, message: 'Unable to connect to database' });
    });
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log('Listening on port ' + PORT);
});
