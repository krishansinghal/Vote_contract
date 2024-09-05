// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0;

contract Ballot {

    struct Voter {
        uint vote;
        bool voted;
        uint weight;
    }

    struct Proposal{
        bytes32 name;
        uint voteCount;
    }
    
    ///storing values of proposal struct
    Proposal[] public proposals;
    //mapping for voter
    mapping(address => Voter) public voters;

    address public chairperson;

    constructor(bytes32[] memory proposalNames) {
        chairperson=msg.sender;

        //add 1 to chairperson weight
        voters[chairperson].weight =1;

        for (uint i; i < proposalNames.length; i++) 
        {
            proposals.push(Proposal({
                name: proposalNames[i],
                voteCount:0
            }));
        }
    }

    //function athenticate voter

    function giveRightToVote(address voter) public {
        require(msg.sender == chairperson, 'Only the chairperson can give access to vote');
        require(!voters[voter].voted, 'the voter has already voted');
        require(voters[voter].weight == 0);

        voters[voter].weight =1;
    }

    //function for voting
    function vote(uint proposal) public {
        Voter storage sender = voters[msg.sender];
        require(sender.weight !=0, 'Has no rightto vote');
        require(!sender.voted, 'Already voted');
        sender.voted = true;
        sender.vote = proposal;

        proposals[proposal].voteCount += sender.weight;
    }

    //function for showing the results 

    //function that shows the  winning proposal by integer
    function winningProposal() public view returns (uint winningProposal_) {
        uint winningVoteCount =0;
        for (uint i; i < proposals.length; i++){
            if (proposals[i].voteCount > winningVoteCount) {
                winningVoteCount = proposals[i].voteCount;
                winningProposal_ = i;
            }
        } 

    }

    // function that shows the winner by name
    function winningName() public view returns(bytes32 winningName_) {
        winningName_ = proposals[winningProposal()].name;
    }
}


