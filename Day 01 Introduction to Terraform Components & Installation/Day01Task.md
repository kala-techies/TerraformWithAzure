

# Day 01 Task: Terraform Installation

To get started with Terraform, it's crucial to install it correctly on your system based on your operating system. Below are the detailed steps to install Terraform on **Windows**, **Linux**, and **macOS**.

---

### **1. Windows Installation**

Follow these steps to install Terraform on a Windows machine:

1. **Download Terraform**:
   - Go to the official Terraform download page: https://www.terraform.io/downloads
   - Download the appropriate `.zip` file for Windows based on your system architecture (32-bit or 64-bit).

2. **Extract the Zip File**:
   - Extract the `.zip` file to a folder of your choice (e.g., `C:\Terraform`).

3. **Add Terraform to System Path**:
   - Open **Control Panel** > **System** > **Advanced System Settings** > **Environment Variables**.
   - Under **System Variables**, find the `Path` variable, and click **Edit**.
   - Add the path where you extracted Terraform (e.g., `C:\Terraform`).
   - Click **OK** to save the changes.

4. **Verify the Installation**:
   - Open **Command Prompt** or **PowerShell** and run the command:
     ```bash
     terraform -version
     ```
   - This should return the installed version of Terraform, confirming it's successfully installed.

---

### **2. Linux Installation (Ubuntu/Debian)**

Follow these steps to install Terraform on a Linux distribution like Ubuntu:

1. **Update Package Lists**:
   ```bash
   sudo apt-get update
   ```

2. **Install Required Dependencies**:
   ```bash
   sudo apt-get install -y gnupg software-properties-common curl
   ```

3. **Add HashiCorp GPG Key**:
   ```bash
   curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
   ```

4. **Add the HashiCorp Repository**:
   ```bash
   echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
   ```

5. **Install Terraform**:
   ```bash
   sudo apt-get update && sudo apt-get install terraform
   ```

6. **Verify the Installation**:
   ```bash
   terraform -version
   ```
   - You should see the installed version of Terraform.

---

### **3. macOS Installation**

For macOS, you can use **Homebrew** to easily install Terraform:

1. **Install Homebrew** (if you haven't already):
   - Open **Terminal** and run the following command:
     ```bash
     /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
     ```

2. **Install Terraform**:
   ```bash
   brew tap hashicorp/tap
   brew install hashicorp/tap/terraform
   ```

3. **Verify the Installation**:
   ```bash
   terraform -version
   ```
   - This should display the installed version of Terraform.

---

### **4. General Instructions for All Platforms**

1. **Check System Architecture**:
   - Make sure to download the correct version of Terraform (32-bit or 64-bit) based on your system’s architecture. On Windows, you can check this by right-clicking on **This PC** > **Properties**. On Linux and macOS, run:
     ```bash
     uname -m
     ```

2. **Update Terraform**:
   - You can update Terraform later by repeating these installation steps or following instructions in the [official documentation](https://www.terraform.io/docs).

3. **More Information**:
   - For more detailed installation instructions or troubleshooting, you can visit the [official Terraform installation page](https://www.terraform.io/docs/cli/install/index.html).

---

By following these steps, you will have Terraform installed and ready to use on your system. If you encounter any issues, be sure to check the Terraform documentation or seek help from the community!

---

