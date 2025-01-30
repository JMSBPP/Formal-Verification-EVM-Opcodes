// SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.0;

contract practice {
    //How does the EVM encode and decode an array of bytes?
    //Consider the following example:
    //ordered inputs: (address,uint256,uint256)
    //encoding: [20bytes, 32bytes, 32bytes]
    //total length: 84 bytes
    function receiveData(
        address k1,
        uint256 k2,
        uint256 value
    ) public pure returns (bytes memory) {
        return abi.encode(k1, k2, value);
    }

    //1. Retreive the 32 byte of k2
    //1.1 0x0000address00000k2000000k1
    //1.2 we need to take off the last 32 bytes
    //1.2 take off the first 32 bytes
    function retreiveK2(bytes calldata data) public pure returns (bytes32) {
        return bytes32(data[32:64]);
    }

    function dataPlusSelector(
        address k1,
        uint256 k2,
        uint256 value
    ) public pure returns (bytes memory data) {
        data = abi.encodeWithSelector(
            bytes4(keccak256("_ownedTokens(address,uint256,uint256)")),
            k1,
            k2,
            value
        );
    }
}
