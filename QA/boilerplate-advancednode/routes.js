const bcrypt = require('bcrypt');
const passport = require('passport');
const { ensureAuthenticated } = require('./middleware');

module.exports = function (app, myDataBase) {
  app.route('/').get((req, res) => {
    res.render('index', {
      title: 'Connected to Database',
      message: 'Please log in',
      showLogin: true,
      showRegistration: true
    });
  });

  app
    .route('/login')
    .post(
      passport.authenticate('local', { failureRedirect: '/' }),
      (req, res, next) => {
        res.redirect('/profile');
      });

  app
    .route('/profile')
    .get(ensureAuthenticated, (req, res) => {
      res.render('profile', { username: req.user.username });
    });

  app.route('/register')
    .post((req, res, next) => {
        myDataBase.findOne({ username: req.body.username }, (err, user) => {
          if (err) {
            next(err);
          } else if (user) {
            res.redirect('/');
          } else {
            myDataBase.insertOne({
                username: req.body.username,
                password: bcrypt.hashSync(req.body.password, 12)
              },
              (err, doc) => {
                if (err) {
                  res.redirect('/');
                } else {
                  // The inserted document is held within
                  // the ops property of the doc
                  next(null, doc.ops[0]);
                }
              }
            )
          }
        })
      },
      passport.authenticate('local', { failureRedirect: '/' }),
      (req, res, next) => {
        res.redirect('/profile');
      }
    );

  app.route('/logout')
    .get((req, res) => {
      req.logout({}, () => {
        res.redirect('/');
      });
    });
}
