// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {DeployDSC} from "../../script/DeployDSC.s.sol";
import {DecentralizedStableCoin} from "../../src/DecentralizedStableCoin.sol";
import {DSCEngine} from "../../src/DSCEngine.sol";
import {HelperConfig} from "../../script/HelperConfig.s.sol";

contract DSCEngineTest is Test {
    DeployDSC deployer;
    DecentralizedStableCoin dsc;
    DSCEngine dsc_e;
    HelperConfig config;
    address ethUsdPriceFeed;
    address weth;

    function setUp() public {
        deployer = new DeployDSC();
        (dsc, dsc_e, config) = deployer.run();
        (ethUsdPriceFeed,, weth,,) = config.activeNetworking();
    }

    // Contructor Tests

    // Price Tests
    function testGetUsdValue() public {
        uint256 ethAmount = 15e18;
        uint256 expectedUsd = 283383e17;
        uint256 actualUsd = dsc_e.getUsdValue(weth, ethAmount);
        assertEq(actualUsd, expectedUsd);
    }
}
