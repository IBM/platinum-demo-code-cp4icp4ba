const http = require("http");

const fs = require("fs").promises;

const host = 'localhost';
const port = 8000;

process.env["NODE_TLS_REJECT_UNAUTHORIZED"] = 0;

const requestListener = function(req, res){
    console.log("Path: "+req.url + " method: "+req.method);

    let body = '';
    req.on('data', (chunk) => {
      body += chunk;
    });

    req.on('end', () => {

        console.log('Request payload: '+body);

        fs.readFile("data.json")
        .then(contents => {
            res.setHeader("Content-Type", "application/json");
            res.writeHead(200);
            res.end(contents);
        });

    });

};

const server = http.createServer(requestListener);

server.listen(port, () => {
      console.log("Server is running on http://"+host+":"+port);
});


