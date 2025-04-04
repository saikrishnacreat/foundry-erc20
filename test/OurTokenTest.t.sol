//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {DeployOurToken} from "../script/DeployOurToken.s.sol";
import {OurToken} from "../src/OurToken.sol";

contract OurTokenTest is Test {
    OurToken public ourToken;
    DeployOurToken public deployer;
    uint256 public constant INTIAL_BALANCE = 100 ether;

    address bob = makeAddr("bob");
    address alice = makeAddr("alice");

    function setUp() public {
        deployer = new DeployOurToken();
        ourToken = deployer.run(); // returns the instance of OurToken

        vm.prank(address(msg.sender));
        ourToken.transfer(bob, INTIAL_BALANCE);
        vm.prank(address(msg.sender));
        ourToken.transfer(alice, INTIAL_BALANCE);
    }

    function testBobBalance() public view {
        assertEq(INTIAL_BALANCE, ourToken.balanceOf(bob));
    }

    function testAliceBalance() public view {
        assertEq(INTIAL_BALANCE, ourToken.balanceOf(alice));
    }

    function testAllowanceWorks() public {
        uint256 initialAllowance = 1000; // This is like credit

        vm.prank(bob); // bob is allowing alice to use some amount on behalf of bob
        ourToken.approve(alice, initialAllowance);

        uint256 transferAmount = 500;

        vm.prank(alice); // alice has used some amount that bob has given
        ourToken.transferFrom(bob, alice, transferAmount);

        assertEq(ourToken.balanceOf(alice), transferAmount + INTIAL_BALANCE);
        assertEq(ourToken.balanceOf(bob), INTIAL_BALANCE - transferAmount);
    }

    function testAllowanceShouldNotWorksIfAmountExceededApprovedAmount()
        public
    {
        // Reverts if user try to transfer more than allowed
        uint256 approvedAllowance = 1000;
        vm.prank(bob);
        ourToken.approve(alice, approvedAllowance);

        vm.prank(alice);
        vm.expectRevert();
        ourToken.transferFrom(bob, alice, 2000);
    }
}
