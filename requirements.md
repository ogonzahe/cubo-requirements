
---

## Guide 1: Installing Requirements to Run a React Project on Windows

### Step 1: Install Node.js

1. **Download Node.js**:
   - Go to the [Node.js official website](https://nodejs.org/).
   - Click on the **LTS** version to download the installer.

2. **Run the Installer**:
   - Open the downloaded `.msi` file.
   - Click **Next** on the welcome screen.

3. **Accept the License Agreement**:
   - Read the license agreement, select **I accept the terms in the License Agreement**, then click **Next**.

4. **Select Destination Folder**:
   - Choose the destination folder or leave it as the default, then click **Next**.

5. **Select Components**:
   - Leave the default components selected and click **Next**.

6. **Install Tools for Native Modules**:
   - It’s recommended to install tools for native modules. If you want, check this option and proceed.

7. **Finish Installation**:
   - Click **Install** and wait for the installation to complete. Once done, click **Finish**.

### Step 2: Verify Node.js and npm Installation

1. **Open Command Prompt**:
   - Press `Windows + R`, type `cmd`, and hit **Enter**.

2. **Check Node.js Version**:
   - Type the following command and press **Enter**:
     ```bash
     node -v
     ```

3. **Check npm Version**:
   - Type the following command and press **Enter**:
     ```bash
     npm -v
     ```

### Step 3: Install Create React App

1. **Install Create React App Globally**:
   - In the Command Prompt, type the following command and press **Enter**:
     ```bash
     npm install -g create-react-app
     ```

### Step 4: Create a New React Project

1. **Create a New Project**:
   - In the Command Prompt, navigate to the directory where you want to create your project.
   - Use the following command to create a new React app:
     ```bash
     npx create-react-app my-app
     ```

2. **Navigate to Your Project**:
   - Once the setup is complete, navigate to your new project folder:
     ```bash
     cd my-app
     ```

### Step 5: Run Your React Project

1. **Start the Development Server**:
   - In your project directory, run:
     ```bash
     npm start
     ```

2. **Open in Browser**:
   - Your default web browser should open automatically and display your new React app at `http://localhost:3000/`.

---

## Guide 2: Installing Git on Windows

### Step 1: Download Git

1. **Go to the Git Website**:
   - Open your browser and navigate to the [Git official website](https://git-scm.com/).

2. **Download Git for Windows**:
   - Click the **Download for Windows** button.

### Step 2: Install Git

1. **Run the Installer**:
   - Open the downloaded `.exe` file to start the installer.

2. **Welcome Screen**:
   - Click **Next** on the setup screen.

3. **Select Destination Location**:
   - Choose the destination folder where Git will be installed or leave it as the default, then click **Next**.

4. **Select Components**:
   - You can leave all the default options checked and click **Next**.

5. **Select the Default Editor**:
   - Choose your preferred text editor.

6. **Adjust Your PATH Environment**:
   - Choose the recommended option: **Git from the command line and also from 3rd-party software**, then click **Next**.

7. **Choose HTTPS Transport Backend**:
   - Use the default option: **Use the OpenSSL library**, and click **Next**.

8. **Configuring the Line Ending Conversions**:
   - Choose the recommended option: **Checkout Windows-style, commit Unix-style line endings**, then click **Next**.

9. **Select the Terminal Emulator**:
   - Use the recommended terminal emulator, **Use MinTTY**, then click **Next**.

10. **Choose Additional Options**:
    - Check the options for any extra features you want to enable. The default selections are usually fine, so you can click **Next**.

11. **Install Git**:
    - Finally, click **Install** and wait for the installation to complete.

12. **Complete the Setup**:
    - After installation is complete, click **Finish** to exit the installer.

### Step 3: Verify Git Installation

1. **Open Git Bash**:
   - You can open Git Bash from the Start Menu or right-click on the desktop or in a folder and select **Git Bash Here**.

2. **Check Git Version**:
   - In the Git Bash terminal, type the following command to verify the installation:
     ```bash
     git --version
     ```

### Step 4: Configure Git (Optional but Recommended)

1. **Set Your Username**:
   ```bash
   git config --global user.name "Your Name"
   ```

2. **Set Your Email**:
   ```bash
   git config --global user.email "your-email@example.com"
   ```
---

## Guide: Configuring SSH for Git on Windows

### Step 1: Check for Git Installation

1. **Open Git Bash**:
   - Press the `Windows` key, search for **Git Bash**, and open it. This will allow you to use Git commands in a terminal.

2. **Verify Git Installation**:
   - In Git Bash, type the following command to check if Git is installed:
     ```bash
     git --version
     ```
   - If you see a version number, Git is installed. If not, install Git by following [this guide](https://git-scm.com/).

### Step 2: Generate an SSH Key

1. **Generate a New SSH Key**:
   - In Git Bash, use the following command to create a new SSH key:
     ```bash
     ssh-keygen -t ed25519 -C "your_email@example.com"
     ```
   - Replace `"your_email@example.com"` with your actual email address associated with your Git account.

2. **Follow the Prompts**:
   - When prompted to save the file, press **Enter** to save it in the default directory (`~/.ssh`).
   - You can add a passphrase for additional security, or just press **Enter** to skip this step.

3. **Confirm Key Generation**:
   - If successful, you should see output similar to:
     ```
     Your identification has been saved in /Users/YourName/.ssh/id_ed25519.
     Your public key has been saved in /Users/YourName/.ssh/id_ed25519.pub.
     ```

### Step 3: Add SSH Key to the SSH-Agent

1. **Start the SSH Agent**:
   - In Git Bash, start the SSH agent with the following command:
     ```bash
     eval "$(ssh-agent -s)"
     ```
   - This should return a process ID number if successful.

2. **Add the SSH Key to the Agent**:
   - Next, add your newly created SSH key to the agent:
     ```bash
     ssh-add ~/.ssh/id_ed25519
     ```

### Step 4: Add SSH Key to Your Git Hosting Service

#### For GitHub:

1. **Copy the SSH Key**:
   - In Git Bash, use this command to copy the SSH key to your clipboard:
     ```bash
     clip < ~/.ssh/id_ed25519.pub
     ```
   - If `clip` doesn't work, open the file manually in a text editor and copy the contents:
     ```bash
     cat ~/.ssh/id_ed25519.pub
     ```

2. **Add Key to GitHub**:
   - Go to [GitHub](https://github.com/) and log in.
   - Click on your profile icon in the upper-right corner, go to **Settings**.
   - On the left menu, navigate to **SSH and GPG keys**, then click **New SSH key**.
   - Give the key a title, paste your SSH key into the "Key" field, and click **Add SSH key**.

### Step 5: Test the SSH Connection

1. **Test GitHub Connection**:
   - In Git Bash, use the following command to test the SSH connection with GitHub:
     ```bash
     ssh -T git@github.com
     ```
   - You should see a message like:
     ```
     Hi username! You've successfully authenticated, but GitHub does not provide shell access.
     ```

2. **Test GitLab Connection**:
   - For GitLab, use this command:
     ```bash
     ssh -T git@gitlab.com
     ```
   - You should see a similar success message indicating that authentication was successful.

### Additional Tips

- **Using Multiple SSH Keys**:
  - If you use multiple Git accounts, you can create multiple SSH keys and add them to `~/.ssh/config` file to manage each key per account.
  
- **Troubleshooting**:
  - If you encounter issues, make sure your key is correctly added to the agent and that it's added to your Git hosting account.
  - Check if the key permissions are set correctly:
    ```bash
    chmod 600 ~/.ssh/id_ed25519
    chmod 644 ~/.ssh/id_ed25519.pub
    ```

---

## Guide 3: Installing Visual Studio Code on Windows

### Step 1: Download Visual Studio Code

1. **Go to the VS Code Website**:
   - Open your browser and go to the [Visual Studio Code website](https://code.visualstudio.com/).
  
2. **Download for Windows**:
   - On the homepage, click on the **Download for Windows** button. The site should automatically detect your operating system and provide you with the correct download link.

### Step 2: Install Visual Studio Code

1. **Run the Installer**:
   - Locate the downloaded `.exe` file (likely in your Downloads folder) and double-click it to begin the installation.

2. **Accept the License Agreement**:
   - In the installer window, read through the license agreement, check the box to **Accept the Agreement**, and click **Next**.

3. **Select Destination Location**:
   - Choose the folder where you want VS Code to be installed, or leave it as the default, then click **Next**.

4. **Select Start Menu Folder**:
   - Decide if you’d like to add a shortcut to the Start Menu folder, or leave it as the default, then click **Next**.

5. **Select Additional Tasks**:
   - You may see several options here, including adding VS Code to the PATH (recommended) and creating a desktop shortcut. Select the options you want and click **Next**.

6. **Install VS Code**:
   - Click **Install** to begin the installation. This may take a few minutes.

7. **Finish Installation**:
   - Once the installation is complete, check the box to **Launch Visual Studio Code** if you’d like to open it immediately, then click **Finish**.

### Step 3: Launch Visual Studio Code

1. **Open VS Code**:
   - If you didn’t choose to launch VS Code from the installer, you can open it by finding “Visual Studio Code” in the Start Menu or double-clicking the desktop shortcut.

2. **Get Started**:
   - VS Code will open a “Welcome” page that offers tips and resources for getting started. You can explore these or close them to start coding right away.

### Additional Resources

- **VS Code Documentation**: [Visual Studio Code Docs](https://code.visualstudio.com/docs)
- **Extensions Marketplace**: To enhance VS Code’s functionality, you can install extensions. Click the Extensions icon in the sidebar to browse and install them directly from within the editor.

---

## Guide 4: Installing Docker Desktop on Windows

### Step 1: Download Docker Desktop

1. **Go to the Docker Desktop Website**:
   - Open your browser and go to the [Docker Desktop website](https://www.docker.com/products/docker-desktop/).
  
2. **Download for Windows**:
   - Click on the **Download for Windows** button. The site should automatically detect your operating system and provide the correct installer.

### Step 2: Install Docker Desktop

1. **Run the Installer**:
   - Locate the downloaded `.exe` file (usually in your Downloads folder) and double-click it to start the installation.

2. **Follow the Setup Instructions**:
   - The installer may prompt you to accept the User Account Control. Click **Yes** to proceed.
   - The setup wizard will open, and you can click **OK** to begin the installation.

3. **Enable WSL 2 (if necessary)**:
   - Docker Desktop requires Windows Subsystem for Linux (WSL 2). The installer will detect if you have it enabled. If you don’t, it may prompt you to enable WSL 2 or install the WSL 2 update package.
   - If prompted, follow the link provided by Docker to download the WSL 2 update package for x64 machines [here](https://aka.ms/wsl2kernel).

4. **Complete Installation**:
   - Once all components are installed, click **Close** to complete the setup process. Docker may need you to log out and back in or restart your computer for the changes to take effect.

### Step 3: Launch Docker Desktop

1. **Open Docker Desktop**:
   - You can find Docker Desktop in the Start Menu. Open it to complete the initial setup.

2. **Complete Initial Setup**:
   - When Docker Desktop opens, it may ask you to sign in with your Docker ID or create a new one. You can skip this step if you want, but signing in lets you access Docker Hub and additional features.
   - Docker Desktop will run through a quick setup to finish configuring itself. You’ll know Docker is ready when the Docker icon in the system tray turns from gray to white.

### Step 4: Verify Docker Installation

1. **Open PowerShell or Command Prompt**:
   - Open either PowerShell or Command Prompt. You can do this by pressing `Windows + R`, typing `cmd` or `powershell`, and hitting **Enter**.

2. **Check Docker Version**:
   - In the terminal, type the following command to verify that Docker is installed correctly:
     ```bash
     docker --version
     ```

3. **Run a Test Container**:
   - Run a quick test to make sure Docker is working by running a simple container, such as the hello-world container:
     ```bash
     docker run hello-world
     ```
   - If everything is set up correctly, you should see a message that Docker has successfully run the container.

### Additional Resources

- **Docker Documentation**: [Docker Desktop Documentation](https://docs.docker.com/desktop/)
- **Docker Hub**: Use [Docker Hub](https://hub.docker.com/) to browse, pull, and run images from Docker’s official image library.

---