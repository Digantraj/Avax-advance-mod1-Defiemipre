// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract GameStore {
    IERC20 public galliumToken;  // Gallium token for purchasing skins
    IERC20 public oresToken;     // Ores token for upgrading skins

    address public owner;

    enum GunSkinLevel { Level1, Level2, Level3 } // Gun skin levels

    struct GunSkin {
        uint256 priceInGallium;    
        GunSkinLevel level;         
        bool owned;                
    }

    mapping(address => mapping(uint256 => GunSkin)) public playerGunSkins;

    // Cost of upgrading gun skins to different levels
    uint256 public constant upgradeToLevel2Cost = 10 ; 
    uint256 public constant upgradeToLevel3Cost = 20 ; 

    mapping(uint256 => uint256) public gunSkinPrices;

    event GunSkinPurchased(address indexed player, uint256 gunSkinId);
    event GunSkinUpgraded(address indexed player, uint256 gunSkinId, GunSkinLevel newLevel);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");
        _;
    }

    constructor(address _galliumToken, address _oresToken) {
        galliumToken = IERC20(_galliumToken);
        oresToken = IERC20(_oresToken);
        owner = msg.sender;
    }

    function setGunSkinPrice(uint256 _gunSkinId, uint256 _priceInGallium) external onlyOwner {
        gunSkinPrices[_gunSkinId] = _priceInGallium;
    }

    // Function to purchase gun skin using Gallium token
    function purchaseGunSkin(uint256 _gunSkinId) external {
        uint256 price = gunSkinPrices[_gunSkinId];
        require(price > 0, "Gun skin not available for purchase");
        require(!playerGunSkins[msg.sender][_gunSkinId].owned, "Gun skin already owned");

        require(galliumToken.transferFrom(msg.sender, address(this), price), "Gallium transfer failed");

        playerGunSkins[msg.sender][_gunSkinId] = GunSkin(price, GunSkinLevel.Level1, true);

        emit GunSkinPurchased(msg.sender, _gunSkinId);
    }

    function upgradeGunSkin(uint256 _gunSkinId) external {
        GunSkin storage skin = playerGunSkins[msg.sender][_gunSkinId];
        require(skin.owned, "Gun skin not owned");
        require(skin.level != GunSkinLevel.Level3, "Gun skin already at max level");

        uint256 upgradeCost;
        if (skin.level == GunSkinLevel.Level1) {
            upgradeCost = upgradeToLevel2Cost;
            skin.level = GunSkinLevel.Level2;
        } else if (skin.level == GunSkinLevel.Level2) {
            upgradeCost = upgradeToLevel3Cost;
            skin.level = GunSkinLevel.Level3;
        }

        require(oresToken.transferFrom(msg.sender, address(this), upgradeCost), "Ores transfer failed");

        emit GunSkinUpgraded(msg.sender, _gunSkinId, skin.level);
    }

    function withdrawTokens(address _token, uint256 _amount) external onlyOwner {
        IERC20(_token).transfer(owner, _amount);
    }
}
