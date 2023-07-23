// // SPDX-License-Identifier: UNLICENSED
// pragma solidity ^0.8.18;

// import {Test} from "forge-std/Test.sol";
// import {StdInvariant} from "forge-std/StdInvariant.sol";
// import {DeployDSC} from "../../script/DeployDSC.s.sol";
// import {DSCEngine} from "../../src/DSCEngine.sol";
// import {DecentralizedStableCoin} from "../../src/DecentralizedStableCoin.sol";
// import {HelperConfig} from "../../script/HelperConfig.s.sol";
// import {IERC20} from "openzeppelin-contracts/contracts/interfaces/IERC20.sol";
// import {console} from "forge-std/console.sol";

// contract OpenInvariantsTest is Test {
//     DeployDSC deployer;
//     DSCEngine dsc_e;
//     DecentralizedStableCoin dsc;
//     HelperConfig config;
//     address weth;
//     address wbtc;

//     function setUp() public {
//         deployer = new DeployDSC();
//         (dsc, dsc_e, config) = deployer.run();
//         targetContract(address(dsc_e));
//         (,, weth, wbtc,) = config.activeNetworking();
//     }

//     function invariant_protocolMustHaveMoreValueThanTotalSupply() public view {
//         uint256 totalSupply = dsc.totalSupply();
//         uint256 totalWethDeposited = IERC20(weth).balanceOf(address(dsc_e));
//         uint256 totalBtcDeposited = IERC20(wbtc).balanceOf(address(dsc_e));

//         uint256 wethValue = dsc_e.getUsdValue(weth, totalWethDeposited);
//         uint256 wbtcValue = dsc_e.getUsdValue(wbtc, totalBtcDeposited);

//         console.log("wethValue: %s", wethValue);
//         console.log("wbtcValue: %s", wbtcValue);

//         assert(wethValue + wbtcValue >= totalSupply);
//     }
// }
