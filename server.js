const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.send('Hello from Dockerized Node.js App! done by ahmadkhan and now check through cicd pipeline  ');
});

app.listen(port, () => {
  console.log(`App running on http://localhost:${port}`);
});
