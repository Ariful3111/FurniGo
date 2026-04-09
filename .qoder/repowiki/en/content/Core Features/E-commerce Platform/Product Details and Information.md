# Product Details and Information

<cite>
**Referenced Files in This Document**
- [main.dart](file://lib/main.dart)
- [app_routes.dart](file://lib/core/routes/app_routes.dart)
- [routes.dart](file://lib/core/routes/routes.dart)
- [product_details_bindings.dart](file://lib/features/product_details.dart/bindings/product_details_bindings.dart)
- [product_details_controller.dart](file://lib/features/product_details.dart/controller/product_details_controller.dart)
- [product_details_view.dart](file://lib/features/product_details.dart/views/product_details_view.dart)
- [product_details_repo.dart](file://lib/features/product_details.dart/repositories/product_details_repo.dart)
- [product_details_model.dart](file://lib/features/product_details.dart/models/product_details_model.dart)
- [products_attributes_controller.dart](file://lib/features/product_details.dart/controller/products_attributes_controller.dart)
- [product_attributes_repo.dart](file://lib/features/product_details.dart/repositories/product_attributes_repo.dart)
- [product_attributes_model.dart](file://lib/features/product_details.dart/models/product_attributes_model.dart)
- [related_products_controller.dart](file://lib/features/product_details.dart/controller/related_products_controller.dart)
- [related_products_repo.dart](file://lib/features/product_details.dart/repositories/related_products_repo.dart)
- [related_products.dart](file://lib/features/product_details.dart/widgets/product_details_view_widgets/related_products.dart)
- [related_product_card.dart](file://lib/features/product_details.dart/widgets/product_details_view_widgets/related_product_card.dart)
- [product_details_tab.dart](file://lib/features/product_details.dart/widgets/product_details_view_widgets/product_details_tab.dart)
- [product_details_cart.dart](file://lib/features/product_details.dart/widgets/product_details_view_widgets/product_details_cart.dart)
- [product_details_helper.dart](file://lib/features/product_details.dart/widgets/product_details_view_widgets/product_details_helper.dart)
- [product_furniture_customized_widgets.dart](file://lib/features/product_details.dart/widgets/product_details_view_widgets/product_furniture_customized_widgets.dart)
- [product_furniture_customized.dart](file://lib/features/product_details.dart/widgets/product_details_view_widgets/product_furniture_customized.dart)
- [product_details_rating.dart](file://lib/features/product_details.dart/widgets/product_details_view_widgets/product_details_rating.dart)
- [product_details_rating_info.dart](file://lib/features/product_details.dart/widgets/product_details_view_widgets/product_details_rating_info.dart)
- [product_details_rating_percent.dart](file://lib/features/product_details.dart/widgets/product_details_view_widgets/product_details_rating_percent.dart)
- [product_details_review.dart](file://lib/features/product_details.dart/widgets/product_details_view_widgets/product_details_review.dart)
- [product_details_view_header.dart](file://lib/features/product_details.dart/widgets/product_details_view_widgets/product_details_view_header.dart)
- [product_details_view_image.dart](file://lib/features/product_details.dart/widgets/product_details_view_widgets/product_details_view_image.dart)
- [product_details_description.dart](file://lib/features/product_details.dart/widgets/product_details_view_widgets/product_details_description.dart)
- [product_details_view_ai.dart](file://lib/features/product_details.dart/widgets/product_details_view_widgets/product_details_view_ai.dart)
- [product_details_offer.dart](file://lib/features/product_details.dart/widgets/product_details_view_widgets/product_details_offer.dart)
- [product_details_rent.dart](file://lib/features/product_details.dart/widgets/product_details_view_widgets/product_details_rent.dart)
- [product_details_room.dart](file://lib/features/product_details.dart/widgets/product_details_view_widgets/product_details_room.dart)
- [product_details_info.dart](file://lib/features/product_details.dart/widgets/product_details_view_widgets/product_details_info.dart)
- [product_details_shipping.dart](file://lib/features/product_details.dart/widgets/product_details_view_widgets/product_details_shipping.dart)
- [product_details_shipping_delivery.dart](file://lib/features/product_details.dart/widgets/product_details_view_widgets/product_details_shipping_delivery.dart)
- [product_details_shipping_membership.dart](file://lib/features/product_details.dart/widgets/product_details_view_widgets/product_details_shipping_membership.dart)
- [dimension_formatter.dart](file://lib/shared/extensions/formatters/dimension_formatter.dart)
- [shared_container.dart](file://lib/shared/widgets/shared_container.dart)
- [custom_primary_text.dart](file://lib/shared/widgets/custom_text/custom_primary_text.dart)
- [colors.dart](file://lib/core/constant/colors.dart)
- [icons_path.dart](file://lib/core/constant/icons_path.dart)
- [images_path.dart](file://lib/core/constant/images_path.dart)
</cite>

## Update Summary
**Changes Made**
- Added comprehensive Related Products System with new RelatedProductsController, RelatedProductsRepository, and specialized widgets
- Enhanced product review/rating system with dynamic rating calculations and improved tabbed interface with smooth animations
- Integrated new accordion-based furniture customization widgets (ProductAccordionItem, AttributeOptionsList, AttributeOptionChip)
- Implemented dynamic rating distribution calculation with percentage-based visualization
- Added new product attributes data model with nested attribute-option hierarchy
- Enhanced dependency injection with separate bindings for product attributes and related products
- Improved product specifications display with enhanced dimension formatting system
- Added new RelatedProductCard component with interactive product discovery features

## Table of Contents
1. [Introduction](#introduction)
2. [Project Structure](#project-structure)
3. [Core Components](#core-components)
4. [Architecture Overview](#architecture-overview)
5. [Detailed Component Analysis](#detailed-component-analysis)
6. [Enhanced Repository Layer](#enhanced-repository-layer)
7. [Comprehensive Data Model](#comprehensive-data-model)
8. [Enhanced Controller Implementation](#enhanced-controller-implementation)
9. [Dynamic Loading States](#dynamic-loading-states)
10. [Enhanced Tabbed Interface System](#enhanced-tabbed-interface-system)
11. [Accordion-Based Furniture Customization](#accordion-based-furniture-customization)
12. [Advanced Product Attributes System](#advanced-product-attributes-system)
13. [Enhanced Review and Rating System](#enhanced-review-and-rating-system)
14. [Advanced Dimension Formatting System](#advanced-dimension-formatting-system)
15. [Related Products Discovery System](#related-products-discovery-system)
16. [Specialized Shipping Information Components](#specialized-shipping-information-components)
17. [Product Specifications Display](#product-specifications-display)
18. [Pricing Display Enhancement](#pricing-display-enhancement)
19. [Dependency Analysis](#dependency-analysis)
20. [Performance Considerations](#performance-considerations)
21. [Troubleshooting Guide](#troubleshooting-guide)
22. [Conclusion](#conclusion)

## Introduction
This document provides comprehensive documentation for the fully enhanced Product Details feature. The feature has been transformed from a partially completed implementation to a fully functional, production-ready solution with a complete repository layer, comprehensive data model, dynamic loading states, and enhanced UI components. The implementation now includes sophisticated product specifications display, shipping information widgets, tab navigation system with AnimatedSwitcher transitions, accordion-based furniture customization, comprehensive product attributes system, robust review/rating functionality with dynamic calculations, and a new Related Products Discovery System that enhances user engagement and increases conversion rates.

## Project Structure
The Product Details feature now follows a complete MVVM architecture with dedicated layers for data management, business logic, and presentation, including the new product attributes system and related products discovery system.

```mermaid
graph TB
subgraph "Application Bootstrap"
MAIN["main.dart"]
ROUTES["routes.dart"]
APP_ROUTES["app_routes.dart"]
END
subgraph "Enhanced Product Details Architecture"
PD_BINDINGS["product_details_bindings.dart<br/>+14 lines enhanced"]
PD_CONTROLLER["product_details_controller.dart<br/>+162 lines enhanced"]
PD_REPO["product_details_repo.dart<br/>+22 lines enhanced"]
PD_MODEL["product_details_model.dart<br/>+278 lines enhanced"]
END
subgraph "Product Attributes System"
ATTR_CONTROLLER["products_attributes_controller.dart<br/>+40 lines new"]
ATTR_REPO["product_attributes_repo.dart<br/>+21 lines new"]
ATTR_MODEL["product_attributes_model.dart<br/>+101 lines new"]
END
subgraph "Related Products Discovery System"
RP_CONTROLLER["related_products_controller.dart<br/>+26 lines new"]
RP_REPO["related_products_repo.dart<br/>+14 lines new"]
RP_WIDGET["related_products.dart<br/>+57 lines new"]
RP_CARD["related_product_card.dart<br/>+136 lines new"]
END
subgraph "Enhanced View Layer"
PD_VIEW["product_details_view.dart<br/>+91 lines enhanced"]
PD_TAB["product_details_tab.dart<br/>+69 lines enhanced"]
PD_INFO["product_details_info.dart<br/>+75 lines enhanced"]
PD_SHIPPING["product_details_shipping.dart<br/>+20 lines enhanced"]
PD_DELIVERY["product_details_shipping_delivery.dart<br/>+66 lines enhanced"]
PD_MEMBERSHIP["product_details_shipping_membership.dart<br/>+82 lines enhanced"]
PD_CUSTOMIZED["product_furniture_customized_widgets.dart<br/>+244 lines enhanced"]
PD_FURNITURE["product_furniture_customized.dart<br/>+63 lines enhanced"]
PD_RATING["product_details_rating.dart<br/>+94 lines enhanced"]
PD_REVIEW["product_details_review.dart<br/>+135 lines enhanced"]
END
subgraph "Specialized Widgets"
ACCORDION_ITEM["product_accordion_item.dart<br/>+123 lines new"]
ATTR_OPTIONS_LIST["attribute_options_list.dart<br/>+33 lines new"]
ATTR_OPTION_CHIP["attribute_option_chip.dart<br/>+73 lines new"]
END
subgraph "Supporting Components"
PD_CART["product_details_cart.dart"]
PD_HELPER["product_details_helper.dart"]
PD_DESCRIPTION["product_details_description.dart<br/>+89 lines enhanced"]
PD_RATING_INFO["product_details_rating_info.dart<br/>+103 lines enhanced"]
PD_RATING_PERCENT["product_details_rating_percent.dart<br/>+55 lines enhanced"]
END
subgraph "Utility Extensions"
DIMENSION_FORMATTER["dimension_formatter.dart<br/>+81 lines enhanced"]
END
MAIN --> ROUTES
ROUTES --> APP_ROUTES
PD_BINDINGS --> PD_CONTROLLER
PD_BINDINGS --> ATTR_CONTROLLER
PD_BINDINGS --> RP_CONTROLLER
PD_CONTROLLER --> PD_REPO
PD_CONTROLLER --> PD_MODEL
ATTR_CONTROLLER --> ATTR_REPO
ATTR_CONTROLLER --> ATTR_MODEL
RP_CONTROLLER --> RP_REPO
PD_VIEW --> PD_TAB
PD_VIEW --> PD_INFO
PD_VIEW --> PD_SHIPPING
PD_VIEW --> PD_DESCRIPTION
PD_VIEW --> PD_RATING
PD_VIEW --> PD_REVIEW
PD_SHIPPING --> PD_DELIVERY
PD_SHIPPING --> PD_MEMBERSHIP
PD_VIEW --> PD_CART
PD_VIEW --> PD_HELPER
PD_TAB --> PD_CUSTOMIZED
PD_CUSTOMIZED --> ACCORDION_ITEM
ACCORDION_ITEM --> ATTR_OPTIONS_LIST
ATTR_OPTIONS_LIST --> ATTR_OPTION_CHIP
PD_RATING --> PD_RATING_INFO
PD_RATING --> PD_RATING_PERCENT
PD_CUSTOMIZED --> DIMENSION_FORMATTER
PD_VIEW --> RP_WIDGET
RP_WIDGET --> RP_CARD
```

**Diagram sources**
- [main.dart:12-47](file://lib/main.dart#L12-L47)
- [routes.dart:206-211](file://lib/core/routes/routes.dart#L206-L211)
- [app_routes.dart:32](file://lib/core/routes/app_routes.dart#L32)
- [product_details_bindings.dart:1-32](file://lib/features/product_details.dart/bindings/product_details_bindings.dart#L1-L32)
- [products_attributes_controller.dart:1-41](file://lib/features/product_details.dart/controller/products_attributes_controller.dart#L1-L41)
- [product_attributes_repo.dart:1-21](file://lib/features/product_details.dart/repositories/product_attributes_repo.dart#L1-L21)
- [product_attributes_model.dart:1-101](file://lib/features/product_details.dart/models/product_attributes_model.dart#L1-L101)
- [related_products_controller.dart:1-35](file://lib/features/product_details.dart/controller/related_products_controller.dart#L1-L35)
- [related_products_repo.dart:1-22](file://lib/features/product_details.dart/repositories/related_products_repo.dart#L1-L22)
- [related_products.dart:1-69](file://lib/features/product_details.dart/widgets/product_details_view_widgets/related_products.dart#L1-L69)
- [related_product_card.dart:1-149](file://lib/features/product_details.dart/widgets/product_details_view_widgets/related_product_card.dart#L1-L149)
- [product_details_rating.dart:1-94](file://lib/features/product_details.dart/widgets/product_details_view_widgets/product_details_rating.dart#L1-L94)
- [product_details_rating_info.dart:1-103](file://lib/features/product_details.dart/widgets/product_details_view_widgets/product_details_rating_info.dart#L1-L103)
- [product_details_rating_percent.dart:1-55](file://lib/features/product_details.dart/widgets/product_details_view_widgets/product_details_rating_percent.dart#L1-L55)

**Section sources**
- [main.dart:12-47](file://lib/main.dart#L12-L47)
- [routes.dart:206-211](file://lib/core/routes/routes.dart#L206-L211)
- [app_routes.dart:32](file://lib/core/routes/app_routes.dart#L32)
- [product_details_bindings.dart:1-32](file://lib/features/product_details.dart/bindings/product_details_bindings.dart#L1-L32)

## Core Components
The enhanced Product Details feature now includes a complete architectural foundation with the new product attributes system and related products discovery system:

- **ProductDetailsBindings**: Dependency injection configuration with lazy loading for repository and controller, including new ProductAttributesController, ProductAttributesRepository, RelatedProductsController, and RelatedProductsRepository
- **ProductDetailsController**: Enhanced with 162 new lines including repository integration, comprehensive state management, and dynamic loading
- **ProductDetailsRepository**: Dedicated data access layer with network integration and error handling
- **ProductDetailsModel**: Complete data model hierarchy with nested entities for categories, furniture types, rooms, media, and default options
- **ProductAttributesController**: New controller managing product attributes with accordion expansion state and loading management
- **ProductAttributesRepository**: New repository layer for fetching product attribute data via REST API
- **ProductAttributesModel**: New comprehensive data model for product attributes with nested attribute-option hierarchy
- **RelatedProductsController**: New controller managing related product recommendations with independent loading state
- **RelatedProductsRepository**: New repository layer for fetching related products via REST API endpoint `/api/products/{id}/related`
- **RelatedProductsSection**: New widget for displaying horizontally scrollable related product recommendations
- **RelatedProductCard**: New interactive card component for individual related products with navigation and action buttons
- **ProductDetailsView**: Fully enhanced layout with dynamic loading states, comprehensive component integration, and related products section
- **ProductDetailsTab**: Advanced tabbed interface with AnimatedSwitcher for smooth transitions and three specialized sections
- **ProductDetailsInfo**: Enhanced product specifications display with DimensionFormatter utility for robust data parsing
- **ProductDetailsDescription**: Updated pricing display logic using finalPrice instead of base price
- **ProductAccordionItem**: New accordion widget for displaying product attributes with expandable panels
- **AttributeOptionsList**: New widget for rendering attribute options in a wrap layout
- **AttributeOptionChip**: New interactive chip widget for individual attribute options with pricing display
- **ProductDetailsRating**: Enhanced rating system with dynamic calculation of rating distributions
- **ProductDetailsReview**: New comprehensive review system with navigation and submission capabilities
- **DimensionFormatter**: New utility class for comprehensive dimension data parsing and formatting

**Section sources**
- [product_details_bindings.dart:1-32](file://lib/features/product_details.dart/bindings/product_details_bindings.dart#L1-L32)
- [product_details_controller.dart:1-162](file://lib/features/product_details.dart/controller/product_details_controller.dart#L1-L162)
- [product_details_repo.dart:1-22](file://lib/features/product_details.dart/repositories/product_details_repo.dart#L1-L22)
- [product_details_model.dart:1-278](file://lib/features/product_details.dart/models/product_details_model.dart#L1-L278)
- [products_attributes_controller.dart:1-41](file://lib/features/product_details.dart/controller/products_attributes_controller.dart#L1-L41)
- [product_attributes_repo.dart:1-21](file://lib/features/product_details.dart/repositories/product_attributes_repo.dart#L1-L21)
- [product_attributes_model.dart:1-101](file://lib/features/product_details.dart/models/product_attributes_model.dart#L1-L101)
- [related_products_controller.dart:1-35](file://lib/features/product_details.dart/controller/related_products_controller.dart#L1-L35)
- [related_products_repo.dart:1-22](file://lib/features/product_details.dart/repositories/related_products_repo.dart#L1-L22)
- [related_products.dart:1-69](file://lib/features/product_details.dart/widgets/product_details_view_widgets/related_products.dart#L1-L69)
- [related_product_card.dart:1-149](file://lib/features/product_details.dart/widgets/product_details_view_widgets/related_product_card.dart#L1-L149)
- [product_details_view.dart:1-91](file://lib/features/product_details.dart/views/product_details_view.dart#L1-L91)
- [product_details_tab.dart:1-69](file://lib/features/product_details.dart/widgets/product_details_view_widgets/product_details_tab.dart#L1-L69)
- [product_details_info.dart:1-75](file://lib/features/product_details.dart/widgets/product_details_view_widgets/product_details_info.dart#L1-L75)
- [product_details_description.dart:1-89](file://lib/features/product_details.dart/widgets/product_details_view_widgets/product_details_description.dart#L1-L89)
- [product_accordion_item.dart:1-123](file://lib/features/product_details.dart/widgets/product_furniture_customized_widgets/product_accordion_item.dart#L1-L123)
- [attribute_options_list.dart:1-33](file://lib/features/product_details.dart/widgets/product_furniture_customized_widgets/attribute_options_list.dart#L1-L33)
- [attribute_option_chip.dart:1-73](file://lib/features/product_details.dart/widgets/product_furniture_customized_widgets/attribute_option_chip.dart#L1-L73)
- [product_details_rating.dart:1-94](file://lib/features/product_details.dart/widgets/product_details_view_widgets/product_details_rating.dart#L1-L94)
- [product_details_review.dart:1-135](file://lib/features/product_details.dart/widgets/product_details_view_widgets/product_details_review.dart#L1-L135)
- [dimension_formatter.dart:1-81](file://lib/shared/extensions/formatters/dimension_formatter.dart#L1-L81)

## Architecture Overview
The enhanced Product Details feature follows a complete MVVM architecture with comprehensive separation of concerns and dependency injection, including the new product attributes system and related products discovery system.

```mermaid
classDiagram
class ProductDetailsBindings {
+dependencies() void
+lazy loading configuration
+dependency injection setup
+ProductAttributesController injection
+ProductAttributesRepository injection
+RelatedProductsController injection
+RelatedProductsRepository injection
}
class ProductDetailsController {
+ProductDetailsRepository productDetailsRepository
+RxBool isLoading
+Rxn~ProductDetailsModel~ productDetails
+getProductDetails(productID) Future~void~
+scroll controller management
+state management integration
+accordion expansion state
+AnimatedSwitcher integration
}
class ProductDetailsRepository {
+GetNetwork getNetwork
+execute(productID) Future~Either~
+network data fetching
+error handling
}
class ProductDetailsModel {
+ProductDetail data
+Category category
+FurnitureType furnitureType
+Room[] rooms
+Media[] media
+DefaultOptionId[] defaultOptionIds
}
class ProductAttributesController {
+ProductAttributesRepository productAttributesRepository
+Rxn~ProductAttributesModel~ productsAttributes
+RxBool isLoading
+RxList~bool~ isOpen
+getProductsAttributes(productID) Future~void~
+toggleExpand(index) void
}
class ProductAttributesRepository {
+GetNetwork getNetwork
+execute(productID) Future~Either~
+API endpoint : /api/products/{id}/attributes
+error handling
}
class ProductAttributesModel {
+ProductAttribute[] data
}
class RelatedProductsController {
+RelatedProductsRepository relatedProductsRepository
+Rxn~ProductsModel~ relatedProducts
+RxBool isLoading
+getRelatedProducts(productID) Future~void~
}
class RelatedProductsRepository {
+GetNetwork getNetwork
+execute(productID) Future~Either~
+API endpoint : /api/products/{id}/related
+error handling
}
class RelatedProductsSection {
+build(context) Widget
+horizontal scrolling layout
+related product display
}
class RelatedProductCard {
+Product product
+bool isDark
+build(context) Widget
+interactive product navigation
}
class ProductAccordionItem {
+int index
+build(context) Widget
+accordion expansion logic
}
class AttributeOptionsList {
+int attributeIndex
+build(context) Widget
+wrap layout rendering
}
class AttributeOptionChip {
+int attributeIndex
+int optionIndex
+AttributeOption option
+build(context) Widget
}
class ProductDetailsView {
+build(context) Widget
+dynamic loading states
+component composition
+responsive design
+related products integration
}
class DimensionFormatter {
+parseDimensions() Map
+formatKey() String
+formatValue() String
+toList() List
+error handling
}
```

**Diagram sources**
- [product_details_bindings.dart:9-31](file://lib/features/product_details.dart/bindings/product_details_bindings.dart#L9-L31)
- [product_details_controller.dart:14-43](file://lib/features/product_details.dart/controller/product_details_controller.dart#L14-L43)
- [product_details_repo.dart:7-21](file://lib/features/product_details.dart/repositories/product_details_repo.dart#L7-L21)
- [product_details_model.dart:9-18](file://lib/features/product_details.dart/models/product_details_model.dart#L9-L18)
- [products_attributes_controller.dart:6-39](file://lib/features/product_details.dart/controller/products_attributes_controller.dart#L6-L39)
- [product_attributes_repo.dart:7-21](file://lib/features/product_details.dart/repositories/product_attributes_repo.dart#L7-L21)
- [product_attributes_model.dart:9-24](file://lib/features/product_details.dart/models/product_attributes_model.dart#L9-L24)
- [related_products_controller.dart:6-34](file://lib/features/product_details.dart/controller/related_products_controller.dart#L6-L34)
- [related_products_repo.dart:7-21](file://lib/features/product_details.dart/repositories/related_products_repo.dart#L7-L21)
- [related_products.dart:10-68](file://lib/features/product_details.dart/widgets/product_details_view_widgets/related_products.dart#L10-L68)
- [related_product_card.dart:13-148](file://lib/features/product_details.dart/widgets/product_details_view_widgets/related_product_card.dart#L13-L148)
- [product_accordion_item.dart:11-62](file://lib/features/product_details.dart/widgets/product_furniture_customized_widgets/product_accordion_item.dart#L11-L62)
- [attribute_options_list.dart:7-32](file://lib/features/product_details.dart/widgets/product_furniture_customized_widgets/attribute_options_list.dart#L7-L32)
- [attribute_option_chip.dart:9-73](file://lib/features/product_details.dart/widgets/product_furniture_customized_widgets/attribute_option_chip.dart#L9-L73)
- [product_details_view.dart:19-89](file://lib/features/product_details.dart/views/product_details_view.dart#L19-L89)
- [dimension_formatter.dart:3-80](file://lib/shared/extensions/formatters/dimension_formatter.dart#L3-L80)

## Detailed Component Analysis

### Enhanced Repository Layer
The new repository layer provides a complete data access abstraction with the addition of the product attributes system and related products discovery system:

**Product Details Repository Implementation:**
- **Network Integration**: Uses GetNetwork for HTTP requests with proper headers management
- **Error Handling**: Returns Either type for safe error propagation
- **Data Parsing**: Converts JSON responses to strongly-typed ProductDetailsModel
- **Dependency Injection**: Integrated through ProductDetailsBindings

**Product Attributes Repository Implementation:**
- **API Endpoint**: `/api/products/{productID}/attributes` for fetching product attributes
- **Network Integration**: Uses GetNetwork with HeadersManager for authenticated requests
- **Data Parsing**: Converts JSON responses to strongly-typed ProductAttributesModel
- **Error Handling**: Returns Either type for safe error propagation

**Related Products Repository Implementation:**
- **API Endpoint**: `/api/products/{productID}/related` for fetching related product recommendations
- **Network Integration**: Uses GetNetwork with HeadersManager for authenticated requests
- **Data Parsing**: Converts JSON responses to strongly-typed ProductsModel
- **Error Handling**: Returns Either type for safe error propagation

**Key Features:**
- **Async Operations**: Non-blocking data fetching with proper error handling
- **Generic Response Type**: Supports both success and error scenarios
- **Network Configuration**: Centralized header management through HeadersManager
- **Multiple Endpoints**: Dedicated endpoints for product details, attributes, and related products
- **Independent Loading**: Related products load separately from main product details

```mermaid
sequenceDiagram
participant V as "ProductDetailsView"
participant C as "ProductDetailsController"
participant AR as "ProductAttributesController"
participant RC as "RelatedProductsController"
participant DR as "ProductDetailsRepository"
participant ARR as "ProductAttributesRepository"
participant RPR as "RelatedProductsRepository"
participant N as "GetNetwork"
V->>C : Build widget
C->>C : onInit()
C->>DR : execute(productID)
DR->>N : getData()
N-->>DR : ProductDetailsModel
DR-->>C : Either<ErrorModel, ProductDetailsModel>
C->>C : Update reactive state
C-->>V : Obx rebuild
V->>AR : onInit()
AR->>ARR : execute(productID)
ARR->>N : getData("/api/products/{id}/attributes")
N-->>ARR : ProductAttributesModel
ARR-->>AR : Either<ErrorModel, ProductAttributesModel>
AR->>AR : Update reactive state
AR-->>V : Obx rebuild
V->>RC : onInit()
RC->>RPR : execute(productID)
RPR->>N : getData("/api/products/{id}/related")
N-->>RPR : ProductsModel
RPR-->>RC : Either<ErrorModel, ProductsModel>
RC->>RC : Update reactive state
RC-->>V : Obx rebuild
```

**Diagram sources**
- [product_details_controller.dart:29-43](file://lib/features/product_details.dart/controller/product_details_controller.dart#L29-L43)
- [product_details_repo.dart:11-20](file://lib/features/product_details.dart/repositories/product_details_repo.dart#L11-L20)
- [products_attributes_controller.dart:35-39](file://lib/features/product_details.dart/controller/products_attributes_controller.dart#L35-L39)
- [product_attributes_repo.dart:11-20](file://lib/features/product_details.dart/repositories/product_attributes_repo.dart#L11-L20)
- [related_products_controller.dart:29-34](file://lib/features/product_details.dart/controller/related_products_controller.dart#L29-L34)
- [related_products_repo.dart:11-20](file://lib/features/product_details.dart/repositories/related_products_repo.dart#L11-L20)

**Section sources**
- [product_details_bindings.dart:1-32](file://lib/features/product_details.dart/bindings/product_details_bindings.dart#L1-L32)
- [product_details_controller.dart:1-162](file://lib/features/product_details.dart/controller/product_details_controller.dart#L1-L162)
- [product_details_repo.dart:1-22](file://lib/features/product_details.dart/repositories/product_details_repo.dart#L1-L22)
- [products_attributes_controller.dart:1-41](file://lib/features/product_details.dart/controller/products_attributes_controller.dart#L1-L41)
- [product_attributes_repo.dart:1-21](file://lib/features/product_details.dart/repositories/product_attributes_repo.dart#L1-L21)
- [related_products_controller.dart:1-35](file://lib/features/product_details.dart/controller/related_products_controller.dart#L1-L35)
- [related_products_repo.dart:1-22](file://lib/features/product_details.dart/repositories/related_products_repo.dart#L1-L22)

### Comprehensive Data Model
The data model provides complete type safety and structured data representation with the new product attributes system and related products integration:

**Product Details Model Hierarchy:**
- **ProductDetailsModel**: Top-level container with ProductDetail data
- **ProductDetail**: Core product information with pricing, inventory, and metadata
- **Category**: Product category information with hierarchical structure
- **FurnitureType**: Specific furniture classification
- **Room**: Room compatibility information
- **Media**: Product media assets with type and URL information
- **DefaultOptionId**: Default attribute option configurations

**Product Attributes Model Hierarchy:**
- **ProductAttributesModel**: Top-level container with List<ProductAttribute>
- **ProductAttribute**: Individual attribute with productAttributeId, attributeId, name, and options
- **AttributeOption**: Individual option with productAttributeOptionId, optionId, name, image, price, stock, and isDefault
- **Nested Structure**: Hierarchical relationship between attributes and their options

**Related Products Model Hierarchy:**
- **ProductsModel**: Top-level container with List<Product> for related product recommendations
- **Product**: Individual related product with id, name, finalPrice, media, isRentable, and other product properties
- **Media**: Product media asset for related product thumbnails

**Enhanced Features:**
- **Nested Collections**: Support for multiple rooms, media, default options, attribute-option hierarchies, and related product lists
- **Optional Fields**: Proper handling of nullable properties like productImage
- **Date Time Handling**: ISO format date parsing and serialization
- **Final Price Field**: Updated pricing structure with finalPrice for accurate calculations
- **Complete Type Safety**: Strongly-typed models with proper serialization/deserialization
- **Related Product Integration**: Seamless integration with main product details model

**Section sources**
- [product_details_model.dart:1-283](file://lib/features/product_details.dart/models/product_details_model.dart#L1-L283)
- [product_attributes_model.dart:1-101](file://lib/features/product_details.dart/models/product_attributes_model.dart#L1-L101)
- [related_products_repo.dart:14-18](file://lib/features/product_details.dart/repositories/related_products_repo.dart#L14-L18)

### Enhanced Controller Implementation
The controller now manages the complete product details lifecycle with the new product attributes system and related products discovery system:

**Product Details Controller State Properties:**
- **isLoading**: Reactive loading state for UI feedback
- **productDetails**: Rxn<ProductDetailsModel> for reactive data binding
- **productDetailsRepository**: Injected repository dependency
- **woodColors**: Comprehensive wood finish palette with 10 options
- **widgets**: Dynamic widget array for tab content with AnimatedSwitcher support
- **selectedIndex**: RxInt for tab selection with AnimatedSwitcher key binding

**Product Attributes Controller State Properties:**
- **productsAttributes**: Rxn<ProductAttributesModel> for reactive attributes data
- **isLoading**: Reactive loading state for attributes UI feedback
- **isOpen**: RxList<bool> for accordion expansion state management
- **productAttributesRepository**: Injected repository dependency

**Related Products Controller State Properties:**
- **relatedProducts**: Rxn<ProductsModel> for reactive related products data
- **isLoading**: Reactive loading state for related products UI feedback
- **relatedProductsRepository**: Injected repository dependency

**Enhanced Methods:**
- **getProductDetails()**: Async data fetching with loading state management
- **getProductsAttributes()**: New method for fetching product attributes with loading state management
- **getRelatedProducts()**: New method for fetching related product recommendations with independent loading state
- **changeIndex()**: Carousel slider navigation with controller integration
- **next()/previous()**: Image gallery navigation with modulo arithmetic
- **toggleExpand()**: New method for accordion panel state management
- **Scroll Controller**: Automatic cart visibility management based on scroll position

**Reactive State Management:**
- **Obx Integration**: Automatic UI updates when reactive properties change
- **Memory Management**: Proper disposal of controllers and listeners
- **Error Handling**: User-friendly error feedback through ErrorSnackbar
- **Accordion State**: Separate state management for attributes accordion panels
- **Independent Loading**: Related products load independently from main product details

**Section sources**
- [product_details_controller.dart:1-162](file://lib/features/product_details.dart/controller/product_details_controller.dart#L1-L162)
- [products_attributes_controller.dart:1-41](file://lib/features/product_details.dart/controller/products_attributes_controller.dart#L1-L41)
- [related_products_controller.dart:1-35](file://lib/features/product_details.dart/controller/related_products_controller.dart#L1-L35)

### Dynamic Loading States
The enhanced loading system provides comprehensive user feedback across both product details, attributes, and related products:

**Loading Implementation:**
- **Reactive Loading**: isLoading observable triggers UI state changes
- **ButtonLoading Component**: Custom loading indicator with proper styling
- **Conditional Rendering**: Different UI states based on loading status
- **Error Recovery**: Graceful handling of loading failures
- **Independent Loading States**: Separate loading states for product details, attributes, and related products
- **Related Products Loading**: Dedicated loading state for recommendation section

**User Experience:**
- **Immediate Feedback**: Loading state appears instantly on data fetch
- **Progress Indication**: Visual indication of ongoing operations
- **Graceful Degradation**: Error states provide meaningful user feedback
- **Independent Loading**: Product details, attributes, and related products load independently
- **Seamless Integration**: Related products section loads without blocking main product details

**Section sources**
- [product_details_view.dart:25-30](file://lib/features/product_details.dart/views/product_details_view.dart#L25-L30)
- [product_details_controller.dart:25-43](file://lib/features/product_details.dart/controller/product_details_controller.dart#L25-L43)
- [products_attributes_controller.dart:10-12](file://lib/features/product_details.dart/controller/products_attributes_controller.dart#L10-L12)
- [related_products_controller.dart:11](file://lib/features/product_details.dart/controller/related_products_controller.dart#L11)

## Enhanced Tabbed Interface System
The advanced tabbed interface provides three comprehensive sections with AnimatedSwitcher for smooth transitions:

**Tab Configuration:**
- **Customize**: Furniture customization with expandable panels and interactive options
- **Product Details**: Comprehensive product specifications and dimensions
- **Shipping**: Detailed shipping information with delivery options and membership benefits

**Implementation Features:**
- **Animated Tab Switching**: Smooth transitions between tab content using AnimatedSwitcher
- **Dynamic Content Loading**: Content loads based on selected tab index with proper key management
- **Shared Container Styling**: Consistent visual design across all tabs
- **Responsive Typography**: Adaptive text sizing and styling
- **Smooth Animations**: 300ms duration with easeInOut curves for professional feel

**Section sources**
- [product_details_tab.dart:1-69](file://lib/features/product_details.dart/widgets/product_details_view_widgets/product_details_tab.dart#L1-L69)

## Accordion-Based Furniture Customization
The new accordion-based furniture customization system replaces the monolithic widget approach with modular, expandable panels:

**Accordion Implementation:**
- **ProductAccordionItem**: Individual accordion panel with expand/collapse functionality
- **AttributeOptionsList**: Dynamic option listing for each attribute category
- **AttributeOptionChip**: Interactive chips for selecting customization options
- **Toggle Expansion**: Smooth animated expansion using AnimatedSize widget

**Key Features:**
- **Modular Design**: Each customization category is its own expandable panel
- **Smooth Animations**: 300ms duration with easeInOut curves for professional feel
- **Visual Feedback**: Animated rotation of chevron icons during expansion
- **Responsive Layout**: Wrap-based layout for customization options with proper spacing
- **Price Display**: Option chips show price differences for transparent pricing
- **State Management**: Independent expansion state for each accordion panel

**Section sources**
- [product_furniture_customized_widgets.dart:1-244](file://lib/features/product_details.dart/widgets/product_details_view_widgets/product_furniture_customized_widgets.dart#L1-L244)
- [product_accordion_item.dart:1-123](file://lib/features/product_details.dart/widgets/product_furniture_customized_widgets/product_accordion_item.dart#L1-L123)
- [attribute_options_list.dart:1-33](file://lib/features/product_details.dart/widgets/product_furniture_customized_widgets/attribute_options_list.dart#L1-L33)
- [attribute_option_chip.dart:1-73](file://lib/features/product_details.dart/widgets/product_furniture_customized_widgets/attribute_option_chip.dart#L1-L73)

## Advanced Product Attributes System
The new product attributes system provides comprehensive customization options with a complete MVC architecture:

**ProductAttributesController Features:**
- **Attribute Management**: Fetches and manages product attribute data
- **Accordion State**: Controls expansion state for each attribute panel
- **Error Handling**: Displays user-friendly error messages via ErrorSnackbar
- **Initialization**: Automatically fetches attributes on controller initialization

**ProductAttributesRepository Features:**
- **API Integration**: Connects to `/api/products/{productID}/attributes` endpoint
- **Authentication**: Uses HeadersManager for secure API requests
- **Data Parsing**: Converts raw JSON to strongly-typed ProductAttributesModel
- **Error Propagation**: Returns Either type for safe error handling

**ProductAttributesModel Features:**
- **Hierarchical Structure**: Nested ProductAttribute -> AttributeOption hierarchy
- **Complete Data**: Includes all attribute metadata and option details
- **Type Safety**: Strongly-typed models with proper serialization
- **Optional Fields**: Handles nullable properties like productImage gracefully

**Widget System Features:**
- **ProductAccordionItem**: Main accordion panel component
- **AttributeOptionsList**: Renders attribute options in a responsive wrap layout
- **AttributeOptionChip**: Individual interactive chips with pricing display
- **Smooth Animations**: Professional 300ms transition animations

**Section sources**
- [products_attributes_controller.dart:1-41](file://lib/features/product_details.dart/controller/products_attributes_controller.dart#L1-L41)
- [product_attributes_repo.dart:1-21](file://lib/features/product_details.dart/repositories/product_attributes_repo.dart#L1-L21)
- [product_attributes_model.dart:1-101](file://lib/features/product_details.dart/models/product_attributes_model.dart#L1-L101)
- [product_accordion_item.dart:1-123](file://lib/features/product_details.dart/widgets/product_furniture_customized_widgets/product_accordion_item.dart#L1-L123)
- [attribute_options_list.dart:1-33](file://lib/features/product_details.dart/widgets/product_furniture_customized_widgets/attribute_options_list.dart#L1-L33)
- [attribute_option_chip.dart:1-73](file://lib/features/product_details.dart/widgets/product_furniture_customized_widgets/attribute_option_chip.dart#L1-L73)

## Enhanced Review and Rating System
The enhanced review and rating system provides comprehensive product feedback with dynamic calculations:

**Dynamic Rating Calculation:**
- **Star Count Distribution**: Calculates frequency of each star rating (1-5 stars)
- **Percentage Conversion**: Converts star counts to percentages based on total reviews
- **Real-time Updates**: Ratings update automatically when new reviews are added
- **Average Rating Display**: Shows precise average rating with one decimal place

**ProductDetailsRating Features:**
- **Distribution Visualization**: LinearPercentIndicator shows rating distribution
- **Star-by-Star Breakdown**: Individual bars for each star rating level
- **Count Display**: Shows actual count alongside percentage for transparency
- **Responsive Design**: Adapts to light and dark themes

**ProductDetailsReview Features:**
- **Review Navigation**: Arrow buttons for browsing through reviews
- **Review Submission**: Modal dialog for submitting new reviews
- **Reviewer Information**: Displays reviewer names and profile images
- **Timestamp Display**: Shows relative time for review creation

**Enhanced Components:**
- **ProductDetailsRatingInfo**: Displays average rating and total review count
- **ProductDetailsRatingPercent**: Individual star rating percentage visualization
- **CustomRatingDialog**: Modal form for submitting new reviews
- **Review Cards**: Individual review display with rating stars and content

**Section sources**
- [product_details_rating.dart:1-94](file://lib/features/product_details.dart/widgets/product_details_view_widgets/product_details_rating.dart#L1-L94)
- [product_details_rating_info.dart:1-103](file://lib/features/product_details.dart/widgets/product_details_view_widgets/product_details_rating_info.dart#L1-L103)
- [product_details_rating_percent.dart:1-55](file://lib/features/product_details.dart/widgets/product_details_view_widgets/product_details_rating_percent.dart#L1-L55)
- [product_details_review.dart:1-135](file://lib/features/product_details.dart/widgets/product_details_view_widgets/product_details_review.dart#L1-L135)

## Advanced Dimension Formatting System
The new DimensionFormatter utility provides comprehensive dimension data parsing and formatting:

**DimensionFormatter Features:**
- **Dynamic Parsing**: Handles both Map and JSON String input with error recovery
- **Smart Formatting**: Automatic unit detection for weight (kg) and dimensions (cm)
- **Key Processing**: Converts snake_case keys to readable titles
- **Safe Error Handling**: Graceful fallback for invalid or null data

**Parsing Logic:**
- **Null Safety**: Returns empty map for null input
- **JSON Parsing**: Attempts JSON decode for string inputs
- **Type Checking**: Validates input types and formats
- **Unit Detection**: Intelligent unit assignment based on key patterns

**Formatting Capabilities:**
- **Title Formatting**: Converts keys like "weight_kg" to "Weight Kg"
- **Value Processing**: Formats numeric values with 2 decimal places
- **Unit Addition**: Automatically appends appropriate units (kg/cm)
- **Fallback Handling**: Returns "N/A" for invalid or null values

**Section sources**
- [dimension_formatter.dart:1-81](file://lib/shared/extensions/formatters/dimension_formatter.dart#L1-L81)
- [product_details_info.dart:16-18](file://lib/features/product_details.dart/widgets/product_details_view_widgets/product_details_info.dart#L16-L18)

## Related Products Discovery System
The new Related Products Discovery System provides intelligent product recommendations to enhance user engagement and increase conversion rates:

**RelatedProductsController Features:**
- **Recommendation Management**: Fetches and manages related product recommendations
- **Independent Loading**: Loads separately from main product details for optimal performance
- **Error Handling**: Displays user-friendly error messages via ErrorSnackbar
- **Automatic Initialization**: Fetches recommendations on controller initialization using Get.arguments

**RelatedProductsRepository Features:**
- **API Integration**: Connects to `/api/products/{productID}/related` endpoint for recommendations
- **Authentication**: Uses HeadersManager for secure API requests
- **Data Parsing**: Converts raw JSON to strongly-typed ProductsModel with Product list
- **Error Propagation**: Returns Either type for safe error handling

**RelatedProductsSection Features:**
- **Horizontal Scrolling**: ListView.builder with horizontal scroll direction for product cards
- **Section Header**: "Related Products" title with "See All" navigation option
- **Loading State**: ButtonLoading component during data fetch
- **Responsive Design**: Fixed height container with proper spacing and alignment

**RelatedProductCard Features:**
- **Interactive Navigation**: Tap to navigate to product details page
- **Visual Elements**: Product image with CachedNetworkImage, badge indicators, and action buttons
- **Product Information**: Name, price, and visual indicators (Rent Product/New Arrival)
- **Action Buttons**: Favorite and Cart buttons with proper theming
- **Responsive Sizing**: Fixed width and height constraints with proper scaling

**Design and UX Features:**
- **Themed Components**: Adapts colors based on dark/light theme detection
- **Performance Optimization**: CachedNetworkImage for efficient image loading
- **Touch Targets**: Properly sized interactive elements for mobile devices
- **Visual Hierarchy**: Clear emphasis on product name and price
- **Accessibility**: Proper contrast ratios and touch target sizes

**Section sources**
- [related_products_controller.dart:1-35](file://lib/features/product_details.dart/controller/related_products_controller.dart#L1-L35)
- [related_products_repo.dart:1-22](file://lib/features/product_details.dart/repositories/related_products_repo.dart#L1-L22)
- [related_products.dart:1-69](file://lib/features/product_details.dart/widgets/product_details_view_widgets/related_products.dart#L1-L69)
- [related_product_card.dart:1-149](file://lib/features/product_details.dart/widgets/product_details_view_widgets/related_product_card.dart#L1-L149)

## Specialized Shipping Information Components
The shipping information system provides comprehensive delivery details:

**ProductDetailsShipping**: Main container component combining delivery and membership sections

**ProductDetailsShippingDelivery**: Standard delivery information with:
- Delivery icon and visual indicators
- Free shipping thresholds and conditions
- Estimated delivery dates
- Doorstep delivery inclusion

**ProductDetailsShippingMembership**: Premium membership benefits:
- Gradient background design
- Membership cost information
- Free shipping benefits
- Call-to-action for membership sign-up

**Design Features:**
- **Consistent Styling**: Unified color scheme and typography
- **Responsive Layout**: Adapts to different screen sizes
- **Visual Hierarchy**: Clear importance indication through size and color
- **Interactive Elements**: Hover states and touch feedback

**Section sources**
- [product_details_shipping.dart:1-20](file://lib/features/product_details.dart/widgets/product_details_view_widgets/product_details_shipping.dart#L1-L20)
- [product_details_shipping_delivery.dart:1-66](file://lib/features/product_details.dart/widgets/product_details_view_widgets/product_details_shipping_delivery.dart#L1-L66)
- [product_details_shipping_membership.dart:1-82](file://lib/features/product_details.dart/widgets/product_details_view_widgets/product_details_shipping_membership.dart#L1-L82)

## Product Specifications Display
The ProductDetailsInfo component provides comprehensive product dimension information using the new DimensionFormatter:

**Specification Categories:**
- **Physical Dimensions**: Width, depth, height, seat height, armrest height
- **Weight Information**: Maximum weight capacity and packaging weights
- **Measurement Units**: Automatic metric and imperial unit conversions
- **Technical Specifications**: Leg height and backrest dimensions

**Implementation Features:**
- **Structured Layout**: Two-column design for title-value pairs
- **Responsive Typography**: Adaptive font sizing and weights
- **Color Adaptation**: Theme-aware color schemes
- **Data Formatting**: Proper number formatting and unit display
- **Error Handling**: Graceful fallback for missing or invalid dimension data

**Design Elements:**
- **Bold Headings**: Clear section identification
- **Light Subtitles**: Secondary information display
- **Right-Aligned Values**: Consistent alignment for numerical data
- **Consistent Spacing**: Even vertical rhythm throughout

**Section sources**
- [product_details_info.dart:1-75](file://lib/features/product_details.dart/widgets/product_details_view_widgets/product_details_info.dart#L1-L75)

## Pricing Display Enhancement
The ProductDetailsDescription component now uses the updated finalPrice field for accurate pricing display:

**Pricing Implementation:**
- **Final Price Display**: Uses finalPrice instead of base price for accurate totals
- **Dynamic Pricing**: Real-time price updates based on product modifications
- **Format Precision**: Two decimal places with dollar sign formatting
- **Responsive Sizing**: Adaptive font sizing for different screen widths

**Enhanced Features:**
- **Price Accuracy**: Reflects all discounts, taxes, and modifications
- **User Clarity**: Transparent pricing with clear final cost indication
- **Consistent Formatting**: Standardized currency display across all components
- **Real-time Updates**: Automatic price updates when customization options change

**Section sources**
- [product_details_description.dart:70](file://lib/features/product_details.dart/widgets/product_details_view_widgets/product_details_description.dart#L70)

## Dependency Analysis
The enhanced Product Details feature has a comprehensive dependency graph with the new product attributes system and related products discovery system:

```mermaid
graph TB
ROUTES["routes.dart"] --> PD_VIEW["product_details_view.dart"]
APP_ROUTES["app_routes.dart"] --> ROUTES
PD_BINDINGS["product_details_bindings.dart"] --> PD_CONTROLLER["product_details_controller.dart"]
PD_BINDINGS --> ATTR_CONTROLLER["products_attributes_controller.dart"]
PD_BINDINGS --> RP_CONTROLLER["related_products_controller.dart"]
PD_CONTROLLER --> PD_REPO["product_details_repo.dart"]
PD_CONTROLLER --> PD_MODEL["product_details_model.dart"]
ATTR_CONTROLLER --> ATTR_REPO["product_attributes_repo.dart"]
ATTR_CONTROLLER --> ATTR_MODEL["product_attributes_model.dart"]
RP_CONTROLLER --> RP_REPO["related_products_repo.dart"]
PD_VIEW --> PD_TAB["product_details_tab.dart"]
PD_VIEW --> PD_INFO["product_details_info.dart"]
PD_VIEW --> PD_SHIPPING["product_details_shipping.dart"]
PD_VIEW --> PD_DESCRIPTION["product_details_description.dart"]
PD_VIEW --> PD_RATING["product_details_rating.dart"]
PD_VIEW --> PD_REVIEW["product_details_review.dart"]
PD_VIEW --> RP_SECTION["RelatedProductsSection"]
PD_SHIPPING --> PD_DELIVERY["product_details_shipping_delivery.dart"]
PD_SHIPPING --> PD_MEMBERSHIP["product_details_shipping_membership.dart"]
PD_VIEW --> PD_CART["product_details_cart.dart"]
PD_VIEW --> PD_HELPER["product_details_helper.dart"]
PD_TAB --> PD_CUSTOMIZED["product_furniture_customized_widgets.dart"]
PD_CUSTOMIZED --> ACCORDION_ITEM["product_accordion_item.dart"]
ACCORDION_ITEM --> ATTR_OPTIONS_LIST["attribute_options_list.dart"]
ATTR_OPTIONS_LIST --> ATTR_OPTION_CHIP["attribute_option_chip.dart"]
PD_RATING --> PD_RATING_INFO["product_details_rating_info.dart"]
PD_RATING --> PD_RATING_PERCENT["product_details_rating_percent.dart"]
PD_CUSTOMIZED --> DIMENSION_FORMATTER["dimension_formatter.dart"]
RP_SECTION --> RP_CARD["RelatedProductCard"]
PD_CONTROLLER --> PD_REPO
PD_CONTROLLER --> PD_MODEL
ATTR_CONTROLLER --> ATTR_REPO
ATTR_CONTROLLER --> ATTR_MODEL
RP_CONTROLLER --> RP_REPO
RP_CONTROLLER --> PRODUCTS_MODEL["ProductsModel"]
PD_REPO --> GET_NETWORK["GetNetwork"]
ATTR_REPO --> GET_NETWORK
RP_REPO --> GET_NETWORK
PD_MODEL --> MODEL_CLASSES["ProductDetail, Category, Media, etc."]
ATTR_MODEL --> ATTR_MODEL_CLASSES["ProductAttribute, AttributeOption, etc."]
RP_REPO --> PRODUCTS_MODEL
PD_DESCRIPTION --> MODEL_CLASSES
PD_INFO --> DIMENSION_FORMATTER
PD_CART --> CUSTOM_TEXT["custom_primary_text.dart"]
PD_TAB --> CUSTOM_TEXT
PD_INFO --> CUSTOM_TEXT
PD_SHIPPING --> CUSTOM_TEXT
PD_DELIVERY --> CUSTOM_TEXT
PD_MEMBERSHIP --> CUSTOM_TEXT
PD_CART --> COLORS["colors.dart"]
PD_TAB --> COLORS
PD_INFO --> COLORS
PD_SHIPPING --> COLORS
PD_DELIVERY --> COLORS
PD_MEMBERSHIP --> COLORS
PD_CUSTOMIZED --> COLORS
PD_DESCRIPTION --> COLORS
PD_RATING --> COLORS
PD_REVIEW --> COLORS
PD_RATING_INFO --> COLORS
PD_RATING_PERCENT --> COLORS
RP_SECTION --> COLORS
RP_CARD --> COLORS
```

**Diagram sources**
- [routes.dart:206-211](file://lib/core/routes/routes.dart#L206-L211)
- [app_routes.dart:32](file://lib/core/routes/app_routes.dart#L32)
- [product_details_bindings.dart:9-31](file://lib/features/product_details.dart/bindings/product_details_bindings.dart#L9-L31)
- [product_details_controller.dart:14-16](file://lib/features/product_details.dart/controller/product_details_controller.dart#L14-L16)
- [products_attributes_controller.dart:7-8](file://lib/features/product_details.dart/controller/products_attributes_controller.dart#L7-L8)
- [related_products_controller.dart:7](file://lib/features/product_details.dart/controller/related_products_controller.dart#L7)
- [product_details_repo.dart:8-9](file://lib/features/product_details.dart/repositories/product_details_repo.dart#L8-L9)
- [product_attributes_repo.dart:8](file://lib/features/product_details.dart/repositories/product_attributes_repo.dart#L8)
- [related_products_repo.dart:8](file://lib/features/product_details.dart/repositories/related_products_repo.dart#L8)
- [product_details_view.dart:19-16](file://lib/features/product_details.dart/views/product_details_view.dart#L19-L16)
- [dimension_formatter.dart:3](file://lib/shared/extensions/formatters/dimension_formatter.dart#L3)

**Section sources**
- [routes.dart:206-211](file://lib/core/routes/routes.dart#L206-L211)
- [app_routes.dart:32](file://lib/core/routes/app_routes.dart#L32)
- [product_details_bindings.dart:1-32](file://lib/features/product_details.dart/bindings/product_details_bindings.dart#L1-L32)

## Performance Considerations
The enhanced feature set includes several performance optimizations with the new product attributes system and related products discovery system:

**Memory Management:**
- **Lazy Loading**: Dependencies loaded only when needed through ProductDetailsBindings
- **Proper Disposal**: Controllers and text controllers are properly disposed
- **Reactive Efficiency**: Selective updates through Obx widgets
- **Animation Optimization**: Efficient AnimatedSwitcher and AnimatedSize implementations
- **Independent State Management**: Separate loading states for product details, attributes, and related products

**Network Performance:**
- **Single Request**: Repository consolidates all product data in one request
- **Attribute Separation**: Product attributes loaded independently for better performance
- **Related Products Separation**: Recommendations loaded independently for optimal user experience
- **Error Caching**: Failed requests don't block subsequent attempts
- **Header Management**: Centralized authentication and configuration
- **API Endpoint Optimization**: Dedicated endpoint for attributes and related products reduces payload size

**UI Performance:**
- **Animated Transitions**: Smooth animations with proper duration configuration
- **Conditional Rendering**: Components only render when data is available
- **Responsive Design**: Adaptive layouts for different screen sizes
- **Accordion Optimization**: Efficient state management for expandable panels
- **Wrap Layout Optimization**: Responsive wrap layout for attribute options
- **Horizontal Scrolling Optimization**: ListView.builder with proper item caching for related products

**State Management:**
- **Minimal Rebuilds**: Reactive state changes trigger only necessary UI updates
- **Memory Cleanup**: Proper disposal of scroll controllers and listeners
- **Efficient Lists**: Optimized list rendering with proper keys
- **Animation State**: Proper animation state management for smooth transitions
- **Independent Controllers**: Product details, attributes, and related products controllers operate independently
- **Cached Network Images**: Efficient image loading with CachedNetworkImage for related products

**Section sources**
- [product_details_bindings.dart:11-30](file://lib/features/product_details.dart/bindings/product_details_bindings.dart#L11-L30)
- [product_details_controller.dart:155-160](file://lib/features/product_details.dart/controller/product_details_controller.dart#L155-L160)
- [products_attributes_controller.dart:10-12](file://lib/features/product_details.dart/controller/products_attributes_controller.dart#L10-L12)
- [related_products_controller.dart:11](file://lib/features/product_details.dart/controller/related_products_controller.dart#L11)
- [product_details_view.dart:71-84](file://lib/features/product_details.dart/views/product_details_view.dart#L71-L84)
- [product_details_tab.dart:60-68](file://lib/features/product_details.dart/widgets/product_details_view_widgets/product_details_tab.dart#L60-L68)
- [related_products.dart:47-62](file://lib/features/product_details.dart/widgets/product_details_view_widgets/related_products.dart#L47-L62)

## Troubleshooting Guide
Enhanced troubleshooting for the comprehensive feature set with the new product attributes system and related products discovery system:

**Data Loading Issues:**
- **Repository Connection**: Verify ProductDetailsRepository, ProductAttributesRepository, and RelatedProductsRepository are properly injected
- **Network Configuration**: Check GetNetwork setup and HeadersManager for all repositories
- **JSON Parsing**: Ensure ProductDetailsModel, ProductAttributesModel, and ProductsModel.fromJson handle all cases
- **Loading State**: Confirm isLoading reactive state updates correctly for all controllers
- **API Endpoints**: Verify `/api/products/{id}/attributes`, `/api/products/{id}/related` endpoints accessibility

**State Management Problems:**
- **Reactive Updates**: Verify Obx widgets wrap all reactive state usage
- **Controller Lifecycle**: Ensure proper initialization and disposal for all controllers
- **Memory Leaks**: Check scroll controller and text controller disposal
- **State Synchronization**: Confirm reactive state changes trigger UI updates
- **Accordion State**: Verify isOpen reactive list synchronization for attributes
- **Related Products State**: Check relatedProducts reactive state for recommendation data

**UI Rendering Issues:**
- **Component Dependencies**: Verify all imported widgets are available
- **Theme Adaptation**: Check dark/light theme switching functionality
- **Responsive Design**: Test layout on different screen sizes
- **Animation Performance**: Monitor AnimatedSize and AnimatedSlide performance
- **Accordion State**: Verify isOpen reactive list synchronization
- **Attribute Options**: Check wrap layout rendering for attribute options
- **Related Products Layout**: Verify horizontal scrolling and card rendering
- **Image Loading**: Check CachedNetworkImage performance for related products

**Navigation and Routing:**
- **Route Parameters**: Ensure productID argument is passed correctly to all controllers
- **Binding Registration**: Verify ProductDetailsBindings includes all controllers
- **Component Integration**: Check all widgets integrate properly in ProductDetailsView
- **Argument Passing**: Confirm Get.arguments contains productID for all controllers
- **Product Navigation**: Verify RelatedProductCard navigation to product details route

**Dimension Formatting Issues:**
- **Data Parsing**: Verify DimensionFormatter.parseDimensions handles various input types
- **Error Recovery**: Ensure fallback mechanisms work for invalid data
- **Unit Detection**: Check automatic unit assignment logic
- **Animation State**: Verify accordion expansion state management

**Product Attributes Issues:**
- **API Connectivity**: Verify `/api/products/{id}/attributes` endpoint responds correctly
- **Data Structure**: Ensure ProductAttributesModel matches API response format
- **Option Selection**: Check AttributeOptionChip interaction handling
- **Accordion Expansion**: Verify toggleExpand method works correctly
- **State Initialization**: Confirm isOpen list is properly initialized

**Related Products Issues:**
- **API Connectivity**: Verify `/api/products/{id}/related` endpoint responds correctly
- **Data Structure**: Ensure ProductsModel matches API response format with Product list
- **Card Interaction**: Check RelatedProductCard tap navigation functionality
- **Image Loading**: Verify CachedNetworkImage performance for product thumbnails
- **Loading State**: Confirm independent loading state for related products section
- **Horizontal Scrolling**: Check ListView.builder performance and item caching

**Section sources**
- [product_details_controller.dart:138-160](file://lib/features/product_details.dart/controller/product_details_controller.dart#L138-L160)
- [products_attributes_controller.dart:10-39](file://lib/features/product_details.dart/controller/products_attributes_controller.dart#L10-L39)
- [related_products_controller.dart:10-34](file://lib/features/product_details.dart/controller/related_products_controller.dart#L10-L34)
- [product_details_bindings.dart:9-31](file://lib/features/product_details.dart/bindings/product_details_bindings.dart#L9-L31)
- [product_details_view.dart:25-89](file://lib/features/product_details.dart/views/product_details_view.dart#L25-L89)
- [dimension_formatter.dart:6-20](file://lib/shared/extensions/formatters/dimension_formatter.dart#L6-L20)
- [related_products.dart:16-67](file://lib/features/product_details.dart/widgets/product_details_view_widgets/related_products.dart#L16-L67)
- [related_product_card.dart:24-148](file://lib/features/product_details.dart/widgets/product_details_view_widgets/related_product_card.dart#L24-L148)

## Conclusion
The enhanced Product Details feature represents a complete transformation from a partially functional implementation to a production-ready, architecturally sound solution. The addition of the comprehensive Product Attributes System with new ProductAttributesController, ProductAttributesRepository, and specialized widgets (AttributeOptionChip, AttributeOptionsList, ProductAccordionItem) creates a robust and maintainable codebase. The new Related Products Discovery System with RelatedProductsController, RelatedProductsRepository, RelatedProductsSection, and RelatedProductCard components significantly enhances user engagement and increases conversion rates through intelligent product recommendations. The enhanced review/rating system with dynamic rating calculations and improved tabbed interface with smooth animations further elevates the user experience. The MVVM architecture ensures clean separation of concerns, while the dependency injection system provides flexibility and testability. The feature successfully balances functionality with performance, offering users a comprehensive product exploration experience with professional-grade error handling, responsive design, smooth interactive animations, sophisticated product customization capabilities, and intelligent product discovery features.