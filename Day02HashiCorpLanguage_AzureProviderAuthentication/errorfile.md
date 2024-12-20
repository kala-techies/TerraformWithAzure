

# Known Errors

## Azure CLI Login Issues

### Error: Authentication Failure
- **Description**: Authentication failed with the message: "Status: Response_Status.Status_InteractionRequired".
- **Suggested Fixes**:
  - Run `az login --allow-no-subscriptions` to log in without requiring specific subscription access.
  - Verify that your account has the necessary permissions; if not, contact your administrator for assistance.

### Error: Subscription Not Found
- **Description**: The specified subscription (e.g., 'XXXXXXXXXXXX') could not be found.
- **Suggested Fixes**:
  - Check your active subscriptions with `az account list` to ensure you are using the correct one.
  - Set the active subscription with:
    ```bash
    az account set --subscription "Your Subscription ID or Name"
    ```
  - If issues persist, clear the current account context:
    ```bash
    az account clear
    ```
  - Verify and navigate to the Azure configuration folder at `%USERPROFILE%\.azure` if needed.
  - Log in again using `az login --allow-no-subscriptions`.
  - If necessary, switch tenants with:
    ```bash
    az account set --tenant "your-tenant-id"
    ```

## Additional Notes
- Always ensure you are logged into the correct Azure tenant before performing operations.
- Confirm that your account has the appropriate role assignments for the required subscription.
- If persistent errors occur, consider clearing the Azure CLI cache using:
  ```bash
  az account clear
  ```

---

