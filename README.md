# Regi-Processor: The CPU Name Changer

Regi-Processor is a PowerShell script designed to make it easy for users to update the CPU name in the Windows Registry. This script is particularly useful for users who want to customize the CPU name displayed in their system information.

## Prerequisites

- Windows operating system
- Administrative privileges

## Usage

1. **Download the Script**:
   - Clone the repository or download the `regi-processor.ps1` script directly.

2. **Open PowerShell**:
   - Right-click on the Windows Start menu and select "Windows PowerShell (Admin)" to open PowerShell with administrative privileges.

3. **Navigate to the Script Location**:
   - Use the `cd` command to navigate to the directory where the `regi-processor.ps1` script is located.

4. **Run the Script**:
   - Execute the script by typing `.\regi-processor.ps1` and pressing Enter.

   **Set Execution Policy (if needed)**:
   - If you encounter a permission issue, use the following command to set the execution policy:
     ```
      Get-ExecutionPolicy
     ```
    - If the policy is set to "Restricted" or "RemoteSigned," you can change it to "Unrestricted" or "Bypass" (for testing purposes only) by running the following command:
    ```
      Set-ExecutionPolicy RemoteSigned
      Set-ExecutionPolicy Unrestricted
     ```

5. **Follow the Prompts**:
   - The script will prompt you to enter the new processor name. Type the desired name and press Enter.

6. **Wait for the Script to Complete**:
   - The script will iterate through each CPU entry in the Windows Registry and update the CPU name as specified.

7. **Verify Changes**:
   - After the script completes, verify that the CPU name has been updated by checking the system information or other relevant utilities.

## Caution

- Ensure you have administrative privileges before running the script.
- Make sure to enter a valid and appropriate CPU name to avoid any unexpected behavior.

## Contributions

Contributions are welcome! If you find any issues or have suggestions for improvements, please feel free to open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).

