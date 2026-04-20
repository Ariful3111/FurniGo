# Data Layer Architecture

<cite>
**Referenced Files in This Document**
- [pubspec.yaml](file://pubspec.yaml)
- [main.dart](file://main.dart)
- [dependency_injection.dart](file://core/di/dependency_injection.dart)
- [networks_path.dart](file://core/constant/networks_path.dart)
- [storage_service.dart](file://core/data/local/storage_service.dart)
- [headers_manager.dart](file://core/data/networks/headers_manager.dart)
- [get_network.dart](file://core/data/networks/get_network.dart)
- [post_with_response.dart](file://core/data/networks/post_with_response.dart)
- [post_without_response.dart](file://core/data/networks/post_without_response.dart)
- [delete_network.dart](file://core/data/networks/delete_network.dart)
- [error_model.dart](file://core/data/global_models/error_model.dart)
- [user_profile_model.dart](file://core/data/global_models/user_profile_model.dart)
- [google_user_info_model.dart](file://core/data/global_models/google_user_info_model.dart)
- [step_zero_repo.dart](file://features/rent_request/repositories/step_zero_repo.dart)
- [login_repo.dart](file://features/auth/repositories/login_repo.dart)
- [get_products_by_type_repo.dart](file://features/home/repositories/get_products_by_type_repo.dart)
- [get_profile_repo.dart](file://features/profile/repositories/get_profile_repo.dart)
- [update_address_repo.dart](file://features/profile/repositories/update_address_repo.dart)
- [delete_address_repo.dart](file://features/profile/repositories/delete_address_repo.dart)
- [step_zero_model.dart](file://features/rent_request/models/step_zero_model.dart)
- [home_bindings.dart](file://features/home/bindings/home_bindings.dart)
- [order_bindings.dart](file://features/order/bindings/order_bindings.dart)
- [rental_bindings.dart](file://features/rental/bindings/rental_bindings.dart)
- [rent_bindings.dart](file://features/rent_request/bindings/rent_bindings.dart)
- [auth_bindings.dart](file://features/auth/bindings/auth_bindings.dart)
- [products_model.dart](file://features/home/models/products_model.dart)
- [product_types_model.dart](file://features/home/models/product_types_model.dart)
- [product_attributes_repo.dart](file://features/product_details.dart/repositories/product_attributes_repo.dart)
- [products_attributes_controller.dart](file://features/product_details.dart/controller/products_attributes_controller.dart)
- [product_attributes_model.dart](file://features/product_details.dart/models/product_attributes_model.dart)
- [product_details_bindings.dart](file://features/product_details.dart/bindings/product_details_bindings.dart)
- [cart_bindings.dart](file://features/cart/bindings/cart_bindings.dart)
- [get_cart_repo.dart](file://features/cart/repositories/get_cart_repo.dart)
- [add_to_cart_repo.dart](file://features/cart/repositories/add_to_cart_repo.dart)
- [cart_controller.dart](file://features/cart/controller/cart_controller.dart)
- [add_to_cart_controller.dart](file://features/cart/controller/add_to_cart_controller.dart)
- [cart_model.dart](file://features/cart/models/cart_model.dart)
- [cart_view.dart](file://features/cart/views/cart_view.dart)
- [cart_item.dart](file://features/cart/widgets/cart_view_widgets/cart_item.dart)
- [cart_item_info.dart](file://features/cart/widgets/cart_view_widgets/cart_item_info.dart)
- [cart_order_summery.dart](file://features/cart/widgets/cart_view_widgets/cart_order_summery.dart)
- [cart_select_item.dart](file://features/cart/widgets/cart_view_widgets/cart_select_item.dart)
- [bottom_nav_cart_item.dart](file://features/home/widgets/bottom_nav_widgets/bottom_nav_cart_item.dart)
- [bottom_nav_controller.dart](file://features/home/controller/bottom_nav_controller.dart)
- [bottom_nav_view.dart](file://features/home/views/bottom_nav_view.dart)
- [product_details_cart.dart](file://features/product_details.dart/widgets/product_details_view_widgets/product_details_cart.dart)
</cite>

## Update Summary
**Changes Made**
- Added comprehensive cart management system with AddToCartRepository and GetCartRepository
- Implemented API-driven cart functionality with proper separation of concerns
- Enhanced error handling using fpdart Either type across all cart operations
- Integrated cart controllers with reactive state management using GetX
- Added cart models with nested CartItem and CartOption structures
- Implemented cart view with item management, quantity controls, and order summary
- Added bottom navigation cart integration with badge count display
- Integrated cart functionality with product details page for seamless shopping experience

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
This document describes the ZB-DEZINE data layer architecture with a focus on network services, local storage, and integration patterns. It explains HTTP client configuration, request/response handling, error management, and how repositories and controllers consume these services. It also covers data serialization/deserialization, offline handling via persistent storage, and practical patterns for caching and synchronization.

**Updated** Enhanced error handling with FP Dart's Either type throughout the architecture, demonstrating clean repository patterns with consistent functional error handling across all network operations. Added comprehensive cart management system with AddToCartRepository and GetCartRepository, implementing API-driven cart functionality with proper separation of concerns between models, controllers, and repositories.

## Project Structure
The data layer is organized under core/data with subfolders for networks and local storage, and global models for domain entities. Dependency injection registers services globally for use across features. Repository implementations demonstrate clean separation of concerns with functional error handling. The new cart feature adds specialized repositories and controllers for cart management, integrated with the product details and home navigation systems.

```mermaid
graph TB
subgraph "Core/Data"
subgraph "Local"
S["storage_service.dart"]
TS["theme_service.dart"]
end
subgraph "Networks"
G["get_network.dart"]
PW["post_with_response.dart"]
PWO["post_without_response.dart"]
D["delete_network.dart"]
H["headers_manager.dart"]
NP["networks_path.dart"]
end
EM["error_model.dart"]
UPM["user_profile_model.dart"]
GUI["google_user_info_model.dart"]
PM["products_model.dart"]
PTM["product_types_model.dart"]
CM["cart_model.dart"]
end
subgraph "Repositories"
SZR["StepZeroRepository"]
LR["LoginRepository"]
GPSR["GetProductsByTypeRepository"]
GPR["GetProfileRepository"]
UAR["UpdateAddressRepository"]
DAR["DeleteAddressRepository"]
PAR["ProductAttributesRepository"]
GCR["GetCartRepository"]
ATCR["AddToCartRepository"]
end
subgraph "Controllers"
PDC["ProductDetailsController"]
PAC["ProductAttributesController"]
CC["CartController"]
ATCC["AddToCartController"]
end
subgraph "Cart Feature"
CV["CartView"]
CIT["CartItem"]
CIS["CartItemInfo"]
COS["CartOrderSummery"]
CSI["CartSelectItem"]
end
subgraph "DI"
DI["dependency_injection.dart"]
PDB["product_details_bindings.dart"]
CB["cart_bindings.dart"]
BNC["bottom_nav_controller.dart"]
BNV["bottom_nav_view.dart"]
end
subgraph "App"
M["main.dart"]
end
M --> DI
DI --> S
DI --> TS
DI --> G
DI --> PW
DI --> PWO
DI --> D
G --> NP
PW --> NP
PWO --> NP
D --> NP
H --> S
G --> EM
PW --> EM
PWO --> EM
D --> EM
SZR --> PW
LR --> PW
GPSR --> G
GPR --> G
UAR --> PWO
DAR --> PWO
PAR --> G
GCR --> G
ATCR --> PWO
CC --> GCR
ATCC --> ATCR
PDC --> PAC
PAC --> PAR
CV --> CC
CIT --> CC
CIS --> CC
COS --> CC
CSI --> CC
CB --> GCR
CB --> ATCR
CB --> CC
CB --> ATCC
PDB --> PAR
PDB --> PAC
BNC --> CV
BNV --> BNC
```

**Diagram sources**
- [main.dart:12-19](file://main.dart#L12-L19)
- [dependency_injection.dart:13-31](file://core/di/dependency_injection.dart#L13-L31)
- [storage_service.dart:3-22](file://core/data/local/storage_service.dart#L3-L22)
- [get_network.dart:8-38](file://core/data/networks/get_network.dart#L8-L38)
- [post_with_response.dart:7-42](file://core/data/networks/post_with_response.dart#L7-L42)
- [post_without_response.dart:9-46](file://core/data/networks/post_without_response.dart#L9-L46)
- [delete_network.dart:8-40](file://core/data/networks/delete_network.dart#L8-L40)
- [headers_manager.dart:4-22](file://core/data/networks/headers_manager.dart#L4-L22)
- [networks_path.dart:1-3](file://core/constant/networks_path.dart#L1-L3)
- [error_model.dart:1-15](file://core/data/global_models/error_model.dart#L1-L15)
- [user_profile_model.dart:1-72](file://core/data/global_models/user_profile_model.dart#L1-L72)
- [google_user_info_model.dart:1-21](file://core/data/global_models/google_user_info_model.dart#L1-L21)
- [products_model.dart:1-274](file://features/home/models/products_model.dart#L1-L274)
- [product_types_model.dart:1-37](file://features/home/models/product_types_model.dart#L1-L37)
- [cart_model.dart:1-165](file://features/cart/models/cart_model.dart#L1-L165)
- [step_zero_repo.dart:9-36](file://features/rent_request/repositories/step_zero_repo.dart#L9-L36)
- [login_repo.dart:9-28](file://features/auth/repositories/login_repo.dart#L9-L28)
- [get_products_by_type_repo.dart:7-21](file://features/home/repositories/get_products_by_type_repo.dart#L7-L21)
- [get_profile_repo.dart:7-19](file://features/profile/repositories/get_profile_repo.dart#L7-L19)
- [update_address_repo.dart:8-23](file://features/profile/repositories/update_address_repo.dart#L8-L23)
- [delete_address_repo.dart:6-18](file://features/profile/repositories/delete_address_repo.dart#L6-L18)
- [product_attributes_repo.dart:1-21](file://features/product_details.dart/repositories/product_attributes_repo.dart#L1-L21)
- [products_attributes_controller.dart:1-40](file://features/product_details.dart/controller/products_attributes_controller.dart#L1-L40)
- [product_attributes_model.dart:1-101](file://features/product_details.dart/models/product_attributes_model.dart#L1-L101)
- [product_details_bindings.dart:1-23](file://features/product_details.dart/bindings/product_details_bindings.dart#L1-L23)
- [cart_bindings.dart:1-11](file://features/cart/bindings/cart_bindings.dart#L1-L11)
- [get_cart_repo.dart:1-19](file://features/cart/repositories/get_cart_repo.dart#L1-L19)
- [add_to_cart_repo.dart:1-29](file://features/cart/repositories/add_to_cart_repo.dart#L1-L29)
- [cart_controller.dart:1-51](file://features/cart/controller/cart_controller.dart#L1-L51)
- [add_to_cart_controller.dart:1-40](file://features/cart/controller/add_to_cart_controller.dart#L1-L40)
- [cart_view.dart:1-66](file://features/cart/views/cart_view.dart#L1-L66)
- [cart_item.dart:1-103](file://features/cart/widgets/cart_view_widgets/cart_item.dart#L1-L103)
- [cart_item_info.dart:1-105](file://features/cart/widgets/cart_view_widgets/cart_item_info.dart#L1-L105)
- [cart_order_summery.dart:1-93](file://features/cart/widgets/cart_view_widgets/cart_order_summery.dart#L1-L93)
- [cart_select_item.dart:1-53](file://features/cart/widgets/cart_view_widgets/cart_select_item.dart#L1-L53)
- [bottom_nav_cart_item.dart:1-75](file://features/home/widgets/bottom_nav_widgets/bottom_nav_cart_item.dart#L1-L75)
- [bottom_nav_controller.dart:1-18](file://features/home/controller/bottom_nav_controller.dart#L1-L18)
- [bottom_nav_view.dart:1-81](file://features/home/views/bottom_nav_view.dart#L1-L81)
- [product_details_cart.dart:1-213](file://features/product_details.dart/widgets/product_details_view_widgets/product_details_cart.dart#L1-L213)

**Section sources**
- [pubspec.yaml:44-46](file://pubspec.yaml#L44-L46)
- [main.dart:12-19](file://main.dart#L12-L19)
- [dependency_injection.dart:13-31](file://core/di/dependency_injection.dart#L13-L31)

## Core Components
- Network base configuration: centralized base URL constant.
- HTTP clients: dedicated classes for GET, POST with response, POST without response, and DELETE.
- Local storage: wrapper around GetStorage for token and arbitrary key-value persistence.
- Headers manager: composes Content-Type, Accept, and Authorization headers using stored tokens.
- Error model: unified error representation for HTTP and unknown failures.
- Domain models: typed models for user profile, Google user info, and cart management with enhanced type safety.
- Pagination models: Products model includes Links and Meta for pagination support.
- Repository pattern: clean separation of business logic with functional error handling via Either type.
- **New**: Cart management system: comprehensive cart functionality with specialized repositories and controllers for cart operations.

Key responsibilities:
- Network classes encapsulate HTTP calls, status checks, JSON parsing, and error wrapping with enhanced debugging.
- Storage service persists tokens and other small data.
- Headers manager injects authentication and content-type headers.
- Error model standardizes error handling across services.
- Models use consistent num types for better type safety and numeric precision.
- Repositories provide clean interfaces for controllers with Either-based error handling.
- **New**: Cart repositories handle cart retrieval and item addition with proper error handling and data structures.

**Updated** All repositories now implement a clean pattern with functional error handling using FP Dart's Either type, ensuring consistent error propagation throughout the application. Added comprehensive cart management capabilities through specialized repositories and controllers for shopping cart functionality.

**Section sources**
- [networks_path.dart:1-3](file://core/constant/networks_path.dart#L1-L3)
- [get_network.dart:8-38](file://core/data/networks/get_network.dart#L8-L38)
- [post_with_response.dart:7-42](file://core/data/networks/post_with_response.dart#L7-L42)
- [post_without_response.dart:9-46](file://core/data/networks/post_without_response.dart#L9-L46)
- [delete_network.dart:8-40](file://core/data/networks/delete_network.dart#L8-L40)
- [storage_service.dart:3-22](file://core/data/local/storage_service.dart#L3-L22)
- [headers_manager.dart:4-22](file://core/data/networks/headers_manager.dart#L4-L22)
- [error_model.dart:1-15](file://core/data/global_models/error_model.dart#L1-L15)
- [user_profile_model.dart:1-72](file://core/data/global_models/user_profile_model.dart#L1-L72)
- [google_user_info_model.dart:1-21](file://core/data/global_models/google_user_info_model.dart#L1-L21)
- [products_model.dart:1-274](file://features/home/models/products_model.dart#L1-L274)
- [product_types_model.dart:1-37](file://features/home/models/product_types_model.dart#L1-L37)
- [step_zero_repo.dart:9-36](file://features/rent_request/repositories/step_zero_repo.dart#L9-L36)
- [cart_model.dart:1-165](file://features/cart/models/cart_model.dart#L1-L165)
- [get_cart_repo.dart:1-19](file://features/cart/repositories/get_cart_repo.dart#L1-L19)
- [add_to_cart_repo.dart:1-29](file://features/cart/repositories/add_to_cart_repo.dart#L1-L29)

## Architecture Overview
The data layer follows a layered pattern with enhanced functional programming principles:
- Controllers depend on Repositories.
- Repositories depend on Network services and optionally on Storage.
- Network services depend on the base URL constant and the Error model.
- Headers manager composes headers using the Storage service.
- All repositories implement clean patterns with Either-based error handling.
- **New**: Cart feature includes specialized controllers and repositories for cart management with reactive state handling.

```mermaid
graph TB
subgraph "Controllers"
HC["Home Controllers"]
OC["Order Controllers"]
RC["Rental Controllers"]
RRC["Rent Request Controllers"]
AC["Auth Controllers"]
PC["Profile Controllers"]
PAC["ProductAttributesController"]
PDC["ProductDetailsController"]
CC["CartController"]
ATCC["AddToCartController"]
end
subgraph "Repositories"
HR["Home Repositories"]
OR["Order Repositories"]
RR["Rental Repositories"]
SZR["StepZeroRepository"]
LR["LoginRepository"]
GPSR["GetProductsByTypeRepository"]
GPR["GetProfileRepository"]
UAR["UpdateAddressRepository"]
DAR["DeleteAddressRepository"]
PAR["ProductAttributesRepository"]
GCR["GetCartRepository"]
ATCR["AddToCartRepository"]
end
subgraph "Network Services"
GN["GetNetwork"]
PWR["PostWithResponse"]
PWO["PostWithoutResponse"]
DN["DeleteNetwork"]
end
subgraph "Local Storage"
SS["StorageService"]
end
subgraph "Support"
HM["HeadersManager"]
EM["ErrorModel"]
NP["NetworkLinks.baseUrl"]
PM["ProductsModel"]
PTM["ProductTypesModel"]
SM["StepZeroModel"]
CM["CartModel"]
CIT["CartItem"]
COS["CartOrderSummery"]
end
HC --> HR
OC --> OR
RC --> RR
RRC --> SZR
AC --> LR
PC --> GPSR
PC --> GPR
PC --> UAR
PC --> DAR
PAC --> PAR
PDC --> PDC
CC --> GCR
ATCC --> ATCR
HR --> GN
OR --> GN
RR --> GN
SZR --> PWR
LR --> PWR
GPSR --> GN
GPR --> GN
UAR --> PWO
DAR --> PWO
PAR --> GN
GCR --> GN
ATCR --> PWO
GN --> NP
PWR --> NP
PWO --> NP
DN --> NP
GN --> EM
PWR --> EM
PWO --> EM
DN --> EM
HM --> SS
GN --> HM
PWR --> HM
PWO --> HM
DN --> HM
PM --> EM
PTM --> EM
SM --> EM
CM --> EM
CIT --> EM
COS --> EM
SZR --> SM
PAR --> CM
GCR --> CM
ATCR --> CM
CC --> CM
ATCC --> CM
```

**Diagram sources**
- [home_bindings.dart:13-33](file://features/home/bindings/home_bindings.dart#L13-L33)
- [order_bindings.dart:5-10](file://features/order/bindings/order_bindings.dart#L5-L10)
- [rental_bindings.dart:5-10](file://features/rental/bindings/rental_bindings.dart#L5-L10)
- [rent_bindings.dart:16-37](file://features/rent_request/bindings/rent_bindings.dart#L16-L37)
- [auth_bindings.dart:13-28](file://features/auth/bindings/auth_bindings.dart#L13-L28)
- [get_network.dart:8-38](file://core/data/networks/get_network.dart#L8-L38)
- [post_with_response.dart:7-42](file://core/data/networks/post_with_response.dart#L7-L42)
- [post_without_response.dart:9-46](file://core/data/networks/post_without_response.dart#L9-L46)
- [delete_network.dart:8-40](file://core/data/networks/delete_network.dart#L8-L40)
- [headers_manager.dart:4-22](file://core/data/networks/headers_manager.dart#L4-L22)
- [storage_service.dart:3-22](file://core/data/local/storage_service.dart#L3-L22)
- [networks_path.dart:1-3](file://core/constant/networks_path.dart#L1-L3)
- [error_model.dart:1-15](file://core/data/global_models/error_model.dart#L1-L15)
- [products_model.dart:1-274](file://features/home/models/products_model.dart#L1-L274)
- [product_types_model.dart:1-37](file://features/home/models/product_types_model.dart#L1-L37)
- [step_zero_model.dart:1-88](file://features/rent_request/models/step_zero_model.dart#L1-L88)
- [step_zero_repo.dart:9-36](file://features/rent_request/repositories/step_zero_repo.dart#L9-L36)
- [login_repo.dart:9-28](file://features/auth/repositories/login_repo.dart#L9-L28)
- [get_products_by_type_repo.dart:7-21](file://features/home/repositories/get_products_by_type_repo.dart#L7-L21)
- [get_profile_repo.dart:7-19](file://features/profile/repositories/get_profile_repo.dart#L7-L19)
- [update_address_repo.dart:8-23](file://features/profile/repositories/update_address_repo.dart#L8-L23)
- [delete_address_repo.dart:6-18](file://features/profile/repositories/delete_address_repo.dart#L6-L18)
- [product_attributes_repo.dart:1-21](file://features/product_details.dart/repositories/product_attributes_repo.dart#L1-L21)
- [products_attributes_controller.dart:1-40](file://features/product_details.dart/controller/products_attributes_controller.dart#L1-L40)
- [product_attributes_model.dart:1-101](file://features/product_details.dart/models/product_attributes_model.dart#L1-L101)
- [product_details_bindings.dart:1-23](file://features/product_details.dart/bindings/product_details_bindings.dart#L1-L23)
- [cart_bindings.dart:1-11](file://features/cart/bindings/cart_bindings.dart#L1-L11)
- [get_cart_repo.dart:1-19](file://features/cart/repositories/get_cart_repo.dart#L1-L19)
- [add_to_cart_repo.dart:1-29](file://features/cart/repositories/add_to_cart_repo.dart#L1-L29)
- [cart_controller.dart:1-51](file://features/cart/controller/cart_controller.dart#L1-L51)
- [add_to_cart_controller.dart:1-40](file://features/cart/controller/add_to_cart_controller.dart#L1-L40)
- [cart_model.dart:1-165](file://features/cart/models/cart_model.dart#L1-L165)

## Detailed Component Analysis

### Network Service Classes
- GetNetwork: performs HTTP GET requests, decodes JSON, and returns typed data or an error with enhanced debugging.
- PostWithResponse: performs HTTP POST with a typed response decoder and improved error logging, now with enhanced functional error handling.
- PostWithoutResponse: performs HTTP POST without expecting a response body with debug output.
- DeleteNetwork: performs HTTP DELETE and returns success or an error with comprehensive error handling.

Each class:
- Uses the base URL constant.
- Accepts headers and body parameters.
- Validates status codes (200, 201, 202) as success.
- Parses JSON bodies and constructs typed models via fromJson.
- Wraps errors using ErrorModel for both HTTP and unknown exceptions.
- Includes debugPrint statements for better error tracking and debugging.

**Updated** PostWithResponse now provides a unified HTTP POST interface with enhanced error handling using FP Dart's Either type for consistent functional programming patterns.

```mermaid
classDiagram
class GetNetwork {
+String baseUrl
+getData<T>(url, fromJson, headers) Future~Either<ErrorModel, T>~
}
class PostWithResponse {
+String baseUrl
+postData<T>(url, headers, body, fromJson) Future~Either<ErrorModel, T>~
}
class PostWithoutResponse {
+String baseUrl
+postData(url, body, headers) Future~Either<ErrorModel, bool>~
}
class DeleteNetwork {
+String baseUrl
+deleteData(url, headers) Future~Either<ErrorModel, bool>~
}
class ErrorModel {
+int? statusCode
+String message
+fromHttp(statusCode, bodyMessage) ErrorModel
+fromUnknown() ErrorModel
}
GetNetwork --> ErrorModel : "returns"
PostWithResponse --> ErrorModel : "returns"
PostWithoutResponse --> ErrorModel : "returns"
DeleteNetwork --> ErrorModel : "returns"
```

**Diagram sources**
- [get_network.dart:8-38](file://core/data/networks/get_network.dart#L8-L38)
- [post_with_response.dart:7-42](file://core/data/networks/post_with_response.dart#L7-L42)
- [post_without_response.dart:9-46](file://core/data/networks/post_without_response.dart#L9-L46)
- [delete_network.dart:8-40](file://core/data/networks/delete_network.dart#L8-L40)
- [error_model.dart:1-15](file://core/data/global_models/error_model.dart#L1-L15)

**Section sources**
- [get_network.dart:8-38](file://core/data/networks/get_network.dart#L8-L38)
- [post_with_response.dart:7-42](file://core/data/networks/post_with_response.dart#L7-L42)
- [post_without_response.dart:9-46](file://core/data/networks/post_without_response.dart#L9-L46)
- [delete_network.dart:8-40](file://core/data/networks/delete_network.dart#L8-L40)

### HTTP Client Configuration and Request/Response Handling
- Base URL: centralized in NetworkLinks.
- Headers: composed by HeadersManager with Content-Type, Accept, and Authorization (when applicable).
- Requests: constructed using http.client with Uri.parse(baseUrl + url).
- Responses: validated by status codes; successful responses are parsed and mapped to typed models.
- Errors: captured via try/catch blocks and converted to ErrorModel instances.
- Debugging: enhanced with debugPrint statements for better error tracking and development experience.

```mermaid
sequenceDiagram
participant C as "Caller"
participant N as "Network Service"
participant H as "HeadersManager"
participant S as "StorageService"
participant E as "ErrorModel"
C->>N : "invoke method(url, headers?, body?)"
N->>H : "compose headers(isAuth, isContentType, isAccept)"
H->>S : "read(tokenKey)"
S-->>H : "token"
H-->>N : "headers"
N->>N : "HTTP request with Uri.parse(baseUrl + url)"
alt "success (200/201/202)"
N->>N : "debugPrint('Success response')"
N-->>C : "Right(typed result)"
else "non-success"
N->>N : "debugPrint('Error response : ${response.body}')"
N->>E : "construct fromHttp or fromUnknown"
N-->>C : "Left(ErrorModel)"
end
```

**Diagram sources**
- [headers_manager.dart:9-21](file://core/data/networks/headers_manager.dart#L9-L21)
- [storage_service.dart:7-9](file://core/data/local/storage_service.dart#L7-L9)
- [get_network.dart:14-37](file://core/data/networks/get_network.dart#L14-L37)
- [post_with_response.dart:14-41](file://core/data/networks/post_with_response.dart#L14-L41)
- [post_without_response.dart:16-45](file://core/data/networks/post_without_response.dart#L16-L45)
- [delete_network.dart:13-39](file://core/data/networks/delete_network.dart#L13-L39)
- [error_model.dart:5-13](file://core/data/global_models/error_model.dart#L5-L13)

**Section sources**
- [networks_path.dart:1-3](file://core/constant/networks_path.dart#L1-L3)
- [headers_manager.dart:4-22](file://core/data/networks/headers_manager.dart#L4-L22)
- [storage_service.dart:3-22](file://core/data/local/storage_service.dart#L3-L22)
- [error_model.dart:1-15](file://core/data/global_models/error_model.dart#L1-L15)

### Local Storage Service (GetStorage)
- Provides read/write/remove/clear operations.
- Used by HeadersManager to retrieve the token for Authorization header.
- Token key is standardized for consistent access across the app.

```mermaid
flowchart TD
Start(["Access Token"]) --> Read["Read token from StorageService"]
Read --> Found{"Token exists?"}
Found --> |Yes| Compose["Compose headers with Authorization"]
Found --> |No| ComposeNoAuth["Compose headers without Authorization"]
Compose --> End(["Proceed with request"])
ComposeNoAuth --> End
```

**Diagram sources**
- [storage_service.dart:7-9](file://core/data/local/storage_service.dart#L7-L9)
- [headers_manager.dart:17-19](file://core/data/networks/headers_manager.dart#L17-L19)

**Section sources**
- [storage_service.dart:3-22](file://core/data/local/storage_service.dart#L3-L22)
- [headers_manager.dart:4-22](file://core/data/networks/headers_manager.dart#L4-L22)

### Repository Pattern Implementation
**Updated** All repositories now implement a clean pattern with functional error handling using FP Dart's Either type, demonstrating consistent error propagation throughout the application. Added comprehensive cart management capabilities through specialized repositories for shopping cart functionality.

- StepZeroRepository: demonstrates clean repository pattern for rental request creation with comprehensive business logic.
- LoginRepository: shows authentication flow with Either-based error handling.
- GetProductsByTypeRepository: illustrates GET request handling with typed responses.
- GetProfileRepository: demonstrates user profile retrieval with proper error handling.
- UpdateAddressRepository: shows POST without response handling.
- DeleteAddressRepository: demonstrates DELETE operation with Either return type.
- **New**: GetCartRepository: retrieves cart data with comprehensive error handling.
- **New**: AddToCartRepository: handles cart item addition with proper validation and error handling.

Each repository:
- Accepts network services through constructor injection.
- Provides a clean execute method with typed parameters.
- Returns Future<Either<ErrorModel, T>> for consistent error handling.
- Uses HeadersManager for authentication and content-type headers.
- Encodes request bodies using jsonEncode for POST operations.

```mermaid
classDiagram
class StepZeroRepository {
+PostWithResponse postWithResponse
+execute(businessName, contactPerson, email, phone, abn, website) Future~Either<ErrorModel, StepZeroModel>~
}
class LoginRepository {
+PostWithResponse postWithResponse
+execute(email, password) Future~Either<ErrorModel, LoginModel>~
}
class GetProductsByTypeRepository {
+GetNetwork getNetwork
+execute(typeID) Future~Either<ErrorModel, ProductsModel>~
}
class GetProfileRepository {
+GetNetwork getNetwork
+execute() Future~Either<ErrorModel, UserProfileModel>~
}
class UpdateAddressRepository {
+PostWithoutResponse postWithoutResponse
+execute(addressID, isDefault) Future~Either<ErrorModel, bool>~
}
class DeleteAddressRepository {
+PostWithoutResponse postWithoutResponse
+execute(addressID) Future~Either<ErrorModel, bool>~
}
class GetCartRepository {
+GetNetwork getNetwork
+execute() Future~Either<ErrorModel, CartModel>~
}
class AddToCartRepository {
+PostWithoutResponse postWithoutResponse
+execute(productID, quantity, options) Future~Either<ErrorModel, bool>~
}
StepZeroRepository --> PostWithResponse : "uses"
LoginRepository --> PostWithResponse : "uses"
GetProductsByTypeRepository --> GetNetwork : "uses"
GetProfileRepository --> GetNetwork : "uses"
UpdateAddressRepository --> PostWithoutResponse : "uses"
DeleteAddressRepository --> PostWithoutResponse : "uses"
GetCartRepository --> GetNetwork : "uses"
AddToCartRepository --> PostWithoutResponse : "uses"
```

**Diagram sources**
- [step_zero_repo.dart:9-36](file://features/rent_request/repositories/step_zero_repo.dart#L9-L36)
- [login_repo.dart:9-28](file://features/auth/repositories/login_repo.dart#L9-L28)
- [get_products_by_type_repo.dart:7-21](file://features/home/repositories/get_products_by_type_repo.dart#L7-L21)
- [get_profile_repo.dart:7-19](file://features/profile/repositories/get_profile_repo.dart#L7-L19)
- [update_address_repo.dart:8-23](file://features/profile/repositories/update_address_repo.dart#L8-L23)
- [delete_address_repo.dart:6-18](file://features/profile/repositories/delete_address_repo.dart#L6-L18)
- [get_cart_repo.dart:1-19](file://features/cart/repositories/get_cart_repo.dart#L1-L19)
- [add_to_cart_repo.dart:1-29](file://features/cart/repositories/add_to_cart_repo.dart#L1-L29)

**Section sources**
- [step_zero_repo.dart:9-36](file://features/rent_request/repositories/step_zero_repo.dart#L9-L36)
- [login_repo.dart:9-28](file://features/auth/repositories/login_repo.dart#L9-L28)
- [get_products_by_type_repo.dart:7-21](file://features/home/repositories/get_products_by_type_repo.dart#L7-L21)
- [get_profile_repo.dart:7-19](file://features/profile/repositories/get_profile_repo.dart#L7-L19)
- [update_address_repo.dart:8-23](file://features/profile/repositories/update_address_repo.dart#L8-L23)
- [delete_address_repo.dart:6-18](file://features/profile/repositories/delete_address_repo.dart#L6-L18)
- [get_cart_repo.dart:1-19](file://features/cart/repositories/get_cart_repo.dart#L1-L19)
- [add_to_cart_repo.dart:1-29](file://features/cart/repositories/add_to_cart_repo.dart#L1-L29)

### Cart Management System
**New** The cart management system provides comprehensive shopping cart functionality with proper separation of concerns between models, controllers, and repositories.

#### GetCartRepository
- Retrieves cart data from the API endpoint `/api/cart`.
- Uses GetNetwork for HTTP GET requests with proper authentication headers.
- Returns Future<Either<ErrorModel, CartModel>> for consistent error handling.
- Integrates with HeadersManager for authentication and content-type headers.

#### AddToCartRepository
- Handles adding items to the cart via POST request to `/api/cart/add`.
- Validates input parameters including productID, quantity, and options.
- Uses PostWithoutResponse for requests that don't expect a response body.
- Returns Future<Either<ErrorModel, bool>> for success/failure indication.
- Encodes request body with product_id, quantity, and options arrays.

#### CartController
- Reactive controller managing cart state with GetX.
- Handles loading states, cart data retrieval, and item selection toggling.
- Implements fold() method for Either-based error handling.
- Provides methods for item manipulation (toggle, delete, quantity adjustment).

#### AddToCartController
- Manages add-to-cart operations with proper validation.
- Handles loading states and displays appropriate snackbars for success/error.
- Validates that product attributes are selected before adding to cart.
- Integrates with ProductAttributesController to get selected options.

#### Cart Model Structure
- Comprehensive cart data structure with nested CartItem and CartOption objects.
- CartItem contains product details, quantity, pricing, and selected options.
- CartOption stores attribute information with pricing and image data.
- Supports complex cart scenarios with multiple items and options.

```mermaid
classDiagram
class GetCartRepository {
+GetNetwork getNetwork
+execute() Future~Either<ErrorModel, CartModel>~
}
class AddToCartRepository {
+PostWithoutResponse postWithoutResponse
+execute(productID, quantity, options) Future~Either<ErrorModel, bool>~
}
class CartController {
+GetCartRepository getCartRepository
+RxBool isLoading
+RxBool isAllSelected
+Rxn~CartModel~ carts
+getCart() void
+toggleItem(id) void
+toggleSelectAll() void
+deleteItem(id) void
+deleteAll() void
+increaseQty(id) void
+decreaseQty(id) void
}
class AddToCartController {
+AddToCartRepository addToCartRepository
+Rxn~RoomsModel~ rooms
+RxBool isLoading
+addToCart(productID, quantity, options) void
}
class CartModel {
+String? id
+int? userId
+CartItem[]? items
+num? subtotal
+num? totalCartValue
+num? discountAmount
+String? couponCode
+String? couponMessage
+num? grandTotal
+int? totalQty
+int? itemCount
+CartModel.fromJson(json)
+toJson() Map
}
class CartItem {
+int? id
+bool isSelected
+Product? product
+int? quantity
+num? unitPrice
+num? basePrice
+num? optionPrice
+num? subtotal
+CartOption[]? options
+CartItem.fromJson(json)
+toJson() Map
}
class CartOption {
+num? productAttributeOptionId
+num? attributeId
+num? optionId
+String? attributeName
+String? optionName
+num? price
+dynamic productImage
+bool? isDefault
+CartOption.fromJson(json)
+toJson() Map
}
GetCartRepository --> GetNetwork : "uses"
AddToCartRepository --> PostWithoutResponse : "uses"
CartController --> GetCartRepository : "uses"
AddToCartController --> AddToCartRepository : "uses"
CartController --> CartModel : "manages"
AddToCartController --> CartModel : "uses"
CartModel --> CartItem : "contains"
CartItem --> CartOption : "contains"
```

**Diagram sources**
- [get_cart_repo.dart:1-19](file://features/cart/repositories/get_cart_repo.dart#L1-L19)
- [add_to_cart_repo.dart:1-29](file://features/cart/repositories/add_to_cart_repo.dart#L1-L29)
- [cart_controller.dart:1-51](file://features/cart/controller/cart_controller.dart#L1-L51)
- [add_to_cart_controller.dart:1-40](file://features/cart/controller/add_to_cart_controller.dart#L1-L40)
- [cart_model.dart:1-165](file://features/cart/models/cart_model.dart#L1-L165)

**Section sources**
- [get_cart_repo.dart:1-19](file://features/cart/repositories/get_cart_repo.dart#L1-L19)
- [add_to_cart_repo.dart:1-29](file://features/cart/repositories/add_to_cart_repo.dart#L1-L29)
- [cart_controller.dart:1-51](file://features/cart/controller/cart_controller.dart#L1-L51)
- [add_to_cart_controller.dart:1-40](file://features/cart/controller/add_to_cart_controller.dart#L1-L40)
- [cart_model.dart:1-165](file://features/cart/models/cart_model.dart#L1-L165)

### Cart View and User Interface
**New** The cart feature includes a comprehensive user interface with item management, quantity controls, and order summary functionality.

#### CartView
- Main cart screen displaying cart items in a scrollable list.
- Shows loading state during cart data retrieval.
- Integrates with CartController for reactive state management.
- Displays cart items with product information and pricing.

#### CartItem Widgets
- **CartItemBox**: Main container for individual cart items.
- **CartItemInfo**: Displays product image, name, category, selected options, and price.
- **Quantity Controls**: +/- buttons for adjusting item quantities.
- **Delete Functionality**: Circular delete button with trash icon.

#### Order Summary
- **CartOrderSummery**: Displays cart totals including subtotal, shipping, discount, and grand total.
- Shows checkout button for proceeding to payment.
- Responsive design with dark/light theme support.

#### Bottom Navigation Integration
- **BottomNavCartItem**: Cart icon in bottom navigation with badge counter.
- Displays item count as a badge overlay.
- Integrated with BottomNavController for page switching.

```mermaid
classDiagram
class CartView {
+build(context) Widget
}
class CartItemBox {
+CartItem item
+bool isDark
+build(context) Widget
}
class CartItemInfo {
+CartItem item
+build(context) Widget
}
class CartOrderSummery {
+build(context) Widget
}
class BottomNavCartItem {
+String icon
+String label
+int index
+String badgeCount
+build(context) Widget
}
class CartController {
+RxBool isLoading
+Rxn~CartModel~ carts
+toggleItem(id) void
+deleteItem(id) void
+increaseQty(id) void
+decreaseQty(id) void
}
CartView --> CartController : "uses"
CartView --> CartItemBox : "displays"
CartView --> CartOrderSummery : "displays"
CartItemBox --> CartItemInfo : "contains"
BottomNavCartItem --> CartController : "integrates"
```

**Diagram sources**
- [cart_view.dart:1-66](file://features/cart/views/cart_view.dart#L1-L66)
- [cart_item.dart:1-103](file://features/cart/widgets/cart_view_widgets/cart_item.dart#L1-L103)
- [cart_item_info.dart:1-105](file://features/cart/widgets/cart_view_widgets/cart_item_info.dart#L1-L105)
- [cart_order_summery.dart:1-93](file://features/cart/widgets/cart_view_widgets/cart_order_summery.dart#L1-L93)
- [bottom_nav_cart_item.dart:1-75](file://features/home/widgets/bottom_nav_widgets/bottom_nav_cart_item.dart#L1-L75)
- [cart_controller.dart:1-51](file://features/cart/controller/cart_controller.dart#L1-L51)

**Section sources**
- [cart_view.dart:1-66](file://features/cart/views/cart_view.dart#L1-L66)
- [cart_item.dart:1-103](file://features/cart/widgets/cart_view_widgets/cart_item.dart#L1-L103)
- [cart_item_info.dart:1-105](file://features/cart/widgets/cart_view_widgets/cart_item_info.dart#L1-L105)
- [cart_order_summery.dart:1-93](file://features/cart/widgets/cart_view_widgets/cart_order_summery.dart#L1-L93)
- [bottom_nav_cart_item.dart:1-75](file://features/home/widgets/bottom_nav_widgets/bottom_nav_cart_item.dart#L1-L75)
- [bottom_nav_controller.dart:1-18](file://features/home/controller/bottom_nav_controller.dart#L1-L18)
- [bottom_nav_view.dart:1-81](file://features/home/views/bottom_nav_view.dart#L1-L81)

### Product Details Cart Integration
**New** Seamless integration between product details and cart functionality for a complete shopping experience.

#### ProductDetailsCart Widget
- Integrates with ProductDetailsController for product information.
- Connects with ProductAttributesController for selected product options.
- Handles quantity selection with +/- buttons.
- Implements add-to-cart functionality with validation.

#### Integration Points
- Retrieves product ID from ProductDetailsController.
- Gets selected attribute options from ProductAttributesController.
- Uses AddToCartController for cart operations.
- Displays loading state during add-to-cart process.

```mermaid
sequenceDiagram
participant PDC as "ProductDetailsController"
participant PAC as "ProductAttributesController"
participant PDCart as "ProductDetailsCart"
participant ATCC as "AddToCartController"
participant ATCR as "AddToCartRepository"
PDCart->>PDC : "get product details"
PDCart->>PAC : "get selected options"
PDCart->>ATCC : "addToCart(productID, qty, options)"
ATCC->>ATCR : "execute(productID, quantity, options)"
ATCR->>ATCR : "validate inputs"
ATCR->>ATCR : "send POST request"
ATCR-->>ATCC : "Either<ErrorModel, bool>"
ATCC-->>PDCart : "handle result"
PDCart->>PDCart : "show snackbar"
```

**Diagram sources**
- [product_details_cart.dart:1-213](file://features/product_details.dart/widgets/product_details_view_widgets/product_details_cart.dart#L1-L213)
- [add_to_cart_controller.dart:1-40](file://features/cart/controller/add_to_cart_controller.dart#L1-L40)
- [add_to_cart_repo.dart:1-29](file://features/cart/repositories/add_to_cart_repo.dart#L1-L29)

**Section sources**
- [product_details_cart.dart:1-213](file://features/product_details.dart/widgets/product_details_view_widgets/product_details_cart.dart#L1-L213)
- [add_to_cart_controller.dart:1-40](file://features/cart/controller/add_to_cart_controller.dart#L1-L40)
- [add_to_cart_repo.dart:1-29](file://features/cart/repositories/add_to_cart_repo.dart#L1-L29)

### Data Serialization/Deserialization Patterns
- Typed models: models expose fromJson and toJson for encoding/decoding.
- Network services pass a fromJson function to decode responses into typed models.
- Enhanced type safety: models now use num type instead of int for better numeric precision.
- Pagination support: Products model includes Links and Meta classes for pagination handling.
- **New**: Cart models support complex nested structures with comprehensive serialization.
- **New**: Product attributes models support complex nested structures with comprehensive serialization.
- Example models:
  - UserProfileModel with nested Data.
  - GoogleUserInfoModel for Google sign-in data.
  - ProductTypesModel for furniture type listings.
  - ProductsModel with pagination support for product listings.
  - StepZeroModel for rental request business information.
  - **New**: CartModel with nested CartItem and CartOption structures.
  - **New**: ProductAttributesModel with nested ProductAttribute and AttributeOption structures.

```mermaid
classDiagram
class UserProfileModel {
+Data? data
+fromJson(json)
+toJson() Map
}
class Data {
+int? id
+String? name
+String? email
+String? phone
+String? abn
+String? type
+String? status
+String? emailVerifiedAt
+String? createdAt
+String? updatedAt
+fromJson(json)
+toJson() Map
}
class GoogleUserInfoModel {
+String name
+String email
+String avatarUrl
+String idToken
+String uid
+toString() String
}
class ProductTypesModel {
+ProductType[] data
+fromJson(json)
+toJson() Map
}
class ProductType {
+num id
+String name
+fromJson(json)
+toJson() Map
}
class ProductsModel {
+Product[] data
+Links? links
+Meta? meta
+fromJson(json)
+toJson() Map
}
class Links {
+String? first
+String? last
+String? prev
+String? next
+fromJson(json)
+toJson() Map
}
class Meta {
+int currentPage
+int from
+int lastPage
+Link[]? links
+String path
+int perPage
+int to
+int total
+fromJson(json)
+toJson() Map
}
class StepZeroModel {
+String? uuid
+int? userId
+BusinessInfo? businessInfo
+int? currentStep
+int? rentalStatusId
+String? updatedAt
+String? createdAt
+int? id
+fromJson(json)
+toJson() Map
}
class BusinessInfo {
+String? businessName
+String? contactPerson
+String? email
+String? phone
+String? abn
+String? website
+fromJson(json)
+toJson() Map
}
class CartModel {
+String? id
+int? userId
+CartItem[]? items
+num? subtotal
+num? totalCartValue
+num? discountAmount
+String? couponCode
+String? couponMessage
+num? grandTotal
+int? totalQty
+int? itemCount
+CartModel.fromJson(json)
+toJson() Map
}
class CartItem {
+int? id
+bool isSelected
+Product? product
+int? quantity
+num? unitPrice
+num? basePrice
+num? optionPrice
+num? subtotal
+CartOption[]? options
+CartItem.fromJson(json)
+toJson() Map
}
class CartOption {
+num? productAttributeOptionId
+num? attributeId
+num? optionId
+String? attributeName
+String? optionName
+num? price
+dynamic productImage
+bool? isDefault
+CartOption.fromJson(json)
+toJson() Map
}
class ProductAttributesModel {
+ProductAttribute[] data
+ProductAttributesModel.fromJson(json)
+toJson() Map
}
class ProductAttribute {
+num productAttributeId
+num attributeId
+String name
+AttributeOption[] options
+ProductAttribute.fromJson(json)
+toJson() Map
}
class AttributeOption {
+num productAttributeOptionId
+num optionId
+String name
+dynamic image
+String productImage
+num price
+num stock
+bool isDefault
+AttributeOption.fromJson(json)
+toJson() Map
}
UserProfileModel --> Data : "contains"
ProductTypesModel --> ProductType : "contains"
ProductsModel --> Product : "contains"
ProductsModel --> Links : "contains"
ProductsModel --> Meta : "contains"
StepZeroModel --> BusinessInfo : "contains"
CartModel --> CartItem : "contains"
CartItem --> CartOption : "contains"
ProductAttributesModel --> ProductAttribute : "contains"
ProductAttribute --> AttributeOption : "contains"
```

**Diagram sources**
- [user_profile_model.dart:1-72](file://core/data/global_models/user_profile_model.dart#L1-L72)
- [google_user_info_model.dart:1-21](file://core/data/global_models/google_user_info_model.dart#L1-L21)
- [product_types_model.dart:1-37](file://features/home/models/product_types_model.dart#L1-L37)
- [products_model.dart:1-363](file://features/home/models/products_model.dart#L1-L363)
- [step_zero_model.dart:1-88](file://features/rent_request/models/step_zero_model.dart#L1-L88)
- [cart_model.dart:1-165](file://features/cart/models/cart_model.dart#L1-L165)
- [product_attributes_model.dart:1-101](file://features/product_details.dart/models/product_attributes_model.dart#L1-L101)

**Section sources**
- [user_profile_model.dart:1-72](file://core/data/global_models/user_profile_model.dart#L1-L72)
- [google_user_info_model.dart:1-21](file://core/data/global_models/google_user_info_model.dart#L1-L21)
- [product_types_model.dart:1-37](file://features/home/models/product_types_model.dart#L1-L37)
- [products_model.dart:1-363](file://features/home/models/products_model.dart#L1-L363)
- [step_zero_model.dart:1-88](file://features/rent_request/models/step_zero_model.dart#L1-L88)
- [cart_model.dart:1-165](file://features/cart/models/cart_model.dart#L1-L165)
- [product_attributes_model.dart:1-101](file://features/product_details.dart/models/product_attributes_model.dart#L1-L101)

### Offline Data Handling
- Persistent token storage enables offline re-authentication when the app restarts.
- Dependency injection initializes GetStorage and reads the token during startup.
- Repositories can cache frequently accessed data in memory or use StorageService for small persisted items.
- **New**: Cart data can be cached locally for offline cart access and modification.
- **New**: Product attributes data can be cached locally for offline product customization features.

```mermaid
sequenceDiagram
participant App as "App Startup"
participant DI as "DependencyInjection"
participant SS as "StorageService"
participant Net as "Network Services"
App->>DI : "init()"
DI->>SS : "read(tokenKey)"
SS-->>DI : "token or null"
DI-->>App : "token string"
App->>Net : "use services after init"
```

**Diagram sources**
- [main.dart:12-19](file://main.dart#L12-L19)
- [dependency_injection.dart:14-30](file://core/di/dependency_injection.dart#L14-L30)
- [storage_service.dart:7-9](file://core/data/local/storage_service.dart#L7-L9)

**Section sources**
- [main.dart:12-19](file://main.dart#L12-L19)
- [dependency_injection.dart:14-30](file://core/di/dependency_injection.dart#L14-L30)
- [storage_service.dart:3-22](file://core/data/local/storage_service.dart#L3-L22)

### Data Flow Between Network Services, Repositories, and Controllers
- Controllers trigger repository methods.
- Repositories use network services to fetch or mutate data.
- Repositories may use StorageService for caching or offline behavior.
- Network services return Either<ErrorModel, T>, allowing repositories to handle success and failure uniformly.
- Enhanced error handling with debugPrint statements for better debugging experience.
- **New**: Cart flow includes reactive state management with GetX for UI updates.
- **New**: Product details cart integration provides seamless shopping experience.

**Updated** All repositories now implement consistent functional error handling using FP Dart's Either type, providing a clean separation of concerns and predictable error propagation. Added comprehensive cart management with reactive state handling for dynamic UI updates and seamless integration with product details functionality.

```mermaid
sequenceDiagram
participant VC as "View Controller"
participant Repo as "Repository"
participant Net as "Network Service"
participant Store as "StorageService"
VC->>Repo : "request data"
Repo->>Net : "perform HTTP call"
alt "success"
Net->>Net : "debugPrint('Request successful')"
Net-->>Repo : "Right(typed data)"
Repo->>Store : "optional cache"
Repo-->>VC : "data"
else "failure"
Net->>Net : "debugPrint('Request failed : ${error.toString()}')"
Net-->>Repo : "Left(ErrorModel)"
Repo-->>VC : "error"
end
```

**Diagram sources**
- [get_network.dart:10-37](file://core/data/networks/get_network.dart#L10-L37)
- [post_with_response.dart:9-41](file://core/data/networks/post_with_response.dart#L9-L41)
- [post_without_response.dart:12-45](file://core/data/networks/post_without_response.dart#L12-L45)
- [delete_network.dart:10-39](file://core/data/networks/delete_network.dart#L10-L39)
- [storage_service.dart:7-21](file://core/data/local/storage_service.dart#L7-L21)

**Section sources**
- [home_bindings.dart:13-33](file://features/home/bindings/home_bindings.dart#L13-L33)
- [order_bindings.dart:5-10](file://features/order/bindings/order_bindings.dart#L5-L10)
- [rental_bindings.dart:5-10](file://features/rental/bindings/rental_bindings.dart#L5-L10)
- [rent_bindings.dart:16-37](file://features/rent_request/bindings/rent_bindings.dart#L16-L37)
- [auth_bindings.dart:13-28](file://features/auth/bindings/auth_bindings.dart#L13-L28)
- [product_details_bindings.dart:1-23](file://features/product_details.dart/bindings/product_details_bindings.dart#L1-L23)
- [cart_bindings.dart:1-11](file://features/cart/bindings/cart_bindings.dart#L1-L11)

### Caching Strategies and Data Synchronization Patterns
- In-memory caching: keep recent data in repository state to reduce network calls.
- Persistence: use StorageService for small, critical data like tokens.
- Synchronization: upon successful network updates, update in-memory state and persist changes as needed.
- Conflict handling: implement optimistic updates with rollback on error; or use server timestamps to reconcile.
- Pagination support: use Links and Meta classes to handle paginated data efficiently.
- **New**: Cart data caching: cache cart items locally for offline cart access and modification.
- **New**: Product attributes caching: cache attribute data locally for offline product customization features.

### Enhanced Type Safety and Numeric Precision
**Updated** The application now uses consistent num types across models for better numeric precision and type safety:

- Product models use num for IDs, prices, and quantities instead of int
- Meta information includes integer pagination fields (currentPage, lastPage, total)
- DefaultOptionId uses num for numeric identifiers
- Category and FurnitureType models use num for ID fields
- **New**: Cart models use num for monetary values, quantities, and IDs
- **New**: Product attributes models use num for productAttributeId, attributeId, optionId, price, stock, and other numeric fields.

This change improves type safety and prevents potential overflow issues with large numeric values.

**Section sources**
- [products_model.dart:251-274](file://features/home/models/products_model.dart#L251-L274)
- [product_types_model.dart:23-37](file://features/home/models/product_types_model.dart#L23-L37)
- [cart_model.dart:21-49](file://features/cart/models/cart_model.dart#L21-L49)
- [product_attributes_model.dart:27-65](file://features/product_details.dart/models/product_attributes_model.dart#L27-L65)

### Pagination Support for Products API
**Updated** Products model now includes comprehensive pagination support:

- Links class: handles pagination navigation (first, last, prev, next)
- Meta class: contains pagination metadata (current_page, last_page, total, per_page, etc.)
- Response structure: ProductsModel now includes links and meta alongside data
- Integration: Repositories can leverage pagination for efficient data loading

```mermaid
classDiagram
class ProductsModel {
+Product[] data
+Links? links
+Meta? meta
}
class Links {
+String? first
+String? last
+String? prev
+String? next
}
class Meta {
+int currentPage
+int from
+int lastPage
+Link[]? links
+String path
+int perPage
+int to
+int total
}
class Link {
+String? url
+String label
+bool active
}
ProductsModel --> Links : "contains"
ProductsModel --> Meta : "contains"
Meta --> Link : "contains"
```

**Diagram sources**
- [products_model.dart:276-363](file://features/home/models/products_model.dart#L276-L363)

**Section sources**
- [products_model.dart:276-363](file://features/home/models/products_model.dart#L276-L363)

### Dependency Injection and Repository Integration
**Updated** Dependency injection now properly registers all network services and repositories with GetX, enabling clean constructor injection patterns. Added comprehensive cart feature integration and product details feature integration.

- Network services are registered as singletons with permanent lifecycle.
- Repositories receive network services through constructor injection.
- Controllers receive repositories through Get.lazyPut with proper dependency resolution.
- StepZeroRepository demonstrates the clean repository pattern with PostWithResponse injection.
- **New**: GetCartRepository and AddToCartRepository are integrated through CartBindings.
- **New**: ProductAttributesRepository and ProductDetailsRepository are integrated through ProductDetailsBindings.

```mermaid
flowchart TD
DI["DependencyInjection.init()"] --> GS["GetStorage.init()"]
DI --> SN["StorageService (permanent)"]
DI --> TN["ThemeService (permanent)"]
DI --> TH["ThemeController (permanent)"]
DI --> GN["GetNetwork (permanent)"]
DI --> PW["PostWithResponse (permanent)"]
DI --> PWO["PostWithoutResponse (permanent)"]
DI --> DN["DeleteNetwork (permanent)"]
DI --> TK["Return token from StorageService"]
SN --> PW
PW --> SZR["StepZeroRepository"]
PW --> LR["LoginRepository"]
GN --> GPSR["GetProductsByTypeRepository"]
GN --> GPR["GetProfileRepository"]
PWO --> UAR["UpdateAddressRepository"]
PWO --> DAR["DeleteAddressRepository"]
DI --> PDB["ProductDetailsBindings"]
DI --> CB["CartBindings"]
CB --> GCR["GetCartRepository"]
CB --> ATCR["AddToCartRepository"]
CB --> CC["CartController"]
CB --> ATCC["AddToCartController"]
PDB --> PAR["ProductAttributesRepository"]
PDB --> PDR["ProductDetailsRepository"]
PDB --> PAC["ProductAttributesController"]
PDB --> PDC["ProductDetailsController"]
GCR --> GN
ATCR --> PWO
CC --> GCR
ATCC --> ATCR
PAR --> GN
PAC --> PAR
```

**Diagram sources**
- [dependency_injection.dart:14-30](file://core/di/dependency_injection.dart#L14-L30)
- [rent_bindings.dart:19-24](file://features/rent_request/bindings/rent_bindings.dart#L19-L24)
- [auth_bindings.dart:16-22](file://features/auth/bindings/auth_bindings.dart#L16-L22)
- [product_details_bindings.dart:1-23](file://features/product_details.dart/bindings/product_details_bindings.dart#L1-L23)
- [cart_bindings.dart:1-11](file://features/cart/bindings/cart_bindings.dart#L1-L11)

**Section sources**
- [dependency_injection.dart:14-30](file://core/di/dependency_injection.dart#L14-L30)
- [rent_bindings.dart:16-37](file://features/rent_request/bindings/rent_bindings.dart#L16-L37)
- [auth_bindings.dart:13-28](file://features/auth/bindings/auth_bindings.dart#L13-L28)
- [product_details_bindings.dart:1-23](file://features/product_details.dart/bindings/product_details_bindings.dart#L1-L23)
- [cart_bindings.dart:1-11](file://features/cart/bindings/cart_bindings.dart#L1-L11)

## Dependency Analysis
- External libraries:
  - http for HTTP requests.
  - fpdart for Either monad support.
  - get_storage for persistent key-value storage.
  - get for dependency injection and reactive state.
  - cached_network_image for optimized image loading.
  - badges for cart item count display.
- Internal dependencies:
  - Network services depend on NetworkLinks and ErrorModel.
  - HeadersManager depends on StorageService.
  - Controllers depend on Repositories, which depend on Network services.
  - Models depend on ErrorModel for serialization/deserialization.
  - All repositories depend on network services and implement Either-based error handling.
  - **New**: Cart feature depends on GetCartRepository, AddToCartRepository, and related controllers.
  - **New**: Product details feature depends on ProductAttributesRepository and ProductDetailsRepository.

**Updated** Enhanced dependency graph showing the clean repository pattern with functional error handling throughout the architecture, including new cart management capabilities and product details integration.

```mermaid
graph LR
P["pubspec.yaml"] --> H["http"]
P --> F["fpdart"]
P --> GS["get_storage"]
P --> G["get"]
P --> CNI["cached_network_image"]
P --> BD["badges"]
subgraph "Internal"
DI["dependency_injection.dart"]
SS["storage_service.dart"]
HM["headers_manager.dart"]
GN["get_network.dart"]
PW["post_with_response.dart"]
PWO["post_without_response.dart"]
DN["delete_network.dart"]
EM["error_model.dart"]
NP["networks_path.dart"]
PM["products_model.dart"]
PTM["product_types_model.dart"]
SM["step_zero_model.dart"]
SZR["step_zero_repo.dart"]
LR["login_repo.dart"]
GPSR["get_products_by_type_repo.dart"]
GPR["get_profile_repo.dart"]
UAR["update_address_repo.dart"]
DAR["delete_address_repo.dart"]
PAR["product_attributes_repo.dart"]
PAC["products_attributes_controller.dart"]
PAM["product_attributes_model.dart"]
PDB["product_details_bindings.dart"]
PDC["product_details_controller.dart"]
PDM["product_details_model.dart"]
GCR["get_cart_repo.dart"]
ATCR["add_to_cart_repo.dart"]
CC["cart_controller.dart"]
ATCC["add_to_cart_controller.dart"]
CM["cart_model.dart"]
CV["cart_view.dart"]
CIT["cart_item.dart"]
CIS["cart_item_info.dart"]
COS["cart_order_summery.dart"]
CSI["cart_select_item.dart"]
CB["cart_bindings.dart"]
BNC["bottom_nav_controller.dart"]
BNV["bottom_nav_view.dart"]
BNCI["bottom_nav_cart_item.dart"]
PDCart["product_details_cart.dart"]
end
DI --> SS
DI --> HM
DI --> GN
DI --> PW
DI --> PWO
DI --> DN
HM --> SS
GN --> NP
PW --> NP
PWO --> NP
DN --> NP
GN --> EM
PW --> EM
PWO --> EM
DN --> EM
SZR --> PW
LR --> PW
GPSR --> GN
GPR --> GN
UAR --> PWO
DAR --> PWO
PAR --> GN
GCR --> GN
ATCR --> PWO
CC --> GCR
ATCC --> ATCR
PAC --> PAR
PDC --> PDM
CV --> CC
CIT --> CC
CIS --> CC
COS --> CC
CSI --> CC
CB --> GCR
CB --> ATCR
CB --> CC
CB --> ATCC
PDB --> PAR
PDB --> PAC
PDB --> PDC
PDB --> PDM
BNC --> CV
BNV --> BNC
BNCI --> BNC
PDCart --> PDC
PDCart --> PAC
PDCart --> ATCC
```

**Diagram sources**
- [pubspec.yaml:44-46](file://pubspec.yaml#L44-L46)
- [dependency_injection.dart:13-31](file://core/di/dependency_injection.dart#L13-L31)
- [storage_service.dart:3-22](file://core/data/local/storage_service.dart#L3-L22)
- [headers_manager.dart:4-22](file://core/data/networks/headers_manager.dart#L4-L22)
- [get_network.dart:8-38](file://core/data/networks/get_network.dart#L8-L38)
- [post_with_response.dart:7-42](file://core/data/networks/post_with_response.dart#L7-L42)
- [post_without_response.dart:9-46](file://core/data/networks/post_without_response.dart#L9-L46)
- [delete_network.dart:8-40](file://core/data/networks/delete_network.dart#L8-L40)
- [error_model.dart:1-15](file://core/data/global_models/error_model.dart#L1-L15)
- [networks_path.dart:1-3](file://core/constant/networks_path.dart#L1-L3)
- [products_model.dart:1-363](file://features/home/models/products_model.dart#L1-L363)
- [product_types_model.dart:1-37](file://features/home/models/product_types_model.dart#L1-L37)
- [step_zero_model.dart:1-88](file://features/rent_request/models/step_zero_model.dart#L1-L88)
- [step_zero_repo.dart:9-36](file://features/rent_request/repositories/step_zero_repo.dart#L9-L36)
- [login_repo.dart:9-28](file://features/auth/repositories/login_repo.dart#L9-L28)
- [get_products_by_type_repo.dart:7-21](file://features/home/repositories/get_products_by_type_repo.dart#L7-L21)
- [get_profile_repo.dart:7-19](file://features/profile/repositories/get_profile_repo.dart#L7-L19)
- [update_address_repo.dart:8-23](file://features/profile/repositories/update_address_repo.dart#L8-L23)
- [delete_address_repo.dart:6-18](file://features/profile/repositories/delete_address_repo.dart#L6-L18)
- [product_attributes_repo.dart:1-21](file://features/product_details.dart/repositories/product_attributes_repo.dart#L1-L21)
- [products_attributes_controller.dart:1-40](file://features/product_details.dart/controller/products_attributes_controller.dart#L1-L40)
- [product_attributes_model.dart:1-101](file://features/product_details.dart/models/product_attributes_model.dart#L1-L101)
- [product_details_bindings.dart:1-23](file://features/product_details.dart/bindings/product_details_bindings.dart#L1-L23)
- [get_cart_repo.dart:1-19](file://features/cart/repositories/get_cart_repo.dart#L1-L19)
- [add_to_cart_repo.dart:1-29](file://features/cart/repositories/add_to_cart_repo.dart#L1-L29)
- [cart_controller.dart:1-51](file://features/cart/controller/cart_controller.dart#L1-L51)
- [add_to_cart_controller.dart:1-40](file://features/cart/controller/add_to_cart_controller.dart#L1-L40)
- [cart_model.dart:1-165](file://features/cart/models/cart_model.dart#L1-L165)
- [cart_bindings.dart:1-11](file://features/cart/bindings/cart_bindings.dart#L1-L11)
- [bottom_nav_controller.dart:1-18](file://features/home/controller/bottom_nav_controller.dart#L1-L18)
- [bottom_nav_view.dart:1-81](file://features/home/views/bottom_nav_view.dart#L1-L81)
- [bottom_nav_cart_item.dart:1-75](file://features/home/widgets/bottom_nav_widgets/bottom_nav_cart_item.dart#L1-L75)
- [product_details_cart.dart:1-213](file://features/product_details.dart/widgets/product_details_view_widgets/product_details_cart.dart#L1-L213)

**Section sources**
- [pubspec.yaml:44-46](file://pubspec.yaml#L44-L46)
- [dependency_injection.dart:13-31](file://core/di/dependency_injection.dart#L13-L31)

## Performance Considerations
- Prefer lightweight models and minimal JSON parsing overhead.
- Reuse network clients and headers where appropriate.
- Cache frequently accessed data in memory to reduce network latency.
- Use pagination and selective field fetching to minimize payload sizes.
- Avoid unnecessary UI rebuilds by structuring state updates efficiently.
- Enhanced error logging helps identify performance bottlenecks during development.
- Functional error handling with Either type reduces error handling overhead and improves code clarity.
- **New**: Cart data caching reduces network calls for frequently accessed cart information.
- **New**: Product attributes caching reduces network calls for frequently accessed product customization data.
- **New**: Optimized image loading with cached_network_image for better performance.

## Troubleshooting Guide
Common issues and resolutions:
- Authentication failures:
  - Verify token presence in StorageService and correct Authorization header composition.
  - Ensure HeadersManager flags align with endpoint requirements.
- Unknown errors:
  - ErrorModel.fromUnknown() indicates exceptions outside HTTP parsing; inspect logs and network conditions.
  - Enhanced debugPrint statements provide better error visibility.
- Status code mismatches:
  - Confirm that 200/201/202 are considered success; adjust expectations per endpoint contract.
- JSON parsing errors:
  - Ensure fromJson handles missing keys gracefully and matches server response shape.
  - Enhanced type safety with num types reduces parsing errors for numeric values.
- Pagination issues:
  - Verify Links and Meta classes are properly populated from API responses.
  - Check pagination parameters (page, per_page) in API requests.
- Repository pattern issues:
  - Ensure repositories are properly injected with network services through constructor injection.
  - Verify Either-based error handling is properly implemented in all repositories.
  - Check that dependency injection registers all required services and repositories.
- **New**: Cart management issues:
  - Verify cart endpoints (/api/cart, /api/cart/add) are accessible and returning expected data.
  - Check that CartController properly handles loading states and error messages.
  - Ensure cart data structures match server response format.
  - Validate that Get.lazyPut properly registers GetCartRepository, AddToCartRepository, and related controllers.
  - Check that product attributes are properly selected before adding items to cart.
- **New**: Product details cart integration issues:
  - Verify product ID retrieval from ProductDetailsController.
  - Check that ProductAttributesController provides proper selected option IDs.
  - Ensure AddToCartController validates input parameters correctly.
  - Confirm that cart badge count updates properly in bottom navigation.

**Updated** Added troubleshooting guidance for repository pattern implementation, functional error handling, cart management system, and product details integration, including comprehensive coverage of new cart functionality and UI integration points.

**Section sources**
- [headers_manager.dart:9-21](file://core/data/networks/headers_manager.dart#L9-L21)
- [storage_service.dart:7-9](file://core/data/local/storage_service.dart#L7-L9)
- [error_model.dart:5-13](file://core/data/global_models/error_model.dart#L5-L13)
- [get_network.dart:14-37](file://core/data/networks/get_network.dart#L14-L37)
- [post_with_response.dart:14-41](file://core/data/networks/post_with_response.dart#L14-L41)
- [post_without_response.dart:16-45](file://core/data/networks/post_without_response.dart#L16-L45)
- [delete_network.dart:13-39](file://core/data/networks/delete_network.dart#L13-L39)
- [products_model.dart:276-363](file://features/home/models/products_model.dart#L276-L363)
- [step_zero_repo.dart:9-36](file://features/rent_request/repositories/step_zero_repo.dart#L9-L36)
- [get_cart_repo.dart:1-19](file://features/cart/repositories/get_cart_repo.dart#L1-L19)
- [add_to_cart_repo.dart:1-29](file://features/cart/repositories/add_to_cart_repo.dart#L1-L29)
- [cart_controller.dart:1-51](file://features/cart/controller/cart_controller.dart#L1-L51)
- [add_to_cart_controller.dart:1-40](file://features/cart/controller/add_to_cart_controller.dart#L1-L40)
- [product_details_cart.dart:1-213](file://features/product_details.dart/widgets/product_details_view_widgets/product_details_cart.dart#L1-L213)

## Conclusion
The ZB-DEZINE data layer cleanly separates concerns across network services, local storage, and headers management. It leverages Either for robust error handling, typed models for safe serialization/deserialization, and a DI system for easy integration across features. The enhanced error handling with debugPrint statements, improved type safety through consistent num types usage, and comprehensive pagination support make the architecture more robust, maintainable, and developer-friendly.

**Updated** The addition of comprehensive cart management system with GetCartRepository and AddToCartRepository demonstrates a clean repository pattern with functional error handling via FP Dart's Either type, providing consistent error propagation throughout the application. The enhanced PostWithResponse utility offers a unified HTTP POST interface with improved error handling, supporting the clean architecture principles across all network operations. The new cart functionality expands the repository pattern with specialized functionality for shopping cart management, integrating seamlessly with the existing architecture through GetX reactive state management and comprehensive UI components.

By combining in-memory caching, persistent storage, and clear request/response patterns, the architecture supports scalable offline-capable experiences with better debugging capabilities and functional programming paradigms.

## Appendices
- API integration patterns:
  - Use HeadersManager.getHeaders with isAuth flag to compose Authorization headers.
  - Call network services with a fromJson function that maps server responses to typed models.
  - Wrap all calls with Either handling to propagate errors consistently.
  - Leverage enhanced error logging for better debugging experience.
  - Implement clean repository pattern with constructor injection for network services.
  - **New**: Use GetCartRepository for cart retrieval with proper error handling.
  - **New**: Use AddToCartRepository for cart item addition with validation and error handling.
- Offline handling:
  - Initialize StorageService during app startup and read tokens for seamless re-authentication.
  - Persist small, critical data (e.g., tokens) using StorageService; cache larger datasets in memory.
  - Use pagination models for efficient data loading and caching strategies.
  - Implement Either-based error handling in all repositories for consistent error propagation.
  - **New**: Cache cart data locally for offline cart access and modification.
  - **New**: Cache product attributes data locally for offline product customization features.
- Type safety best practices:
  - Use num types for numeric values to prevent overflow and improve precision.
  - Implement proper error handling with debugPrint statements for better development experience.
  - Ensure models handle nullable fields gracefully during deserialization.
  - Use FP Dart's Either type for functional error handling across the entire application.
  - Follow clean repository pattern with proper dependency injection and constructor-based service injection.
  - **New**: Ensure cart models use appropriate num types for monetary values and quantities.
  - **New**: Ensure product attributes models use appropriate num types for pricing and stock quantities.
- **New**: Cart management integration patterns:
  - Use CartController for reactive state management of cart UI components.
  - Implement proper loading states and error handling for cart operations.
  - Cache cart data locally for offline shopping experiences.
  - Follow the established repository pattern with Either-based error handling for consistency.
  - Integrate with existing dependency injection system through CartBindings.
  - **New**: Use ProductDetailsCart widget for seamless integration between product details and cart functionality.
  - **New**: Implement proper validation for product attributes before adding items to cart.
  - **New**: Handle cart item quantity adjustments and deletion operations through CartController methods.
- **New**: Bottom navigation cart integration:
  - Display cart item count as a badge overlay on the cart icon.
  - Integrate cart view navigation through BottomNavController.
  - Provide visual feedback for cart state changes through reactive UI updates.
  - Ensure cart functionality works seamlessly across different app states and navigation flows.