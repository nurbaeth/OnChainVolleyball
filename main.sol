// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract VolleyballGame {
    address public player1;
    address public player2;
    uint256 public score1;
    uint256 public score2;
    address public turn;
    bool public gameActive;

    event GameStarted(address player1, address player2);
    event BallServed(address player);
    event BallReturned(address player, bool success);
    event PointScored(address player, uint256 newScore);
    event GameOver(address winner);

    modifier onlyPlayers() {
        require(msg.sender == player1 || msg.sender == player2, "Not a player");
        _;
    }
    
    modifier isTurn() {
        require(msg.sender == turn, "Not your turn");
        _;
    }

    function startGame(address _player2) external {
        require(player1 == address(0), "Game already started");
        player1 = msg.sender;
        player2 = _player2;
        turn = player1;
        gameActive = true;
        emit GameStarted(player1, player2);
    }

    function serveBall() external onlyPlayers isTurn {
        require(gameActive, "Game is over");
        emit BallServed(msg.sender);
    }

    function returnBall() external onlyPlayers isTurn {
        require(gameActive, "Game is over");
        bool success = (block.timestamp % 2 == 0);
        emit BallReturned(msg.sender, success);
        
        if (!success) {
            _scorePoint(msg.sender == player1 ? player2 : player1);
        } else {
            turn = (msg.sender == player1) ? player2 : player1;
        }
    }

    function _scorePoint(address scorer) internal {
        if (scorer == player1) {
            score1++;
            emit PointScored(player1, score1);
        } else {
            score2++;
            emit PointScored(player2, score2);
        }

        if (score1 >= 15) {
            gameActive = false;
            emit GameOver(player1);
        } else if (score2 >= 15) {
            gameActive = false;
            emit GameOver(player2);
        }
    }
}
