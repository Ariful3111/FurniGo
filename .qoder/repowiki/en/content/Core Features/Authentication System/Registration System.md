# Registration System

<cite>
**Referenced Files in This Document**
- [signup_option_controller.dart](file://lib/features/auth/controller/signup_option_controller.dart)
- [signup_controller.dart](file://lib/features/auth/controller/signup_controller.dart)
- [register_repo.dart](file://lib/features/auth/repositories/register_repo.dart)
- [register_model.dart](file://lib/features/auth/models/register_model.dart)
- [signup_view.dart](file://lib/features/auth/views/signup_view.dart)
- [signup_form.dart](file://lib/features/auth/widgets/signup_form.dart)
- [user_mode_controller.dart](file://lib/features/auth/controller/user_mode_controller.dart)
- [signup_option_view.dart](file://lib/features/auth/views/signup_option_view.dart)
- [name_validator.dart](file://lib/shared/extensions/validators/name_validator.dart)
- [email_validator.dart](file://lib/shared/extensions/validators/email_validator.dart)
- [password_validator.dart](file://lib/shared/extensions/validators/password_validator.dart)
- [confirm_password_validator.dart](file://lib/shared/extensions/validators/confirm_password_validator.dart)
- [post_with_response.dart](file://lib/core/data/networks/post_with_response.dart)
- [headers_manager.dart](file://lib/core/data/networks/headers_manager.dart)
- [storage_service.dart](file://lib/core/data/local/storage_service.dart)
- [app_routes.dart](file://lib/core/routes/app_routes.dart)
- [firebase_google_auth.dart](file://lib/core/services/firebase_google_auth.dart)
</cite>

## Table of Contents
1. [Introduction](#introduction)
2. [Project Structure](#project-structure)
3. [Core Components](#core-components)
4. [Architecture Overview](#architecture-overview)
5. [Detailed Component Analysis](#detailed-component-analysis)
6. [Dependency Analysis](#dependency-analysis)
7. [Performance Considerations](#performance-considerations)
8. [Security and Data Sanitization](#security-and-data-sanitization)
9. [Troubleshooting Guide](#troubleshooting-guide)
10. [Conclusion](#conclusion)

## Introduction
This document provides comprehensive technical documentation for the Registration System component. It covers the complete user registration workflow, including signup option selection (personal/business), form validation, user data collection, and account creation. It explains the implementation of the SignupOptionController and SignupController with GetX state management, validation rules, and error handling. It also details the registration repository integration, API communication patterns, and data persistence. Additional topics include user mode selection logic, form field requirements, validation feedback mechanisms, success/error state management, security considerations, data sanitization, and integration with Firebase authentication services.

## Project Structure
The Registration System resides under the auth feature module and integrates with shared validators, core networking utilities, and routing. The primary components are organized as follows:
- Controllers: manage UI state and orchestrate registration actions
- Views: render the registration UI and collect user input
- Widgets: reusable form fields and validation helpers
- Repositories: encapsulate API communication and data modeling
- Models: define response and payload structures
- Validators: enforce field-specific validation rules
- Services and Utilities: handle storage, routing, and network headers

```mermaid
graph TB
subgraph "Auth Feature"
SOV["SignupOptionView"]
SV["SignupView"]
SFC["SignupForm"]
SOC["SignupOptionController"]
SC["SignupController"]
UMC["UserModeController"]
end
subgraph "Repositories"
RR["RegisterRepository"]
end
subgraph "Models"
RM["RegisterModel"]
end
subgraph "Validators"
NV["NameValidator"]
EV["EmailValidator"]
PV["PasswordValidator"]
CPV["ConfirmPasswordValidator"]
end
subgraph "Networking"
PWR["PostWithResponse"]
HM["HeadersManager"]
end
subgraph "Local Storage"
SS["StorageService"]
end
subgraph "Routing"
AR["AppRoutes"]
end
SOV --> SOC
SOV --> UMC
SOV --> SV
SV --> SC
SV --> SFC
SFC --> NV
SFC --> EV
SFC --> PV
SFC --> CPV
SC --> RR
RR --> PWR
RR --> HM
RR --> RM
SC --> SS
SC --> AR
```

**Diagram sources**
- [signup_option_view.dart:18-123](file://lib/features/auth/views/signup_option_view.dart#L18-L123)
- [signup_view.dart:18-96](file://lib/features/auth/views/signup_view.dart#L18-L96)
- [signup_form.dart:15-103](file://lib/features/auth/widgets/signup_form.dart#L15-L103)
- [signup_option_controller.dart:3-5](file://lib/features/auth/controller/signup_option_controller.dart#L3-L5)
- [signup_controller.dart:10-66](file://lib/features/auth/controller/signup_controller.dart#L10-L66)
- [user_mode_controller.dart:4-18](file://lib/features/auth/controller/user_mode_controller.dart#L4-L18)
- [register_repo.dart:9-38](file://lib/features/auth/repositories/register_repo.dart#L9-L38)
- [register_model.dart:1-74](file://lib/features/auth/models/register_model.dart#L1-L74)
- [name_validator.dart:1-15](file://lib/shared/extensions/validators/name_validator.dart#L1-L15)
- [email_validator.dart:1-14](file://lib/shared/extensions/validators/email_validator.dart#L1-L14)
- [password_validator.dart:1-11](file://lib/shared/extensions/validators/password_validator.dart#L1-L11)
- [confirm_password_validator.dart:1-11](file://lib/shared/extensions/validators/confirm_password_validator.dart#L1-L11)
- [post_with_response.dart](file://lib/core/data/networks/post_with_response.dart)
- [headers_manager.dart](file://lib/core/data/networks/headers_manager.dart)
- [storage_service.dart](file://lib/core/data/local/storage_service.dart)
- [app_routes.dart](file://lib/core/routes/app_routes.dart)

**Section sources**
- [signup_option_view.dart:18-123](file://lib/features/auth/views/signup_option_view.dart#L18-L123)
- [signup_view.dart:18-96](file://lib/features/auth/views/signup_view.dart#L18-L96)
- [signup_form.dart:15-103](file://lib/features/auth/widgets/signup_form.dart#L15-L103)
- [signup_option_controller.dart:3-5](file://lib/features/auth/controller/signup_option_controller.dart#L3-L5)
- [signup_controller.dart:10-66](file://lib/features/auth/controller/signup_controller.dart#L10-L66)
- [user_mode_controller.dart:4-18](file://lib/features/auth/controller/user_mode_controller.dart#L4-L18)
- [register_repo.dart:9-38](file://lib/features/auth/repositories/register_repo.dart#L9-L38)
- [register_model.dart:1-74](file://lib/features/auth/models/register_model.dart#L1-L74)
- [name_validator.dart:1-15](file://lib/shared/extensions/validators/name_validator.dart#L1-L15)
- [email_validator.dart:1-14](file://lib/shared/extensions/validators/email_validator.dart#L1-L14)
- [password_validator.dart:1-11](file://lib/shared/extensions/validators/password_validator.dart#L1-L11)
- [confirm_password_validator.dart:1-11](file://lib/shared/extensions/validators/confirm_password_validator.dart#L1-L11)
- [post_with_response.dart](file://lib/core/data/networks/post_with_response.dart)
- [headers_manager.dart](file://lib/core/data/networks/headers_manager.dart)
- [storage_service.dart](file://lib/core/data/local/storage_service.dart)
- [app_routes.dart](file://lib/core/routes/app_routes.dart)

## Core Components
This section outlines the primary building blocks of the Registration System and their responsibilities.

- SignupOptionController: Manages the agreement checkbox state for terms and privacy policy during initial signup option selection.
- SignupController: Orchestrates the registration flow, validates form data, invokes the repository, handles loading states, and manages navigation and storage upon success.
- RegisterRepository: Encapsulates the API call to the backend, constructs request payloads, and parses responses into typed models.
- RegisterModel: Defines the shape of the registration response, including token and user metadata.
- UserModeController: Provides user mode selection (personal/business) and associated UI labels and icons.
- SignupView and SignupForm: Render the registration UI, collect inputs, apply validators, and trigger submission.
- Validation Extensions: Enforce field-specific validation rules for name, email, password, confirm password, and ABN (when applicable).
- Networking Utilities: Provide HTTP POST with response parsing and standardized headers.
- Local Storage: Persists authentication tokens after successful registration.
- Routing: Navigates to the email verification screen after successful registration.

**Section sources**
- [signup_option_controller.dart:3-5](file://lib/features/auth/controller/signup_option_controller.dart#L3-L5)
- [signup_controller.dart:10-66](file://lib/features/auth/controller/signup_controller.dart#L10-L66)
- [register_repo.dart:9-38](file://lib/features/auth/repositories/register_repo.dart#L9-L38)
- [register_model.dart:1-74](file://lib/features/auth/models/register_model.dart#L1-L74)
- [user_mode_controller.dart:4-18](file://lib/features/auth/controller/user_mode_controller.dart#L4-L18)
- [signup_view.dart:18-96](file://lib/features/auth/views/signup_view.dart#L18-L96)
- [signup_form.dart:15-103](file://lib/features/auth/widgets/signup_form.dart#L15-L103)
- [name_validator.dart:1-15](file://lib/shared/extensions/validators/name_validator.dart#L1-L15)
- [email_validator.dart:1-14](file://lib/shared/extensions/validators/email_validator.dart#L1-L14)
- [password_validator.dart:1-11](file://lib/shared/extensions/validators/password_validator.dart#L1-L11)
- [confirm_password_validator.dart:1-11](file://lib/shared/extensions/validators/confirm_password_validator.dart#L1-L11)
- [post_with_response.dart](file://lib/core/data/networks/post_with_response.dart)
- [headers_manager.dart](file://lib/core/data/networks/headers_manager.dart)
- [storage_service.dart](file://lib/core/data/local/storage_service.dart)
- [app_routes.dart](file://lib/core/routes/app_routes.dart)

## Architecture Overview
The Registration System follows a layered architecture:
- Presentation Layer: Views and widgets render the UI and capture user input.
- State Management: GetX controllers manage reactive state for UI updates and business logic coordination.
- Domain Layer: Controllers coordinate validation, state updates, and repository calls.
- Data Layer: Repository encapsulates network requests and response parsing.
- Infrastructure: Networking utilities and local storage provide cross-cutting concerns.

```mermaid
sequenceDiagram
participant User as "User"
participant SOV as "SignupOptionView"
participant SOC as "SignupOptionController"
participant SV as "SignupView"
participant SC as "SignupController"
participant RR as "RegisterRepository"
participant PWR as "PostWithResponse"
participant HM as "HeadersManager"
participant SS as "StorageService"
participant AR as "AppRoutes"
User->>SOV : "Tap Continue"
SOV->>SOC : "Read isChecked"
SOC-->>SOV : "Checkbox state"
SOV->>SV : "Navigate to SignupView"
User->>SV : "Fill form and tap Sign Up"
SV->>SC : "Call register(formKey)"
SC->>SC : "Validate form via FormState"
SC->>RR : "execute(name,email,phone,password,confirmPassword,abn,userType)"
RR->>PWR : "postData(url, headers, body, fromJson)"
PWR->>HM : "Get headers"
PWR-->>RR : "HTTP response"
RR-->>SC : "Either(ErrorModel or RegisterModel)"
SC->>SS : "Persist token"
SC-->>SV : "Show success snackbar"
SC->>AR : "Navigate to EmailVerificationView"
```

**Diagram sources**
- [signup_option_view.dart:77-89](file://lib/features/auth/views/signup_option_view.dart#L77-L89)
- [signup_controller.dart:25-54](file://lib/features/auth/controller/signup_controller.dart#L25-L54)
- [register_repo.dart:14-37](file://lib/features/auth/repositories/register_repo.dart#L14-L37)
- [post_with_response.dart](file://lib/core/data/networks/post_with_response.dart)
- [headers_manager.dart](file://lib/core/data/networks/headers_manager.dart)
- [storage_service.dart](file://lib/core/data/local/storage_service.dart)
- [app_routes.dart](file://lib/core/routes/app_routes.dart)

## Detailed Component Analysis

### Signup Option Selection (Client/Provider)
The signup option screen allows users to choose between personal and business accounts and agree to terms and privacy policy. The selection influences subsequent screens and form fields.

Key behaviors:
- Checkbox state managed by SignupOptionController
- Navigation to the main signup form only when terms are agreed
- Conditional rendering of business-specific fields on the main signup screen

```mermaid
flowchart TD
Start(["Open Signup Option Screen"]) --> Terms["Display Terms & Privacy Checkbox"]
Terms --> UserChoice{"User Agreed?"}
UserChoice --> |No| ShowError["Show Error Snackbar"]
UserChoice --> |Yes| Navigate["Navigate to Signup View"]
Navigate --> End(["Ready to Register"])
ShowError --> End
```

**Diagram sources**
- [signup_option_view.dart:77-89](file://lib/features/auth/views/signup_option_view.dart#L77-L89)
- [signup_option_controller.dart:3-5](file://lib/features/auth/controller/signup_option_controller.dart#L3-L5)

**Section sources**
- [signup_option_view.dart:18-123](file://lib/features/auth/views/signup_option_view.dart#L18-L123)
- [signup_option_controller.dart:3-5](file://lib/features/auth/controller/signup_option_controller.dart#L3-L5)

### User Mode Selection Logic
UserModeController defines two modes:
- Personal Account: Suitable for individuals
- Business Account: Suitable for organizations

The selected index determines:
- UI labels and placeholders in the signup form
- The userType value passed to the backend ("customer" or "business")
- Visibility of ABN field for business accounts

```mermaid
classDiagram
class UserModeController {
+RxInt selectedIndex
+List userItem
}
class SignupForm {
+build(context)
}
class SignupController {
+register(formKey)
}
UserModeController <.. SignupForm : "observes selected index"
UserModeController <.. SignupController : "provides userType"
```

**Diagram sources**
- [user_mode_controller.dart:4-18](file://lib/features/auth/controller/user_mode_controller.dart#L4-L18)
- [signup_form.dart:21-98](file://lib/features/auth/widgets/signup_form.dart#L21-L98)
- [signup_controller.dart:35-37](file://lib/features/auth/controller/signup_controller.dart#L35-L37)

**Section sources**
- [user_mode_controller.dart:4-18](file://lib/features/auth/controller/user_mode_controller.dart#L4-L18)
- [signup_form.dart:21-98](file://lib/features/auth/widgets/signup_form.dart#L21-L98)
- [signup_controller.dart:35-37](file://lib/features/auth/controller/signup_controller.dart#L35-L37)

### Form Validation and Field Requirements
The signup form enforces strict validation rules for each field. Validation occurs on user interaction and is applied conditionally based on user mode.

Required fields:
- Full Name: Minimum length and alphabetic characters only
- Email: RFC-compliant format
- Password: Minimum length requirement
- Confirm Password: Must match the password field
- Phone Number: Numeric and formatted appropriately
- ABN Number: Required only for business accounts

```mermaid
flowchart TD
Start(["User submits form"]) --> ValidateName["Validate Name"]
ValidateName --> NameValid{"Name valid?"}
NameValid --> |No| ShowNameError["Show Name Error"]
NameValid --> |Yes| ValidateEmail["Validate Email"]
ValidateEmail --> EmailValid{"Email valid?"}
EmailValid --> |No| ShowEmailError["Show Email Error"]
EmailValid --> |Yes| ValidatePassword["Validate Password"]
ValidatePassword --> PasswordValid{"Password valid?"}
PasswordValid --> |No| ShowPasswordError["Show Password Error"]
PasswordValid --> |Yes| ValidateConfirm["Validate Confirm Password"]
ValidateConfirm --> ConfirmValid{"Passwords match?"}
ConfirmValid --> |No| ShowConfirmError["Show Confirm Password Error"]
ConfirmValid --> |Yes| ValidatePhone["Validate Phone"]
ValidatePhone --> PhoneValid{"Phone valid?"}
PhoneValid --> |No| ShowPhoneError["Show Phone Error"]
PhoneValid --> |Yes| CheckBusiness{"Business Account?"}
CheckBusiness --> |Yes| ValidateABN["Validate ABN"]
ValidateABN --> ABNValid{"ABN valid?"}
ABNValid --> |No| ShowABNError["Show ABN Error"]
ABNValid --> |Yes| Submit["Submit Registration"]
CheckBusiness --> |No| Submit
ShowNameError --> End(["Stop"])
ShowEmailError --> End
ShowPasswordError --> End
ShowConfirmError --> End
ShowPhoneError --> End
ShowABNError --> End
Submit --> End
```

**Diagram sources**
- [signup_form.dart:27-98](file://lib/features/auth/widgets/signup_form.dart#L27-L98)
- [name_validator.dart:1-15](file://lib/shared/extensions/validators/name_validator.dart#L1-L15)
- [email_validator.dart:1-14](file://lib/shared/extensions/validators/email_validator.dart#L1-L14)
- [password_validator.dart:1-11](file://lib/shared/extensions/validators/password_validator.dart#L1-L11)
- [confirm_password_validator.dart:1-11](file://lib/shared/extensions/validators/confirm_password_validator.dart#L1-L11)

**Section sources**
- [signup_form.dart:15-103](file://lib/features/auth/widgets/signup_form.dart#L15-L103)
- [name_validator.dart:1-15](file://lib/shared/extensions/validators/name_validator.dart#L1-L15)
- [email_validator.dart:1-14](file://lib/shared/extensions/validators/email_validator.dart#L1-L14)
- [password_validator.dart:1-11](file://lib/shared/extensions/validators/password_validator.dart#L1-L11)
- [confirm_password_validator.dart:1-11](file://lib/shared/extensions/validators/confirm_password_validator.dart#L1-L11)

### Registration Workflow and API Communication
The registration workflow coordinates UI state, validation, repository calls, and persistence.

```mermaid
sequenceDiagram
participant UI as "SignupView"
participant C as "SignupController"
participant R as "RegisterRepository"
participant Net as "PostWithResponse"
participant H as "HeadersManager"
participant S as "StorageService"
participant Nav as "AppRoutes"
UI->>C : "register(formKey)"
C->>C : "FormState.validate()"
alt "Valid"
C->>R : "execute(name,email,phone,password,confirmPassword,abn,userType)"
R->>Net : "postData(url, headers, body, fromJson)"
Net->>H : "getHeaders()"
Net-->>R : "Parsed RegisterModel"
R-->>C : "Either(ErrorModel or RegisterModel)"
alt "Success"
C->>S : "write(tokenKey, token)"
C-->>UI : "Show success snackbar"
C->>Nav : "toNamed(EmailVerificationView)"
else "Error"
C-->>UI : "Show error snackbar"
end
else "Invalid"
C-->>UI : "Do nothing"
end
```

**Diagram sources**
- [signup_view.dart:78-88](file://lib/features/auth/views/signup_view.dart#L78-L88)
- [signup_controller.dart:25-54](file://lib/features/auth/controller/signup_controller.dart#L25-L54)
- [register_repo.dart:14-37](file://lib/features/auth/repositories/register_repo.dart#L14-L37)
- [post_with_response.dart](file://lib/core/data/networks/post_with_response.dart)
- [headers_manager.dart](file://lib/core/data/networks/headers_manager.dart)
- [storage_service.dart](file://lib/core/data/local/storage_service.dart)
- [app_routes.dart](file://lib/core/routes/app_routes.dart)

**Section sources**
- [signup_view.dart:18-96](file://lib/features/auth/views/signup_view.dart#L18-L96)
- [signup_controller.dart:10-66](file://lib/features/auth/controller/signup_controller.dart#L10-L66)
- [register_repo.dart:9-38](file://lib/features/auth/repositories/register_repo.dart#L9-L38)
- [register_model.dart:1-74](file://lib/features/auth/models/register_model.dart#L1-L74)

### Data Persistence and Token Management
On successful registration, the system persists the authentication token locally and navigates to the email verification screen. This ensures the user can proceed with the verification flow without re-authentication.

Key steps:
- Persist token using StorageService
- Show success snackbar
- Navigate to email verification route

**Section sources**
- [signup_controller.dart:44-51](file://lib/features/auth/controller/signup_controller.dart#L44-L51)
- [storage_service.dart](file://lib/core/data/local/storage_service.dart)
- [app_routes.dart](file://lib/core/routes/app_routes.dart)

### Firebase Authentication Integration
The project includes a Firebase Google authentication service file, indicating potential integration points for social sign-in alongside email/password registration. While the current registration flow uses the custom backend, Firebase services can complement the system for additional authentication methods.

**Section sources**
- [firebase_google_auth.dart](file://lib/core/services/firebase_google_auth.dart)

## Dependency Analysis
The Registration System exhibits clear separation of concerns with low coupling and high cohesion among components.

```mermaid
graph TB
SOC["SignupOptionController"] --> SOV["SignupOptionView"]
UMC["UserModeController"] --> SV["SignupView"]
UMC --> SFC["SignupForm"]
SC["SignupController"] --> SV
SC --> RR["RegisterRepository"]
SFC --> NV["NameValidator"]
SFC --> EV["EmailValidator"]
SFC --> PV["PasswordValidator"]
SFC --> CPV["ConfirmPasswordValidator"]
RR --> PWR["PostWithResponse"]
RR --> HM["HeadersManager"]
RR --> RM["RegisterModel"]
SC --> SS["StorageService"]
SC --> AR["AppRoutes"]
```

**Diagram sources**
- [signup_option_controller.dart:3-5](file://lib/features/auth/controller/signup_option_controller.dart#L3-L5)
- [signup_option_view.dart:18-123](file://lib/features/auth/views/signup_option_view.dart#L18-L123)
- [user_mode_controller.dart:4-18](file://lib/features/auth/controller/user_mode_controller.dart#L4-L18)
- [signup_view.dart:18-96](file://lib/features/auth/views/signup_view.dart#L18-L96)
- [signup_form.dart:15-103](file://lib/features/auth/widgets/signup_form.dart#L15-L103)
- [signup_controller.dart:10-66](file://lib/features/auth/controller/signup_controller.dart#L10-L66)
- [register_repo.dart:9-38](file://lib/features/auth/repositories/register_repo.dart#L9-L38)
- [register_model.dart:1-74](file://lib/features/auth/models/register_model.dart#L1-L74)
- [name_validator.dart:1-15](file://lib/shared/extensions/validators/name_validator.dart#L1-L15)
- [email_validator.dart:1-14](file://lib/shared/extensions/validators/email_validator.dart#L1-L14)
- [password_validator.dart:1-11](file://lib/shared/extensions/validators/password_validator.dart#L1-L11)
- [confirm_password_validator.dart:1-11](file://lib/shared/extensions/validators/confirm_password_validator.dart#L1-L11)
- [post_with_response.dart](file://lib/core/data/networks/post_with_response.dart)
- [headers_manager.dart](file://lib/core/data/networks/headers_manager.dart)
- [storage_service.dart](file://lib/core/data/local/storage_service.dart)
- [app_routes.dart](file://lib/core/routes/app_routes.dart)

**Section sources**
- [signup_controller.dart:10-66](file://lib/features/auth/controller/signup_controller.dart#L10-L66)
- [register_repo.dart:9-38](file://lib/features/auth/repositories/register_repo.dart#L9-L38)
- [signup_view.dart:18-96](file://lib/features/auth/views/signup_view.dart#L18-L96)
- [signup_form.dart:15-103](file://lib/features/auth/widgets/signup_form.dart#L15-L103)

## Performance Considerations
- Reactive UI updates: GetX controllers minimize rebuilds by observing only necessary state variables.
- Network efficiency: Repository consolidates request construction and response parsing to reduce duplication.
- Validation feedback: Immediate validation on user interaction reduces unnecessary submissions.
- Loading states: UI displays a loading indicator during registration to prevent duplicate submissions.

## Security and Data Sanitization
- Input sanitization: Validators enforce minimum lengths and acceptable formats for each field.
- Secure transmission: Headers manager provides standardized headers for secure API communication.
- Token handling: Authentication tokens are persisted securely via StorageService and used for session management.
- Privacy compliance: Terms and privacy policy agreement is enforced before proceeding to registration.

**Section sources**
- [name_validator.dart:1-15](file://lib/shared/extensions/validators/name_validator.dart#L1-L15)
- [email_validator.dart:1-14](file://lib/shared/extensions/validators/email_validator.dart#L1-L14)
- [password_validator.dart:1-11](file://lib/shared/extensions/validators/password_validator.dart#L1-L11)
- [confirm_password_validator.dart:1-11](file://lib/shared/extensions/validators/confirm_password_validator.dart#L1-L11)
- [headers_manager.dart](file://lib/core/data/networks/headers_manager.dart)
- [storage_service.dart](file://lib/core/data/local/storage_service.dart)

## Troubleshooting Guide
Common issues and resolutions:
- Form validation failures: Ensure all required fields meet validation criteria before submission.
- Terms agreement error: The continue button requires the terms checkbox to be checked.
- Network errors: Verify API endpoint availability and headers configuration.
- Token persistence failures: Confirm StorageService is initialized and accessible.
- Navigation issues: Ensure AppRoutes constants are correctly defined and registered.

**Section sources**
- [signup_option_view.dart:108-117](file://lib/features/auth/views/signup_option_view.dart#L108-L117)
- [signup_view.dart:78-88](file://lib/features/auth/views/signup_view.dart#L78-L88)
- [signup_controller.dart:40-52](file://lib/features/auth/controller/signup_controller.dart#L40-L52)
- [register_repo.dart:23-36](file://lib/features/auth/repositories/register_repo.dart#L23-L36)
- [storage_service.dart](file://lib/core/data/local/storage_service.dart)
- [app_routes.dart](file://lib/core/routes/app_routes.dart)

## Conclusion
The Registration System provides a robust, validated, and secure user onboarding experience. It leverages GetX for reactive state management, encapsulates network concerns in a dedicated repository, and integrates seamlessly with local storage and routing. The modular design supports future enhancements, such as integrating Firebase authentication services, while maintaining clear separation of concerns and strong validation practices.