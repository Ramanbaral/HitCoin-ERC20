const {ethers} = require("hardhat");

const main = async () => {

    const hitcoinContract = await ethers.getContractFactory("HitCoin");
    const deployedHitcoinContract = await hitcoinContract.deploy();

    console.log("Contract Address: ", deployedHitcoinContract.address);
}

main()
.then(() => {
    process.exit(0);
})
.catch((err) => {
    console.log(err);
    process.exit(1);
})