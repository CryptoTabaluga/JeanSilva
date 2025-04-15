// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.20;

import "contracts/2_Owner.sol";

contract Voting is Owner {
    // uint256 counterCandidates;
    // uint256 counterVoters;

    // mapping(uint256 => address) listCandidates;
    // mapping(uint256 => address) listVoters;

    // candidate
    mapping(address => bool) public candidates;

    // mapping(uint256 => address)
    // candidate => voter => true/false
    mapping(address => mapping(address => bool)) public votes;

    mapping(address => bool) private voterVoted;

    modifier isCandidate(address _candidate) {       
        require(candidates[_candidate] == true, "Is not a registered candidate");
        _;
    }
     
     function addCandidate(address _newCandidate) external isOwner() {
        candidates[_newCandidate] = true;

     }

     function voteCandidate(address _candidate, bool _vote) external isCandidate(_candidate) {
        require (voterVoted[_candidate] == false, "Voter voted already");
        voterVoted[_candidate] = true;
        votes[_candidate][msg.sender] = _vote;        
     }

    // function getWinner()

}

// Code Challenge

//  Task: Develop a Simple Voting Smart Contract

//You are required to create a simple voting smart contract in Solidity that allows users to propose candidates and vote for them. 
//The contract should include the following functionalities:

//### T1.  Add Candidate: A function to add a candidate to the election.
//### T2.  Vote: A function to allow users to vote for a candidate.
//### T3.  Get Winner: A function to determine the candidate with the most votes.
//### T4.  Security: Ensure that a user can only vote once and that only registered candidates can receive votes.

//### Requirements:

//### T*   Use Solidity for the implementation.
//### T*   Ensure the contract is secure and follows best practices.
//### T*   Include comments in your code to explain your logic.
