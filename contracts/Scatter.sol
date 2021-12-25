//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/token/ERC1155/IERC1155.sol";

contract Scatter {
    function sendErc20(
        IERC20 token,
        address[] calldata recipient,
        uint256[] calldata amount
    ) external {
        uint256 total = 0;
        for (uint256 i = 0; i < amount.length; i++) {
            total += amount[i];
        }
        require(
            token.transferFrom(msg.sender, address(this), total),
            "Could not transfer to contract"
        );
        for (uint256 i = 0; i < recipient.length; i++) {
            require(
                token.transfer(recipient[i], amount[i]),
                "Could not send to recipient"
            );
        }
    }

    function sendErc721(
        IERC721 token,
        address[] calldata recipient,
        uint256[] calldata tokenId
    ) external {
        for (uint256 i = 0; i < recipient.length; i++) {
            token.safeTransferFrom(msg.sender, recipient[i], tokenId[i]);
        }
    }

    struct Erc1155Transfer {
        uint256[] ids;
        uint256[] amounts;
    }

    function sendErc1155(
        IERC1155 token,
        address[] calldata recipient,
        Erc1155Transfer[] calldata parameters
    ) external {
        for (uint256 i = 0; i < recipient.length; i++) {
            token.safeBatchTransferFrom(
                msg.sender,
                recipient[i],
                parameters[i].ids,
                parameters[i].amounts,
                ""
            );
        }
    }
}
