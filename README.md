<p align="center">
<img src="https://raw.githubusercontent.com/prince4you/sherlock/main/sherlock.png" width="800">
</p>
## 🌟 Overview

**Sherlock ** is a sophisticated bash-based installation and management system designed specifically for Termux environments. It automates the deployment of the renowned [Sherlock Project](https://github.com/sherlock-project/sherlock) - a powerful OSINT tool capable of hunting down social media accounts by username across 400+ social networks.

Created by **Sunil (Prince4you)** from **Noob Cyber Tech**, this framework eliminates the complexity of manual installation while providing a robust management interface for maintaining your Sherlock instance.

---

## ✨ Features

| Feature | Description |
|---------|-------------|
| 🚀 **One-Command Install** | Complete automated setup with dependency resolution |
| 🔄 **Smart Update System** | Seamless updates via pip or git repository |
| 🛠️ **Repair Functionality** | Force-reinstall corrupted installations |
| 🗑️ **Clean Uninstall** | Complete removal with optional dependency cleanup |
| 📊 **Storage Analysis** | Pre-installation disk space verification |
| 🌐 **Connectivity Check** | Automatic internet connection validation |
| ⏱️ **Execution Timer** | Performance metrics for all operations |
| 🎨 **Visual Feedback** | Color-coded status messages with timestamps |

---

## 📋 Prerequisites

- **Android Device** with Termux installed
- **Android 7.0+** (API level 24)
- **500MB+** free storage space
- **Stable internet connection**
- **Storage permission** granted to Termux

---

## 🚀 Quick Start

### Automatic Installation (Recommended)
```bash
curl -sL https://raw.githubusercontent.com/prince4you/sherlock/main/Sherlock-Installer.sh | bash
```

Manual Installation

```bash
# Clone the repository
git clone https://github.com/prince4you/sherlock.git

# Navigate to directory
cd sherlock

# Make executable
chmod +x Sherlock-Installer.sh

# Run installer
bash Sherlock-Installer.sh
```

---

🖥️ Usage

Main Installation

```bash
bash Sherlock-Installer.sh
# or
bash Sherlock-Installer.sh install
```

Command Options

Command	Action	
`bash Sherlock-Installer.sh --install`	Install Sherlock (default)	
`bash Sherlock-Installer.sh --update`	Update to latest version	
`bash Sherlock-Installer.sh --remove`	Complete uninstallation	
`bash Sherlock-Installer.sh --repair`	Repair broken installation	
`bash Sherlock-Installer.sh --version`	Check installed version	
`bash Sherlock-Installer.sh --help`	Display help menu	

Using Sherlock
Once installed, use the original Sherlock commands:

```bash
# Search single username
sherlock username123

# Search multiple usernames
sherlock user1 user2 user3

# Output to file
sherlock username --output results.txt

# Search specific sites only
sherlock username --site instagram twitter github

# Show all options
sherlock --help
```

🏗️ Architecture

```
Sherlock-Installer.sh
├── Environment Validation
│   ├── Termux Detection
│   ├── Internet Connectivity
│   └── Storage Analysis
├── Dependency Management
│   ├── System Packages (python, git, build-essential)
│   └── Python Modules (numpy, pandas, sherlock-project)
├── Installation Engine
│   ├── Primary: pip install sherlock-project
│   └── Fallback: git clone + requirements.txt
└── Management Interface
    ├── Update Mechanism
    ├── Repair Function
    └── Clean Removal
```

---

🔧 Technical Specifications

- Shell: Bash 4.0+
- Python: 3.8+
- Supported Platforms: Termux (Android)
- Network: Requires HTTPS outbound
- Storage: 150MB for full installation

---

🛡️ Security & Ethics

> ⚠️ IMPORTANT NOTICE

This tool is intended for legal security research and personal account recovery only. Users are responsible for complying with local laws and platform Terms of Service. The developers assume no liability for misuse.

- ✅ Legal: Investigating your own accounts
- ✅ Legal: Security research with permission
- ❌ Illegal: Stalking, harassment, or unauthorized surveillance
- ❌ Illegal: Social engineering or identity theft

---

🤝 Contributing

Contributions are welcome! Please follow these guidelines:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

📝 Changelog

v1.0 (Current)
- Initial release
- Automated installation system
- Update/repair/remove functionality
- Storage and connectivity checks
- Visual status feedback system

---

👨‍💻 Credits

Creator: Sunil [Prince4you]

Organization: Noob Cyber Tech

GitHub: [@Prince4you](https://github.com/prince4you)

Acknowledgments
- [Sherlock Project](https://github.com/sherlock-project/sherlock) - Original OSINT tool by Siddharth Dushantha
- [Termux](https://termux.dev/) - Android terminal emulator
- Open source community for testing and feedback

---

📜 License

This project is licensed under the MIT License - see the [LICENSE](https://github.com/prince4you/sherlock/blob/main/LICENSE) file for details.

```
MIT License

Copyright (c) 2024 Sunil (Prince4you)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
```

---

📞 Support

- 🐛 Issues: [GitHub Issues](https://github.com/prince4you/sherlock/issues)
- 💬 Discussions: [GitHub Discussions](https://github.com/prince4you/sherlock/discussions)
- 📺 YouTube: Noob Cyber Tech
