# Scatter
An ERC-20/ERC-721/ERC-1155 multi-send contract that's totally free. Use at your own risk, etc etc.

## Deployments:
| Network | Address |
| --- | --- |
| Polygon | [0x57589eD72CD7B05140eA14e72795ebf799EaB6eb](https://polygonscan.com/address/0x57589ed72cd7b05140ea14e72795ebf799eab6eb) |

Want the contract deployed to another network? Open a PR!

## Usage
All function calls require the appropriate approval for the Scatter contract.
- `sendErc20(IERC20 token, address[] recipient, uint256[] amount)`: for each `recipient[i]`, send `amount[i]` of `token`.

- `sendErc721(IERC721 token, address[] recipient, uint256[] tokenId)`: for each `recipient[i]`, send `tokenId[i]` from `token`.

- `sendErc1155(IERC1155 token, address[] recipient, Erc1155Transfer[] parameters)`.
```
struct Erc1155Transfer {
    uint256[] ids;
    uint256[] amounts;
}
```
For each `recipient[i]`, send `parameters[i]` from `token`, which can contain a set of token IDs and amounts for each recipient. This uses the ERC-1155 batch-send function.
