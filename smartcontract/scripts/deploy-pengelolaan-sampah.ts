import { ethers } from "hardhat";

async function main() {
  const instance_pengelolaanSampah = await ethers.deployContract("PengelolaanSampah");
  await instance_pengelolaanSampah.waitForDeployment();
  const addressPengelolaanSampah = await instance_pengelolaanSampah.getAddress();
  console.log(`PengelolaanSampah: ${addressPengelolaanSampah}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
