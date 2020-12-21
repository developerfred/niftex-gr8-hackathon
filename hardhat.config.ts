// We load the plugin here.
import { HardhatUserConfig } from "hardhat/types";
import "@nomiclabs/hardhat-waffl";
import "hardhat-gas-reporter";
import "@nomiclabs/hardhat-ethers";

import "../../src/index";

const config: HardhatUserConfig = {
  gasReporter: {
    currency: 'CHF',
    gasPrice: 21
  },
  solidity: "0.5.8",
};

export default config;
