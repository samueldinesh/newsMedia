var News=artifacts.require("./News.sol");

module.exports =function(deployer,network,accounts){

	deployer.deploy(News);
}