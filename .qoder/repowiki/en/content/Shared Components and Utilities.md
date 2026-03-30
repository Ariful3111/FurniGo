# Shared Components and Utilities

<cite>
**Referenced Files in This Document**
- [main.dart](file://lib/main.dart)
- [pubspec.yaml](file://pubspec.yaml)
- [colors.dart](file://lib/core/constant/colors.dart)
- [custom_primary_button.dart](file://lib/shared/widgets/custom_button/custom_primary_button.dart)
- [custom_secondary_button.dart](file://lib/shared/widgets/custom_button/custom_secondary_button.dart)
- [custom_text_form_field.dart](file://lib/shared/widgets/custom_form_field/custom_text_form_field.dart)
- [button_loading.dart](file://lib/shared/widgets/custom_loadings/button_loading.dart)
- [custom_pagination.dart](file://lib/shared/widgets/custom_pagination/custom_pagination.dart)
- [email_validator.dart](file://lib/shared/extensions/validators/email_validator.dart)
- [date_formatter.dart](file://lib/shared/extensions/formatters/date_formatter.dart)
- [estimate_delivery_extractor.dart](file://lib/shared/extensions/extractors/estimate_delivery_extractor.dart)
- [custom_payment_dialog.dart](file://lib/shared/widgets/custom_dialog/custom_payment_dialog.dart)
- [rent_request_next.dart](file://lib/features/rent_request/widgets/rent_request_view_widgets/rent_request_next.dart)
- [rent_step_controller.dart](file://lib/features/rent_request/controllers/rent_step_controller.dart)
- [storage_service.dart](file://lib/core/data/local/storage_service.dart)
- [rent_request_controller.dart](file://lib/features/rent_request/controllers/rent_request_controller.dart)
- [step_zero_repo.dart](file://lib/features/rent_request/repositories/step_zero_repo.dart)
- [rent_helper.dart](file://lib/features/rent_request/widgets/rent_helper.dart)
- [rent_submit_dialog.dart](file://lib/features/rent_request/widgets/rent_submit_dialog.dart)
</cite>

## Update Summary
**Changes Made**
- Added documentation for RentRequestNext widget with enhanced loading state support
- Updated RentStepController documentation to reflect async step navigation integration
- Added StorageService documentation with rentRequestUUID constant for persistent rental request identifier storage
- Updated RentRequestController documentation to show async request submission flow
- Enhanced component architecture overview with new rental request flow components

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
10. [Appendices](#appendices)

## Introduction
This document describes the shared components and utility systems in ZB-DEZINE. It focuses on reusable UI components such as custom buttons, form fields, dialogs, loading indicators, and pagination. It also covers validation and formatting utilities, helper extensions, and extension methods. The guide explains component architecture, prop interfaces, event handling, customization options, composition patterns, accessibility considerations, responsive design, and guidelines for extending existing components and building new shared utilities.

**Updated** Enhanced with documentation for the new rental request flow components including RentRequestNext widget with loading state support and StorageService with persistent rental request identifier storage.

## Project Structure
The shared components live under the shared directory, organized by feature families:
- widgets/custom_button: Primary and secondary buttons with theming and typography.
- widgets/custom_form_field: Reusable form fields with extensive customization.
- widgets/custom_loadings: Loading indicators tailored for actions.
- widgets/custom_pagination: Pagination controls with dynamic page rendering.
- widgets/custom_dialog: Payment and feedback dialogs.
- extensions/validators: Validation helpers for common inputs.
- extensions/formatters: Formatting helpers for dates and relative time.
- extensions/extractors: Domain-specific extractors for order-related data.
- features/rent_request: Complete rental request flow with step navigation and async operations.

```mermaid
graph TB
subgraph "Shared Widgets"
CB1["CustomPrimaryButton"]
CB2["CustomSecondaryButton"]
CFF["CustomTextFormField"]
BL["ButtonLoading"]
CP["CustomPagination"]
CPD["CustomPaymentDialog"]
end
subgraph "Extensions"
EV["EmailValidator"]
DF["DateFormatter"]
EDE["EstimatedDeliveryExtractor"]
end
subgraph "Theme & Constants"
AC["AppColors"]
end
subgraph "Rental Request Flow"
RNN["RentRequestNext"]
RSC["RentStepController"]
SS["StorageService"]
RC["RentRequestController"]
RH["RentHelper"]
RSD["RentSubmitDialog"]
end
CB1 --> AC
CB2 --> AC
CFF --> AC
BL --> AC
CPD --> AC
CFF --> EV
CPD --> EDE
RNN --> RSC
RNN --> BL
RNN --> RH
RC --> SS
RSC --> RC
RSC --> RSD
```

**Diagram sources**
- [custom_primary_button.dart:1-74](file://lib/shared/widgets/custom_button/custom_primary_button.dart#L1-L74)
- [custom_secondary_button.dart:1-88](file://lib/shared/widgets/custom_button/custom_secondary_button.dart#L1-L88)
- [custom_text_form_field.dart:1-191](file://lib/shared/widgets/custom_form_field/custom_text_form_field.dart#L1-L191)
- [button_loading.dart:1-36](file://lib/shared/widgets/custom_loadings/button_loading.dart#L1-L36)
- [custom_pagination.dart:1-87](file://lib/shared/widgets/custom_pagination/custom_pagination.dart#L1-L87)
- [custom_payment_dialog.dart:1-94](file://lib/shared/widgets/custom_dialog/custom_payment_dialog.dart#L1-L94)
- [email_validator.dart:1-14](file://lib/shared/extensions/validators/email_validator.dart#L1-L14)
- [date_formatter.dart:1-54](file://lib/shared/extensions/formatters/date_formatter.dart#L1-L54)
- [estimate_delivery_extractor.dart:1-39](file://lib/shared/extensions/extractors/estimate_delivery_extractor.dart#L1-L39)
- [colors.dart:1-117](file://lib/core/constant/colors.dart#L1-L117)
- [rent_request_next.dart:1-61](file://lib/features/rent_request/widgets/rent_request_view_widgets/rent_request_next.dart#L1-L61)
- [rent_step_controller.dart:1-96](file://lib/features/rent_request/controllers/rent_step_controller.dart#L1-L96)
- [storage_service.dart:1-24](file://lib/core/data/local/storage_service.dart#L1-L24)
- [rent_request_controller.dart:1-68](file://lib/features/rent_request/controllers/rent_request_controller.dart#L1-L68)
- [rent_helper.dart:1-41](file://lib/features/rent_request/widgets/rent_helper.dart#L1-L41)
- [rent_submit_dialog.dart:1-66](file://lib/features/rent_request/widgets/rent_submit_dialog.dart#L1-L66)

**Section sources**
- [main.dart:1-47](file://lib/main.dart#L1-L47)
- [pubspec.yaml:30-66](file://pubspec.yaml#L30-L66)

## Core Components
This section summarizes the reusable UI components and their primary responsibilities.

- CustomPrimaryButton
  - Purpose: Prominent call-to-action with theming and typography.
  - Key props: size, colors, border radius, padding, shadow, child widget, font weight.
  - Behavior: Uses theme brightness to select appropriate colors; supports custom decoration or defaults to brand colors.

- CustomSecondaryButton
  - Purpose: Secondary actions with icon and label.
  - Key props: icon asset, sizes, colors, border radius, padding, shadow.
  - Behavior: Renders icon and text in a row; applies theme-aware tinting.

- CustomTextFormField
  - Purpose: Consistent, theme-aware form field with extensive customization.
  - Key props: controller, hints, label, prefix/suffix icons, obscure text, keyboard type, validation, styling, borders, fill color.
  - Behavior: Applies theme-aware colors and typography; integrates with Google Fonts.

- ButtonLoading
  - Purpose: Loading indicator for actions.
  - Key props: padding, color, size.
  - Behavior: Centers a spinner with theme-aware color.

- CustomPagination
  - Purpose: Page navigation with dynamic page range and navigation arrows.
  - Key props: current page (Rx), total pages.
  - Behavior: Renders numbered pages and ellipses; updates reactive current page.

- CustomPaymentDialog
  - Purpose: Payment selection dialog with amount and method list.
  - Key props: icon, title, subtitle, button text, card list, selected card (Rx), selection callback.
  - Behavior: Dialog with shadow and theme-aware background; composes payment method component.

**Updated** Added RentRequestNext widget for enhanced step navigation with loading state support and async operation integration.

- RentRequestNext
  - Purpose: Navigation button for rental request flow with conditional rendering based on step position and loading state.
  - Key props: None (uses controller state internally).
  - Behavior: Shows Submit Request button on last step, ButtonLoading during async operations, or Next button with arrow icon otherwise.

**Section sources**
- [custom_primary_button.dart:6-74](file://lib/shared/widgets/custom_button/custom_primary_button.dart#L6-L74)
- [custom_secondary_button.dart:6-88](file://lib/shared/widgets/custom_button/custom_secondary_button.dart#L6-L88)
- [custom_text_form_field.dart:7-191](file://lib/shared/widgets/custom_form_field/custom_text_form_field.dart#L7-L191)
- [button_loading.dart:6-36](file://lib/shared/widgets/custom_loadings/button_loading.dart#L6-L36)
- [custom_pagination.dart:7-87](file://lib/shared/widgets/custom_pagination/custom_pagination.dart#L7-L87)
- [custom_payment_dialog.dart:9-94](file://lib/shared/widgets/custom_dialog/custom_payment_dialog.dart#L9-L94)
- [rent_request_next.dart:11-61](file://lib/features/rent_request/widgets/rent_request_view_widgets/rent_request_next.dart#L11-L61)

## Architecture Overview
The shared components follow a consistent pattern:
- Props-first design: All customization is exposed via constructor parameters.
- Theme-aware rendering: Components check brightness and apply appropriate colors from AppColors.
- Composition: Components often wrap smaller shared text widgets or reuse common styling logic.
- Reactive updates: Pagination uses GetX reactive integers for current page.
- Async operation support: Enhanced with loading states and error handling for network operations.

**Updated** The architecture now includes a comprehensive rental request flow with step-based navigation, async validation, and persistent storage integration.

```mermaid
classDiagram
class CustomPrimaryButton {
+double? height
+double? width
+String text
+VoidCallback onPressed
+Color? backgroundColor
+Color? textColor
+BorderRadius? borderRadius
+BoxDecoration? boxDecoration
+Widget? child
+FontWeight? fontWeight
+EdgeInsets? padding
+BoxBorder? border
+BoxShadow[]? boxShadow
}
class CustomSecondaryButton {
+double? height
+double? width
+double? iconHeight
+double? iconWidth
+String text
+String icon
+VoidCallback onPressed
+Color? backgroundColor
+Color? textColor
+Color? iconColor
+double? radius
+BoxDecoration? boxDecoration
+Widget? child
+FontWeight? fontWeight
+EdgeInsets? padding
+BoxBorder? border
+BoxShadow[]? boxShadow
}
class CustomTextFormField {
+TextEditingController controller
+String? hintText
+Widget? hintTextWidget
+String? labelText
+Widget? labelTextWidget
+bool? obscureText
+TextInputType? keyboardType
+Color? textColor
+Color? cursorColor
+Color? labelColor
+double? fontSize
+double? labelFontSize
+FontWeight? fontWeight
+String? Function(String?)? validator
+ValueChanged~String~? onChanged
+bool? readOnly
+EdgeInsetsGeometry? padding
+EdgeInsetsGeometry? margin
+AutovalidateMode? validation
+bool? isFilled
+BorderSide? border
+FloatingLabelBehavior? floatingLabelBehavior
+Color? fillColor
+int? maxLength
+int? maxLines
+TextDirection? hintDirection
+bool? isAlignLabelWithHint
+double? fontHeight
+double? cursorHeight
+bool? isDense
+FocusNode? focusNode
+double? borderRadius
+double? borderWidth
+Color? borderColor
+FontWeight? labelFontWeight
}
class ButtonLoading {
+double? verticalPadding
+double? horizontalPadding
+Color? loadingColor
+double? loadingSize
}
class CustomPagination {
+RxInt currentPage
+int totalPage
}
class CustomPaymentDialog {
+String? icon
+String? title
+String? sub
+String? buttonText
+String[] cardList
+RxString selectedCard
+void Function(String?) onSelect
}
class RentRequestNext {
+controller RentStepController
+build() Widget
}
class RentStepController {
+RxInt currentIndex
+RxBool isLoading
+Widget[] rentWidgets
+handleNextStep() Future~void~
+goToPreviousStep() void
+_handleFinalStep() void
}
class StorageService {
+String tokenKey
+String rentRequestUUID
+read() T?
+write() Future~void~
+remove() Future~void~
+clear() Future~void~
}
class RentRequestController {
+submitRentRequest() Future~void~
+initializeData() void
}
CustomPrimaryButton --> AppColors : "uses"
CustomSecondaryButton --> AppColors : "uses"
CustomTextFormField --> AppColors : "uses"
ButtonLoading --> AppColors : "uses"
CustomPaymentDialog --> AppColors : "uses"
RentRequestNext --> RentStepController : "uses"
RentRequestNext --> ButtonLoading : "uses"
RentRequestNext --> RentHelper : "uses"
RentStepController --> RentRequestController : "uses"
RentRequestController --> StorageService : "uses"
```

**Diagram sources**
- [custom_primary_button.dart:6-74](file://lib/shared/widgets/custom_button/custom_primary_button.dart#L6-L74)
- [custom_secondary_button.dart:6-88](file://lib/shared/widgets/custom_button/custom_secondary_button.dart#L6-L88)
- [custom_text_form_field.dart:7-191](file://lib/shared/widgets/custom_form_field/custom_text_form_field.dart#L7-L191)
- [button_loading.dart:6-36](file://lib/shared/widgets/custom_loadings/button_loading.dart#L6-L36)
- [custom_pagination.dart:7-87](file://lib/shared/widgets/custom_pagination/custom_pagination.dart#L7-L87)
- [custom_payment_dialog.dart:9-94](file://lib/shared/widgets/custom_dialog/custom_payment_dialog.dart#L9-L94)
- [colors.dart:3-117](file://lib/core/constant/colors.dart#L3-L117)
- [rent_request_next.dart:11-61](file://lib/features/rent_request/widgets/rent_request_view_widgets/rent_request_next.dart#L11-L61)
- [rent_step_controller.dart:15-96](file://lib/features/rent_request/controllers/rent_step_controller.dart#L15-L96)
- [storage_service.dart:3-24](file://lib/core/data/local/storage_service.dart#L3-L24)
- [rent_request_controller.dart:36-56](file://lib/features/rent_request/controllers/rent_request_controller.dart#L36-L56)

## Detailed Component Analysis

### CustomPrimaryButton
- Props interface
  - Size and layout: height, width, padding.
  - Theming: backgroundColor, textColor, borderRadius, border, boxShadow.
  - Typography: fontSize, fontWeight.
  - Interaction: onPressed, child override.
- Event handling
  - Tap gesture triggers onPressed callback.
- Customization
  - Supports custom child widget to render complex layouts inside the button.
  - Falls back to a centered text label using a shared text widget.
- Accessibility and responsiveness
  - Uses screen-aware units for sizing and padding.
  - Respects theme brightness for color selection.

Usage example pattern
- Integrate with a controller's onPressed handler and pass theme-aware colors.

**Section sources**
- [custom_primary_button.dart:6-74](file://lib/shared/widgets/custom_button/custom_primary_button.dart#L6-L74)
- [colors.dart:3-117](file://lib/core/constant/colors.dart#L3-L117)

### CustomSecondaryButton
- Props interface
  - Icon and text: icon asset path, text, iconHeight, iconWidth.
  - Layout and styling: height, width, backgroundColor, textColor, iconColor, radius, padding, border, boxShadow.
- Behavior
  - Composes an icon and text in a centered row.
  - Applies theme-aware tinting to icon and text.
- Accessibility and responsiveness
  - Uses screen-aware units for sizing and spacing.

Usage example pattern
- Use for secondary actions like "Sign in with provider" with an associated icon asset.

**Section sources**
- [custom_secondary_button.dart:6-88](file://lib/shared/widgets/custom_button/custom_secondary_button.dart#L6-L88)
- [colors.dart:3-117](file://lib/core/constant/colors.dart#L3-L117)

### CustomTextFormField
- Props interface
  - Content: controller, maxLines, maxLength, readOnly, onChanged.
  - Hints and labels: hintText, labelText, hintTextWidget, labelTextWidget.
  - Validation: validator, validation mode, errorText.
  - Styling: textColor, fontSize, fontWeight, labelColor, labelFontSize, labelFontWeight.
  - Borders and fills: border, borderRadius, borderWidth, borderColor, isFilled, fillColor, floatingLabelBehavior, isAlignLabelWithHint.
  - Focus and cursor: focusNode, cursorColor, cursorHeight, isDense.
- Behavior
  - Applies theme-aware colors and typography.
  - Integrates with Google Fonts and a consistent label/text widget.
- Accessibility and responsiveness
  - Supports text direction, dense layout, and cursor customization.

Usage example pattern
- Wrap with a form and pass a validator from the extensions module.

**Section sources**
- [custom_text_form_field.dart:7-191](file://lib/shared/widgets/custom_form_field/custom_text_form_field.dart#L7-L191)
- [colors.dart:3-117](file://lib/core/constant/colors.dart#L3-L117)

### ButtonLoading
- Props interface
  - Spacing: verticalPadding, horizontalPadding.
  - Visual: loadingColor, loadingSize.
- Behavior
  - Renders a spinner with theme-aware color and centering.
- Accessibility and responsiveness
  - Uses screen-aware units for size and padding.

Usage example pattern
- Display during async operations; hide when not busy.

**Section sources**
- [button_loading.dart:6-36](file://lib/shared/widgets/custom_loadings/button_loading.dart#L6-L36)
- [colors.dart:3-117](file://lib/core/constant/colors.dart#L3-L117)

### CustomPagination
- Props interface
  - Reactive: currentPage (RxInt), totalPage (int).
- Behavior
  - Dynamically renders page numbers around the current page.
  - Shows ellipses when not all pages are visible.
  - Provides left/right navigation arrows with disabled states.
- Reactive updates
  - Uses Obx to rebuild when current page changes.

```mermaid
sequenceDiagram
participant U as "User"
participant P as "CustomPagination"
participant N as "NumberButton"
participant S as "State (RxInt)"
U->>P : "Tap arrow or number"
P->>S : "Update current page"
S-->>P : "Obx rebuild"
P->>N : "Render visible pages"
N-->>U : "Updated pagination UI"
```

**Diagram sources**
- [custom_pagination.dart:7-87](file://lib/shared/widgets/custom_pagination/custom_pagination.dart#L7-L87)

**Section sources**
- [custom_pagination.dart:7-87](file://lib/shared/widgets/custom_pagination/custom_pagination.dart#L7-L87)

### CustomPaymentDialog
- Props interface
  - Presentation: icon, title, sub, buttonText.
  - Data: cardList (List<String>), selectedCard (RxString), onSelect (callback).
- Behavior
  - Dialog with theme-aware background and shadow.
  - Displays amount and delegates payment method selection to a composed component.
- Accessibility and responsiveness
  - Full-width dialog with centered content; uses screen-aware units.

Usage example pattern
- Open via Get.dialog and update selected card via the provided callback.

**Section sources**
- [custom_payment_dialog.dart:9-94](file://lib/shared/widgets/custom_dialog/custom_payment_dialog.dart#L9-L94)
- [colors.dart:3-117](file://lib/core/constant/colors.dart#L3-L117)

### RentRequestNext Widget
**Updated** Enhanced with loading state support and async step navigation integration.

- Props interface
  - None (uses controller state internally via GetWidget).
- Behavior
  - Conditional rendering based on step position and loading state.
  - Shows Submit Request button on the last step with RentSubmitDialog.
  - Displays ButtonLoading during async operations.
  - Renders Next button with arrow icon for intermediate steps.
- Integration
  - Uses RentStepController for step management and loading state.
  - Integrates with RentHelper.myButton for consistent button styling.
  - Utilizes ButtonLoading for async operation feedback.

```mermaid
flowchart TD
A[RentRequestNext] --> B{Is Last Step?}
B --> |Yes| C[Show Submit Button]
B --> |No| D{Is Loading?}
D --> |Yes| E[Show ButtonLoading]
D --> |No| F[Show Next Button]
C --> G[RentSubmitDialog]
E --> H[Async Operation]
F --> I[handleNextStep]
```

**Diagram sources**
- [rent_request_next.dart:11-61](file://lib/features/rent_request/widgets/rent_request_view_widgets/rent_request_next.dart#L11-L61)

**Section sources**
- [rent_request_next.dart:11-61](file://lib/features/rent_request/widgets/rent_request_view_widgets/rent_request_next.dart#L11-L61)

### RentStepController
**Updated** Enhanced with async step navigation and loading state management.

- State Management
  - currentIndex: RxInt for current step position.
  - isLoading: RxBool for async operation status.
  - totalSteps: Computed property based on rentWidgets length.
- Step Navigation
  - handleNextStep(): Async method with loading state management.
  - goToPreviousStep(): Simple step decrement.
  - resetFlow(): Resets to initial step.
- Async Operations
  - Manages loading state during async operations.
  - Integrates with RentRequestController for form submission.
  - Handles step-specific async operations in switch statement.

**Section sources**
- [rent_step_controller.dart:15-96](file://lib/features/rent_request/controllers/rent_step_controller.dart#L15-L96)

### StorageService
**Updated** Added rentRequestUUID constant for persistent rental request identifier storage.

- Storage Keys
  - tokenKey: "token" for authentication tokens.
  - rentRequestUUID: "rent_request_uuid" for persistent rental request identifiers.
- Operations
  - read<T>(): Type-safe key-value retrieval.
  - write(): Asynchronous key-value storage.
  - remove(): Key removal from storage.
  - clear(): Complete storage clearing.
- Usage Pattern
  - Used by RentRequestController to persist rental request UUID.
  - Enables offline access and session persistence.

**Section sources**
- [storage_service.dart:3-24](file://lib/core/data/local/storage_service.dart#L3-L24)

### RentRequestController
**Updated** Enhanced with async request submission and storage integration.

- Form Management
  - Form key for validation coordination.
  - Initialize user data from authenticated user.
- Async Submission
  - submitRentRequest(): Validates form and submits to backend.
  - Uses StepZeroRepository for network communication.
  - Persists rental request UUID via StorageService.
  - Navigates to next step upon successful submission.
- Error Handling
  - Uses ErrorSnackbar for error display.
  - Proper error propagation through Either type.

**Section sources**
- [rent_request_controller.dart:36-56](file://lib/features/rent_request/controllers/rent_request_controller.dart#L36-L56)

### RentHelper
- Utility Functions
  - optionContainer(): Creates styled container with rounded corners and padding.
  - myButton(): Generic button component with consistent styling and tap handling.
- Integration
  - Used by RentRequestNext for consistent button appearance.
  - Provides reusable button styling across rental request flow.

**Section sources**
- [rent_helper.dart:7-41](file://lib/features/rent_request/widgets/rent_helper.dart#L7-L41)

### RentSubmitDialog
- Purpose: Confirmation dialog for rental request submission.
- Content: Success icon, confirmation message, estimated review time.
- Integration: Triggered by RentRequestNext on last step.
- Styling: Uses AppColors for consistent theming.

**Section sources**
- [rent_submit_dialog.dart:7-66](file://lib/features/rent_request/widgets/rent_submit_dialog.dart#L7-L66)

### Validation Utilities
- EmailValidator
  - Function: Validates email presence and format.
  - Returns null on success or an error message string.

Usage example pattern
- Pass to CustomTextFormField.validator for email inputs.

**Section sources**
- [email_validator.dart:1-14](file://lib/shared/extensions/validators/email_validator.dart#L1-L14)

### Formatting Utilities
- DateFormatter
  - Methods:
    - toFormattedDate: ISO 8601 to "MMM dd, yyyy".
    - toFormattedDateTime: ISO 8601 to "MMM dd, yyyy hh:mm a".
    - toRelativeTime: Relative time like "2 days ago", "Just now".

Usage example pattern
- Apply to model strings before displaying.

**Section sources**
- [date_formatter.dart:3-54](file://lib/shared/extensions/formatters/date_formatter.dart#L3-L54)

### Extractor Utilities
- EstimatedDeliveryExtractor
  - Method: calculateEstimatedDelivery
    - Parses order creation date and delivery window.
    - Computes min/max delivery dates and formats as "Month D – Month D, YYYY".

Usage example pattern
- Call on order data to present estimated delivery range.

**Section sources**
- [estimate_delivery_extractor.dart:5-39](file://lib/shared/extensions/extractors/estimate_delivery_extractor.dart#L5-L39)

## Dependency Analysis
Shared components depend on:
- AppColors for theme-aware colors.
- Flutter SDK and third-party packages for UI and utilities.
- GetX for reactive state in pagination and rental request flow.
- ScreenUtil for responsive sizing.
- GetStorage for persistent storage in rental request flow.

**Updated** Enhanced dependency graph with rental request flow components and storage integration.

```mermaid
graph LR
AC["AppColors"] --> CPB["CustomPrimaryButton"]
AC --> CSB["CustomSecondaryButton"]
AC --> CTFF["CustomTextFormField"]
AC --> BL["ButtonLoading"]
AC --> CPD["CustomPaymentDialog"]
AC --> RNN["RentRequestNext"]
G["GetX (RxInt/RxString)"] --> CP["CustomPagination"]
G --> RSC["RentStepController"]
SU["flutter_screenutil"] --> CPB
SU --> CSB
SU --> CTFF
SU --> BL
SU --> CPD
SU --> RNN
SP["flutter_spinkit"] --> BL
GF["google_fonts"] --> CTFF
GS["get_storage"] --> SS["StorageService"]
SS --> RC["RentRequestController"]
RNN --> RSC
RNN --> RH["RentHelper"]
RSC --> RC
RC --> SS
```

**Diagram sources**
- [colors.dart:3-117](file://lib/core/constant/colors.dart#L3-L117)
- [custom_primary_button.dart:1-74](file://lib/shared/widgets/custom_button/custom_primary_button.dart#L1-L74)
- [custom_secondary_button.dart:1-88](file://lib/shared/widgets/custom_button/custom_secondary_button.dart#L1-L88)
- [custom_text_form_field.dart:1-191](file://lib/shared/widgets/custom_form_field/custom_text_form_field.dart#L1-L191)
- [button_loading.dart:1-36](file://lib/shared/widgets/custom_loadings/button_loading.dart#L1-L36)
- [custom_pagination.dart:1-87](file://lib/shared/widgets/custom_pagination/custom_pagination.dart#L1-L87)
- [custom_payment_dialog.dart:1-94](file://lib/shared/widgets/custom_dialog/custom_payment_dialog.dart#L1-L94)
- [rent_request_next.dart:1-61](file://lib/features/rent_request/widgets/rent_request_view_widgets/rent_request_next.dart#L1-L61)
- [rent_step_controller.dart:1-96](file://lib/features/rent_request/controllers/rent_step_controller.dart#L1-L96)
- [storage_service.dart:1-24](file://lib/core/data/local/storage_service.dart#L1-L24)
- [rent_request_controller.dart:1-68](file://lib/features/rent_request/controllers/rent_request_controller.dart#L1-L68)
- [rent_helper.dart:1-41](file://lib/features/rent_request/widgets/rent_helper.dart#L1-L41)
- [pubspec.yaml:37-59](file://pubspec.yaml#L37-L59)

**Section sources**
- [pubspec.yaml:30-66](file://pubspec.yaml#L30-L66)

## Performance Considerations
- Prefer lightweight widgets for lists and paginations to minimize rebuild scope.
- Use reactive props (RxInt/RxString) judiciously; avoid unnecessary global state updates.
- Keep custom decoration and shadows minimal to reduce overdraw.
- Use screen-aware units consistently to avoid layout thrashing on different screen densities.
- Implement proper loading states during async operations to prevent UI blocking.
- Use GetStorage for efficient key-value operations in rental request flow.

**Updated** Added performance considerations for async operations and storage management.

## Troubleshooting Guide
- Buttons appear inverted in dark mode
  - Verify theme brightness detection and color fallbacks.
  - Ensure AppColors constants are defined for dark variants.

- Form fields not validating
  - Confirm validator function returns null for valid input and a non-empty string for invalid input.
  - Set AutovalidateMode appropriately on the form field.

- Pagination not updating
  - Ensure the currentPage prop is a reactive variable and is updated via callbacks.

- Loading indicator not visible
  - Check theme brightness and loadingColor; ensure the widget is rendered during async operations.

**Updated** Added troubleshooting guidance for rental request flow components.

- RentRequestNext not showing loading state
  - Verify RentStepController.isLoading is properly toggled during async operations.
  - Ensure Obx wrapper is correctly accessing controller state.

- Storage not persisting rental request UUID
  - Check StorageService initialization and key naming.
  - Verify async write operations complete successfully.

- Step navigation not working
  - Confirm RentStepController currentIndex is properly managed.
  - Ensure handleNextStep() is awaited in RentRequestNext.

**Section sources**
- [custom_primary_button.dart:39-72](file://lib/shared/widgets/custom_button/custom_primary_button.dart#L39-L72)
- [custom_text_form_field.dart:103-187](file://lib/shared/widgets/custom_form_field/custom_text_form_field.dart#L103-L187)
- [custom_pagination.dart:14-78](file://lib/shared/widgets/custom_pagination/custom_pagination.dart#L14-L78)
- [button_loading.dart:20-35](file://lib/shared/widgets/custom_loadings/button_loading.dart#L20-L35)
- [rent_request_next.dart:16-58](file://lib/features/rent_request/widgets/rent_request_view_widgets/rent_request_next.dart#L16-L58)
- [storage_service.dart:8-22](file://lib/core/data/local/storage_service.dart#L8-L22)
- [rent_step_controller.dart:41-73](file://lib/features/rent_request/controllers/rent_step_controller.dart#L41-L73)

## Conclusion
The shared components and utilities in ZB-DEZINE provide a cohesive, theme-aware foundation for UI development. They emphasize composability, customization, and responsiveness. Validators and formatters enable consistent data handling across the app. The enhanced rental request flow demonstrates advanced patterns for async operations, loading states, and persistent storage integration. Following the patterns described here will help maintain consistency and scalability as new features are added.

**Updated** The addition of RentRequestNext widget and enhanced RentStepController showcases modern Flutter development practices with proper async handling, reactive state management, and user experience optimization.

## Appendices

### Component Composition Patterns
- Prefer small, single-responsibility widgets and compose them into larger components.
- Use props to externalize behavior and appearance; avoid hardcoding values.
- Centralize theme colors in AppColors and derive all component colors from it.
- Implement proper loading states for async operations to maintain UI responsiveness.

**Updated** Added composition patterns for async operations and state management.

### Accessibility Considerations
- Ensure sufficient color contrast in theme-aware modes.
- Provide meaningful labels and hints for form fields.
- Respect text scaling and use responsive units for paddings and sizes.
- Implement proper loading states for screen readers and accessibility tools.

**Updated** Added accessibility considerations for loading states and async operations.

### Responsive Design Implementation
- Use screen-aware units for sizing and spacing.
- Avoid fixed widths; prefer flexible layouts with Spacers and centering.
- Ensure loading indicators are appropriately sized across different screen densities.

**Updated** Added responsive design considerations for loading states.

### Extending Existing Components
- Add new props to constructors with sensible defaults.
- Keep backward compatibility by making new parameters optional.
- Update AppColors if introducing new brand colors.
- Implement proper error handling and loading states for async operations.

**Updated** Added guidelines for extending components with async capabilities.

### Creating New Shared Utilities
- Place validators and formatters under extensions with clear method names.
- Encapsulate domain-specific extractors as extensions on model types.
- Export utilities from a central library file if needed for broader access.
- Implement proper error handling and logging for async operations.

**Updated** Added guidelines for creating utilities with async and storage capabilities.