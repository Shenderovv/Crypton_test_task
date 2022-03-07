require("@nomiclabs/hardhat-waffle");
require('solidity-coverage');
import "solidity-coverage";

import "./tasks/accounts";
import "./tasks/deploy";

import { resolve } from "path";

import { config as dotenvConfig } from "dotenv";

dotenvConfig({ path: resolve(__dirname, "./.env") });

const { ALCHEMY_API, RINKEBY_PRIVATE_KEY } = process.env;

// This is a sample Hardhat task. To learn how to create your own go to
// https://hardhat.org/guides/create-task.html
module.exports = {
  solidity: "0.8.0",
  networks: {
    rinkeby: {
      url: `https://eth-ropsten.alchemyapi.io/v2/${ALCHEMY_API}`,
      accounts: [`${RINKEBY_PRIVATE_KEY}`]
    }
  }
} 
