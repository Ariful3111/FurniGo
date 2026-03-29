# Administrative Features

<cite>
**Referenced Files in This Document**
- [main.dart](file://lib/main.dart)
- [app_routes.dart](file://lib/core/routes/app_routes.dart)
- [routes.dart](file://lib/core/routes/routes.dart)
- [dashboard_bindings.dart](file://lib/features/dashboard/bindings/dashboard_bindings.dart)
- [dashboard_controller.dart](file://lib/features/dashboard/controller/dashboard_controller.dart)
- [recent_order_model.dart](file://lib/features/dashboard/models/recent_order_model.dart)
- [support_bindings.dart](file://lib/features/support/bindings/support_bindings.dart)
- [support_controller.dart](file://lib/features/support/controller/support_controller.dart)
- [user_profile_model.dart](file://lib/core/data/global_models/user_profile_model.dart)
- [icons_path.dart](file://lib/core/constant/icons_path.dart)
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
This document describes the administrative features present in the ZB-DEZINE codebase, focusing on the dashboard analytics system, customer support and ticketing mechanisms, and user-related models that underpin administrative workflows. It also outlines conceptual administrative procedures, security considerations for admin access, and audit/logging recommendations grounded in the current implementation.

## Project Structure
The application uses a modular feature-based structure with route definitions and dependency injection. Administrative-capable areas include:
- Dashboard: analytics overview, quick actions, and recent orders
- Support: help desk and ticketing interface
- Authentication and routing: initial route selection and navigation
- Global models: user profile data used across features

```mermaid
graph TB
subgraph "Entry Point"
MAIN["main.dart<br/>App bootstrap and initial route"]
end
subgraph "Routing"
ROUTES["routes.dart<br/>Route registry"]
APP_ROUTES["app_routes.dart<br/>Named routes"]
end
subgraph "Dashboard"
DASH_BIND["dashboard_bindings.dart<br/>DI bindings"]
DASH_CTRL["dashboard_controller.dart<br/>Analytics and quick actions"]
RECENT_MODEL["recent_order_model.dart<br/>Order model"]
end
subgraph "Support"
SUP_BIND["support_bindings.dart<br/>DI bindings"]
SUP_CTRL["support_controller.dart<br/>Ticketing data"]
end
subgraph "Models"
USER_MODEL["user_profile_model.dart<br/>User profile schema"]
ICONS["icons_path.dart<br/>Asset icon paths"]
end
MAIN --> ROUTES
ROUTES --> APP_ROUTES
ROUTES --> DASH_BIND
ROUTES --> SUP_BIND
DASH_BIND --> DASH_CTRL
DASH_BIND --> ICONS
DASH_CTRL --> RECENT_MODEL
SUP_BIND --> SUP_CTRL
MAIN --> USER_MODEL
```

**Diagram sources**
- [main.dart:12-46](file://lib/main.dart#L12-L46)
- [routes.dart:55-211](file://lib/core/routes/routes.dart#L55-L211)
- [app_routes.dart:1-34](file://lib/core/routes/app_routes.dart#L1-L34)
- [dashboard_bindings.dart:7-15](file://lib/features/dashboard/bindings/dashboard_bindings.dart#L7-L15)
- [dashboard_controller.dart:6-63](file://lib/features/dashboard/controller/dashboard_controller.dart#L6-L63)
- [recent_order_model.dart:1-15](file://lib/features/dashboard/models/recent_order_model.dart#L1-L15)
- [support_bindings.dart:4-9](file://lib/features/support/bindings/support_bindings.dart#L4-L9)
- [support_controller.dart:4-31](file://lib/features/support/controller/support_controller.dart#L4-L31)
- [user_profile_model.dart:1-72](file://lib/core/data/global_models/user_profile_model.dart#L1-L72)
- [icons_path.dart:1-100](file://lib/core/constant/icons_path.dart#L1-L100)

**Section sources**
- [main.dart:12-46](file://lib/main.dart#L12-L46)
- [routes.dart:55-211](file://lib/core/routes/routes.dart#L55-L211)
- [app_routes.dart:1-34](file://lib/core/routes/app_routes.dart#L1-L34)

## Core Components
- Dashboard analytics and quick actions: Provides overview tiles, recent orders, and navigation targets for shop, sell, and rent flows.
- Support and ticketing: Defines categories and sample tickets for a help desk interface.
- User profile model: Standardized user data structure used across features.
- Routing and DI: Centralized route registration and lazy-loading of controllers.

Key implementation references:
- Dashboard quick actions and recent orders: [dashboard_controller.dart:9-34](file://lib/features/dashboard/controller/dashboard_controller.dart#L9-L34), [dashboard_controller.dart:35-57](file://lib/features/dashboard/controller/dashboard_controller.dart#L35-L57)
- Support categories and tickets: [support_controller.dart:11-31](file://lib/features/support/controller/support_controller.dart#L11-L31)
- User profile schema: [user_profile_model.dart:19-71](file://lib/core/data/global_models/user_profile_model.dart#L19-L71)
- Route registration: [routes.dart:116-195](file://lib/core/routes/routes.dart#L116-L195)

**Section sources**
- [dashboard_controller.dart:6-63](file://lib/features/dashboard/controller/dashboard_controller.dart#L6-L63)
- [support_controller.dart:4-31](file://lib/features/support/controller/support_controller.dart#L4-L31)
- [user_profile_model.dart:1-72](file://lib/core/data/global_models/user_profile_model.dart#L1-L72)
- [routes.dart:55-211](file://lib/core/routes/routes.dart#L55-L211)

## Architecture Overview
The application initializes via the main entry point, sets up theme and routing, and lazily loads feature controllers through dependency injection. Routes define named destinations for dashboard, support, and other features. Controllers encapsulate UI logic and data for analytics and support.

```mermaid
sequenceDiagram
participant App as "MyApp (main.dart)"
participant DI as "DependencyInjection"
participant Router as "GetMaterialApp (routes.dart)"
participant Dash as "DashboardController"
participant Sup as "SupportController"
App->>DI : Initialize and resolve token
App->>Router : Configure routes and initial route
Router->>Dash : Lazy load via DashboardBindings
Router->>Sup : Lazy load via SupportBindings
Router-->>App : Render UI with routes
```

**Diagram sources**
- [main.dart:12-46](file://lib/main.dart#L12-L46)
- [routes.dart:116-195](file://lib/core/routes/routes.dart#L116-L195)
- [dashboard_bindings.dart:7-15](file://lib/features/dashboard/bindings/dashboard_bindings.dart#L7-L15)
- [support_bindings.dart:4-9](file://lib/features/support/bindings/support_bindings.dart#L4-L9)

## Detailed Component Analysis

### Dashboard Analytics System
The dashboard controller exposes:
- Quick action tiles for shop, sell, rent, and design
- Recent orders list with status and action indicators
- Expandable rows and column headers for tabular presentation

```mermaid
classDiagram
class DashboardController {
+String[] dashboardTableColumn
+RxList~bool~ expandedList
+List quickAction
+RecentOrderModel[] recentOrderModel
+onInit()
}
class RecentOrderModel {
+String id
+String eta
+String total
+String status
+String action
}
DashboardController --> RecentOrderModel : "manages"
```

**Diagram sources**
- [dashboard_controller.dart:6-63](file://lib/features/dashboard/controller/dashboard_controller.dart#L6-L63)
- [recent_order_model.dart:1-15](file://lib/features/dashboard/models/recent_order_model.dart#L1-L15)

Administrative workflows supported by the dashboard:
- Business insights: quick action tiles guide administrative tasks (shop, sell, rent).
- Performance metrics: recent orders list provides status visibility and action triggers.
- Data visualization: expandable rows and status indicators enable quick triage.

**Section sources**
- [dashboard_controller.dart:6-63](file://lib/features/dashboard/controller/dashboard_controller.dart#L6-L63)
- [recent_order_model.dart:1-15](file://lib/features/dashboard/models/recent_order_model.dart#L1-L15)
- [icons_path.dart:52-85](file://lib/core/constant/icons_path.dart#L52-L85)

### Customer Support System and Ticketing
The support controller defines:
- Subject, order ID, and message fields for support requests
- Category selection (Payment Issue, Order Problem, Delivery Issue, Technical Issue)
- Sample tickets with title, ID, update time, and status

```mermaid
classDiagram
class SupportController {
+TextEditingController subjectController
+TextEditingController orderIdController
+TextEditingController messageController
+RxString selectedCategory
+String[] categories
+Map[] tickets
}
```

**Diagram sources**
- [support_controller.dart:4-31](file://lib/features/support/controller/support_controller.dart#L4-L31)

Administrative procedures:
- Creating a support ticket: select category, fill subject/order/message, submit.
- Managing tickets: view list, filter/respect statuses, and mark resolution.

**Section sources**
- [support_controller.dart:4-31](file://lib/features/support/controller/support_controller.dart#L4-L31)
- [support_bindings.dart:4-9](file://lib/features/support/bindings/support_bindings.dart#L4-L9)

### User Management and Profiles
The user profile model provides a structured representation of user data, including identifiers, contact info, account type, verification status, and timestamps. This supports administrative user lookup, auditing, and permission checks.

```mermaid
classDiagram
class UserProfileModel {
+Data data
+fromJson(json)
+toJson()
}
class Data {
+int id
+String name
+String email
+String phone
+String abn
+String type
+String status
+String emailVerifiedAt
+String createdAt
+String updatedAt
+fromJson(json)
+toJson()
}
UserProfileModel --> Data : "contains"
```

**Diagram sources**
- [user_profile_model.dart:1-72](file://lib/core/data/global_models/user_profile_model.dart#L1-L72)

Administrative procedures:
- User lookup: retrieve profile by ID or email for audits.
- Permission checks: use type/status fields to enforce role-based access.
- Audit trails: track createdAt/updatedAt for compliance.

**Section sources**
- [user_profile_model.dart:1-72](file://lib/core/data/global_models/user_profile_model.dart#L1-L72)

### Reporting Systems and Analytics Dashboards
Conceptual reporting and analytics features:
- Dashboard KPIs: revenue, order volume, conversion rates, and fulfillment metrics.
- Visualizations: charts for trends, status distributions, and funnel analytics.
- Export capabilities: CSV/PDF reports for stakeholders.

[No sources needed since this section provides conceptual guidance]

### Security Considerations for Admin Access
Conceptual security recommendations:
- Role-based access control (RBAC): restrict dashboard and support administrative routes by user type.
- Audit logging: record admin actions (ticket updates, user status changes, report exports).
- Session management: enforce secure tokens, timeouts, and re-authentication for sensitive operations.
- Least privilege: limit admin actions to necessary scopes (e.g., ticket resolution vs. user deletion).

[No sources needed since this section provides conceptual guidance]

## Dependency Analysis
The dashboard and support features rely on dependency injection to lazily load controllers. Routes centralize navigation and bind controllers to views.

```mermaid
graph LR
APP["main.dart"] --> ROUTES["routes.dart"]
ROUTES --> DASH_BIND["dashboard_bindings.dart"]
ROUTES --> SUP_BIND["support_bindings.dart"]
DASH_BIND --> DASH_CTRL["dashboard_controller.dart"]
SUP_BIND --> SUP_CTRL["support_controller.dart"]
DASH_CTRL --> ICONS["icons_path.dart"]
DASH_CTRL --> RECENT["recent_order_model.dart"]
```

**Diagram sources**
- [main.dart:12-46](file://lib/main.dart#L12-L46)
- [routes.dart:116-195](file://lib/core/routes/routes.dart#L116-L195)
- [dashboard_bindings.dart:7-15](file://lib/features/dashboard/bindings/dashboard_bindings.dart#L7-L15)
- [support_bindings.dart:4-9](file://lib/features/support/bindings/support_bindings.dart#L4-L9)
- [dashboard_controller.dart:6-63](file://lib/features/dashboard/controller/dashboard_controller.dart#L6-L63)
- [recent_order_model.dart:1-15](file://lib/features/dashboard/models/recent_order_model.dart#L1-L15)
- [icons_path.dart:1-100](file://lib/core/constant/icons_path.dart#L1-L100)

**Section sources**
- [routes.dart:55-211](file://lib/core/routes/routes.dart#L55-L211)
- [dashboard_bindings.dart:7-15](file://lib/features/dashboard/bindings/dashboard_bindings.dart#L7-L15)
- [support_bindings.dart:4-9](file://lib/features/support/bindings/support_bindings.dart#L4-L9)

## Performance Considerations
- Lazy loading controllers via dependency injection reduces startup overhead.
- Reactive state (GetX) updates only affected UI parts, minimizing redraws.
- Asset paths for icons should remain static to avoid runtime resolution costs.

[No sources needed since this section provides general guidance]

## Troubleshooting Guide
Common issues and resolutions:
- Navigation failures: verify route names in app_routes and route registry entries.
- Missing controllers: ensure bindings are registered and controllers are lazy-loaded.
- Data inconsistencies: confirm model schemas match backend responses.

**Section sources**
- [app_routes.dart:1-34](file://lib/core/routes/app_routes.dart#L1-L34)
- [routes.dart:116-195](file://lib/core/routes/routes.dart#L116-L195)
- [dashboard_bindings.dart:7-15](file://lib/features/dashboard/bindings/dashboard_bindings.dart#L7-L15)
- [support_bindings.dart:4-9](file://lib/features/support/bindings/support_bindings.dart#L4-L9)

## Conclusion
The ZB-DEZINE codebase provides foundational building blocks for administrative features: a dashboard with quick actions and recent orders, a support module with categories and tickets, and a user profile model suitable for audits and permissions. The routing and dependency injection layers enable scalable extension for advanced analytics, reporting, and security controls.