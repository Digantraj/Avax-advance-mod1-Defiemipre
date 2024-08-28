# Game Store on Avalanche Subnet

## Project Overview

This project consists of three smart contracts deployed on the Avalanche Subnet. The contracts are:

1. **GameStore**: A smart contract for managing in-game purchases and upgrades of gun skins using Gallium (GAL) and Ores (ORE) tokens.
2. **Gallium (GAL) Token**: An ERC20 token used for purchasing gun skins.
3. **Ores (ORE) Token**: An ERC20 token used for upgrading gun skins.

The project utilizes the Avalanche Subnet, with MetaMask configured for the connection to the Avalanche network. The subnet was deployed using the Avalanche CLI on an Ubuntu Linux environment.

## Setup Instructions

### 1. Install Dependencies

Ensure you have the following installed on your Ubuntu Linux system:

- [MetaMask](https://metamask.io/) - Browser extension for Ethereum and Avalanche network interaction
- [Avalanche-CLI](https://github.com/ava-labs/avalanche-cli) - Command-line tool for setting up and deploying to Avalanche Subnets

### 2. Configure Avalanche Subnet Using Avalanche CLI

To run the contracts on the Avalanche Subnet, follow these steps:

- Install the Avalanche-CLI by following the instructions from its [GitHub repository](https://github.com/ava-labs/avalanche-cli).

- Create and deploy your EVM Subnet using the Avalanche CLI:

  ```bash
  avalanche subnet create <YourSubnetName>
'''
# GameStore Contract

This repository contains the smart contracts for a game store on the Avalanche network. The GameStore contract allows users to purchase and upgrade gun skins using in-game tokens. It also includes functionality for the contract owner to withdraw tokens.

## Deployment Instructions

1. **Deploy Your Subnet**

   Use the following command to deploy your subnet:
   ```bash
   avalanche subnet deploy myblockchain


# Security and Permissions
# - Only the contract owner can set the price of gun skins and withdraw tokens from the contract.

# License
# This project is licensed under the MIT License.

