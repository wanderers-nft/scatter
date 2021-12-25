import * as dotenv from "dotenv";

import { HardhatUserConfig, task } from "hardhat/config";
import "@nomiclabs/hardhat-etherscan";
import "@nomiclabs/hardhat-waffle";
import "@typechain/hardhat";
import "hardhat-gas-reporter";
import "solidity-coverage";

dotenv.config();

// This is a sample Hardhat task. To learn how to create your own go to
// https://hardhat.org/guides/create-task.html
task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
});

// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

const config: HardhatUserConfig = {
  solidity: {
    version: "0.8.6",
    settings: {
      optimizer: {
        enabled: true,
        runs: 1000
      }
    }
  },

  networks: {
    polygon: {
      url: "https://polygon-rpc.com/",
      accounts: {
        // 0xF8256AD6ADdB0E7a956cf61D14e5D53c78e65621
        mnemonic: process.env.MNEMONIC !== undefined ? process.env.MNEMONIC : ""
      }
    }
  },

  etherscan: {
    apiKey: process.env.POLYGONSCAN !== undefined ? process.env.POLYGONSCAN : ""
  }
};

export default config;
