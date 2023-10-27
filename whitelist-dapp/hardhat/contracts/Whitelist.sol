// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Whitelist {

    // Max number of whitelisted addresses allowed
    uint8 public maxWhitelistedAddresses;

    // Create a mapping of whitelistedAddresses
    // if an address is whiteliste, we would set it to true, it is false by default for all other addresses
    mapping(address => bool) public whitelistedAddresses;

    // numAddressesWhitelisted would be used to keep track of how many have been whitelisted
    uint8 public numAddressesWhitelisted;

    // Setting the max number of whitelisted addresses
    // User will put the value at the time of deployment
    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    /** 
     * addAddressToWhitelist- This function adds the address of the sender to the whitelist
    */
   function addAddressToWhitelist() public {
    //check if the user has already been whitelisted
    require(!whitelistedAddresses[msg.sender],"Sender has already been whitelisted");

    //check if the numAddressesWhitelisted < maxWhitelistedAddresses, if not then throw an error
    require(numAddressesWhitelisted < maxWhitelistedAddresses, "More addresses cannot be added, limit reached");
    
    // Add the addresses which called the function to the whitelistedAddress array
    whitelistedAddresses[msg.sender] = true;

    // Increase the number of whitelisted addresses
    numAddressesWhitelisted += 1;
   }
     
}


// Whitelist Contract Address: 0xF41029475450B033ed23892CFCC9E8eC9C0a5BDf

// https://sepolia.etherscan.io/address/0xF41029475450B033ed23892CFCC9E8eC9C0a5BDf#code