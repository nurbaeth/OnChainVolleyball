# OnChainVolleyball 🏐

OnChainVolleyball is a turn-based volleyball game built on Solidity, allowing two players to compete in a smart contract. The game simulates a rally where players take turns serving and returning the ball, with random outcomes determining points.

## Features ✨
- 🏐 **Two-player match**: Challenge another Ethereum address.
- 🎲 **Randomized rally outcomes**: Each return has a chance of failure.
- 🔥 **First to 15 points wins**: The game ends when a player reaches 15.
- 🔄 **Turn-based gameplay**: Players must alternate turns.

## How It Works ⚙️
1. **Start a game**: One player calls `startGame(address _player2)`.
2. **Serve the ball**: The starting player calls `serveBall()`.
3. **Return the ball**: The opponent calls `returnBall()`, with a 50% success rate.
4. **Score points**: If a return fails, the opponent gains a point.
5. **Win the game**: The first to 15 points is declared the winner.

## Smart Contract Methods 📝
### `startGame(address _player2)`
- Initiates a new game with two players.

### `serveBall()`
- The current player serves the ball to start a rally.

### `returnBall()`
- The opponent attempts to return the ball.
- If successful, the turn switches.
- If unsuccessful, the opponent scores a point.

## Deployment & Usage 🚀
1. Deploy the contract to an EVM-compatible blockchain.
2. Interact using a Web3 wallet (e.g., MetaMask, Remix, or Hardhat scripts).
3. Call contract functions to play the game.

## Future Improvements 🔮
- NFT-based player identities.
- Betting mechanics with locked stakes.
- Visualized gameplay via a frontend UI.

---
💡 **Built for on-chain gaming enthusiasts!**

