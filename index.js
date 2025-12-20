const http = require("http");
http.createServer((req, res) => {
  res.writeHead(200);
  res.end("Hello from Microservice");
}).listen(3000);


