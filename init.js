import { Web3Auth } from "@web3auth/modal";

//Initialize within your constructor
const web3auth = new Web3Auth({
  clientId: "BNMKPmWyN6vTi9Q1o9bUo-WNd45VN9fvK2zuTLb1ey0bbeO_LSNgLk2eGx8zfSV3IysRDkCDQxmNjpx-heFlzPU", // Get your Client ID from Web3Auth Dashboard
  chainConfig: {
    chainNamespace: "eip155",
    chainId: "0x1",
  },
});

await web3auth.initModal();