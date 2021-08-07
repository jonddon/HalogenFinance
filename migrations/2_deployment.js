const NativeToken = artifacts.require("NativeToken");
const StableToken = artifacts.require("StableToken");
const Dao = artifacts.require("Dao");
const Project = artifacts.require("Project");
const TimeLockedWalletFactory = artifacts.require("TimeLockedWalletFactory");

module.exports = function (deployer) {
    deployer.deploy(StableToken);
    deployer.deploy(NativeToken);
    deployer.deploy(Dao);
    deployer.deploy(Project);
    deployer.deploy(TimeLockedWalletFactory);
    
};
