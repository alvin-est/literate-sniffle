const express = require('express');
const routes = require('./routes');
// import sequelize connection
const sequelize = require('./config/connection');

const app = express();
const PORT = process.env.PORT || 3001;

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use(routes);

// sync sequelize models to the database 
(async ()  => {
  try {
    await sequelize.sync({ force: false }); // Set force to false in production
  }
  catch (err) {
    console.error('Error syncing DB:', err);
    process.exit(1); // Exit process on sync failure
  }
})();

// then turn on the server
app.listen(PORT, () => {
  console.log(`App listening on port ${PORT}!`);
});
