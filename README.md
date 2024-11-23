# netboot.xyz-autoVM.sh

## Overview

`netboot.xyz-autoVM.sh` is a Bash script designed to automate the process of setting up a virtual machine (VM) using QEMU with the netboot.xyz image. The script handles downloading the netboot.xyz image, setting up the VM with user-defined RAM settings, and starting the VM. It also cleans the `/tmp` directory and minimizes the terminal window for a cleaner user experience.

## Prerequisites

- **Operating System:** Debian-based (e.g., Ubuntu).
- **Root or Sudo Access:** The script must be run with root privileges.
- **Internet Connection:** Required for downloading the netboot.xyz image.

## Usage

1. **Download & Execute**

   ```bash
   cd /tmp
   git clone https://github.com/GlitchLinux/NETBOOT.XYZ-Automatic-VM.git 
   cd NETBOOT.XYZ-Automatic-VM
   sudo bash netboot.xyz-autoVM.sh
   ```

2. **Follow the Prompts:**

   - You will be prompted to enter the amount of RAM (in MB) to allocate to the VM.

## Script Functionality

- **Root Check:** Ensures the script is executed with root privileges.
- **Clean `/tmp`:** Deletes all files and directories in `/tmp` except the script itself.
- **Install Packages:** Installs necessary packages including `qemu-system`, `wget`, `qemu-utils`, `qemu-system-gui`, and `xdotool`.
- **Download netboot.xyz Image:** Fetches the netboot.xyz image and saves it to `/tmp`.
- **User Input for RAM:** Prompts you to specify the amount of RAM for the VM.
- **Start VM:** Launches a VM using QEMU with the specified RAM and netboot.xyz image. The VM runs in the background with KVM acceleration and CPU optimization.
- **Minimize Terminal:** Uses `xdotool` to minimize the terminal window.

## Troubleshooting

- **Script Must be Run as Root:** Ensure you use `sudo` or are logged in as the root user.
- **Package Installation Issues:** Verify your package manager is functioning correctly and check your internet connection.
- **VM Not Starting:** Ensure that `qemu-system-x86_64` is installed and that your system supports KVM.

## License

This script is released under the MIT License. See [LICENSE](LICENSE) for more information.

## Contributing

Contributions are welcome! Fork the repository and submit pull requests with improvements or fixes. Please follow best practices and align your contributions with the project's objectives.

## Contact

For questions or issues, please contact:

- **Author:** [GlitchLinux](https://github.com/GlitchLinux)
- **Email:** [info@glitchlinux.wtf](mailto:info@glitchlinux.wtf)
- **Website:** [www.glitchlinux.com](http://www.glitchlinux.com)

---
