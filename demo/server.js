// Server config
const express = require('express');
const app = express();
var server = require('http').Server(app);
const io = require('socket.io').listen(server);
const path = require('path');

app.use('/js',express.static(__dirname + '/src/app/game/js'));
app.use('/assets',express.static(__dirname + '/src/assets'));


// Serve only the static files form the dist directory
app.use(express.static(__dirname + '/dist/demo'));

app.get('/*', function(req,res) {
    
res.sendFile(path.join(__dirname + '/dist/demo/index.html'));
});


// Player config
const players = {};
io.on('connection', function (socket) {
    console.log('a player connected: ', socket.id);

    // create a new player and add it to our players object
    players[socket.id] = {
        flipX: false,
        x: Math.floor(50),
        y: Math.floor(100),
        playerId: socket.id
    };

    // send all current players
    socket.emit('CURRENT_PLAYERS', players);

    // update all other players of the new player
    socket.broadcast.emit('NEW_PLAYER', players[socket.id]);

    socket.on('PLAYER_CONNECTED', function () {
        socket.broadcast.emit('PLAYER_CONNECTED', players[socket.id]);
        console.log('A player connected!')
    });

    // update movements of player
    socket.on('PLAYER_MOVED', function (movementData) {
        players[socket.id].x = movementData.x;
        players[socket.id].y = movementData.y;

        socket.broadcast.emit('PLAYER_MOVED', players[socket.id]);
    });

    // when a player disconnects, remove them from our players object
    socket.on('disconnect', function () {
        console.log('user disconnected: ', socket.id);
        delete players[socket.id];

        // emit a message to all players to remove this player
        io.emit('PLAYER_DISCONNECT', socket.id);
    });
});

// Start the server
const port = 3000;
server.listen(port,function(){
    console.log('Listening on '+server.address().port);
});
