const http = require("http");

const server = http.createServer((req, res) => {
  if (req.url === "/health") {
    res.writeHead(200, { "Content-Type": "text/plain" });
    res.end("OK");
    return;
  }

  res.writeHead(200, { "Content-Type": "text/plain" });
  res.end("Hello from Microservice");
});

// ✅ MUST listen on port 80 and 0.0.0.0
server.listen(80, "0.0.0.0", () => {
  console.log("Server running on port 80");
});
