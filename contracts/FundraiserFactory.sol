// SPDX-License-Identifier: UNLICENSED
pragma solidity >0.4.23 <0.9.0;

import "./Fundraiser.sol";

contract FundraiserFactory {
    Fundraiser[] private _fundraisers;

    event FundraiserCreated(Fundraiser indexed fundraiser, address indexed owner);

    function createFundraiser(
        string memory name,
        string memory url,
        string memory imageURL,
        string memory description,
        address payable beneficiary
    )
        public
    {
        Fundraiser fundraiser = new Fundraiser(
            name,
            url,
            imageURL,
            description,
            beneficiary,
            msg.sender
        );
        _fundraisers.push(fundraiser);
        emit FundraiserCreated(fundraiser, fundraiser.owner());
    }

    function fundraisersCount() public view returns(uint256) {
        return _fundraisers.length;
    }
}
