# Wallet_api

This contract is used to vote for the any registered participants. Contract is written in the Solidity language. The createBytes and parseBytes files are written in `JavaScript` language.

## SETUP

1. Clone the repository:

   ```bash
   git clone https://github.com/krishansinghal/Vote_contract
   ```

2. Navigate to the project directory:

   ```bash
   cd Vote_contract
   ```

3. Install the dependencies:

   ```bash
   npm install
   ```

5. Contract Deployment: on remix IDE
Follow the steps to deploy the contract: 
- open your `remix ide` and create a new file `ballot-vote.sol` and paste the contract code in it.

6. Compile and Deploy:
- compile the contract  and deploy using the remix account.

### Funtionality

1. Registering participant:
-After succesfull deployment of contract chairman can register the partipants.

2. Able/unable for Vote:
-Chairman can decide who can vote for participants.

3. Voting Process: 
- The registered voter can vote for partipant using their registered account.

#### Encoding and Decoding Results
- The result of voting will get in bytes. Use the following process for encoding and decoding:

- `Encoding`: open the terminal in copied repository and run:
   ```bash
   npm run createBytes.js
   ```
   after that provide the `bytes data`. it will return the string format of provided data.


- `Decoding`: open the terminal in copied repository and run:
   ```bash
   npm run parseBytes.js
   ```
   after that provide the `String data`. it will return the bytes format of provided data.   



