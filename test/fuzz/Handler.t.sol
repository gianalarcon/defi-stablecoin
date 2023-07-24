// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
// import {StdInvariant} from "forge-std/StdInvariant.sol";
// import {DeployDSC} from "../../script/DeployDSC.s.sol";
import {DSCEngine} from "../../src/DSCEngine.sol";
import {DecentralizedStableCoin} from "../../src/DecentralizedStableCoin.sol";
// import {HelperConfig} from "../../script/HelperConfig.s.sol";
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
// import {console} from "forge-std/console.sol";

contract Handler is Test {
    DSCEngine dsc_e;
    DecentralizedStableCoin dsc;

    ERC20 public weth;
    ERC20 public wbtc;

    // Ghost Variables
    uint96 public constant MAX_DEPOSIT_SIZE = type(uint96).max;

    constructor(DSCEngine _dsc_e, DecentralizedStableCoin _dsc) {
        dsc_e = _dsc_e;
        dsc = _dsc;
        address[] memory collateralTokens = dsc_e.getCollateralTokens();
        weth = ERC20(collateralTokens[0]);
        wbtc = ERC20(collateralTokens[1]);
    }

    function depositCollateral(uint256 collateralSeed, uint256 amountCollateral) public {
        amountCollateral = bound(amountCollateral, 1, MAX_DEPOSIT_SIZE);
        ERC20 collateral = _getCollateralFromSeed(collateralSeed);

        vm.startPrank(msg.sender);
        //collateral._mint(msg.sender, amountCollateral);
        collateral.approve(address(dsc_e), amountCollateral);
        dsc_e.depositCollateral(address(collateral), amountCollateral);
        vm.stopPrank();
    }
    /// Helper Functions

    function _getCollateralFromSeed(uint256 collateralSeed) private view returns (ERC20) {
        if (collateralSeed % 2 == 0) {
            return weth;
        } else {
            return wbtc;
        }
    }
}
