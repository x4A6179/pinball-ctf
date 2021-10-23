pragma solidity 0.8.9;

import './Pinball.sol';

contract play {
  Pinball pinball;
  bytes ball;

  constructor(Pinball _pinball) public {
    pinball = _pinball;
  }


  function makeBall() internal returns (bytes) {
    ball.push(0x50);
    ball.push(0x43);
    ball.push(0x54);
    ball.push(0x46);
    while (ball.length < 512){
      ball.push(0x0)
    }
    return ball;
  }

  function insertMoney() {
    bytes32 commit = keccak256(makeBall());
    pinball.insertCoins(commit);
  }
}
