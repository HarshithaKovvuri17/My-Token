// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/*
 * @title MyToken (MTK) - Simple ERC-20 token for learning
 * @author -
 * @notice Minimal, standards-compatible ERC-20 implementation for educational purposes.
 * Features:
 *  - name, symbol, decimals
 *  - totalSupply minted to deployer
 *  - balanceOf, allowance public mappings (auto getters)
 *  - transfer, approve, transferFrom functions
 *  - Transfer and Approval events emitted after state changes
 *  - basic input validation (no zero-address transfers/approvals, sufficient balance/allowance)
 */

contract MyToken {
    // Token metadata
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply;

    // Balances for each account
    mapping(address => uint256) public balanceOf;

    // Allowances owner => (spender => amount)
    mapping(address => mapping(address => uint256)) public allowance;

    // Events as specified in ERC-20
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    /**
     * @dev Constructor that gives msg.sender all of existing tokens.
     * @param _name Token name (e.g., "MyToken")
     * @param _symbol Token symbol (e.g., "MTK")
     * @param _decimals Number of decimals (commonly 18)
     * @param _initialSupply Total supply in smallest units (e.g., 1_000_000 * 10**18)
     */
    constructor(
        string memory _name,
        string memory _symbol,
        uint8 _decimals,
        uint256 _initialSupply
    ) {
        require(bytes(_name).length > 0, "Name required");
        require(bytes(_symbol).length > 0, "Symbol required");
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        totalSupply = _initialSupply;

        // Assign the entire initial supply to the deployer
        balanceOf[msg.sender] = _initialSupply;

        // Emit Transfer event from zero address to indicate minting
        emit Transfer(address(0), msg.sender, _initialSupply);
    }

    /**
     * @notice Transfer `_value` tokens from caller to `_to`.
     * @param _to Recipient address
     * @param _value Amount to transfer (in smallest unit)
     * @return success true on success
     */
    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(_to != address(0), "Cannot transfer to zero address");
        require(balanceOf[msg.sender] >= _value, "Insufficient balance");

        // Update balances
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;

        // Emit event
        emit Transfer(msg.sender, _to, _value);

        return true;
    }

    /**
     * @notice Approve `_spender` to spend `_value` on caller's behalf.
     * @param _spender Spender address
     * @param _value Allowance amount
     * @return success true on success
     *
     * Note: This implementation sets the allowance directly. In production code,
     * it's common to guard against the ERC-20 race condition by requiring
     * allowance be set to 0 before updating, or use increase/decreaseAllowance helpers.
     */
    function approve(address _spender, uint256 _value) public returns (bool success) {
        require(_spender != address(0), "Cannot approve zero address");

        allowance[msg.sender][_spender] = _value;

        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    /**
     * @notice Transfer tokens from `_from` to `_to` using allowance.
     * @param _from Owner of the tokens
     * @param _to Recipient
     * @param _value Amount to transfer
     * @return success true on success
     */
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_to != address(0), "Cannot transfer to zero address");
        require(balanceOf[_from] >= _value, "Insufficient balance of owner");
        require(allowance[_from][msg.sender] >= _value, "Insufficient allowance");

        // Update balances
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;

        // Decrease allowance
        allowance[_from][msg.sender] -= _value;

        // Emit event
        emit Transfer(_from, _to, _value);

        return true;
    }

    // --- Optional helper read functions (not strictly required) ---


    function getTokenInfo()
        external
        view
        returns (
            string memory tokenName,
            string memory tokenSymbol,
            uint8 tokenDecimals,
            uint256 tokenTotalSupply
        )
    {
        return (name, symbol, decimals, totalSupply);
    }

    /**
     * @notice Returns total supply (duplicate of public variable for clarity).
     * @return supply total supply
     */
    function getTotalSupply() external view returns (uint256 supply) {
        return totalSupply;
    }
}
