# BioAuth-iOS

Welcome to BioAuth-iOS, a simple and effective demonstration of iOS Biometric Authentication using the Local Authentication framework. This application showcases how to integrate Face ID, Touch ID, and device passcode authentication into an iOS application to secure user access.

## Features

- **Biometric Authentication**: Utilize Face ID, Touch ID, and device passcode for secure authentication.
- **Local Authentication Framework**: Leverage iOS's built-in framework to handle complex authentication scenarios.
- **Customizable UI**: Personalize authentication prompts with custom messages.
- **Error Handling**: Robust error handling to manage different authentication errors or fallbacks.

## Understanding Biometric Authentication

Biometric authentication on iOS devices is facilitated through the Local Authentication framework, which allows developers to securely authenticate users. This framework supports several types of authentication policies, primarily focusing on biometrics and device passcodes.

### Key Authentication Policies

1. **deviceOwnerAuthenticationWithBiometrics**
    - This policy strictly uses biometric methods—such as Face ID or Touch ID—for authentication.
    - It offers a high level of security by ensuring that only the biometrically verified user can access the app.
    - **Limitations**: There is no fallback to other authentication methods under this policy. If the biometric check fails or is unavailable (e.g., due to hardware failure or biometric data not being enrolled), the authentication attempt will fail outright.

2. **deviceOwnerAuthentication**
    - This policy provides a more flexible authentication approach. It primarily attempts to authenticate using biometrics.
    - **Fallback**: In cases where biometric authentication fails, is cancelled by the user, or if no biometric data is enrolled, this policy falls back to device passcode authentication.
    - This policy is useful for applications that require user verification but can afford to offer a secondary authentication method when biometrics aren't available.

### Implementing Biometric Authentication

To implement biometric authentication in your app, follow these steps:

1. Import the Local Authentication framework:
   ```swift
   import LocalAuthentication


### Prerequisites

To run this project, you'll need:

- Xcode 12 or later
- An iOS device with Face ID or Touch ID, or an iOS Simulator that supports biometric authentication.

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/BioAuth-iOS.git


<p align="center">
  <i>Take a look at my repositories and let's get in touch!</i>

<p align="center">
<a href= "https://github.com/swiftwithamitesh"><img src="https://img.icons8.com/material-outlined/27/000000/ball-point-pen.png"/></a>
<a href= "https://www.linkedin.com/in/geekyamitesh/"><img src="https://img.icons8.com/material-outlined/30/000000/linkedin.png"/></a>
<a href= "https://twitter.com/geekyamitesh03"><img src="https://img.icons8.com/material-outlined/30/000000/twitter.png"/></a>
</p>

</p>
