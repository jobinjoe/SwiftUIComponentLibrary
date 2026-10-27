# SwiftUI Component Library

A reusable UI component library built with SwiftUI. This project demonstrates how to create configurable components, manage UI state, validate form inputs, and combine reusable views into a sample application.

## Features

- Reusable buttons with multiple styles and disabled states
- Configurable cards with optional icons and action buttons
- Reusable modal sheets with confirmation and cancellation actions
- Text inputs with secure-entry support and validation messages
- Showcase screens for each component
- A demo application combining all four components

## Tech Stack

- Swift
- SwiftUI
- Xcode
- iOS

## Project Structure

```text
SwiftUIComponentLibrary/
├── SwiftUIComponentLibraryApp.swift
├── ContentView.swift
├── Components/
│   ├── AppButton.swift
│   ├── AppCard.swift
│   ├── AppSheet.swift
│   └── AppTextField.swift
├── Screens/
│   ├── ButtonShowcaseView.swift
│   ├── CardShowcaseView.swift
│   ├── SheetShowcaseView.swift
│   ├── FormInputShowcaseView.swift
│   └── DemoApplicationView.swift
└── README.md
```

## Components

### 1. AppButton

A configurable button component supporting primary, secondary, and outlined styles, along with a disabled state.

**Parameters**
- `title`: Text displayed on the button.
- `style`: Button style; defaults to `.primary`.
- `isDisabled`: Controls whether the button is interactive; defaults to `false`.
- `action`: Closure executed when the button is tapped.

**Example**

```swift
AppButton(title: "Continue", style: .primary) {
    print("Continue tapped")
}
```

### 2. AppCard

A reusable card displaying a title, description, optional SF Symbol, and optional action button.

**Parameters**
- `title`: Card heading.
- `description`: Supporting text.
- `systemImage`: Optional SF Symbol name.
- `actionTitle`: Optional action-button label.
- `action`: Optional action closure.

**Example**

```swift
AppCard(
    title: "Your Profile",
    description: "View your profile details.",
    systemImage: "person.crop.circle",
    actionTitle: "View Profile"
) {
    print("View Profile tapped")
}
```

### 3. AppSheet

Reusable modal content with a title, message, confirmation action, and optional cancellation action. The presenting screen controls when the sheet appears.

**Parameters**
- `title`: Sheet heading.
- `message`: Supporting message.
- `confirmTitle`: Confirmation-button label; defaults to `"OK"`.
- `cancelTitle`: Optional cancellation-button label.
- `onConfirm`: Closure executed when confirmed.
- `onCancel`: Optional cancellation closure.

**Example**

```swift
.sheet(isPresented: $isPresented) {
    AppSheet(
        title: "Confirm Action",
        message: "Are you sure you want to continue?",
        confirmTitle: "Continue",
        cancelTitle: "Cancel",
        onConfirm: {
            print("Confirmed")
        },
        onCancel: {
            print("Cancelled")
        }
    )
    .presentationDetents([.medium])
}
```

### 4. AppTextField

A reusable text input supporting regular and secure entry, two-way data binding, and optional validation errors.

**Parameters**
- `title`: Label displayed above the field.
- `placeholder`: Placeholder text.
- `text`: A binding to the parent view's string.
- `errorMessage`: Optional validation message.
- `isSecure`: Enables secure password entry; defaults to `false`.

**Example**

```swift
@State private var email = ""

AppTextField(
    title: "Email",
    placeholder: "Enter your email",
    text: $email
)
```

## Running the Project

1. Clone or download the repository.
2. Open `SwiftUIComponentLibrary.xcodeproj` in Xcode.
3. Select an iOS simulator.
4. Build and run the application.
5. Explore the individual component showcases and the demo application.

## Learning Outcomes

This project demonstrates reusable SwiftUI views, property-driven configuration, closures, `@State`, `@Binding`, environment-based dismissal, modal presentation, and basic form validation.

## Scope

The demo uses local state only. It does not include a backend, persistent storage, or production authentication.

## License

This project is available under the MIT License. See `LICENSE` for details.
