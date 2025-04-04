# 🪙 OurToken - ERC20 Token Project

![Solidity](https://img.shields.io/badge/Solidity-0.8.18-informational) 
![Foundry](https://img.shields.io/badge/Foundry-v0.2.0-success)
![License](https://img.shields.io/badge/License-MIT-blue)

A complete ERC20 token implementation with deployment scripts and comprehensive tests using Foundry.

## 📦 Project Structure

```
our-token/
├── script/
│   └── DeployOurToken.s.sol      # Deployment script
├── src/
│   └── OurToken.sol             # ERC20 Token implementation
├── test/
│   └── OurTokenTest.t.sol       # Test cases
└── README.md
```

## 🚀 Features

- Fully compliant ERC20 token
- Initial supply minting on deployment
- Comprehensive test coverage
- Foundry-based deployment scripts
- Includes allowance/approval functionality testing

## ⚙️ Setup

1. Install Foundry:
```bash
curl -L https://foundry.paradigm.xyz | bash
foundryup
```

2. Clone this repository:
```bash
git clone https://github.com/your-repo/our-token.git
cd our-token
```

3. Install dependencies:
```bash
forge install
```

## 🧪 Running Tests

```bash
forge test -vv  # Run all tests with verbose output
```

Test cases include:
- Basic token transfers
- Balance verification
- Allowance functionality
- Edge cases (over-spending allowances)

## 🛠️ Deployment

Deploy to Anvil (local testnet):
```bash
forge script script/DeployOurToken.s.sol --broadcast --rpc-url http://localhost:8545
```

Deploy to Ethereum mainnet (replace with your RPC):
```bash
forge script script/DeployOurToken.s.sol --broadcast --rpc-url $MAINNET_RPC_URL
```

## 📚 Technical Details

### OurToken.sol
- Inherits OpenZeppelin's ERC20 standard
- Mints initial supply to deployer
- Token name: "OurToken"
- Token symbol: "OT"

### Key Test Cases
1. `testBobBalance` - Verifies initial token distribution
2. `testAliceBalance` - Tests multiple account balances
3. `testAllowanceWorks` - Tests approval/transferFrom flow
4. `testAllowanceShouldNotWorksIfAmountExceededApprovedAmount` - Tests allowance limits

## 🤝 Contributing

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📜 License

Distributed under the MIT License. See `LICENSE` for more information.

## ✉️ Contact

Project Maintainer - Sai Krishna 

Project Link: [https://github.com/saikrishnacreat/foundry-erc20](https://github.com/saikrishnacreat/foundry-erc20)