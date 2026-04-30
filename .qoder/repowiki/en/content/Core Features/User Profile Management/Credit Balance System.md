# Credit Balance System

<cite>
**Referenced Files in This Document**
- [credit_balance_controller.dart](file://lib/features/credit_balance/controller/credit_balance_controller.dart)
- [credit_transaction_model.dart](file://lib/features/credit_balance/models/credit_transaction_model.dart)
- [credit_chart_model.dart](file://lib/features/credit_balance/models/credit_chart_model.dart)
- [credit_balance_bindings.dart](file://lib/features/credit_balance/bindings/credit_balance_bindings.dart)
- [credit_balance_view.dart](file://lib/features/credit_balance/views/credit_balance_view.dart)
- [credit_balance.dart](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/credit_balance.dart)
- [credit_section.dart](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/credit_section.dart)
- [credit_items.dart](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/credit_items.dart)
- [credit_usage_card.dart](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/credit_usage_card.dart)
- [credit_header.dart](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/credit_header.dart)
- [credit_chart.dart](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/credit_chart.dart)
- [cylinder_bar.dart](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/cylinder_bar.dart)
- [cylinder_painter.dart](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/cylinder_painter.dart)
- [cylinder_border.dart](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/cylinder_border.dart)
- [cylinder_bottom_design.dart](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/cylinder_bottom_design.dart)
- [cylinder_inner_design.dart](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/cylinder_inner_design.dart)
- [cylinder_top_design.dart](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/cylinder_top_design.dart)
- [credit_transaction_list.dart](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/credit_transaction_list.dart)
- [credit_transaction_item.dart](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/credit_transaction_item.dart)
- [ai_controller.dart](file://lib/features/ai/controller/ai_controller.dart)
- [ai_dropdown.dart](file://lib/features/ai/widgets/ai_view_widgets/ai_dropdown.dart)
- [ai_dropdown_credit.dart](file://lib/features/ai/widgets/ai_view_widgets/ai_dropdown_credit.dart)
- [ai_dropdown_upgrade.dart](file://lib/features/ai/widgets/ai_view_widgets/ai_dropdown_upgrade.dart)
- [ai_user_credit.dart](file://lib/features/ai/widgets/ai_view_widgets/ai_user_credit.dart)
- [ai_header.dart](file://lib/features/ai/widgets/ai_header.dart)
- [ai_bindings.dart](file://lib/features/ai/bindings/ai_bindings.dart)
- [ai_view.dart](file://lib/features/ai/views/ai_view.dart)
- [routes.dart](file://lib/core/routes/routes.dart)
- [icons_path.dart](file://lib/core/constant/icons_path.dart)
- [pubspec.yaml](file://pubspec.yaml)
</cite>

## Update Summary
**Changes Made**
- Complete architectural overhaul from fl_chart-based bar chart to custom cylinder-based visualization system
- Introduced specialized cylinder components: cylinder_bar.dart, cylinder_painter.dart, cylinder_border.dart, cylinder_bottom_design.dart, cylinder_inner_design.dart, cylinder_top_design.dart
- Eliminated fl_chart dependency in favor of sophisticated CustomPaint and CustomPainter implementation
- Implemented advanced gradient effects, lighting simulations, and realistic 3D-like cylinder rendering
- Added smooth animation transitions with TweenAnimationBuilder for active/inactive state changes
- Enhanced visual effects with multi-layer gradient systems, glass reflections, and dynamic lighting

## Table of Contents
1. [Introduction](#introduction)
2. [Project Structure](#project-structure)
3. [Core Components](#core-components)
4. [Architecture Overview](#architecture-overview)
5. [Detailed Component Analysis](#detailed-component-analysis)
6. [Custom Cylinder Visualization System](#custom-cylinder-visualization-system)
7. [Advanced Cylinder Rendering Engine](#advanced-cylinder-rendering-engine)
8. [AI Credit Integration](#ai-credit-integration)
9. [Dependency Analysis](#dependency-analysis)
10. [Performance Considerations](#performance-considerations)
11. [Troubleshooting Guide](#troubleshooting-guide)
12. [Conclusion](#conclusion)

## Introduction
This document describes the Credit Balance System, focusing on credit transactions, top-up mechanisms, and usage tracking. The system has been enhanced with a revolutionary custom cylinder-based visualization system that completely replaces the previous fl_chart dependency with sophisticated CustomPaint and CustomPainter implementations. The new system provides advanced gradient effects, lighting simulations, and realistic 3D-like cylinder rendering with active/inactive states. It explains the responsibilities of the credit controller for transaction processing, balance calculations, and history management. It documents the credit models for transaction records, balance updates, and financial tracking. It covers the credit view components for balance display, transaction history, and credit management interfaces. It also documents the credit binding configurations for dependency injection and service initialization, and the credit widget components for balance visualization, transaction forms, and status indicators. Finally, it addresses the integration between the credit system and user profile for a seamless credit management experience, including AI-specific credit dropdown functionality.

## Project Structure
The Credit Balance System is organized by feature with dedicated controller, models, bindings, views, and widgets. The system now includes AI integration through specialized dropdown widgets that leverage the existing credit infrastructure. The architecture has been completely redesigned around custom cylinder visualization technology. Routing integrates the credit balance view with its binding and supports AI interface navigation.

```mermaid
graph TB
subgraph "Credit Feature"
V["CreditBalanceView"]
W1["CreditBalance"]
W2["CreditSection"]
W3["CreditItems"]
W4["CreditUsageCard"]
W5["CreditHeader"]
W6["CreditChart"]
W7["CreditTransactionList"]
W8["CreditTransactionItem"]
M1["CreditTransaction model"]
M2["CreditChartModel model"]
C["CreditBalanceController"]
B["CreditBalanceBindings"]
end
subgraph "AI Integration"
AIC["AiController"]
AID["AiDropdown"]
AIDC["AiDropdownCredit"]
AIDU["AiDropdownUpgrade"]
AICredit["AiUserCredit"]
AIH["AiHeader"]
AIV["AiView"]
end
subgraph "Custom Cylinder Visualization Engine"
CB["CylinderBar"]
CP["CylinderPainter"]
CBD["CylinderBorder"]
CBI["CylinderInnerDesign"]
CBB["CylinderBottomDesign"]
CBT["CylinderTopDesign"]
end
R["Routes"] --> V
R --> AIV
V --> W1
V --> W2
V --> W4
W2 --> W3
W4 --> W5
W4 --> W6
W4 --> W7
W7 --> W8
W1 --> C
W2 --> C
W3 --> C
B --> C
AIC --> AID
AID --> AIDC
AIDC --> AIDU
AICredit --> AID
AIH --> AICredit
AIV --> AIH
W6 --> CB
CB --> CP
CP --> CBD
CP --> CBI
CP --> CBB
CP --> CBT
```

**Diagram sources**
- [routes.dart:199-202](file://lib/core/routes/routes.dart#L199-L202)
- [routes.dart:249-252](file://lib/core/routes/routes.dart#L249-L252)
- [credit_balance_view.dart:13-68](file://lib/features/credit_balance/views/credit_balance_view.dart#L13-L68)
- [credit_balance.dart:10-99](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/credit_balance.dart#L10-L99)
- [credit_section.dart:13-110](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/credit_section.dart#L13-L110)
- [credit_items.dart:10-81](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/credit_items.dart#L10-L81)
- [credit_usage_card.dart:9-37](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/credit_usage_card.dart#L9-L37)
- [credit_header.dart:7-37](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/credit_header.dart#L7-L37)
- [credit_chart.dart:9-61](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/credit_chart.dart#L9-L61)
- [cylinder_bar.dart:7-88](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/cylinder_bar.dart#L7-L88)
- [cylinder_painter.dart:10-96](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/cylinder_painter.dart#L10-L96)
- [cylinder_border.dart:4-31](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/cylinder_border.dart#L4-L31)
- [cylinder_inner_design.dart:6-133](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/cylinder_inner_design.dart#L6-L133)
- [cylinder_bottom_design.dart:6-65](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/cylinder_bottom_design.dart#L6-L65)
- [cylinder_top_design.dart:6-98](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/cylinder_top_design.dart#L6-L98)
- [credit_transaction_list.dart:10-121](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/credit_transaction_list.dart#L10-L121)
- [credit_transaction_item.dart:8-73](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/credit_transaction_item.dart#L8-L73)
- [credit_transaction_model.dart:1-11](file://lib/features/credit_balance/models/credit_transaction_model.dart#L1-L11)
- [credit_chart_model.dart:1-7](file://lib/features/credit_balance/models/credit_chart_model.dart#L1-L7)
- [credit_balance_controller.dart:5-56](file://lib/features/credit_balance/controller/credit_balance_controller.dart#L5-L56)
- [credit_balance_bindings.dart:4-9](file://lib/features/credit_balance/bindings/credit_balance_bindings.dart#L4-L9)
- [ai_controller.dart:7-94](file://lib/features/ai/controller/ai_controller.dart#L7-L94)
- [ai_dropdown.dart:10-70](file://lib/features/ai/widgets/ai_view_widgets/ai_dropdown.dart#L10-L70)
- [ai_dropdown_credit.dart:12-88](file://lib/features/ai/widgets/ai_view_widgets/ai_dropdown_credit.dart#L12-L88)
- [ai_dropdown_upgrade.dart:8-49](file://lib/features/ai/widgets/ai_view_widgets/ai_dropdown_upgrade.dart#L8-L49)
- [ai_user_credit.dart:8-31](file://lib/features/ai/widgets/ai_view_widgets/ai_user_credit.dart#L8-L31)
- [ai_header.dart:9-32](file://lib/features/ai/widgets/ai_header.dart#L9-L32)
- [ai_bindings.dart:4-10](file://lib/features/ai/bindings/ai_bindings.dart#L4-L10)
- [ai_view.dart:7-26](file://lib/features/ai/views/ai_view.dart#L7-L26)

**Section sources**
- [routes.dart:199-202](file://lib/core/routes/routes.dart#L199-L202)
- [routes.dart:249-252](file://lib/core/routes/routes.dart#L249-L252)
- [credit_balance_view.dart:13-68](file://lib/features/credit_balance/views/credit_balance_view.dart#L13-L68)

## Core Components
- CreditBalanceController: Manages selection state for credit packages and selected payment card. It exposes reactive properties for UI updates and maintains chart data with monthly credit usage.
- CreditTransaction model: Represents a single credit transaction with title, date, and amount.
- CreditChartModel: Represents a data point for the usage chart with month and value.
- CreditBalanceBindings: Provides dependency injection via lazy loading for the controller.
- Views and Widgets: Compose the credit balance display, purchase section, usage card, charts, and transaction lists.
- **Custom Cylinder Visualization System**: Advanced CustomPaint implementation with specialized cylinder components for creating realistic 3D-like cylinders with gradient effects, lighting simulations, and smooth animation transitions.
- **AI Integration Components**: AiController manages AI-specific credit items and dropdown overlay functionality. AiDropdown provides credit display with dropdown trigger. AiDropdownCredit creates the overlay content with credit usage visualization. AiDropdownUpgrade offers credit package upgrade functionality.

Key responsibilities:
- Transaction processing: Represented by the transaction model and list rendering.
- Balance calculations: Not implemented in code; placeholder balance is shown in widgets.
- History management: Rendered via transaction list and items.
- **Custom Visualization**: Advanced cylinder rendering with active/inactive states, gradient effects, and lighting simulations using specialized cylinder components.
- **AI Credit Management**: Handles AI-specific credit item display and dropdown overlay positioning.

**Section sources**
- [credit_balance_controller.dart:5-56](file://lib/features/credit_balance/controller/credit_balance_controller.dart#L5-L56)
- [credit_transaction_model.dart:1-11](file://lib/features/credit_balance/models/credit_transaction_model.dart#L1-L11)
- [credit_chart_model.dart:1-7](file://lib/features/credit_balance/models/credit_chart_model.dart#L1-L7)
- [credit_balance_bindings.dart:4-9](file://lib/features/credit_balance/bindings/credit_balance_bindings.dart#L4-L9)
- [cylinder_bar.dart:7-88](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/cylinder_bar.dart#L7-L88)
- [cylinder_painter.dart:10-96](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/cylinder_painter.dart#L10-L96)
- [ai_controller.dart:7-94](file://lib/features/ai/controller/ai_controller.dart#L7-L94)
- [ai_dropdown.dart:10-70](file://lib/features/ai/widgets/ai_view_widgets/ai_dropdown.dart#L10-L70)
- [ai_dropdown_credit.dart:12-88](file://lib/features/ai/widgets/ai_view_widgets/ai_dropdown_credit.dart#L12-L88)
- [ai_dropdown_upgrade.dart:8-49](file://lib/features/ai/widgets/ai_view_widgets/ai_dropdown_upgrade.dart#L8-L49)

## Architecture Overview
The system follows a layered architecture with enhanced AI integration and a revolutionary custom visualization engine:
- View layer: CreditBalanceView composes widgets for balance, purchase section, and usage card.
- Widget layer: Reusable widgets encapsulate UI concerns (balance display, custom cylinder chart, transaction list).
- Model layer: Immutable data models for transactions and chart data.
- Controller layer: State management for selections and reactive updates.
- Binding layer: Dependency injection for the controller.
- **Custom Visualization Layer**: Advanced CustomPaint and specialized cylinder components implementation for sophisticated cylinder rendering with gradient effects and lighting simulations.
- **AI Integration Layer**: Specialized controllers and widgets for AI interface credit management with overlay-based dropdown functionality.

```mermaid
graph TB
A["CreditBalanceView"] --> B["CreditBalance"]
A --> C["CreditSection"]
A --> D["CreditUsageCard"]
C --> E["CreditItems"]
D --> F["CreditHeader"]
D --> G["CreditChart"]
D --> H["CreditTransactionList"]
H --> I["CreditTransactionItem"]
B -.-> J["CreditBalanceController"]
C -.-> J
E -.-> J
K["CreditBalanceBindings"] --> J
subgraph "Custom Cylinder Visualization Engine"
L["CylinderBar"] --> M["CylinderPainter"]
M --> N["CylinderBorder"]
M --> O["CylinderInnerDesign"]
M --> P["CylinderBottomDesign"]
M --> Q["CylinderTopDesign"]
N --> R["Glass Reflections"]
O --> S["Multi-layer Gradients"]
P --> T["Liquid Surface Effects"]
Q --> U["Top Cap Rendering"]
end
subgraph "AI Integration"
V["AiController"] --> W["AiDropdown"]
W --> X["AiDropdownCredit"]
X --> Y["AiDropdownUpgrade"]
Z["AiUserCredit"] --> W
AA["AiHeader"] --> Z
AB["AiView"] --> AA
AC["AiBindings"] --> V
end
G --> L
```

**Diagram sources**
- [credit_balance_view.dart:13-68](file://lib/features/credit_balance/views/credit_balance_view.dart#L13-L68)
- [credit_balance.dart:10-99](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/credit_balance.dart#L10-L99)
- [credit_section.dart:13-110](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/credit_section.dart#L13-L110)
- [credit_items.dart:10-81](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/credit_items.dart#L10-L81)
- [credit_usage_card.dart:9-37](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/credit_usage_card.dart#L9-L37)
- [credit_header.dart:7-37](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/credit_header.dart#L7-L37)
- [credit_chart.dart:9-61](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/credit_chart.dart#L9-L61)
- [credit_transaction_list.dart:10-121](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/credit_transaction_list.dart#L10-L121)
- [credit_transaction_item.dart:8-73](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/credit_transaction_item.dart#L8-L73)
- [credit_balance_controller.dart:5-56](file://lib/features/credit_balance/controller/credit_balance_controller.dart#L5-L56)
- [credit_balance_bindings.dart:4-9](file://lib/features/credit_balance/bindings/credit_balance_bindings.dart#L4-L9)
- [cylinder_bar.dart:7-88](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/cylinder_bar.dart#L7-L88)
- [cylinder_painter.dart:10-96](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/cylinder_painter.dart#L10-L96)
- [cylinder_border.dart:4-31](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/cylinder_border.dart#L4-L31)
- [cylinder_inner_design.dart:6-133](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/cylinder_inner_design.dart#L6-L133)
- [cylinder_bottom_design.dart:6-65](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/cylinder_bottom_design.dart#L6-L65)
- [cylinder_top_design.dart:6-98](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/cylinder_top_design.dart#L6-L98)
- [ai_controller.dart:7-94](file://lib/features/ai/controller/ai_controller.dart#L7-L94)
- [ai_dropdown.dart:10-70](file://lib/features/ai/widgets/ai_view_widgets/ai_dropdown.dart#L10-L70)
- [ai_dropdown_credit.dart:12-88](file://lib/features/ai/widgets/ai_view_widgets/ai_dropdown_credit.dart#L12-L88)
- [ai_dropdown_upgrade.dart:8-49](file://lib/features/ai/widgets/ai_view_widgets/ai_dropdown_upgrade.dart#L8-L49)
- [ai_user_credit.dart:8-31](file://lib/features/ai/widgets/ai_view_widgets/ai_user_credit.dart#L8-L31)
- [ai_header.dart:9-32](file://lib/features/ai/widgets/ai_header.dart#L9-L32)
- [ai_bindings.dart:4-10](file://lib/features/ai/bindings/ai_bindings.dart#L4-L10)
- [ai_view.dart:7-26](file://lib/features/ai/views/ai_view.dart#L7-L26)

## Detailed Component Analysis

### CreditBalanceController
- Responsibilities:
  - Manage selected item index for credit package selection.
  - Track selected payment card for top-ups.
  - Handle chart data management with monthly credit usage.
  - Resolve current month index for automatic chart selection.
- Reactive state:
  - selectedItem: RxInt for selection state.
  - selectedCard: RxString for the chosen card.
  - cardList: Static list of cards for demonstration.
  - selectedIndex: RxInt for currently selected chart index.
  - chartData: List of CreditChartModel objects containing monthly usage data.

```mermaid
classDiagram
class CreditBalanceController {
+RxInt selectedItem
+String[] cardList
+RxString selectedCard
+RxInt selectedIndex
+CreditChartModel[] chartData
+selectIndex(int)
+_resolveCurrentMonthIndex()
}
class CreditChartModel {
+String month
+int value
}
CreditBalanceController --> CreditChartModel : "manages"
```

**Diagram sources**
- [credit_balance_controller.dart:5-56](file://lib/features/credit_balance/controller/credit_balance_controller.dart#L5-L56)
- [credit_chart_model.dart:1-7](file://lib/features/credit_balance/models/credit_chart_model.dart#L1-L7)

**Section sources**
- [credit_balance_controller.dart:5-56](file://lib/features/credit_balance/controller/credit_balance_controller.dart#L5-L56)

### Credit Transaction Model
- Purpose: Encapsulate transaction record data.
- Fields: title, date, amount.

```mermaid
classDiagram
class CreditTransaction {
+String title
+String date
+double amount
}
```

**Diagram sources**
- [credit_transaction_model.dart:1-11](file://lib/features/credit_balance/models/credit_transaction_model.dart#L1-L11)

**Section sources**
- [credit_transaction_model.dart:1-11](file://lib/features/credit_balance/models/credit_transaction_model.dart#L1-L11)

### Credit Chart Model
- Purpose: Encapsulate monthly usage data for visualization.
- Fields: month, value.

```mermaid
classDiagram
class CreditChartModel {
+String? month
+int? value
+CreditChartModel(String?, int?)
}
```

**Diagram sources**
- [credit_chart_model.dart:1-7](file://lib/features/credit_balance/models/credit_chart_model.dart#L1-L7)

**Section sources**
- [credit_chart_model.dart:1-7](file://lib/features/credit_balance/models/credit_chart_model.dart#L1-L7)

### CreditBalanceBindings
- Purpose: Provide dependency injection for the controller using Get.lazyPut.

```mermaid
classDiagram
class CreditBalanceBindings {
+dependencies()
}
class CreditBalanceController
CreditBalanceBindings --> CreditBalanceController : "lazyPut"
```

**Diagram sources**
- [credit_balance_bindings.dart:4-9](file://lib/features/credit_balance/bindings/credit_balance_bindings.dart#L4-L9)
- [credit_balance_controller.dart:5-56](file://lib/features/credit_balance/controller/credit_balance_controller.dart#L5-L56)

**Section sources**
- [credit_balance_bindings.dart:4-9](file://lib/features/credit_balance/bindings/credit_balance_bindings.dart#L4-L9)

### CreditBalanceView
- Purpose: Top-level view composing the credit balance UI.
- Behavior: Renders app bar, balance summary, purchase section, and usage card.

```mermaid
sequenceDiagram
participant Route as "Route"
participant View as "CreditBalanceView"
participant AppBar as "CustomAppbar"
participant Card as "CreditBalance"
participant Section as "CreditSection"
participant Usage as "CreditUsageCard"
Route->>View : Navigate to credit balance
View->>AppBar : Build app bar with drawer
View->>Card : Render current balance
View->>Section : Render purchase section
View->>Usage : Render usage card
```

**Diagram sources**
- [routes.dart:199-202](file://lib/core/routes/routes.dart#L199-L202)
- [credit_balance_view.dart:13-68](file://lib/features/credit_balance/views/credit_balance_view.dart#L13-L68)

**Section sources**
- [credit_balance_view.dart:13-68](file://lib/features/credit_balance/views/credit_balance_view.dart#L13-L68)

### CreditBalance Widget
- Purpose: Display current credit balance and provide a purchase action.
- Behavior: Shows balance text and a button to purchase credits.

```mermaid
flowchart TD
Start(["Build CreditBalance"]) --> ReadTheme["Read theme brightness"]
ReadTheme --> RenderHeader["Render balance header"]
RenderHeader --> RenderAmount["Render amount text"]
RenderAmount --> RenderFooter["Render last updated and description"]
RenderFooter --> RenderButton["Render Purchase Credits button"]
RenderButton --> End(["Done"])
```

**Diagram sources**
- [credit_balance.dart:10-99](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/credit_balance.dart#L10-L99)

**Section sources**
- [credit_balance.dart:10-99](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/credit_balance.dart#L10-L99)

### CreditSection Widget
- Purpose: Present credit packages and payment selection.
- Behavior: Renders a grid of credit items, handles selection, and opens a payment dialog with card list.

```mermaid
sequenceDiagram
participant UI as "CreditSection"
participant Ctrl as "CreditBalanceController"
participant Dialog as "CustomPaymentDialog"
UI->>Ctrl : Observe selectedItem and selectedCard
UI->>UI : Render credit items grid
UI->>Ctrl : Update selectedItem on tap
UI->>Dialog : Open payment dialog with cardList
Dialog-->>UI : Return selectedCard
UI->>Ctrl : Update selectedCard
```

**Diagram sources**
- [credit_section.dart:13-110](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/credit_section.dart#L13-L110)
- [credit_items.dart:10-81](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/credit_items.dart#L10-L81)
- [credit_balance_controller.dart:5-56](file://lib/features/credit_balance/controller/credit_balance_controller.dart#L5-L56)

**Section sources**
- [credit_section.dart:13-110](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/credit_section.dart#L13-L110)
- [credit_items.dart:10-81](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/credit_items.dart#L10-L81)
- [credit_balance_controller.dart:5-56](file://lib/features/credit_balance/controller/credit_balance_controller.dart#L5-L56)

### CreditItems Widget
- Purpose: Grid of selectable credit package items.
- Behavior: Uses controller state to highlight selection and update reactive state.

**Section sources**
- [credit_items.dart:10-81](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/credit_items.dart#L10-L81)

### CreditUsageCard Widget
- Purpose: Container for usage visualization and transaction history.
- Composition: Header, chart, and transaction list.

**Section sources**
- [credit_usage_card.dart:9-37](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/credit_usage_card.dart#L9-L37)

### CreditHeader Widget
- Purpose: Title and current balance display within usage card.

**Section sources**
- [credit_header.dart:7-37](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/credit_header.dart#L7-L37)

### CreditChart Widget
- Purpose: Custom cylinder-based visualization system replacing fl_chart dependency.
- Data: Uses CreditChartModel entries with chartData property for demonstration.
- **Updated**: Complete architectural overhaul from fl_chart-based bar chart to custom cylinder rendering with specialized cylinder components.

```mermaid
flowchart TD
Init(["Init chart data"]) --> BuildModel["Create CreditChartModel list"]
BuildModel --> ConfigureChart["Configure CylinderBar with CustomPaint"]
ConfigureChart --> Render["Render CylinderBar with cylinder_painter.dart"]
Render --> ActiveState["Active cylinder rendering"]
Render --> InactiveState["Inactive cylinder rendering"]
ActiveState --> MultiGradient["Multi-layer gradient effects"]
ActiveState --> Lighting["Lighting simulation effects"]
InactiveState --> SubtleGradient["Subtle gradient effects"]
```

**Diagram sources**
- [credit_chart.dart:9-61](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/credit_chart.dart#L9-L61)
- [credit_chart_model.dart:1-7](file://lib/features/credit_balance/models/credit_chart_model.dart#L1-L7)
- [cylinder_bar.dart:7-88](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/cylinder_bar.dart#L7-L88)

**Section sources**
- [credit_chart.dart:9-61](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/credit_chart.dart#L9-L61)
- [credit_chart_model.dart:1-7](file://lib/features/credit_balance/models/credit_chart_model.dart#L1-L7)
- [cylinder_bar.dart:7-88](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/cylinder_bar.dart#L7-L88)

### CreditTransactionList Widget
- Purpose: List of recent credit transactions.
- Data: Hardcoded CreditTransaction entries for demonstration.

**Section sources**
- [credit_transaction_list.dart:10-121](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/credit_transaction_list.dart#L10-L121)

### CreditTransactionItem Widget
- Purpose: Individual row in the transaction list.
- Behavior: Formats positive/negative amounts and renders metadata.

**Section sources**
- [credit_transaction_item.dart:8-73](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/credit_transaction_item.dart#L8-L73)

## Custom Cylinder Visualization System

### CreditChart Widget Architecture
The CreditChart widget has undergone a complete architectural transformation from fl_chart-based bar charts to a sophisticated custom cylinder rendering system. This new system eliminates external dependencies while providing enhanced visual aesthetics and interactive capabilities.

**Key Features:**
- **CylinderBar Component**: Specialized widget for individual cylinder rendering with animation support
- **CustomPaint Integration**: Uses Flutter's CustomPaint widget for precise control over rendering
- **CustomPainter Implementation**: Dedicated CylinderPainter class handles all drawing operations
- **Active/Inactive States**: Dynamic rendering based on selection state with different visual treatments
- **Advanced Gradient Effects**: Multi-layer gradient systems for realistic 3D appearance
- **Lighting Simulations**: Sophisticated lighting effects simulating real-world illumination
- **Smooth Animations**: TweenAnimationBuilder provides fluid transitions between states
- **Responsive Design**: Adapts to theme brightness (light/dark mode support)

```mermaid
classDiagram
class CreditChart {
+CreditChartModel[] chartData
+int maxY
+build(context)
}
class CylinderBar {
+String label
+int value
+double fillRatio
+bool isSelected
+bool isDark
+VoidCallback onTap
+build(context)
}
class CylinderPainter {
+double fillRatio
+double animValue
+bool isDark
+paint(canvas, size)
+shouldRepaint(old)
}
class CreditChartModel {
+String? month
+int? value
}
CreditChart --> CylinderBar : "creates"
CylinderBar --> CylinderPainter : "uses"
CreditChart --> CreditChartModel : "manages"
```

**Diagram sources**
- [credit_chart.dart:9-61](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/credit_chart.dart#L9-L61)
- [cylinder_bar.dart:7-88](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/cylinder_bar.dart#L7-L88)
- [cylinder_painter.dart:10-96](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/cylinder_painter.dart#L10-L96)
- [credit_chart_model.dart:1-7](file://lib/features/credit_balance/models/credit_chart_model.dart#L1-L7)

### CylinderBar Component
The CylinderBar widget serves as the main interface for individual cylinder rendering within the chart. It integrates with the animation system and provides touch interaction capabilities.

**Key Features:**
- **TweenAnimationBuilder Integration**: Smooth 0→1 / 1→0 transitions for selection state changes
- **Gesture Detection**: Tap handling for chart interaction
- **Stack Layout**: Overlays value text on top of cylinder visualization
- **Dynamic Styling**: Theme-aware color adaptation for labels and values

**Rendering Pipeline:**
1. Create TweenAnimationBuilder with selection state
2. Build gesture detector with tap callback
3. Render stack with CustomPaint cylinder and value overlay
4. Apply theme-aware label styling
5. Handle responsive sizing with ScreenUtil

**Section sources**
- [cylinder_bar.dart:7-88](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/cylinder_bar.dart#L7-L88)

### CylinderPainter Implementation
The CylinderPainter class is the core of the custom visualization system, implementing sophisticated rendering techniques for both active and inactive cylinder states.

**Active Cylinder Rendering (_drawActiveCylinder):**
- **Multi-gradient Background**: Deep blue gradient base with horizontal linear gradients
- **Smoke Layer Effects**: Four radial gradient layers creating atmospheric effects
- **Glass Reflections**: Semi-transparent white strips for tube wall reflections
- **Liquid Surface**: Bright cyan glowing ring with blur effects
- **Top Cap**: Convex glass effect with radial gradient and highlight strokes
- **Complex Path Clipping**: Precise clipping for proper gradient application

**Inactive Cylinder Rendering (_drawInactiveCylinder):**
- **Subtle Gray System**: Dark gray gradients for neutral appearance
- **Simple Elliptical Caps**: Basic top and bottom caps without complex effects
- **Minimal Borders**: Simple stroke borders for structural definition

**Rendering Pipeline:**
1. Calculate cylinder dimensions and clipping regions
2. Apply appropriate gradient shaders based on state
3. Draw body, caps, and borders with precision
4. Handle theme adaptation for light/dark modes
5. Optimize repaint performance with shouldRepaint override

**Section sources**
- [cylinder_painter.dart:10-96](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/cylinder_painter.dart#L10-L96)

## Advanced Cylinder Rendering Engine

### Specialized Cylinder Components
The custom cylinder system is built upon six specialized components, each responsible for specific aspects of the cylinder rendering pipeline.

**CylinderBorder Component:**
- **Glass Side Reflections**: Semi-transparent white strips for tube wall highlights
- **Outer Border Lines**: Thin stroke lines along straight tube walls
- **Gradient Application**: Proper color adaptation for light/dark themes

**CylinderInnerDesign Component:**
- **Multi-layer Gradients**: Complex gradient system for inactive and active states
- **Smoke Effects**: Four distinct radial gradients for atmospheric appearance
- **Shimmer Effects**: Left-edge highlights for glass-like reflections
- **Clip Path Management**: Precise clipping for proper gradient application

**CylinderBottomDesign Component:**
- **Inner Floor Rendering**: Full oval at cylinder bottom with radial gradients
- **Liquid Surface Effects**: Dynamic color interpolation based on animation state
- **Outer Bottom Arc**: Front arc only for open-tube effect
- **Theme Adaptation**: Color transitions for inactive/active states

**CylinderTopDesign Component:**
- **Liquid Surface Ring**: Open oval with thick stroke and glow effects
- **Top Cap Rendering**: Solid filled oval with convex appearance
- **Highlight Strokes**: Arc highlights for realistic glass effect
- **Radial Gradient Application**: Depth illusion through gradient shading

### Advanced Visual Effects
The custom cylinder system implements several advanced visual effects that surpass traditional chart rendering:

**Gradient Layering:**
- Horizontal linear gradients for cylindrical appearance
- Radial gradients for atmospheric and lighting effects
- Multi-color transitions for depth perception
- Alpha channel manipulation for transparency effects

**Lighting Simulation:**
- Directional light streaks for realistic reflections
- Multi-angle gradient blending for 3D depth
- Shadow casting through gradient transitions
- Surface texture simulation through gradient variations

**Material Properties:**
- Metallic surface appearance through gradient combinations
- Glass-like transparency effects
- Realistic edge highlighting and shadowing
- Responsive color adaptation to theme changes

**Animation System:**
- Smooth 420ms transitions between states
- Cubic bezier easing for natural motion
- Interpolated color transitions for seamless state changes
- Optimized repaint performance with shouldRepaint override

**Section sources**
- [cylinder_border.dart:4-31](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/cylinder_border.dart#L4-L31)
- [cylinder_inner_design.dart:6-133](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/cylinder_inner_design.dart#L6-L133)
- [cylinder_bottom_design.dart:6-65](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/cylinder_bottom_design.dart#L6-L65)
- [cylinder_top_design.dart:6-98](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/cylinder_top_design.dart#L6-L98)

## AI Credit Integration

### AiController
- Purpose: Manages AI-specific credit items and dropdown overlay functionality.
- Responsibilities:
  - Maintains AI credit transaction list with predefined credit usage data.
  - Handles overlay entry creation and management for dropdown display.
  - Provides layer link for overlay positioning compatibility.
- Credit Items: Predefined list of CreditTransaction objects representing AI credit usage history.

```mermaid
classDiagram
class AiController {
+CreditTransaction[] creditItems
+OverlayEntry overlayEntry
+LayerLink layerLink
+toggleDropdown(context)
+closeDropdown()
+_createOverlay(context)
}
class CreditTransaction {
+String title
+String date
+double amount
}
AiController --> CreditTransaction : "manages"
```

**Diagram sources**
- [ai_controller.dart:7-94](file://lib/features/ai/controller/ai_controller.dart#L7-L94)
- [credit_transaction_model.dart:1-11](file://lib/features/credit_balance/models/credit_transaction_model.dart#L1-L11)

**Section sources**
- [ai_controller.dart:7-94](file://lib/features/ai/controller/ai_controller.dart#L7-L94)
- [credit_transaction_model.dart:1-11](file://lib/features/credit_balance/models/credit_transaction_model.dart#L1-L11)

### AiDropdown Widget
- Purpose: Displays user credit information with dropdown trigger functionality.
- Behavior: Shows user avatar, name, and credit balance with expandable dropdown indicator.
- Integration: Uses LayerLink for overlay positioning compatibility with GetX framework.

```mermaid
sequenceDiagram
participant User as "User"
participant Dropdown as "AiDropdown"
participant Controller as "AiController"
User->>Dropdown : Tap credit display
Dropdown->>Controller : toggleDropdown(context)
Controller->>Controller : Create overlay entry
Controller->>Controller : Insert overlay
```

**Diagram sources**
- [ai_dropdown.dart:10-70](file://lib/features/ai/widgets/ai_view_widgets/ai_dropdown.dart#L10-L70)
- [ai_controller.dart:58-65](file://lib/features/ai/controller/ai_controller.dart#L58-L65)

**Section sources**
- [ai_dropdown.dart:10-70](file://lib/features/ai/widgets/ai_view_widgets/ai_dropdown.dart#L10-L70)
- [ai_controller.dart:58-65](file://lib/features/ai/controller/ai_controller.dart#L58-L65)

### AiDropdownCredit Widget
- Purpose: Creates the main content of the AI credit dropdown overlay.
- Features:
  - Displays credit usage header with coin icon and balance.
  - Shows credit chart visualization using the new custom cylinder system.
  - Renders scrollable transaction list using CreditTransactionItem widgets.
  - Includes upgrade button at the bottom for credit package upgrades.
- Integration: Utilizes existing CreditChart and CreditTransactionItem widgets from credit balance system.

```mermaid
flowchart TD
Start(["Build AiDropdownCredit"]) --> Header["Render credit usage header"]
Header --> Chart["Render CreditChart widget (Custom Cylinder)"]
Chart --> Scroll["Create scrollable container"]
Scroll --> Transactions["Generate CreditTransactionItem list"]
Transactions --> Upgrade["Render AiDropdownUpgrade button"]
Upgrade --> End(["Complete"])
```

**Diagram sources**
- [ai_dropdown_credit.dart:12-88](file://lib/features/ai/widgets/ai_view_widgets/ai_dropdown_credit.dart#L12-L88)
- [credit_chart.dart:9-61](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/credit_chart.dart#L9-L61)
- [credit_transaction_item.dart:8-73](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/credit_transaction_item.dart#L8-L73)

**Section sources**
- [ai_dropdown_credit.dart:12-88](file://lib/features/ai/widgets/ai_view_widgets/ai_dropdown_credit.dart#L12-L88)
- [credit_chart.dart:9-61](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/credit_chart.dart#L9-L61)
- [credit_transaction_item.dart:8-73](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/credit_transaction_item.dart#L8-L73)

### AiDropdownUpgrade Widget
- Purpose: Provides upgrade functionality for credit packages within the AI dropdown.
- Features:
  - Blurred backdrop effect for modern UI appearance.
  - Gradient background that adapts to theme brightness.
  - Prominent upgrade button with custom styling.
  - Rounded bottom corners for visual integration with dropdown.

**Section sources**
- [ai_dropdown_upgrade.dart:8-49](file://lib/features/ai/widgets/ai_view_widgets/ai_dropdown_upgrade.dart#L8-L49)

### AiUserCredit Widget
- Purpose: Integrates credit display within AI interface layout.
- Composition: Combines back button with AiDropdown for consistent AI navigation.
- Layout: Uses row layout with space-between alignment for proper spacing.

**Section sources**
- [ai_user_credit.dart:8-31](file://lib/features/ai/widgets/ai_view_widgets/ai_user_credit.dart#L8-L31)

### AiHeader Integration
- Purpose: Provides AI interface header with integrated credit management.
- Integration: Uses AiUserCredit component for credit display within AI navigation.
- Navigation: Supports AI view navigation with proper argument passing.

**Section sources**
- [ai_header.dart:9-32](file://lib/features/ai/widgets/ai_header.dart#L9-L32)

### AiBindings
- Purpose: Provides dependency injection for AiController using Get.lazyPut.
- Integration: Enables AI credit functionality without manual controller instantiation.

**Section sources**
- [ai_bindings.dart:4-10](file://lib/features/ai/bindings/ai_bindings.dart#L4-L10)

## Dependency Analysis
- Routing integrates the credit balance view with its binding and supports AI interface navigation.
- The view depends on widgets; widgets depend on models and controller.
- Binding provides controller instantiation for dependency injection.
- **Custom Visualization Dependencies**: CreditChart widget depends on CylinderBar component, which uses CustomPaint and CylinderPainter classes for rendering.
- **Cylinder Component Dependencies**: CylinderPainter depends on specialized cylinder design components (CylinderBorder, CylinderInnerDesign, CylinderBottomDesign, CylinderTopDesign).
- **AI Integration Dependencies**: AiController depends on CreditTransaction model and uses overlay positioning for dropdown functionality.
- **External Dependencies**: fl_chart remains as a dependency in pubspec.yaml despite the architectural change, though it's no longer actively used in the codebase.

```mermaid
graph LR
Routes["routes.dart"] --> View["credit_balance_view.dart"]
Routes --> AIView["ai_view.dart"]
View --> Widgets["Widgets"]
AIView --> AIWidgets["AI Widgets"]
Widgets --> Models["Models"]
Widgets --> Controller["CreditBalanceController"]
Widgets --> CylinderBar["CylinderBar"]
CylinderBar --> CustomPaint["CustomPaint"]
CustomPaint --> CylinderPainter["_CylinderPainter"]
CylinderPainter --> CylinderBorder["CylinderBorder"]
CylinderPainter --> CylinderInnerDesign["CylinderInnerDesign"]
CylinderPainter --> CylinderBottomDesign["CylinderBottomDesign"]
CylinderPainter --> CylinderTopDesign["CylinderTopDesign"]
AIWidgets --> AIController["AiController"]
AIController --> Models
Binding["credit_balance_bindings.dart"] --> Controller
AIBinding["ai_bindings.dart"] --> AIController
PubSpec["pubspec.yaml"] --> FlChart["fl_chart"]
```

**Diagram sources**
- [routes.dart:199-202](file://lib/core/routes/routes.dart#L199-L202)
- [routes.dart:249-252](file://lib/core/routes/routes.dart#L249-L252)
- [credit_balance_view.dart:13-68](file://lib/features/credit_balance/views/credit_balance_view.dart#L13-L68)
- [ai_view.dart:7-26](file://lib/features/ai/views/ai_view.dart#L7-L26)
- [credit_balance_bindings.dart:4-9](file://lib/features/credit_balance/bindings/credit_balance_bindings.dart#L4-L9)
- [ai_bindings.dart:4-10](file://lib/features/ai/bindings/ai_bindings.dart#L4-L10)
- [cylinder_bar.dart:7-88](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/cylinder_bar.dart#L7-L88)
- [cylinder_painter.dart:10-96](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/cylinder_painter.dart#L10-L96)
- [cylinder_border.dart:4-31](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/cylinder_border.dart#L4-L31)
- [cylinder_inner_design.dart:6-133](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/cylinder_inner_design.dart#L6-L133)
- [cylinder_bottom_design.dart:6-65](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/cylinder_bottom_design.dart#L6-L65)
- [cylinder_top_design.dart:6-98](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/cylinder_top_design.dart#L6-L98)
- [pubspec.yaml:56](file://pubspec.yaml#L56)

**Section sources**
- [routes.dart:199-202](file://lib/core/routes/routes.dart#L199-L202)
- [routes.dart:249-252](file://lib/core/routes/routes.dart#L249-L252)
- [credit_balance_bindings.dart:4-9](file://lib/features/credit_balance/bindings/credit_balance_bindings.dart#L4-L9)
- [ai_bindings.dart:4-10](file://lib/features/ai/bindings/ai_bindings.dart#L4-L10)
- [cylinder_bar.dart:7-88](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/cylinder_bar.dart#L7-L88)
- [cylinder_painter.dart:10-96](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/cylinder_painter.dart#L10-L96)
- [pubspec.yaml:56](file://pubspec.yaml#L56)

## Performance Considerations
- Widget composition: Prefer lightweight StatelessWidgets for static content to minimize rebuild costs.
- Lists: Use ListView.builder for large transaction lists to avoid unnecessary widget creation.
- **Custom Visualization Performance**: CustomPaint and specialized cylinder components provide efficient rendering with optimized shouldRepaint logic.
- **Gradient Optimization**: Multi-layer gradients are computed once per paint operation, minimizing repeated calculations.
- **Animation Performance**: TweenAnimationBuilder provides smooth 420ms transitions with optimized interpolation.
- **Theme Adaptation**: Automatic theme switching without performance penalties through built-in Flutter theme system.
- **Memory Management**: Proper disposal of ScrollController in CreditBalanceController lifecycle.
- **Reactive State**: Limit excessive reactive updates by batching controller state changes.
- **AI Overlay Performance**: Overlay entries should be properly disposed to prevent memory leaks.
- **Cylinder Component Caching**: Specialized cylinder design components cache gradient shaders for improved performance.

## Troubleshooting Guide
- Missing balance updates: Verify controller state is being observed by widgets and that reactive properties are updated after actions.
- Transaction list not rendering: Confirm the transaction list length and itemBuilder are correctly configured.
- Payment dialog not selecting card: Ensure the dialog passes back the selected card and the controller updates selectedCard.
- Icons not displaying: Confirm asset paths in icons_path.dart match actual assets.
- **Custom Cylinder Rendering Issues**: Verify CylinderBar widget is properly sized and CylinderPainter is receiving correct parameters.
- **Gradient Effects Not Appearing**: Check that gradient shaders are being created with valid color values and proper bounds in cylinder components.
- **Lighting Simulation Problems**: Ensure gradient directions and alpha values are correctly configured for desired lighting effects.
- **Animation Transitions Not Working**: Verify TweenAnimationBuilder is properly configured with selection state changes.
- **Theme Adaptation Failures**: Verify theme brightness detection and color adaptation logic in cylinder components.
- **AI Dropdown not appearing**: Verify overlay entry is properly created and inserted, and layerLink is correctly passed to CompositedTransformTarget.
- **AI Credit items not showing**: Ensure AiController is properly injected and creditItems list contains valid CreditTransaction objects.
- **AI Upgrade button not working**: Check that AiDropdownUpgrade widget is properly positioned and receives user interaction events.
- **Cylinder Component Crashes**: Verify all cylinder design components are properly imported and initialized.
- **Performance Issues**: Monitor paint operations and ensure shouldRepaint logic is functioning correctly.

**Section sources**
- [credit_balance_controller.dart:5-56](file://lib/features/credit_balance/controller/credit_balance_controller.dart#L5-L56)
- [credit_transaction_list.dart:10-121](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/credit_transaction_list.dart#L10-L121)
- [cylinder_bar.dart:7-88](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/cylinder_bar.dart#L7-L88)
- [cylinder_painter.dart:10-96](file://lib/features/credit_balance/widgets/credit_balance_view_widgets/cylinder_painter.dart#L10-L96)
- [ai_controller.dart:58-94](file://lib/features/ai/controller/ai_controller.dart#L58-L94)
- [ai_dropdown_credit.dart:12-88](file://lib/features/ai/widgets/ai_view_widgets/ai_dropdown_credit.dart#L12-L88)
- [icons_path.dart:109-111](file://lib/core/constant/icons_path.dart#L109-L111)

## Conclusion
The Credit Balance System provides a modular structure for managing credit balances, presenting usage analytics, and enabling top-ups. The system has been significantly enhanced with a revolutionary custom cylinder-based visualization system that eliminates external dependencies while providing sophisticated gradient effects, lighting simulations, and realistic 3D-like cylinder rendering. The new implementation uses specialized cylinder components (CylinderBar, CylinderPainter, CylinderBorder, CylinderInnerDesign, CylinderBottomDesign, CylinderTopDesign) to create advanced visual effects with active/inactive states, multi-layer gradient systems, and responsive theme adaptation.

The system has been enhanced with AI credit dropdown widgets that seamlessly integrate credit management functionality within AI interface components. The current implementation focuses on UI composition and reactive state for selection and card choice, with AI-specific credit item management and overlay-based dropdown functionality. The custom visualization system demonstrates advanced Flutter rendering capabilities while maintaining excellent performance characteristics through optimized CustomPaint implementations and efficient animation systems.

Future enhancements should integrate backend APIs for real-time balance updates, transaction processing, and financial tracking, while maintaining the existing widget and model abstractions. The AI integration demonstrates successful cross-feature collaboration, enabling users to manage credits directly from AI interface contexts. The custom cylinder visualization system represents a significant architectural achievement in Flutter development, showcasing the power of CustomPaint for creating sophisticated UI components with specialized cylinder rendering technology.