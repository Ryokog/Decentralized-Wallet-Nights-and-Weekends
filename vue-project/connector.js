const { ethers } = require("ethers");
ethereum.request({ method: 'eth_requestAccounts' });

// what MetaMask injects as window.ethereum into each page
const provider = new ethers.providers.Web3Provider(window.ethereum)

// MetaMask requires requesting permission to connect users accounts
await provider.send("eth_requestAccounts", []);

// The MetaMask plugin also allows signing transactions to
// send ether and pay to change state within the blockchain.
// For this, you need the account signer...
const signer = provider.getSigner()

if (window.ethereum) {
    // MetaMask is installed and enabled
  } else {
    // MetaMask is not installed or not enabled
  }
  