var express = require("express");
var app = express();

app.get("/", function (req, res) {
  res.send("Simple Web Application");
});

app.get("/test", function (req, res) {
  var currentTime = new Date().toLocaleString();
  console.log(
    "[" + currentTime + "] Received a request for the test endpoint."
  );
  res.send("Test endpoint");
});

app.get("/health", function (req, res) {
  var currentTime = new Date().toLocaleString();
  console.log(
    "[" + currentTime + "] Received a request for the health endpoint."
  );
  res.send("Application is healthy");
});

app.listen(8081, function () {
  console.log("Web Application running on port 8081!");
  console.log("Listening for incoming requests...");
});
