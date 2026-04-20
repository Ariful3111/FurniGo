# E-commerce Platform

<cite>
**Referenced Files in This Document**
- [main.dart](file://lib/main.dart)
- [app_routes.dart](file://lib/core/routes/app_routes.dart)
- [routes.dart](file://lib/core/routes/routes.dart)
- [dependency_injection.dart](file://lib/core/di/dependency_injection.dart)
- [home_bindings.dart](file://lib/features/home/bindings/home_bindings.dart)
- [home_controller.dart](file://lib/features/home/controller/home_controller.dart)
- [home_view.dart](file://lib/features/home/views/home_view.dart)
- [home_shop.dart](file://lib/features/home/widgets/home_widgets/home_shop.dart)
- [home_header.dart](file://lib/features/home/widgets/home_widgets/home_header.dart)
- [home_helper.dart](file://lib/features/home/widgets/home_widgets/home_helper.dart)
- [custom_quick_action.dart](file://lib/shared/widgets/custom_quick_action/custom_quick_action.dart)
- [quick_action_list.dart](file://lib/shared/widgets/custom_quick_action/quick_action_list.dart)
- [products_model.dart](file://lib/features/home/models/products_model.dart)
- [orders_model.dart](file://lib/features/order/models/orders_model.dart)
- [get_orders_repo.dart](file://lib/features/order/repositories/get_orders_repo.dart)
- [order_review_repo.dart](file://lib/features/order/repositories/order_review_repo.dart)
- [order_bindings.dart](file://lib/features/order/bindings/order_bindings.dart)
- [order_controller.dart](file://lib/features/order/controllers/order_controller.dart)
- [product_details_controller.dart](file://lib/features/product_details.dart/controller/product_details_controller.dart)
- [product_attributes_model.dart](file://lib/features/product_details.dart/models/product_attributes_model.dart)
- [products_attributes_controller.dart](file://lib/features/product_details.dart/controller/products_attributes_controller.dart)
- [product_attributes_repo.dart](file://lib/features/product_details.dart/repositories/product_attributes_repo.dart)
- [product_details_model.dart](file://lib/features/product_details.dart/models/product_details_model.dart)
- [payment_controller.dart](file://lib/features/payment/controller/payment_controller.dart)
- [home_our_products.dart](file://lib/features/home/widgets/home_widgets/home_our_products.dart)
- [home_product_design.dart](file://lib/features/home/widgets/home_widgets/home_product_design.dart)
- [global_search_suggestion_box.dart](file://lib/features/home/widgets/home_widgets/global_search_suggestion_box.dart)
- [product_details_view_image.dart](file://lib/features/product_details.dart/widgets/product_details_view_widgets/product_details_view_image.dart)
- [product_details_view.dart](file://lib/features/product_details.dart/views/product_details_view.dart)
- [product_details_rating.dart](file://lib/features/product_details.dart/widgets/product_details_view_widgets/product_details_rating.dart)
- [product_details_rating_info.dart](file://lib/features/product_details.dart/widgets/product_details_view_widgets/product_details_rating_info.dart)
- [product_details_rating_percent.dart](file://lib/features/product_details.dart/widgets/product_details_view_widgets/product_details_rating_percent.dart)
- [product_details_review.dart](file://lib/features/product_details.dart/widgets/product_details_view_widgets/product_details_review.dart)
- [order_review_controller.dart](file://lib/features/order/controllers/order_review_controller.dart)
- [error_model.dart](file://lib/core/data/global_models/error_model.dart)
- [get_network.dart](file://lib/core/data/networks/get_network.dart)
- [post_without_response.dart](file://lib/core/data/networks/post_without_response.dart)
- [headers_manager.dart](file://lib/core/data/networks/headers_manager.dart)
- [error_snackbar.dart](file://lib/shared/widgets/snackbars/error_snackbar.dart)
- [custom_text_form_field.dart](file://lib/shared/widgets/custom_form_field/custom_text_form_field.dart)
- [custom_phone_field.dart](file://lib/shared/widgets/custom_form_field/custom_phone_field.dart)
- [custom_rating_builder.dart](file://lib/shared/widgets/custom_rating/custom_rating_builder.dart)
- [custom_rating_bar.dart](file://lib/shared/widgets/custom_rating/custom_rating_bar.dart)
- [custom_rating_dialog.dart](file://lib/shared/widgets/custom_dialog/custom_rating_dialog.dart)
- [phone_validator.dart](file://lib/shared/extensions/validators/phone_validator.dart)
- [abn_validator.dart](file://lib/shared/extensions/validators/abn_validator.dart)
- [shared_container.dart](file://lib/shared/widgets/shared_container.dart)
</cite>

## Update Summary
**Changes Made**
- Added comprehensive quick action system with four main categories: Shop Products, Sell Furniture, Rent Products, and Design My Room
- Enhanced home screen with improved product presentation including room-based shopping and AI interior design features
- Integrated CustomQuickAction widget with responsive grid layout and visual design elements
- Added HomeShop widget for horizontal room-based product browsing with cached image loading
- Enhanced HomeHeader with improved visual presentation and shadow effects
- Added HomeAiDesign widget for AI-powered interior design capabilities
- Improved overall home screen navigation with better categorization and user experience

## Table of Contents
1. [Introduction](#introduction)
2. [Project Structure](#project-structure)
3. [Core Components](#core-components)
4. [Architecture Overview](#architecture-overview)
5. [Detailed Component Analysis](#detailed-component-analysis)
6. [Enhanced Home Screen System](#enhanced-home-screen-system)
7. [Quick Action System](#quick-action-system)
8. [Enhanced Product Presentation](#enhanced-product-presentation)
9. [AI Room Interior Design](#ai-room-interior-design)
10. [Enhanced Product Attributes System](#enhanced-product-attributes-system)
11. [Improved Rating and Review System](#improved-rating-and-review-system)
12. [Enhanced UI Components](#enhanced-ui-components)
13. [Form Field Components](#form-field-components)
14. [Rating System Components](#rating-system-components)
15. [Validation Extensions](#validation-extensions)
16. [UI Safety Checks for Product Image Loading](#ui-safety-checks-for-product-image-loading)
17. [Dependency Analysis](#dependency-analysis)
18. [Performance Considerations](#performance-considerations)
19. [Troubleshooting Guide](#troubleshooting-guide)
20. [Conclusion](#conclusion)

## Introduction
This document describes the e-commerce platform feature set implemented in the Flutter application. It focuses on the product catalog system, product details view, order management, payment processing, category management, filtering mechanisms, and the integrated lifecycle from browsing to order fulfillment. The platform leverages a modular feature-based architecture using GetX for state management and dependency injection, with network repositories abstracted via core networking utilities. Recent enhancements include a comprehensive product attributes system with dynamic attribute options, improved product review and rating functionality with detailed visualization, enhanced form field components, custom phone field validation, rating bar widgets, comprehensive UI safety checks for product image loading, and **major architectural additions** including the enhanced home screen with quick action system and improved product presentation.

## Project Structure
The application initializes through a central entry point that sets up dependency injection, theme, routing, and navigation bindings. Features are organized under the features directory, with dedicated modules for product catalog, product details, orders, payments, categories, and more. Core infrastructure resides under core, including DI, routes, theme, and network utilities. Enhanced UI components are organized under shared/widgets with specialized components for forms, ratings, dialogs, and containers.

```mermaid
graph TB
subgraph "App Bootstrap"
M["main.dart"]
DI["dependency_injection.dart"]
AR["app_routes.dart"]
RT["routes.dart"]
HB["home_bindings.dart"]
HC["home_controller.dart"]
end
subgraph "Enhanced Home Screen"
HV["home_view.dart"]
HQ["custom_quick_action.dart"]
QAL["quick_action_list.dart"]
HS["home_shop.dart"]
HH["home_header.dart"]
HHE["home_helper.dart"]
HAD["home_ai_design.dart"]
end
subgraph "Features"
PC["product_details_controller.dart"]
PAC["products_attributes_controller.dart"]
PAM["product_attributes_model.dart"]
PDR["product_details_rating.dart"]
PDMI["product_details_model.dart"]
OC["order_controller.dart"]
OR["order_review_repo.dart"]
GR["get_orders_repo.dart"]
PM["payment_controller.dart"]
CM["products_model.dart"]
OM["orders_model.dart"]
HPD["home_product_design.dart"]
GSSB["global_search_suggestion_box.dart"]
HOUP["home_our_products.dart"]
PDVI["product_details_view_image.dart"]
PDV["product_details_view.dart"]
end
subgraph "Core"
GN["get_network.dart"]
PWR["post_without_response.dart"]
HM["headers_manager.dart"]
EM["error_model.dart"]
ES["error_snackbar.dart"]
end
subgraph "Enhanced UI Components"
CTFF["custom_text_form_field.dart"]
CPHF["custom_phone_field.dart"]
CRB["custom_rating_builder.dart"]
CRBAR["custom_rating_bar.dart"]
CRD["custom_rating_dialog.dart"]
SC["shared_container.dart"]
end
M --> DI
M --> AR
M --> RT
M --> HB
HB --> HC
M --> HV
HV --> HQ
HV --> HS
HV --> HH
HV --> HAD
HQ --> QAL
PC --> CM
PC --> CRD
PC --> PDR
PC --> PDMI
OC --> GR
OC --> OM
GR --> GN
GR --> HM
GR --> EM
OR --> PWR
OR --> HM
OR --> EM
PC --> HPD
PC --> GSSB
PC --> HOUP
PC --> PDVI
PAC --> PAM
PAC --> GN
```

**Diagram sources**
- [main.dart:12-46](file://lib/main.dart#L12-L46)
- [dependency_injection.dart](file://lib/core/di/dependency_injection.dart)
- [app_routes.dart](file://lib/core/routes/app_routes.dart)
- [routes.dart](file://lib/core/routes/routes.dart)
- [home_bindings.dart:19-55](file://lib/features/home/bindings/home_bindings.dart#L19-L55)
- [home_controller.dart:3-11](file://lib/features/home/controller/home_controller.dart#L3-L11)
- [home_view.dart:18-92](file://lib/features/home/views/home_view.dart#L18-L92)
- [custom_quick_action.dart:10-101](file://lib/shared/widgets/custom_quick_action/custom_quick_action.dart#L10-L101)
- [quick_action_list.dart:4-30](file://lib/shared/widgets/custom_quick_action/quick_action_list.dart#L4-L30)
- [home_shop.dart:11-62](file://lib/features/home/widgets/home_widgets/home_shop.dart#L11-L62)
- [home_header.dart:10-57](file://lib/features/home/widgets/home_widgets/home_header.dart#L10-L57)
- [home_helper.dart:7-88](file://lib/features/home/widgets/home_widgets/home_helper.dart#L7-L88)
- [home_ai_design.dart:10-63](file://lib/features/home/widgets/home_widgets/home_ai_design.dart#L10-L63)
- [product_details_controller.dart:1-162](file://lib/features/product_details.dart/controller/product_details_controller.dart#L1-L162)
- [products_attributes_controller.dart:1-40](file://lib/features/product_details.dart/controller/products_attributes_controller.dart#L1-L40)
- [product_attributes_model.dart:1-100](file://lib/features/product_details.dart/models/product_attributes_model.dart#L1-L100)
- [product_details_rating.dart:1-94](file://lib/features/product_details.dart/widgets/product_details_view_widgets/product_details_rating.dart#L1-L94)
- [product_details_model.dart:1-340](file://lib/features/product_details.dart/models/product_details_model.dart#L1-L340)
- [order_controller.dart:1-41](file://lib/features/order/controllers/order_controller.dart#L1-L41)
- [order_review_repo.dart:1-29](file://lib/features/order/repositories/order_review_repo.dart#L1-L29)
- [get_orders_repo.dart:1-20](file://lib/features/order/repositories/get_orders_repo.dart#L1-L20)
- [products_model.dart:1-267](file://lib/features/home/models/products_model.dart#L1-L267)
- [orders_model.dart:1-308](file://lib/features/order/models/orders_model.dart#L1-L308)
- [home_product_design.dart:1-99](file://lib/features/home/widgets/home_widgets/home_product_design.dart#L1-L99)
- [global_search_suggestion_box.dart:150-226](file://lib/features/home/widgets/home_widgets/global_search_suggestion_box.dart#L150-L226)
- [home_our_products.dart:54-82](file://lib/features/home/widgets/home_widgets/home_our_products.dart#L54-L82)
- [product_details_view_image.dart:1-97](file://lib/features/product_details.dart/widgets/product_details_view_widgets/product_details_view_image.dart#L1-L97)
- [product_details_view.dart:1-91](file://lib/features/product_details.dart/views/product_details_view.dart#L1-L91)
- [get_network.dart](file://lib/core/data/networks/get_network.dart)
- [post_without_response.dart](file://lib/core/data/networks/post_without_response.dart)
- [headers_manager.dart](file://lib/core/data/networks/headers_manager.dart)
- [error_model.dart](file://lib/core/data/global_models/error_model.dart)
- [error_snackbar.dart](file://lib/shared/widgets/snackbars/error_snackbar.dart)
- [custom_text_form_field.dart:1-191](file://lib/shared/widgets/custom_form_field/custom_text_form_field.dart#L1-L191)
- [custom_phone_field.dart:1-116](file://lib/shared/widgets/custom_form_field/custom_phone_field.dart#L1-L116)
- [custom_rating_builder.dart:1-35](file://lib/shared/widgets/custom_rating/custom_rating_builder.dart#L1-L35)
- [custom_rating_bar.dart:1-30](file://lib/shared/widgets/custom_rating/custom_rating_bar.dart#L1-L30)
- [custom_rating_dialog.dart:1-128](file://lib/shared/widgets/custom_dialog/custom_rating_dialog.dart#L1-L128)
- [shared_container.dart:1-57](file://lib/shared/widgets/shared_container.dart#L1-L57)

**Section sources**
- [main.dart:12-46](file://lib/main.dart#L12-L46)
- [app_routes.dart](file://lib/core/routes/app_routes.dart)
- [routes.dart](file://lib/core/routes/routes.dart)
- [dependency_injection.dart](file://lib/core/di/dependency_injection.dart)
- [home_bindings.dart:19-55](file://lib/features/home/bindings/home_bindings.dart#L19-L55)

## Core Components
- Product Catalog Model: Defines product entities, categories, furniture types, rooms, media, and default options used across the catalog.
- Product Attributes Model: Comprehensive attribute system with product attributes, options, pricing, stock levels, and default selections for dynamic product customization.
- Product Details Model: Enhanced product details with comprehensive metadata, reviews, ratings, media, and attribute configurations.
- Orders Model: Encapsulates order data, items, addresses, status history, and payment metadata including Airwallex integration fields.
- Order Repository: Fetches paginated order lists from the backend using typed JSON deserialization.
- Order Review Repository: Posts product reviews with ratings and messages to the backend.
- Order Controller: Manages loading states, search, and displays orders with error handling via snackbars.
- Product Details Controller: Manages carousel navigation, AI toggle state, customization options, and review management for product media presentation.
- Product Attributes Controller: Manages dynamic attribute loading, expandable sections, and attribute option selection for product customization.
- Payment Controller: Holds form field controllers for payment inputs and manages lifecycle cleanup.
- **Enhanced Home Screen**: Comprehensive home screen with quick action system, improved product presentation, and AI design capabilities.
- **Quick Action System**: Four main categories with icons, titles, descriptions, and navigation to respective views.

**Section sources**
- [products_model.dart:23-129](file://lib/features/home/models/products_model.dart#L23-L129)
- [product_attributes_model.dart:1-100](file://lib/features/product_details.dart/models/product_attributes_model.dart#L1-L100)
- [product_details_model.dart:20-146](file://lib/features/product_details.dart/models/product_details_model.dart#L20-L146)
- [orders_model.dart:1-139](file://lib/features/order/models/orders_model.dart#L1-L139)
- [get_orders_repo.dart:1-20](file://lib/features/order/repositories/get_orders_repo.dart#L1-L20)
- [order_review_repo.dart:1-29](file://lib/features/order/repositories/order_review_repo.dart#L1-L29)
- [order_controller.dart:1-41](file://lib/features/order/controllers/order_controller.dart#L1-L41)
- [product_details_controller.dart:14-162](file://lib/features/product_details.dart/controller/product_details_controller.dart#L14-L162)
- [products_attributes_controller.dart:6-40](file://lib/features/product_details.dart/controller/products_attributes_controller.dart#L6-L40)
- [payment_controller.dart:1-23](file://lib/features/payment/controller/payment_controller.dart#L1-L23)
- [home_view.dart:18-92](file://lib/features/home/views/home_view.dart#L18-L92)
- [custom_quick_action.dart:10-101](file://lib/shared/widgets/custom_quick_action/custom_quick_action.dart#L10-L101)
- [quick_action_list.dart:4-30](file://lib/shared/widgets/custom_quick_action/quick_action_list.dart#L4-L30)

## Architecture Overview
The e-commerce feature architecture follows a layered pattern:
- UI Layer: Feature views bind to controllers for state and actions.
- Controller Layer: Orchestrates data fetching, state updates, and user interactions.
- Repository Layer: Handles network requests and JSON serialization/deserialization.
- Core Layer: Provides shared networking utilities, headers, and error models.
- Enhanced UI Layer: Provides reusable components for forms, ratings, dialogs, and containers.
- **Enhanced Home Screen**: Comprehensive home screen with quick action system and improved user navigation.

```mermaid
graph TB
UI["Feature Views<br/>Order View, Product Details View, Payment View, Home View"]
CTRL["Controllers<br/>OrderController, ProductDetailsController, ProductAttributesController, PaymentController, HomeController"]
REPO["Repositories<br/>GetOrdersRepository, OrderReviewRepository, ProductAttributesRepository"]
NET["Network Utilities<br/>GetNetwork, PostWithoutResponse, HeadersManager"]
MODELS["Data Models<br/>ProductsModel, ProductAttributesModel, ProductDetailsModel, OrdersModel"]
ERR["Error Model & Snackbar"]
QUICK["Quick Action System<br/>CustomQuickAction, QuickActionList"]
HOME["Enhanced Home Screen<br/>HomeView, HomeShop, HomeHeader, HomeAiDesign"]
UI --> CTRL
CTRL --> REPO
REPO --> NET
REPO --> MODELS
REPO --> ERR
UI --> QUICK
UI --> HOME
subgraph "Enhanced UI Components"
FORM["Form Components<br/>CustomTextFormField, CustomPhoneField"]
RATING["Rating Components<br/>CustomRatingBar, CustomRatingBuilder"]
DIALOG["Dialog Components<br/>CustomRatingDialog"]
CONTAINER["Container Components<br/>SharedContainer"]
IMG["Image Loading Safety<br/>Media Validation, Fallback Handling"]
ATTR["Product Attributes<br/>Dynamic Options, Pricing, Stock"]
REV["Rating & Reviews<br/>Distribution, Visualization"]
END
UI --> FORM
UI --> RATING
UI --> DIALOG
UI --> CONTAINER
UI --> IMG
UI --> ATTR
UI --> REV
```

**Diagram sources**
- [order_controller.dart:1-41](file://lib/features/order/controllers/order_controller.dart#L1-L41)
- [get_orders_repo.dart:1-20](file://lib/features/order/repositories/get_orders_repo.dart#L1-L20)
- [order_review_repo.dart:1-29](file://lib/features/order/repositories/order_review_repo.dart#L1-L29)
- [products_attributes_controller.dart:1-40](file://lib/features/product_details.dart/controller/products_attributes_controller.dart#L1-L40)
- [product_attributes_repo.dart:1-21](file://lib/features/product_details.dart/repositories/product_attributes_repo.dart#L1-L21)
- [get_network.dart](file://lib/core/data/networks/get_network.dart)
- [post_without_response.dart](file://lib/core/data/networks/post_without_response.dart)
- [headers_manager.dart](file://lib/core/data/networks/headers_manager.dart)
- [products_model.dart:1-267](file://lib/features/home/models/products_model.dart#L1-L267)
- [product_attributes_model.dart:1-100](file://lib/features/product_details.dart/models/product_attributes_model.dart#L1-L100)
- [product_details_model.dart:1-340](file://lib/features/product_details.dart/models/product_details_model.dart#L1-L340)
- [orders_model.dart:1-308](file://lib/features/order/models/orders_model.dart#L1-L308)
- [error_model.dart](file://lib/core/data/global_models/error_model.dart)
- [error_snackbar.dart](file://lib/shared/widgets/snackbars/error_snackbar.dart)
- [custom_text_form_field.dart:1-191](file://lib/shared/widgets/custom_form_field/custom_text_form_field.dart#L1-L191)
- [custom_phone_field.dart:1-116](file://lib/shared/widgets/custom_form_field/custom_phone_field.dart#L1-L116)
- [custom_rating_builder.dart:1-35](file://lib/shared/widgets/custom_rating/custom_rating_builder.dart#L1-L35)
- [custom_rating_bar.dart:1-30](file://lib/shared/widgets/custom_rating/custom_rating_bar.dart#L1-L30)
- [custom_rating_dialog.dart:1-128](file://lib/shared/widgets/custom_dialog/custom_rating_dialog.dart#L1-L128)
- [shared_container.dart:1-57](file://lib/shared/widgets/shared_container.dart#L1-L57)
- [home_view.dart:18-92](file://lib/features/home/views/home_view.dart#L18-L92)
- [custom_quick_action.dart:10-101](file://lib/shared/widgets/custom_quick_action/custom_quick_action.dart#L10-L101)
- [quick_action_list.dart:4-30](file://lib/shared/widgets/custom_quick_action/quick_action_list.dart#L4-L30)

## Detailed Component Analysis

### Enhanced Home Screen System
- Purpose: Provide an improved user experience with categorized product browsing, quick actions, and enhanced visual presentation.
- Implementation: HomeView serves as the main entry point with stacked layout containing header, quick actions, product sections, and AI design features.
- **Enhancement**: Comprehensive redesign with better organization, improved navigation, and enhanced visual appeal.

```mermaid
classDiagram
class HomeView {
+build(context) Widget
+HomeHeader header
+CustomQuickAction quickAction
+HomeShop shopByRoom
+HomeNewArrival newArrival
+HomeProductPlacement placement
+HomeOurProducts ourProducts
+HomeSell sell
+HomeRent rent
+HomeAiDesign aiDesign
}
class HomeHeader {
+BoxDecoration decoration
+CustomPrimaryText title
+CustomPrimaryText subtitle
+HomeSearchFilter searchFilter
}
class HomeHelper {
+BoxShadow boxShadow()
+Widget blurContainer()
+Widget categoryTitle()
}
HomeView --> HomeHeader : "contains"
HomeView --> HomeHelper : "uses"
```

**Diagram sources**
- [home_view.dart:18-92](file://lib/features/home/views/home_view.dart#L18-L92)
- [home_header.dart:10-57](file://lib/features/home/widgets/home_widgets/home_header.dart#L10-L57)
- [home_helper.dart:7-88](file://lib/features/home/widgets/home_widgets/home_helper.dart#L7-L88)

**Section sources**
- [home_view.dart:18-92](file://lib/features/home/views/home_view.dart#L18-L92)
- [home_header.dart:10-57](file://lib/features/home/widgets/home_widgets/home_header.dart#L10-L57)
- [home_helper.dart:7-88](file://lib/features/home/widgets/home_widgets/home_helper.dart#L7-L88)

### Quick Action System
- Purpose: Provide four main categories (Shop Products, Sell Furniture, Rent Products, Design My Room) with visual icons and descriptions for quick navigation.
- Implementation: CustomQuickAction widget with GridView layout displaying four quick action items with background patterns and overlay graphics.
- **Architecture Enhancement**: New dedicated system for quick navigation with centralized configuration in QuickActionList.

```mermaid
classDiagram
class CustomQuickAction {
+text String?
+GridView.builder grid
+GestureDetector onTap
+SharedContainer container
+Stack overlay
+ImageAsset backgroundPattern
+Column content
+ImageAsset icon
+CustomPrimaryText title
+CustomPrimaryText subtitle
}
class QuickActionList {
+List quickAction
+Map icon
+Map title
+Map sub
+Map page
}
CustomQuickAction --> QuickActionList : "uses"
```

**Diagram sources**
- [custom_quick_action.dart:10-101](file://lib/shared/widgets/custom_quick_action/custom_quick_action.dart#L10-L101)
- [quick_action_list.dart:4-30](file://lib/shared/widgets/custom_quick_action/quick_action_list.dart#L4-L30)

**Section sources**
- [custom_quick_action.dart:10-101](file://lib/shared/widgets/custom_quick_action/custom_quick_action.dart#L10-L101)
- [quick_action_list.dart:4-30](file://lib/shared/widgets/custom_quick_action/quick_action_list.dart#L4-L30)

### Enhanced Product Presentation
- Purpose: Improve product browsing experience with room-based shopping and horizontal scrolling product display.
- Implementation: HomeShop widget uses CachedNetworkImage for efficient image loading with horizontal ListView for room-based product categories.
- **Enhancement**: Better visual presentation with cached image loading and improved user interaction patterns.

```mermaid
sequenceDiagram
participant User as "User"
participant HomeView as "HomeView"
participant HomeShop as "HomeShop"
participant GetRoomsController as "GetRoomsController"
participant CachedImage as "CachedNetworkImage"
User->>HomeView : "Open Home Screen"
HomeView->>HomeShop : "Display Shop by Room"
HomeShop->>GetRoomsController : "Load rooms data"
GetRoomsController->>GetRoomsController : "isLoading = true"
GetRoomsController->>GetRoomsController : "Fetch rooms from repository"
GetRoomsController->>GetRoomsController : "isLoading = false"
GetRoomsController->>HomeShop : "Return rooms data"
HomeShop->>CachedImage : "Load room images"
CachedImage-->>HomeShop : "Display cached images"
User->>HomeShop : "Scroll horizontally"
User->>HomeShop : "Tap on room"
HomeShop->>User : "Navigate to product details"
```

**Diagram sources**
- [home_shop.dart:11-62](file://lib/features/home/widgets/home_widgets/home_shop.dart#L11-L62)

**Section sources**
- [home_shop.dart:11-62](file://lib/features/home/widgets/home_widgets/home_shop.dart#L11-L62)

### AI Room Interior Design
- Purpose: Provide AI-powered interior design capabilities with step-by-step guidance and visual product placement.
- Implementation: HomeAiDesign widget with step indicators, slider for design progression, and product placement visualization.
- **Enhancement**: New AI design feature that enhances the shopping experience with personalized design recommendations.

```mermaid
classDiagram
class HomeAiDesign {
+bool isDark
+SharedContainer container
+CustomPrimaryText title
+SharedContainer designContainer
+HomeAiDesignStep stepIndicator
+HomeAiSlider slider
+HomeProductPlacementPlace placementButton
}
class HomeAiDesignStep {
+int currentStep
+List steps
+Widget buildStepIndicator()
}
class HomeAiSlider {
+double position
+HomeController controller
+updatePosition(dx, width)
}
HomeAiDesign --> HomeAiDesignStep : "contains"
HomeAiDesign --> HomeAiSlider : "contains"
HomeAiDesign --> HomeProductPlacementPlace : "contains"
```

**Diagram sources**
- [home_ai_design.dart:10-63](file://lib/features/home/widgets/home_widgets/home_ai_design.dart#L10-L63)

**Section sources**
- [home_ai_design.dart:10-63](file://lib/features/home/widgets/home_widgets/home_ai_design.dart#L10-L63)

### Enhanced Home Screen System

#### Overview
The enhanced home screen system represents a significant architectural improvement to the e-commerce platform, providing users with a more intuitive and visually appealing shopping experience. The system integrates multiple components including quick actions, improved product presentation, and AI design capabilities.

#### Key Features
- **Quick Action System**: Four main categories with visual icons and descriptions for instant navigation
- **Enhanced Product Presentation**: Room-based shopping with horizontal scrolling and cached image loading
- **AI Room Design**: Step-by-step interior design assistance with visual product placement
- **Improved Visual Design**: Enhanced header with shadow effects and better typography
- **Responsive Layout**: Grid-based quick action system with adaptive spacing

#### Architecture Enhancement
The home screen system introduces a new architectural pattern with dedicated controllers and widgets:

```mermaid
flowchart TD
A["HomeView"] --> B["HomeHeader"]
A --> C["CustomQuickAction"]
A --> D["HomeShop"]
A --> E["HomeNewArrival"]
A --> F["HomeProductPlacement"]
A --> G["HomeOurProducts"]
A --> H["HomeSell"]
A --> I["HomeRent"]
A --> J["HomeAiDesign"]
C --> K["QuickActionList"]
K --> L["Shop Products"]
K --> M["Sell Furniture"]
K --> N["Rent Products"]
K --> O["Design My Room"]
```

**Diagram sources**
- [home_view.dart:34-78](file://lib/features/home/views/home_view.dart#L34-L78)
- [custom_quick_action.dart:25-35](file://lib/shared/widgets/custom_quick_action/custom_quick_action.dart#L25-L35)
- [quick_action_list.dart:5-30](file://lib/shared/widgets/custom_quick_action/quick_action_list.dart#L5-L30)

#### Quick Action Implementation
The quick action system provides instant access to major platform features:

**Features:**
- **Shop Products**: Navigate to product catalog with fast delivery and easy setup
- **Sell Furniture**: Get fair offers with fast pickup included
- **Rent Products**: Brand-new pieces with fast delivery and easy setup
- **Design My Room**: AI-powered interior design assistance

**Implementation Details:**
- Grid-based layout with 2-column responsive design
- Background pattern overlay with subtle opacity
- Icon-based visual representation
- Descriptive subtitle text for each action
- Navigation to respective routes via Get.toNamed()

**Section sources**
- [custom_quick_action.dart:10-101](file://lib/shared/widgets/custom_quick_action/custom_quick_action.dart#L10-L101)
- [quick_action_list.dart:4-30](file://lib/shared/widgets/custom_quick_action/quick_action_list.dart#L4-L30)
- [home_view.dart:39-42](file://lib/features/home/views/home_view.dart#L39-L42)

### Enhanced Product Presentation

#### Overview
The enhanced product presentation system focuses on improving the visual appeal and usability of product browsing through room-based categorization and improved image loading mechanisms.

#### Room-Based Shopping
The HomeShop widget implements a sophisticated room-based product browsing system:

**Key Features:**
- Horizontal scrolling ListView for intuitive navigation
- CachedNetworkImage for efficient image loading and caching
- Room name overlay with white text for contrast
- Responsive design with proper spacing and sizing
- Tap-to-navigate functionality to product details

**Implementation Architecture:**
```mermaid
sequenceDiagram
participant User as "User"
participant HomeView as "HomeView"
participant HomeShop as "HomeShop"
participant GetRoomsController as "GetRoomsController"
participant CachedNetworkImage as "CachedNetworkImage"
User->>HomeView : "Open Home Screen"
HomeView->>HomeShop : "Render Shop by Room"
HomeShop->>GetRoomsController : "Check isLoading"
alt "Loading State"
GetRoomsController-->>HomeShop : "ButtonLoading()"
else "Data Available"
GetRoomsController->>GetRoomsController : "Fetch rooms data"
GetRoomsController-->>HomeShop : "Return rooms list"
HomeShop->>CachedNetworkImage : "Load room image"
CachedNetworkImage-->>HomeShop : "Display cached image"
end
User->>HomeShop : "Tap on room"
HomeShop->>User : "Navigate to product details"
```

**Diagram sources**
- [home_shop.dart:16-60](file://lib/features/home/widgets/home_widgets/home_shop.dart#L16-L60)

#### Visual Design Enhancements
The enhanced presentation includes several visual improvements:

**HomeHeader Enhancements:**
- Large decorative background image
- Bold typography with text shadows for readability
- Responsive sizing using Flutter_ScreenUtil
- Improved spacing and alignment
- Better contrast for text elements

**HomeHelper Utilities:**
- BoxShadow helper for consistent shadow effects
- BlurContainer for glass-morphism effects
- CategoryTitle helper for consistent section headers
- SplitImageClipper for advanced image clipping

**Section sources**
- [home_shop.dart:11-62](file://lib/features/home/widgets/home_widgets/home_shop.dart#L11-L62)
- [home_header.dart:10-57](file://lib/features/home/widgets/home_widgets/home_header.dart#L10-L57)
- [home_helper.dart:7-88](file://lib/features/home/widgets/home_widgets/home_helper.dart#L7-L88)

### AI Room Interior Design

#### Overview
The AI Room Interior Design feature represents a cutting-edge enhancement to the e-commerce platform, providing users with personalized interior design assistance powered by AI technology.

#### Design Architecture
The AI design system consists of several interconnected components:

```mermaid
classDiagram
class HomeAiDesign {
+bool isDark
+SharedContainer container
+CustomPrimaryText title
+SharedContainer designContainer
+HomeAiDesignStep stepIndicator
+HomeAiSlider slider
+HomeProductPlacementPlace placementButton
}
class HomeAiDesignStep {
+int currentStep
+List steps
+Widget buildStepIndicator()
}
class HomeAiSlider {
+double position
+HomeController controller
+updatePosition(dx, width)
}
class HomeProductPlacementPlace {
+String text
+VoidCallback onTap
+Widget build()
}
HomeAiDesign --> HomeAiDesignStep : "contains"
HomeAiDesign --> HomeAiSlider : "contains"
HomeAiDesign --> HomeProductPlacementPlace : "contains"
```

**Diagram sources**
- [home_ai_design.dart:10-63](file://lib/features/home/widgets/home_widgets/home_ai_design.dart#L10-L63)

#### Step-by-Step Design Process
The AI design system guides users through a structured design process:

**Step 1: Design Selection**
- Users choose from various design categories
- Visual indicators show current selection
- Progress tracking through the design process

**Step 2: Slider Interface**
- Interactive slider for design adjustments
- Real-time preview updates
- Position-based calculations for smooth interaction

**Step 3: Product Placement**
- Visual placement of products in design space
- Drag-and-drop functionality
- Realistic product positioning

**Section sources**
- [home_ai_design.dart:10-63](file://lib/features/home/widgets/home_widgets/home_ai_design.dart#L10-L63)

### Enhanced Product Attributes System
- Purpose: Manage dynamic product attributes with options, pricing, stock levels, and default selections for comprehensive product customization.
- Data Model: ProductAttributesModel contains product attributes with nested options including pricing, stock, images, and default flags.
- Implementation: Separate controller and repository handle attribute loading with expandable sections and default option management.
- **Architecture Enhancement**: New dedicated system for managing product customization options beyond basic media and details.

```mermaid
classDiagram
class ProductAttributesModel {
+ProductAttribute[] data
+fromJson(json)
+toJson()
}
class ProductAttribute {
+int productAttributeId
+int attributeId
+String name
+AttributeOption[] options
+fromJson(json)
+toJson()
}
class AttributeOption {
+int productAttributeOptionId
+int optionId
+String name
+dynamic image
+String productImage
+int price
+int stock
+bool isDefault
+fromJson(json)
+toJson()
}
ProductAttributesModel --> ProductAttribute : "contains"
ProductAttribute --> AttributeOption : "has many"
```

**Diagram sources**
- [product_attributes_model.dart:9-100](file://lib/features/product_details.dart/models/product_attributes_model.dart#L9-L100)

**Section sources**
- [product_attributes_model.dart:1-100](file://lib/features/product_details.dart/models/product_attributes_model.dart#L1-L100)
- [products_attributes_controller.dart:1-40](file://lib/features/product_details.dart/controller/products_attributes_controller.dart#L1-L40)
- [product_attributes_repo.dart:1-21](file://lib/features/product_details.dart/repositories/product_attributes_repo.dart#L1-L21)

### Improved Rating and Review System
- Purpose: Provide comprehensive product rating and review functionality with detailed distribution visualization and interactive rating submission.
- Data Model: ProductDetailsModel includes reviews with reviewer information, ratings, timestamps, and verification status.
- Implementation: Dedicated rating components with dynamic star distribution calculation and interactive review submission.
- **Enhancement**: Complete overhaul of rating system with detailed visualization and improved user interaction patterns.

```mermaid
classDiagram
class ProductDetailsModel {
+ProductDetail data
+fromJson(json)
+toJson()
}
class ProductDetail {
+int id
+int categoryId
+String categoryName
+String name
+String sku
+String description
+int price
+int sellingPrice
+String discountType
+int discountAmount
+int finalPrice
+bool isRentable
+bool isFavourite
+bool isInStock
+String status
+dynamic dimensions
+Category category
+FurnitureType furnitureType
+Room[] rooms
+Media[] media
+DefaultOptionId[] defaultOptionIds
+double averageRating
+int totalReviews
+Review[] reviews
+DateTime createdAt
+dynamic updatedAt
+fromJson(json)
+toJson()
}
class Review {
+int id
+int productId
+String reviewerName
+dynamic reviewerImage
+int rating
+String title
+String review
+bool isVerifiedPurchase
+int helpfulCount
+String status
+DateTime createdAt
+fromJson(json)
+toJson()
}
ProductDetailsModel --> ProductDetail : "contains"
ProductDetail --> Review : "has many"
```

**Diagram sources**
- [product_details_model.dart:9-146](file://lib/features/product_details.dart/models/product_details_model.dart#L9-L146)

**Section sources**
- [product_details_model.dart:20-340](file://lib/features/product_details.dart/models/product_details_model.dart#L20-L340)
- [product_details_rating.dart:1-94](file://lib/features/product_details.dart/widgets/product_details_view_widgets/product_details_rating.dart#L1-L94)
- [product_details_rating_info.dart:1-104](file://lib/features/product_details.dart/widgets/product_details_view_widgets/product_details_rating_info.dart#L1-L104)
- [product_details_rating_percent.dart:1-55](file://lib/features/product_details.dart/widgets/product_details_view_widgets/product_details_rating_percent.dart#L1-L55)
- [product_details_review.dart:1-135](file://lib/features/product_details.dart/widgets/product_details_view_widgets/product_details_review.dart#L1-L135)

### Product Details View
- Purpose: Present product media via carousel, handle navigation, expose AI toggle state, and integrate rating/review components.
- Implementation: Uses a carousel controller to manage page transitions and reactive index tracking.
- **Enhancement**: Integrated comprehensive rating and review system with dynamic visualization and interactive submission.
- **UI Safety Checks**: Implements robust image loading with fallback mechanisms and placeholder handling.

```mermaid
sequenceDiagram
participant View as "Product Details View"
participant Ctrl as "ProductDetailsController"
participant AttrCtrl as "ProductAttributesController"
participant Carousel as "CarouselSliderController"
View->>Ctrl : "changeIndex(i)"
Ctrl->>Ctrl : "currentIndex = i"
Ctrl->>Carousel : "animateToPage(i)"
View->>Ctrl : "next()"
Ctrl->>Ctrl : "currentIndex++ if within bounds"
Ctrl->>Carousel : "animateToPage(currentIndex)"
View->>Ctrl : "previous()"
Ctrl->>Ctrl : "currentIndex-- if within bounds"
Ctrl->>Carousel : "animateToPage(currentIndex)"
View->>AttrCtrl : "getProductsAttributes(productID)"
AttrCtrl->>AttrCtrl : "isLoading = true"
AttrCtrl->>AttrCtrl : "Fetch attributes from repository"
AttrCtrl->>AttrCtrl : "isLoading = false"
AttrCtrl->>AttrCtrl : "Set isOpen array for expandable sections"
```

**Diagram sources**
- [product_details_controller.dart:92-107](file://lib/features/product_details.dart/controller/product_details_controller.dart#L92-L107)
- [products_attributes_controller.dart:14-29](file://lib/features/product_details.dart/controller/products_attributes_controller.dart#L14-L29)

**Section sources**
- [product_details_controller.dart:14-162](file://lib/features/product_details.dart/controller/product_details_controller.dart#L14-L162)
- [product_details_view.dart:19-91](file://lib/features/product_details.dart/views/product_details_view.dart#L19-L91)

### Shopping Cart Functionality
- Current Status: No dedicated cart controller or repository was identified in the analyzed files.
- Recommendation: Introduce a CartController with cart items model, add/remove/update item quantities, and persist state. Integrate with product models and inventory checks.

### Order Management
- Retrieval: OrderController fetches orders via GetOrdersRepository, handles loading states, and displays errors via snackbar.
- Data Model: OrdersModel supports pagination links, metadata, order items, addresses, status histories, and payment fields.

```mermaid
sequenceDiagram
participant View as "Orders View"
participant Ctrl as "OrderController"
participant Repo as "GetOrdersRepository"
participant Net as "GetNetwork"
participant Model as "OrdersModel"
participant Err as "ErrorModel"
participant Snack as "ErrorSnackbar"
View->>Ctrl : "onInit()"
Ctrl->>Repo : "execute()"
Repo->>Net : "getData(url, headers, fromJson)"
Net-->>Repo : "Future<Either<Err, OrdersModel>>"
Repo-->>Ctrl : "Either<Err, OrdersModel>"
alt "Failure"
Ctrl->>Snack : "show(error.message)"
else "Success"
Ctrl->>Ctrl : "orders.value = data"
end
```

**Diagram sources**
- [order_controller.dart:16-27](file://lib/features/order/controllers/order_controller.dart#L16-L27)
- [get_orders_repo.dart:11-18](file://lib/features/order/repositories/get_orders_repo.dart#L11-L18)
- [get_network.dart](file://lib/core/data/networks/get_network.dart)
- [orders_model.dart:1-31](file://lib/features/order/models/orders_model.dart#L1-L31)
- [error_model.dart](file://lib/core/data/global_models/error_model.dart)
- [error_snackbar.dart](file://lib/shared/widgets/snackbars/error_snackbar.dart)

**Section sources**
- [order_controller.dart:1-41](file://lib/features/order/controllers/order_controller.dart#L1-L41)
- [get_orders_repo.dart:1-20](file://lib/features/order/repositories/get_orders_repo.dart#L1-L20)
- [orders_model.dart:1-139](file://lib/features/order/models/orders_model.dart#L1-L139)

### Payment Processing
- Current Status: PaymentController holds form field controllers and lifecycle cleanup. No payment gateway integration or transaction handling was identified in the analyzed files.
- Recommendation: Add a PaymentRepository to orchestrate payment initiation, collect payment method data, and finalize transactions. Integrate with Airwallex fields exposed in OrdersModel (client secret and intent ID).

```mermaid
flowchart TD
Start(["User initiates payment"]) --> Collect["Collect payment details via PaymentController"]
Collect --> Validate{"Validate inputs"}
Validate --> |Invalid| ShowError["Show validation error"]
Validate --> |Valid| Initiate["Initiate payment via PaymentRepository"]
Initiate --> Gateway["Call payment gateway API"]
Gateway --> Confirm{"Transaction confirmed?"}
Confirm --> |No| HandleFail["Handle failure and show snackbar"]
Confirm --> |Yes| Complete["Complete order and update UI"]
ShowError --> End(["End"])
HandleFail --> End
Complete --> End
```

**Section sources**
- [payment_controller.dart:1-23](file://lib/features/payment/controller/payment_controller.dart#L1-L23)

### Category Management and Filtering
- Current Status: CategoryController exists but is minimal. No category repository or filtering logic was identified in the analyzed files.
- Recommendation: Implement CategoryRepository for fetching categories and applying filters (e.g., by parent category, slug, or status). Extend Product model queries to filter by category fields.

### Order Lifecycle: From Cart to Fulfillment
- Cart Creation: Not implemented in the analyzed files; propose a cart module with item selection and persistence.
- Checkout: Not implemented; propose checkout flow integrating with payment controller and repository.
- Order Placement: Orders are fetched via GetOrdersRepository; extend to POST orders when cart is checked out.
- Fulfillment: OrdersModel includes status histories and addresses; UI can surface fulfillment progress.

```mermaid
sequenceDiagram
participant User as "User"
participant Cart as "Cart Module"
participant Checkout as "Checkout Flow"
participant Payment as "PaymentController/PaymentRepository"
participant Orders as "OrderController/GetOrdersRepository"
participant Backend as "Backend API"
User->>Cart : "Add items to cart"
User->>Checkout : "Proceed to checkout"
Checkout->>Payment : "Collect payment details"
Payment->>Backend : "Initiate payment"
Backend-->>Payment : "Payment confirmation"
Payment-->>Checkout : "Transaction success"
Checkout->>Backend : "Place order"
Backend-->>Orders : "Order created"
Orders->>User : "Order visible in order list"
```

### Integration Between Systems
- Product Catalog ↔ Orders: OrdersModel includes items with product identifiers and metadata; UI can link order items to product details.
- Cart ↔ Orders: Cart state should serialize to order payload; ensure product availability and pricing snapshot.
- Payments ↔ Orders: Use Airwallex fields (client secret, intent ID) from OrdersModel to finalize payment and update order status.
- Product Attributes ↔ Orders: Product attributes should be captured during purchase for accurate order fulfillment.
- Rating System ↔ Orders: Order review system complements product rating system for comprehensive feedback collection.
- **Quick Action System**: Centralized navigation system integrating with all major platform features.
- **Enhanced Home Screen**: Unified interface combining quick actions, product presentation, and AI design capabilities.

## Enhanced UI Components

### Shared Container Component
The SharedContainer provides a flexible container component with comprehensive styling options including rounded corners, shadows, gradients, and responsive design.

**Key Features:**
- Dark/light mode support with automatic theme detection
- Responsive sizing with Flutter_ScreenUtil integration
- Gradient background support
- Shadow effects and custom borders
- Flexible padding and margin configuration

**Section sources**
- [shared_container.dart:1-57](file://lib/shared/widgets/shared_container.dart#L1-L57)

### Enhanced Form Field Components

#### CustomTextFormField
Provides a highly customizable text input field with extensive styling options and validation support.

**Key Features:**
- Comprehensive styling options (colors, fonts, borders)
- Dark/light mode automatic theming
- Custom label and hint text widgets
- Responsive design with screen utility integration
- Full validation support with custom validators

**Section sources**
- [custom_text_form_field.dart:1-191](file://lib/shared/widgets/custom_form_field/custom_text_form_field.dart#L1-L191)

#### CustomPhoneField
Specialized phone number input field with international phone number validation and formatting.

**Key Features:**
- International phone number support via intl_phone_field package
- Custom validation with phoneValidator extension
- Country code selection and formatting
- Responsive design and dark mode support
- Custom styling with Material Design integration

**Section sources**
- [custom_phone_field.dart:1-116](file://lib/shared/widgets/custom_form_field/custom_phone_field.dart#L1-L116)

## Rating System Components

### CustomRatingBar
Static rating display component using custom icons for consistent visual representation.

**Key Features:**
- Static rating display with custom icon assets
- Configurable icon size and spacing
- Support for different colors and themes
- Responsive design integration
- Used extensively in product details and order management

**Section sources**
- [custom_rating_bar.dart:1-30](file://lib/shared/widgets/custom_rating/custom_rating_bar.dart#L1-L30)

### CustomRatingBuilder
Interactive rating component allowing users to provide ratings with half-star support.

**Key Features:**
- Interactive star rating with half-star precision
- Custom icon asset integration
- Configurable item count and sizing
- Real-time rating updates
- Used in rating dialogs and review systems

**Section sources**
- [custom_rating_builder.dart:1-35](file://lib/shared/widgets/custom_rating/custom_rating_builder.dart#L1-L35)

### CustomRatingDialog
Comprehensive rating and review dialog component integrated with the rating system.

**Key Features:**
- Integrated rating and review submission
- Interactive rating builder for user input
- Rich text area for detailed reviews
- Loading states and error handling
- Dark/light mode support
- Seamless integration with order management system

**Section sources**
- [custom_rating_dialog.dart:1-128](file://lib/shared/widgets/custom_dialog/custom_rating_dialog.dart#L1-L128)

## Validation Extensions

### Phone Validator
Custom phone number validation supporting international formats with Bangladesh country code.

**Validation Rules:**
- Required field validation
- Bangladesh mobile number format: 8801[3-9]XXXXXXX
- Example format: 8801712345678
- Integration with CustomPhoneField component

**Section sources**
- [phone_validator.dart:1-15](file://lib/shared/extensions/validators/phone_validator.dart#L1-L15)

### ABN Validator
Business registration number validation for Australian businesses.

**Validation Rules:**
- Required field validation
- Custom regex pattern for ABN format validation
- Business-specific validation logic
- Integration with authentication forms

**Section sources**
- [abn_validator.dart:1-12](file://lib/shared/extensions/validators/abn_validator.dart#L1-L12)

## UI Safety Checks for Product Image Loading

### Overview
The e-commerce platform implements comprehensive UI safety checks to prevent crashes when products have no associated images. These safety measures ensure robust image loading across all product display components.

### Null and Empty List Validation Patterns

#### Product Catalog Validation
The product catalog implements strict validation before accessing product media URLs:

```mermaid
flowchart TD
A["Product Catalog Request"] --> B{"Has Product Media?"}
B --> |Yes| C{"Media List Not Empty?"}
B --> |No| D["Use Empty String Fallback"]
C --> |Yes| E["Access media.first.url"]
C --> |No| F["Use Empty String Fallback"]
E --> G["Render Product Image"]
F --> G
D --> G
```

**Diagram sources**
- [home_our_products.dart:54-82](file://lib/features/home/widgets/home_widgets/home_our_products.dart#L54-L82)

#### Search Suggestions Validation
Global search suggestions implement primary image selection with fallback mechanisms:

```mermaid
flowchart TD
A["Search Suggestion Request"] --> B{"Has Product Media?"}
B --> |Yes| C{"Has Primary Media?"}
B --> |No| D["Build Placeholder Icon"]
C --> |Yes| E["Use Primary Media URL"]
C --> |No| F["Use First Media URL"]
E --> G["Render Product Image"]
F --> G
D --> G
```

**Diagram sources**
- [global_search_suggestion_box.dart:151-182](file://lib/features/home/widgets/home_widgets/global_search_suggestion_box.dart#L151-L182)

### Image Loading Components

#### HomeProductDesign Component
Implements cached network image loading with comprehensive error handling:

**Key Features:**
- CachedNetworkImage for efficient image loading
- Placeholder loading indicator during image fetch
- Automatic fallback to loading state for failed requests
- Safe image URL handling with null checks

**Section sources**
- [home_product_design.dart:58-66](file://lib/features/home/widgets/home_widgets/home_product_design.dart#L58-L66)

#### Global Search Suggestion Box
Implements robust image loading with error handling and fallback icons:

**Key Features:**
- Primary image selection priority
- Fallback to first available image
- Error builder for network failures
- Placeholder icon for empty states
- Comprehensive null safety checks

**Section sources**
- [global_search_suggestion_box.dart:151-182](file://lib/features/home/widgets/home_widgets/global_search_suggestion_box.dart#L151-L182)

#### Product Details Image Gallery
Implements safe image navigation with fallback mechanisms:

**Key Features:**
- Local image assets for product details
- Navigation controls with boundary checking
- Placeholder handling for empty image lists
- Smooth transitions between images

**Section sources**
- [product_details_view_image.dart:33-51](file://lib/features/product_details.dart/widgets/product_details_view_widgets/product_details_view_image.dart#L33-L51)

#### HomeShop Component
Implements efficient room-based product image loading:

**Key Features:**
- CachedNetworkImageProvider for horizontal scrolling
- Proper image sizing and aspect ratio
- Overlay text for room names
- Responsive design with proper spacing

**Section sources**
- [home_shop.dart:38-55](file://lib/features/home/widgets/home_widgets/home_shop.dart#L38-L55)

### Error Handling Mechanisms

#### Fallback Strategies
- **Empty Media Lists**: Return empty string to prevent null pointer exceptions
- **Missing Primary Images**: Fall back to first available image
- **Network Failures**: Use placeholder icons instead of crashing
- **Null URLs**: Provide default empty string for safe rendering

#### Placeholder Components
- **Chair outline icons for empty product images**
- **Loading indicators during image fetch operations**
- **Graceful degradation when image loading fails**

**Section sources**
- [global_search_suggestion_box.dart:184-192](file://lib/features/home/widgets/home_widgets/global_search_suggestion_box.dart#L184-L192)
- [home_product_design.dart:63-64](file://lib/features/home/widgets/home_widgets/home_product_design.dart#L63-L64)
- [home_shop.dart:38-46](file://lib/features/home/widgets/home_widgets/home_shop.dart#L38-L46)

## Dependency Analysis
- Controllers depend on Repositories for data access.
- Repositories depend on Network utilities and HeadersManager for HTTP communication.
- Models encapsulate JSON serialization/deserialization and are consumed by Repositories and Controllers.
- Error handling is centralized via ErrorModel and ErrorSnackbar.
- Enhanced UI components provide reusable building blocks for consistent user experience.
- **Product Attributes System**: New dedicated controllers and repositories for attribute management.
- **Rating System**: Integrated rating components with dynamic visualization and review submission.
- **UI Safety Checks**: Comprehensive validation patterns ensure robust image loading across all components.
- **Quick Action System**: New centralized navigation system with dedicated widget and configuration classes.
- **Enhanced Home Screen**: Comprehensive redesign with multiple integrated components and improved user experience.

```mermaid
graph LR
PC["ProductDetailsController"] --> PDR["ProductDetailsRating"]
PC --> PDMI["ProductDetailsModel"]
PC --> CM["ProductsModel"]
PAC["ProductAttributesController"] --> PAM["ProductAttributesModel"]
PAC --> PAR["ProductAttributesRepository"]
OC["OrderController"] --> GR["GetOrdersRepository"]
GR --> GN["GetNetwork"]
GR --> HM["HeadersManager"]
GR --> EM["ErrorModel"]
OR["OrderReviewRepository"] --> PWR["PostWithoutResponse"]
OR --> HM
OR --> EM
PC --> ES["ErrorSnackbar"]
PC --> CRD["CustomRatingDialog"]
OC --> CRD
PC --> HPD["HomeProductDesign"]
PC --> GSSB["GlobalSearchSuggestionBox"]
PC --> HOUP["HomeOurProducts"]
PC --> PDVI["ProductDetailsViewImage"]
PAC --> GN
subgraph "Enhanced Home Screen"
HV["HomeView"] --> HQ["CustomQuickAction"]
HV --> HS["HomeShop"]
HV --> HH["HomeHeader"]
HV --> HAD["HomeAiDesign"]
HQ --> QAL["QuickActionList"]
HC["HomeController"] --> HAD
end
subgraph "Enhanced UI Dependencies"
CTFF["CustomTextFormField"] --> CTFF
CPHF["CustomPhoneField"] --> CPHF
CRB["CustomRatingBuilder"] --> CRB
CRBAR["CustomRatingBar"] --> CRBAR
SC["SharedContainer"] --> SC
IMG["Image Safety Checks"] --> IMG
ATTR["Product Attributes"] --> ATTR
REV["Rating & Reviews"] --> REV
END
```

**Diagram sources**
- [product_details_controller.dart:1-162](file://lib/features/product_details.dart/controller/product_details_controller.dart#L1-L162)
- [products_attributes_controller.dart:1-40](file://lib/features/product_details.dart/controller/products_attributes_controller.dart#L1-L40)
- [product_attributes_model.dart:1-100](file://lib/features/product_details.dart/models/product_attributes_model.dart#L1-L100)
- [product_details_rating.dart:1-94](file://lib/features/product_details.dart/widgets/product_details_view_widgets/product_details_rating.dart#L1-L94)
- [order_controller.dart:1-41](file://lib/features/order/controllers/order_controller.dart#L1-L41)
- [get_orders_repo.dart:1-20](file://lib/features/order/repositories/get_orders_repo.dart#L1-L20)
- [order_review_repo.dart:1-29](file://lib/features/order/repositories/order_review_repo.dart#L1-L29)
- [get_network.dart](file://lib/core/data/networks/get_network.dart)
- [post_without_response.dart](file://lib/core/data/networks/post_without_response.dart)
- [headers_manager.dart](file://lib/core/data/networks/headers_manager.dart)
- [error_model.dart](file://lib/core/data/global_models/error_model.dart)
- [error_snackbar.dart](file://lib/shared/widgets/snackbars/error_snackbar.dart)
- [products_model.dart:1-267](file://lib/features/home/models/products_model.dart#L1-L267)
- [product_details_model.dart:1-340](file://lib/features/product_details.dart/models/product_details_model.dart#L1-L340)
- [home_view.dart:18-92](file://lib/features/home/views/home_view.dart#L18-L92)
- [custom_quick_action.dart:10-101](file://lib/shared/widgets/custom_quick_action/custom_quick_action.dart#L10-L101)
- [quick_action_list.dart:4-30](file://lib/shared/widgets/custom_quick_action/quick_action_list.dart#L4-L30)
- [home_shop.dart:11-62](file://lib/features/home/widgets/home_widgets/home_shop.dart#L11-L62)
- [home_header.dart:10-57](file://lib/features/home/widgets/home_widgets/home_header.dart#L10-L57)
- [home_ai_design.dart:10-63](file://lib/features/home/widgets/home_widgets/home_ai_design.dart#L10-L63)
- [home_controller.dart:3-11](file://lib/features/home/controller/home_controller.dart#L3-L11)
- [custom_text_form_field.dart:1-191](file://lib/shared/widgets/custom_form_field/custom_text_form_field.dart#L1-L191)
- [custom_phone_field.dart:1-116](file://lib/shared/widgets/custom_form_field/custom_phone_field.dart#L1-L116)
- [custom_rating_builder.dart:1-35](file://lib/shared/widgets/custom_rating/custom_rating_builder.dart#L1-L35)
- [custom_rating_bar.dart:1-30](file://lib/shared/widgets/custom_rating/custom_rating_bar.dart#L1-L30)
- [custom_rating_dialog.dart:1-128](file://lib/shared/widgets/custom_dialog/custom_rating_dialog.dart#L1-L128)
- [shared_container.dart:1-57](file://lib/shared/widgets/shared_container.dart#L1-L57)

**Section sources**
- [order_bindings.dart:1-11](file://lib/features/order/bindings/order_bindings.dart#L1-L11)
- [home_bindings.dart:19-55](file://lib/features/home/bindings/home_bindings.dart#L19-L55)

## Performance Considerations
- Lazy Loading: Use lazy loading for heavy UI components (e.g., product carousels) to reduce initial load.
- Pagination: Utilize OrdersModel pagination links to implement infinite scroll or pagination controls.
- Caching: Cache frequently accessed product and order data to minimize network calls.
- Reactive Updates: Keep controllers reactive to avoid unnecessary rebuilds; use granular observables.
- UI Component Optimization: Enhanced form fields and rating components use efficient rendering patterns with proper widget caching.
- **Image Loading Optimization**: CachedNetworkImage implementation reduces memory usage and improves performance for repeated image loads.
- **Attribute Loading**: Product attributes are loaded asynchronously to prevent blocking the main UI thread.
- **Rating Calculation**: Star distribution calculations are performed efficiently with minimal computational overhead.
- **Quick Action System**: Grid-based layout with proper caching and responsive design for optimal performance.
- **AI Design Features**: Optimized slider interactions and real-time updates for smooth user experience.

## Troubleshooting Guide
- Network Failures: Errors are returned as Either<ErrorModel, T>; ensure controllers handle failures gracefully and display user-friendly messages via ErrorSnackbar.
- Authentication: HeadersManager supplies standardized headers; verify tokens are attached for protected endpoints.
- UI Feedback: Use OrderController's loading state and error snackbar to inform users during data fetches.
- Form Validation: Custom validators provide clear error messages for invalid inputs in form fields.
- Rating System: Ensure proper initialization of rating components and handle edge cases in rating updates.
- **Image Loading Issues**: Verify media validation patterns are correctly implemented; check for null URL handling and fallback mechanisms.
- **Empty Product States**: Ensure fallback placeholders are displayed when product media is unavailable.
- **Attribute Loading**: Verify ProductAttributesController properly handles loading states and error conditions.
- **Rating Distribution**: Ensure star count calculations handle edge cases like empty review lists or invalid rating values.
- **Quick Action Navigation**: Verify route navigation works correctly for all four quick action categories.
- **Home Screen Layout**: Check responsive design works across different screen sizes and orientations.
- **AI Design Interactions**: Ensure slider interactions and design updates work smoothly without performance issues.

**Section sources**
- [order_controller.dart:16-27](file://lib/features/order/controllers/order_controller.dart#L16-L27)
- [error_model.dart](file://lib/core/data/global_models/error_model.dart)
- [error_snackbar.dart](file://lib/shared/widgets/snackbars/error_snackbar.dart)
- [headers_manager.dart](file://lib/core/data/networks/headers_manager.dart)
- [phone_validator.dart:1-15](file://lib/shared/extensions/validators/phone_validator.dart#L1-L15)
- [products_attributes_controller.dart:20-28](file://lib/features/product_details.dart/controller/products_attributes_controller.dart#L20-L28)
- [product_details_rating.dart:21-38](file://lib/features/product_details.dart/widgets/product_details_view_widgets/product_details_rating.dart#L21-L38)
- [custom_quick_action.dart:38-41](file://lib/shared/widgets/custom_quick_action/custom_quick_action.dart#L38-L41)
- [home_view.dart:39-42](file://lib/features/home/views/home_view.dart#L39-L42)
- [home_shop.dart:26-32](file://lib/features/home/widgets/home_widgets/home_shop.dart#L26-L32)

## Conclusion
The e-commerce platform establishes a solid foundation with product catalogs, order retrieval, and UI controllers. Recent enhancements significantly improve the user experience through comprehensive form field components, custom phone field validation, rating bar widgets, robust UI safety checks for product image loading, and **major architectural additions** including:

### Major Enhancements
- **Enhanced Home Screen**: Comprehensive redesign with improved visual presentation, better organization, and enhanced user experience
- **Quick Action System**: Four main categories (Shop Products, Sell Furniture, Rent Products, Design My Room) with visual icons and descriptions
- **Improved Product Presentation**: Room-based shopping with horizontal scrolling and cached image loading
- **AI Room Interior Design**: Step-by-step design assistance with visual product placement and real-time updates
- **Enhanced Visual Design**: Improved typography, shadows, and responsive layout across all components
- **Comprehensive Product Attributes System**: Dynamic attribute management with pricing, stock, and default options for complex product customization
- **Enhanced Rating and Review System**: Detailed star distribution visualization, interactive rating submission, and comprehensive review management
- **Expanded UI Component Library**: Specialized rating components with progress indicators and detailed visualization

### Architectural Improvements
- **Integrated Quick Action System**: Centralized navigation system with dedicated widget and configuration classes
- **Enhanced Home Screen Architecture**: Multiple integrated components working together for unified user experience
- **Modular Rating System**: Standalone rating components with reusable visualization patterns
- **Enhanced Data Models**: Comprehensive ProductDetailsModel with rich metadata and review information
- **Improved User Experience**: Interactive rating submission, detailed feedback visualization, and seamless attribute selection
- **Better Performance**: Optimized image loading, responsive design, and efficient component interactions

### Missing Components
The platform still requires cart functionality, checkout flow, payment gateway integration, category filtering, and inventory management. Extending the existing architecture with repositories and controllers for these features will complete the end-to-end shopping experience while maintaining modularity, testability, and robust error handling across all image loading scenarios, enhanced rating systems, and the new quick action navigation system.

The recent enhancements represent a significant step forward in creating a comprehensive e-commerce platform that provides rich product information, detailed customer feedback mechanisms, robust image handling capabilities, and an intuitive user interface essential for modern e-commerce applications. The enhanced home screen with quick action system and improved product presentation creates a more engaging and efficient shopping experience for users.