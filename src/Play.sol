pragma solidity 0.8.9;

import './Pinball.sol';

contract play {
  Pinball pinball;
  bytes public ball;
  uint256 blockNum;

  constructor(Pinball _pinball) {
    pinball = _pinball;
    ball = makeBall();
  }


  function makeBall() internal returns (bytes memory) {
    ball.push(0x50);
    ball.push(0x43);
    ball.push(0x54);
    ball.push(0x46);
    while (ball.length < 512){
      ball.push(0x0);
    }
    return ball;
  }

  function insertMoney() public returns (bytes32) {
    bytes32 commit = keccak256(ball);
    pinball.insertCoins(commit);
    blockNum = block.number;
    return commit;
  }

  function play() public {
    pinball.play(ball, blockNum);
  }
}
