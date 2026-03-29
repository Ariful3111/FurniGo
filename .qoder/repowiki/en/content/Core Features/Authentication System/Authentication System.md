# Authentication System

<cite>
**Referenced Files in This Document**
- [lib/main.dart](file://lib/main.dart)
- [lib/firebase_options.dart](file://lib/firebase_options.dart)
- [lib/core/services/firebase_google_auth.dart](file://lib/core/services/firebase_google_auth.dart)
- [lib/features/auth/bindings/auth_bindings.dart](file://lib/features/auth/bindings/auth_bindings.dart)
- [lib/features/auth/bindings/onboard_bindings.dart](file://lib/features/auth/bindings/onboard_bindings.dart)
- [lib/features/auth/controller/onboarding_controller.dart](file://lib/features/auth/controller/onboarding_controller.dart)
- [lib/features/auth/views/onboarding_view.dart](file://lib/features/auth/views/onboarding_view.dart)
- [lib/features/auth/controller/signin_controller.dart](file://lib/features/auth/controller/signin_controller.dart)
- [lib/features/auth/views/signin_view.dart](file://lib/features/auth/views/signin_view.dart)
- [lib/features/auth/controller/signup_controller.dart](file://lib/features/auth/controller/signup_controller.dart)
- [lib/features/auth/views/signup_view.dart](file://lib/features/auth/views/signup_view.dart)
- [lib/features/auth/controller/user_mode_controller.dart](file://lib/features/auth/controller/user_mode_controller.dart)
- [lib/features/auth/views/user_mode_view.dart](file://lib/features/auth/views/user_mode_view.dart)
- [lib/features/auth/views/signup_option_view.dart](file://lib/features/auth/views/signup_option_view.dart)
- [lib/features/auth/controller/signup_option_controller.dart](file://lib/features/auth/controller/signup_option_controller.dart)
- [lib/features/auth/views/email_verification_view.dart](file://lib/features/auth/views/email_verification_view.dart)
- [lib/features/auth/controller/email_verification_controller.dart](file://lib/features/auth/controller/email_verification_controller.dart)
- [lib/features/auth/views/otp_view.dart](file://lib/features/auth/views/otp_view.dart)
- [lib/features/auth/controller/otp_controller.dart](file://lib/features/auth/controller/otp_controller.dart)
- [lib/features/auth/views/forgot_password_view.dart](file://lib/features/auth/views/forgot_password_view.dart)
- [lib/features/auth/controller/forgot_password_controller.dart](file://lib/features/auth/controller/forgot_password_controller.dart)
- [lib/features/auth/views/new_password_view.dart](file://lib/features/auth/views/new_password_view.dart)
- [lib/features/auth/controller/new_password_controller.dart](file://lib/features/auth/controller/new_password_controller.dart)
- [lib/features/auth/repositories/login_repo.dart](file://lib/features/auth/repositories/login_repo.dart)
- [lib/features/auth/repositories/register_repo.dart](file://lib/features/auth/repositories/register_repo.dart)
- [lib/features/auth/repositories/forgot_password_repo.dart](file://lib/features/auth/repositories/forgot_password_repo.dart)
- [lib/features/auth/models/login_model.dart](file://lib/features/auth/models/login_model.dart)
- [lib/features/auth/models/register_model.dart](file://lib/features/auth/models/register_model.dart)
- [lib/features/auth/models/forgot_password_model.dart](file://lib/features/auth/models/forgot_password_model.dart)
</cite>

## Table of Contents
1. [Introduction](#introduction)
2. [Project Structure](#project-structure)
3. [Core Components](#core-components)
4. [Architecture Overview](#architecture-overview)
5. [Detailed Component Analysis](#detailed-component-analysis)
6. [Dependency Analysis](#dependency-analysis)
7. [Performance Considerations](#performance-considerations)
8. [Troubleshooting Guide](#troubleshooting-guide)
9. [Conclusion](#conclusion)

## Introduction
This document describes the Authentication System feature of the application. It covers the complete user authentication workflow from onboarding, registration, login, email verification, OTP verification, password reset, and user mode selection (client/provider). It also explains the MVVM architecture implemented with GetX controllers, view bindings, and state management patterns, along with integration points for Firebase Authentication and Google Sign-In.

## Project Structure
The authentication feature is organized under the features/auth package with clear separation of concerns:
- Controllers: stateful business logic and coordination
- Views: UI rendered via GetView with reactive updates
- Repositories: encapsulate network/API interactions
- Models: typed request/response data structures
- Bindings: dependency injection wiring via GetX
- Services: platform integrations (Firebase/Google)

```mermaid
graph TB
subgraph "Auth Feature"
subgraph "Controllers"
OC["OnboardingController"]
SC["SigninController"]
SGC["SignupController"]
UMC["UserModeController"]
EVC["EmailVerificationController"]
OPC["OtpController"]
FPC["ForgotPasswordController"]
NPC["NewPasswordController"]
end
subgraph "Views"
OV["OnboardingView"]
SV["SigninView"]
SGV["SignupView"]
UMV["UserModeView"]
EVO["EmailVerificationView"]
OPV["OtpView"]
FPV["ForgotPasswordView"]
NPV["NewPasswordView"]
end
subgraph "Repositories"
LR["LoginRepository"]
RR["RegisterRepository"]
FR["ForgotPasswordRepository"]
end
subgraph "Models"
LM["LoginModel"]
RM["RegisterModel"]
FPM["ForgotPasswordModel"]
end
subgraph "Bindings"
AB["AuthBindings"]
OB["OnboardBindings"]
end
subgraph "Services"
FGAS["FirebaseGoogleAuthService"]
end
OV --> OC
SV --> SC
SGV --> SGC
UMV --> UMC
EVO --> EVC
OPV --> OPC
FPV --> FPC
NPV --> NPC
SC --> LR
SGC --> RR
FPC --> FR
OC -.-> AB
SC -.-> AB
SGC -.-> AB
UMC -.-> AB
EVC -.-> AB
OPC -.-> AB
FPC -.-> AB
NPC -.-> AB
FGAS --> SV
```

**Diagram sources**
- [lib/features/auth/bindings/auth_bindings.dart:13-28](file://lib/features/auth/bindings/auth_bindings.dart#L13-L28)
- [lib/features/auth/controller/onboarding_controller.dart:7-123](file://lib/features/auth/controller/onboarding_controller.dart#L7-L123)
- [lib/features/auth/views/onboarding_view.dart:8-54](file://lib/features/auth/views/onboarding_view.dart#L8-L54)
- [lib/features/auth/controller/signin_controller.dart:9-51](file://lib/features/auth/controller/signin_controller.dart#L9-L51)
- [lib/features/auth/views/signin_view.dart:17-93](file://lib/features/auth/views/signin_view.dart#L17-L93)
- [lib/features/auth/controller/signup_controller.dart:10-66](file://lib/features/auth/controller/signup_controller.dart#L10-L66)
- [lib/features/auth/views/signup_view.dart:18-96](file://lib/features/auth/views/signup_view.dart#L18-L96)
- [lib/features/auth/controller/user_mode_controller.dart](file://lib/features/auth/controller/user_mode_controller.dart)
- [lib/features/auth/views/user_mode_view.dart](file://lib/features/auth/views/user_mode_view.dart)
- [lib/features/auth/views/email_verification_view.dart](file://lib/features/auth/views/email_verification_view.dart)
- [lib/features/auth/controller/email_verification_controller.dart](file://lib/features/auth/controller/email_verification_controller.dart)
- [lib/features/auth/views/otp_view.dart](file://lib/features/auth/views/otp_view.dart)
- [lib/features/auth/controller/otp_controller.dart](file://lib/features/auth/controller/otp_controller.dart)
- [lib/features/auth/views/forgot_password_view.dart](file://lib/features/auth/views/forgot_password_view.dart)
- [lib/features/auth/controller/forgot_password_controller.dart](file://lib/features/auth/controller/forgot_password_controller.dart)
- [lib/features/auth/views/new_password_view.dart](file://lib/features/auth/views/new_password_view.dart)
- [lib/features/auth/controller/new_password_controller.dart](file://lib/features/auth/controller/new_password_controller.dart)
- [lib/features/auth/repositories/login_repo.dart](file://lib/features/auth/repositories/login_repo.dart)
- [lib/features/auth/repositories/register_repo.dart](file://lib/features/auth/repositories/register_repo.dart)
- [lib/features/auth/repositories/forgot_password_repo.dart](file://lib/features/auth/repositories/forgot_password_repo.dart)
- [lib/features/auth/models/login_model.dart](file://lib/features/auth/models/login_model.dart)
- [lib/features/auth/models/register_model.dart](file://lib/features/auth/models/register_model.dart)
- [lib/features/auth/models/forgot_password_model.dart](file://lib/features/auth/models/forgot_password_model.dart)
- [lib/core/services/firebase_google_auth.dart:6-69](file://lib/core/services/firebase_google_auth.dart#L6-L69)

**Section sources**
- [lib/features/auth/bindings/auth_bindings.dart:13-28](file://lib/features/auth/bindings/auth_bindings.dart#L13-L28)
- [lib/features/auth/bindings/onboard_bindings.dart](file://lib/features/auth/bindings/onboard_bindings.dart)
- [lib/features/auth/controller/onboarding_controller.dart:7-123](file://lib/features/auth/controller/onboarding_controller.dart#L7-L123)
- [lib/features/auth/views/onboarding_view.dart:8-54](file://lib/features/auth/views/onboarding_view.dart#L8-L54)

## Core Components
- Onboarding: animated onboarding screens with page navigation and theme-aware visuals.
- Sign-in: email/password login with repository-driven execution and token persistence.
- Registration: multi-field form with terms agreement, user type selection, and post-registration token handling.
- User Mode Selection: toggles between client and provider modes influencing registration routing and model population.
- Email Verification: dedicated view and controller for verifying email after registration.
- OTP Verification: OTP entry screen and controller coordinating verification steps.
- Password Reset: forgot password view/controller and repository for initiating reset; new password view/controller for setting a new password.
- Google Sign-In: service wrapper integrating Firebase Auth with Google Sign-In.

**Section sources**
- [lib/features/auth/controller/signin_controller.dart:9-51](file://lib/features/auth/controller/signin_controller.dart#L9-L51)
- [lib/features/auth/views/signin_view.dart:17-93](file://lib/features/auth/views/signin_view.dart#L17-L93)
- [lib/features/auth/controller/signup_controller.dart:10-66](file://lib/features/auth/controller/signup_controller.dart#L10-L66)
- [lib/features/auth/views/signup_view.dart:18-96](file://lib/features/auth/views/signup_view.dart#L18-L96)
- [lib/features/auth/controller/user_mode_controller.dart](file://lib/features/auth/controller/user_mode_controller.dart)
- [lib/features/auth/views/user_mode_view.dart](file://lib/features/auth/views/user_mode_view.dart)
- [lib/features/auth/views/signup_option_view.dart](file://lib/features/auth/views/signup_option_view.dart)
- [lib/features/auth/controller/signup_option_controller.dart](file://lib/features/auth/controller/signup_option_controller.dart)
- [lib/features/auth/views/email_verification_view.dart](file://lib/features/auth/views/email_verification_view.dart)
- [lib/features/auth/controller/email_verification_controller.dart](file://lib/features/auth/controller/email_verification_controller.dart)
- [lib/features/auth/views/otp_view.dart](file://lib/features/auth/views/otp_view.dart)
- [lib/features/auth/controller/otp_controller.dart](file://lib/features/auth/controller/otp_controller.dart)
- [lib/features/auth/views/forgot_password_view.dart](file://lib/features/auth/views/forgot_password_view.dart)
- [lib/features/auth/controller/forgot_password_controller.dart](file://lib/features/auth/controller/forgot_password_controller.dart)
- [lib/features/auth/views/new_password_view.dart](file://lib/features/auth/views/new_password_view.dart)
- [lib/features/auth/controller/new_password_controller.dart](file://lib/features/auth/controller/new_password_controller.dart)
- [lib/core/services/firebase_google_auth.dart:6-69](file://lib/core/services/firebase_google_auth.dart#L6-L69)

## Architecture Overview
The system follows MVVM with GetX:
- Models define typed request/response structures.
- Controllers manage state and orchestrate business logic.
- Views render UI and bind to controller state via Obx.
- Repositories encapsulate network/API calls.
- Bindings wire dependencies lazily for DI.

```mermaid
classDiagram
class LoginModel
class RegisterModel
class ForgotPasswordModel
class LoginRepository {
+execute(email, password)
}
class RegisterRepository {
+execute(name, email, phone, password, confirmPassword, abn, userType)
}
class ForgotPasswordRepository {
+execute(email)
}
class OnboardingController {
+currentIndex
+dragOffset
+onInit()
+dispose()
}
class SigninController {
+email
+password
+isLoading
+userLogin(formKey)
+signup(formKey)
+dispose()
}
class SignupController {
+isChecked
+nameController
+emailController
+passwordController
+confirmPasswordController
+phoneController
+abnController
+isLoading
+register(formKey)
+dispose()
}
class UserModeController {
+selectedIndex
}
class EmailVerificationController
class OtpController
class ForgotPasswordController
class NewPasswordController
SigninController --> LoginRepository : "uses"
SignupController --> RegisterRepository : "uses"
ForgotPasswordController --> ForgotPasswordRepository : "uses"
LoginModel <.. LoginRepository
RegisterModel <.. RegisterRepository
ForgotPasswordModel <.. ForgotPasswordRepository
```

**Diagram sources**
- [lib/features/auth/models/login_model.dart](file://lib/features/auth/models/login_model.dart)
- [lib/features/auth/models/register_model.dart](file://lib/features/auth/models/register_model.dart)
- [lib/features/auth/models/forgot_password_model.dart](file://lib/features/auth/models/forgot_password_model.dart)
- [lib/features/auth/repositories/login_repo.dart](file://lib/features/auth/repositories/login_repo.dart)
- [lib/features/auth/repositories/register_repo.dart](file://lib/features/auth/repositories/register_repo.dart)
- [lib/features/auth/repositories/forgot_password_repo.dart](file://lib/features/auth/repositories/forgot_password_repo.dart)
- [lib/features/auth/controller/signin_controller.dart:9-51](file://lib/features/auth/controller/signin_controller.dart#L9-L51)
- [lib/features/auth/controller/signup_controller.dart:10-66](file://lib/features/auth/controller/signup_controller.dart#L10-L66)
- [lib/features/auth/controller/user_mode_controller.dart](file://lib/features/auth/controller/user_mode_controller.dart)
- [lib/features/auth/controller/email_verification_controller.dart](file://lib/features/auth/controller/email_verification_controller.dart)
- [lib/features/auth/controller/otp_controller.dart](file://lib/features/auth/controller/otp_controller.dart)
- [lib/features/auth/controller/forgot_password_controller.dart](file://lib/features/auth/controller/forgot_password_controller.dart)
- [lib/features/auth/controller/new_password_controller.dart](file://lib/features/auth/controller/new_password_controller.dart)

## Detailed Component Analysis

### Onboarding Workflow
- Controller manages page transitions, drag gestures, and animated arrows.
- View renders onboarding slides with theme-aware assets and footer actions.
- Navigation leads to user mode selection upon completion.

```mermaid
sequenceDiagram
participant User as "User"
participant View as "OnboardingView"
participant Ctrl as "OnboardingController"
User->>View : Open App
View->>Ctrl : Initialize controller
Ctrl->>Ctrl : startArrowAnimation()
User->>View : Swipe or tap Next
View->>Ctrl : updateDrag(dx)
Ctrl->>Ctrl : endDrag(isLast)
Ctrl-->>View : Update currentIndex
View-->>User : Render next slide
```

**Diagram sources**
- [lib/features/auth/views/onboarding_view.dart:14-50](file://lib/features/auth/views/onboarding_view.dart#L14-L50)
- [lib/features/auth/controller/onboarding_controller.dart:38-68](file://lib/features/auth/controller/onboarding_controller.dart#L38-L68)

**Section sources**
- [lib/features/auth/controller/onboarding_controller.dart:7-123](file://lib/features/auth/controller/onboarding_controller.dart#L7-L123)
- [lib/features/auth/views/onboarding_view.dart:8-54](file://lib/features/auth/views/onboarding_view.dart#L8-L54)

### User Mode Selection (Client/Provider)
- User selects either personal or business account during registration.
- Controller maintains selected index and influences registration payload.
- View reflects current selection and routes accordingly.

```mermaid
flowchart TD
Start(["Open User Mode View"]) --> Choice{"Selected Type?"}
Choice --> |Client| SetClient["Set selectedIndex = 0"]
Choice --> |Business| SetBusiness["Set selectedIndex = 1"]
SetClient --> Proceed["Proceed to Registration"]
SetBusiness --> Proceed
Proceed --> End(["Registration Payload Includes userType"])
```

**Diagram sources**
- [lib/features/auth/controller/user_mode_controller.dart](file://lib/features/auth/controller/user_mode_controller.dart)
- [lib/features/auth/views/user_mode_view.dart](file://lib/features/auth/views/user_mode_view.dart)
- [lib/features/auth/views/signup_option_view.dart](file://lib/features/auth/views/signup_option_view.dart)
- [lib/features/auth/controller/signup_option_controller.dart](file://lib/features/auth/controller/signup_option_controller.dart)
- [lib/features/auth/controller/signup_controller.dart:35-37](file://lib/features/auth/controller/signup_controller.dart#L35-L37)

**Section sources**
- [lib/features/auth/controller/user_mode_controller.dart](file://lib/features/auth/controller/user_mode_controller.dart)
- [lib/features/auth/views/user_mode_view.dart](file://lib/features/auth/views/user_mode_view.dart)
- [lib/features/auth/views/signup_option_view.dart](file://lib/features/auth/views/signup_option_view.dart)
- [lib/features/auth/controller/signup_option_controller.dart](file://lib/features/auth/controller/signup_option_controller.dart)
- [lib/features/auth/controller/signup_controller.dart:35-37](file://lib/features/auth/controller/signup_controller.dart#L35-L37)

### Registration and Email Verification
- Registration collects personal/business details, validates terms, and submits to repository.
- Repository executes registration and returns a token; controller persists token and navigates to email verification.
- Email verification view/controller handles verification flow.

```mermaid
sequenceDiagram
participant User as "User"
participant View as "SignupView"
participant Ctrl as "SignupController"
participant Repo as "RegisterRepository"
participant Storage as "StorageService"
participant Nav as "Navigator"
User->>View : Fill form and tap Sign Up
View->>Ctrl : register(formKey)
Ctrl->>Repo : execute(name,email,phone,password,confirmPassword,abn,userType)
Repo-->>Ctrl : Result(token)
Ctrl->>Storage : write(tokenKey, token)
Ctrl->>Nav : navigate to EmailVerificationView
```

**Diagram sources**
- [lib/features/auth/views/signup_view.dart:78-88](file://lib/features/auth/views/signup_view.dart#L78-L88)
- [lib/features/auth/controller/signup_controller.dart:25-54](file://lib/features/auth/controller/signup_controller.dart#L25-L54)
- [lib/features/auth/repositories/register_repo.dart](file://lib/features/auth/repositories/register_repo.dart)
- [lib/features/auth/views/email_verification_view.dart](file://lib/features/auth/views/email_verification_view.dart)
- [lib/features/auth/controller/email_verification_controller.dart](file://lib/features/auth/controller/email_verification_controller.dart)

**Section sources**
- [lib/features/auth/controller/signup_controller.dart:10-66](file://lib/features/auth/controller/signup_controller.dart#L10-L66)
- [lib/features/auth/views/signup_view.dart:18-96](file://lib/features/auth/views/signup_view.dart#L18-L96)
- [lib/features/auth/repositories/register_repo.dart](file://lib/features/auth/repositories/register_repo.dart)
- [lib/features/auth/views/email_verification_view.dart](file://lib/features/auth/views/email_verification_view.dart)
- [lib/features/auth/controller/email_verification_controller.dart](file://lib/features/auth/controller/email_verification_controller.dart)

### Login and Token Persistence
- Login view validates credentials and delegates to repository.
- On success, token is persisted and user is navigated to bottom navigation.

```mermaid
sequenceDiagram
participant User as "User"
participant View as "SigninView"
participant Ctrl as "SigninController"
participant Repo as "LoginRepository"
participant Storage as "StorageService"
participant Nav as "Navigator"
User->>View : Enter email/password and tap Sign In
View->>Ctrl : userLogin(formKey)
Ctrl->>Repo : execute(email, password)
Repo-->>Ctrl : Result(token)
Ctrl->>Storage : write(tokenKey, token)
Ctrl->>Nav : navigate to BottomNav
```

**Diagram sources**
- [lib/features/auth/views/signin_view.dart:58-61](file://lib/features/auth/views/signin_view.dart#L58-L61)
- [lib/features/auth/controller/signin_controller.dart:17-36](file://lib/features/auth/controller/signin_controller.dart#L17-L36)
- [lib/features/auth/repositories/login_repo.dart](file://lib/features/auth/repositories/login_repo.dart)
- [lib/core/data/local/storage_service.dart](file://lib/core/data/local/storage_service.dart)

**Section sources**
- [lib/features/auth/controller/signin_controller.dart:9-51](file://lib/features/auth/controller/signin_controller.dart#L9-L51)
- [lib/features/auth/views/signin_view.dart:17-93](file://lib/features/auth/views/signin_view.dart#L17-L93)
- [lib/features/auth/repositories/login_repo.dart](file://lib/features/auth/repositories/login_repo.dart)

### OTP Verification
- OTP view/controller coordinates user input and verification submission.
- Integrates with backend verification endpoint via repository pattern.

```mermaid
flowchart TD
Start(["Open OTP View"]) --> Input["User enters OTP"]
Input --> Submit["Submit OTP"]
Submit --> Validate{"Valid?"}
Validate --> |Yes| Success["Navigate to Home"]
Validate --> |No| Retry["Show error and allow retry"]
Retry --> Input
```

**Diagram sources**
- [lib/features/auth/views/otp_view.dart](file://lib/features/auth/views/otp_view.dart)
- [lib/features/auth/controller/otp_controller.dart](file://lib/features/auth/controller/otp_controller.dart)

**Section sources**
- [lib/features/auth/views/otp_view.dart](file://lib/features/auth/views/otp_view.dart)
- [lib/features/auth/controller/otp_controller.dart](file://lib/features/auth/controller/otp_controller.dart)

### Password Reset and New Password
- Forgot password view/controller triggers reset initiation.
- New password view/controller sets a new password after verification.

```mermaid
sequenceDiagram
participant User as "User"
participant FPView as "ForgotPasswordView"
participant FPCtrl as "ForgotPasswordController"
participant FR as "ForgotPasswordRepository"
participant NV as "NewPasswordView"
participant NPCtrl as "NewPasswordController"
User->>FPView : Enter email and submit
FPView->>FPCtrl : initiateReset(email)
FPCtrl->>FR : execute(email)
FR-->>FPCtrl : Result(success)
FPCtrl-->>User : Show reset sent message
User->>NV : Open set new password
NV->>NPCtrl : setNewPassword(token, newPassword)
NPCtrl-->>User : Show success and redirect
```

**Diagram sources**
- [lib/features/auth/views/forgot_password_view.dart](file://lib/features/auth/views/forgot_password_view.dart)
- [lib/features/auth/controller/forgot_password_controller.dart](file://lib/features/auth/controller/forgot_password_controller.dart)
- [lib/features/auth/repositories/forgot_password_repo.dart](file://lib/features/auth/repositories/forgot_password_repo.dart)
- [lib/features/auth/views/new_password_view.dart](file://lib/features/auth/views/new_password_view.dart)
- [lib/features/auth/controller/new_password_controller.dart](file://lib/features/auth/controller/new_password_controller.dart)

**Section sources**
- [lib/features/auth/views/forgot_password_view.dart](file://lib/features/auth/views/forgot_password_view.dart)
- [lib/features/auth/controller/forgot_password_controller.dart](file://lib/features/auth/controller/forgot_password_controller.dart)
- [lib/features/auth/repositories/forgot_password_repo.dart](file://lib/features/auth/repositories/forgot_password_repo.dart)
- [lib/features/auth/views/new_password_view.dart](file://lib/features/auth/views/new_password_view.dart)
- [lib/features/auth/controller/new_password_controller.dart](file://lib/features/auth/controller/new_password_controller.dart)

### Google Sign-In Integration
- Service wrapper integrates Google Sign-In with Firebase Auth.
- Provides sign-in and sign-out operations returning user info or null on failure.

```mermaid
sequenceDiagram
participant User as "User"
participant View as "SigninView"
participant FGAS as "FirebaseGoogleAuthService"
participant FA as "FirebaseAuth"
participant GSI as "GoogleSignIn"
User->>View : Tap Continue With Google
View->>FGAS : signInWithGoogle()
FGAS->>GSI : signIn()
GSI-->>FGAS : GoogleSignInAccount
FGAS->>FA : signInWithCredential(idToken, accessToken)
FA-->>FGAS : UserCredential
FGAS-->>View : GoogleUserInfoModel or null
```

**Diagram sources**
- [lib/core/services/firebase_google_auth.dart:15-58](file://lib/core/services/firebase_google_auth.dart#L15-L58)
- [lib/features/auth/views/signin_view.dart:73-86](file://lib/features/auth/views/signin_view.dart#L73-L86)

**Section sources**
- [lib/core/services/firebase_google_auth.dart:6-69](file://lib/core/services/firebase_google_auth.dart#L6-L69)
- [lib/features/auth/views/signin_view.dart:73-86](file://lib/features/auth/views/signin_view.dart#L73-L86)

## Dependency Analysis
- Bindings: AuthBindings wires controllers and repositories for lazy loading.
- Controllers depend on repositories and shared services (storage, routes).
- Views depend on controllers and reactive state via Obx.
- Models are consumed by repositories and passed to APIs.

```mermaid
graph TB
AB["AuthBindings"] --> SC["SigninController"]
AB --> SGC["SignupController"]
AB --> UMC["UserModeController"]
AB --> EVC["EmailVerificationController"]
AB --> OPC["OtpController"]
AB --> FPC["ForgotPasswordController"]
AB --> NPC["NewPasswordController"]
SC --> LR["LoginRepository"]
SGC --> RR["RegisterRepository"]
FPC --> FR["ForgotPasswordRepository"]
```

**Diagram sources**
- [lib/features/auth/bindings/auth_bindings.dart:13-28](file://lib/features/auth/bindings/auth_bindings.dart#L13-L28)
- [lib/features/auth/controller/signin_controller.dart:9-11](file://lib/features/auth/controller/signin_controller.dart#L9-L11)
- [lib/features/auth/controller/signup_controller.dart:10-13](file://lib/features/auth/controller/signup_controller.dart#L10-L13)
- [lib/features/auth/repositories/login_repo.dart](file://lib/features/auth/repositories/login_repo.dart)
- [lib/features/auth/repositories/register_repo.dart](file://lib/features/auth/repositories/register_repo.dart)
- [lib/features/auth/repositories/forgot_password_repo.dart](file://lib/features/auth/repositories/forgot_password_repo.dart)

**Section sources**
- [lib/features/auth/bindings/auth_bindings.dart:13-28](file://lib/features/auth/bindings/auth_bindings.dart#L13-L28)

## Performance Considerations
- Reactive state updates: Prefer Obx for granular UI refreshes to avoid unnecessary rebuilds.
- Lazy loading: Get.lazyPut defers instantiation until needed, reducing startup overhead.
- Gesture handling: Clamp drag offsets and throttle animations to prevent excessive recomposition.
- Token persistence: Persist tokens efficiently to avoid repeated login attempts.
- Network calls: Debounce form submissions and show loading indicators to improve UX and reduce redundant requests.

## Troubleshooting Guide
- Authentication errors: Catch and surface user-friendly messages via snackbars; log underlying exceptions for diagnostics.
- Form validation failures: Ensure form keys are properly scoped and validators return clear feedback.
- Navigation issues: Verify route names and binding registrations to prevent runtime navigation errors.
- Google sign-in failures: Handle cancellation and error cases gracefully; confirm Google Play services availability on Android devices.
- Token persistence: Confirm storage keys and secure token handling to prevent unauthorized access.

**Section sources**
- [lib/features/auth/controller/signin_controller.dart:25-34](file://lib/features/auth/controller/signin_controller.dart#L25-L34)
- [lib/features/auth/controller/signup_controller.dart:40-52](file://lib/features/auth/controller/signup_controller.dart#L40-L52)
- [lib/core/services/firebase_google_auth.dart:51-57](file://lib/core/services/firebase_google_auth.dart#L51-L57)

## Conclusion
The Authentication System leverages a clean MVVM architecture with GetX for state management and DI. It supports a complete user journey from onboarding to verified login, with robust integration for Google Sign-In and extensible repositories for backend interactions. The modular design ensures maintainability and scalability across authentication flows.