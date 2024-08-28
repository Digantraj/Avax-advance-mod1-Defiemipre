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

  ```
  avalanche subnet create <YourSubnetName>
  ```

### 3. **Deploy Your Subnet**

   Use the following command to deploy your subnet:
   ```
   avalanche subnet deploy myblockchain
```
During the deployment process, the CLI will provide details to add a custom network to MetaMask.

## 3. Configure MetaMask

Open MetaMask and connect to your custom Avalanche Subnet:
- Click on the network dropdown and select "Add Network".
- Input your Subnet's RPC URL, Chain ID, and other details provided by Avalanche CLI.
- Save and switch to your Subnet.

## 4. Deploy Smart Contracts

Compile the smart contracts using Remix IDE or any Solidity development environment of your choice. Use MetaMask, connected to your custom Avalanche Subnet, to deploy the contracts directly from Remix IDE.

## 5. Interact with the Contracts

Use the deployed contract addresses to interact with them through the Avalanche network. You can use Remix IDE with MetaMask connected to your Subnet to interact with the contracts directly.

## How to Use the GameStore Contract

### Purchase Gun Skin

- Call `purchaseGunSkin(uint256 _gunSkinId)` with the ID of the gun skin you want to purchase.
- Ensure you have enough Gallium (GAL) tokens in your wallet.

### Upgrade Gun Skin

- Call `upgradeGunSkin(uint256 _gunSkinId)` with the ID of the gun skin you want to upgrade.
- Ensure you have enough Ores (ORE) tokens in your wallet.

### Withdraw Tokens (Owner Only)

- Call `withdrawTokens(address _token, uint256 _amount)` to withdraw a specific amount of tokens to the owner's address.

## Events

The `GameStore` contract emits the following events:

- `GunSkinPurchased(address indexed player, uint256 gunSkinId)`: Emitted when a player purchases a gun skin.
- `GunSkinUpgraded(address indexed player, uint256 gunSkinId, GunSkinLevel newLevel)`: Emitted when a player upgrades their gun skin.

## Security and Permissions

- Only the contract owner can set the price of gun skins and withdraw tokens from the contract.

## Authors

- **Digant Raj**  
  GitHub: [@Digant](https://github.com/Digantraj)

## License

This project is licensed under the MIT License.
 
