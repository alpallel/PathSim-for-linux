### DISCLAIMER: I have not tested this on other Linux distros except for Arch Linux.

# PathSim for Linux

PathSim is a graphical MIPS Processor Simulator. This package includes a universal Linux installer that automatically configures the application, handles JavaFX module paths, and creates a convenient desktop shortcut for your application launcher.

## Prerequisites

To run PathSim, you must have **Java** and **OpenJFX** installed on your system.

If you do not have Java installed, you can install it using your distribution's package manager:
* **Ubuntu/Mint/Debian:**
    ```
    sudo apt install default-jre openjfx
* **Fedora:**
    ```
    sudo dnf install java-latest-openjdk java-latest-openjdk-openjfx
* **Arch Linux:**
    ```
    sudo pacman -S jre-openjdk
    yay -S java-openjfx-bin
*(Note: The installer script will automatically check for Java and alert you if it is missing).*

## Installation Instructions

1. **Clone this repository** to a folder on your computer:
   ```
   git clone https://github.com/alpallel/PathSim-for-linux
3. **Navigate to that extracted folder:**
    ```
    cd PathSim-for-linux/
4. **Make the installer and uninstaller executable:**
   ```
   chmod +x install.sh
   chmod +x uninstall.sh
5. **Run the installer on your terminal:**
    ```
    ./install.sh
## How to Run
Once installed, you do not need to use the terminal anymore.

Simply open your desktop environment's Application Menu (Start Menu) or launcher, search for PathSim, and click it to launch the simulator.

## Uninstallation
1. **Navigate to the repository folder**:
    ```
    cd [REPOSITORY_FOLDER]
2. **Run the uninstall script**:
    ```
    ./uninstall.sh
Alternatively, you can manually delete the following two generated files/folders:

* ~/.local/share/PathSim/ (The application folder)

* ~/.local/share/applications/pathsim.desktop (The launcher shortcut)
