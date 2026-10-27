# SwiftUI Component Library

A reusable UI component library built with SwiftUI. This project demonstrates how to create configurable components, manage UI state, validate form inputs, and combine reusable views into a sample application.

## Features

- Reusable buttons with multiple styles, optional icons, a loading state, and a disabled state
- Configurable cards with standard, outlined, and highlighted styles, plus custom content
- Reusable modal sheets with info, confirmation, and destructive styles, plus custom content
- Text inputs with secure-entry support and live validation messages
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
├── README.md
├── SwiftUIComponentLibrary.xcodeproj
└── SwiftUIComponentLibrary/
    ├── SwiftUIComponentLibraryApp.swift
    ├── ContentView.swift
    ├── Components/
    │   ├── AppButton.swift
    │   ├── AppCard.swift
    │   ├── AppSheet.swift
    │   └── AppTextField.swift
    └── Screens/
        ├── ButtonShowcaseView.swift
        ├── CardShowcaseView.swift
        ├── SheetShowcaseView.swift
        ├── FormInputShowcaseView.swift
        └── DemoApplicationView.swift
```

## Components

### 1. AppButton

A configurable button component supporting primary, secondary, outlined, and destructive styles, an optional SF Symbol, a loading state, and a disabled state.

**Parameters**
- `title`: Text displayed on the button.
- `style`: Button style; `.primary`, `.secondary`, `.outlined`, or `.destructive`. Defaults to `.primary`.
- `systemImage`: Optional SF Symbol name shown before the title.
- `isLoading`: Replaces the icon with a spinner and blocks taps; defaults to `false`.
- `isDisabled`: Controls whether the button is interactive; defaults to `false`.
- `action`: Closure executed when the button is tapped.

**Example**

```swift
AppButton(
    title: "Save",
    style: .primary,
    systemImage: "square.and.arrow.down"
) {
    print("Save tapped")
}
```

### 2. AppCard

A reusable card displaying a title, description, optional SF Symbol, optional custom content, and an optional action button. `style` changes the fill and border.

**Parameters**
- `title`: Card heading.
- `description`: Supporting text.
- `systemImage`: Optional SF Symbol name.
- `style`: Card style; `.standard`, `.outlined`, or `.highlighted`. Defaults to `.standard`.
- `actionTitle`: Optional action-button label.
- `content`: Optional view built with `@ViewBuilder` and placed under the description.
- `action`: Optional action closure.

**Example**

```swift
AppCard(
    title: "Your Profile",
    description: "View your profile details.",
    systemImage: "person.crop.circle",
    style: .highlighted,
    actionTitle: "View Profile"
) {
    print("View Profile tapped")
}

AppCard(
    title: "Storage",
    description: "You are using 2 GB of 5 GB.",
    systemImage: "internaldrive",
    content: {
        ProgressView(value: 0.4)
    }
)
```

### 3. AppSheet

Reusable modal with a title, message, confirmation action, and optional cancellation action. Call `appSheet` on the presenting view. It owns the sheet presentation, medium detent, and drag indicator. `style` changes the icon and confirm button.

**Parameters**
- `isPresented`: Binding that controls whether the sheet is visible.
- `title`: Sheet heading.
- `message`: Supporting message.
- `style`: Sheet style; `.info`, `.confirmation`, or `.destructive`. Defaults to `.confirmation`.
- `confirmTitle`: Confirmation-button label; defaults to `"OK"`.
- `cancelTitle`: Optional cancellation-button label.
- `onConfirm`: Closure executed when confirmed.
- `onCancel`: Optional cancellation closure.
- `content`: Optional view built with `@ViewBuilder` and placed between the message and the buttons.

**Example**

```swift
.appSheet(
    isPresented: $isPresented,
    title: "Confirm Action",
    message: "Are you sure you want to continue?",
    style: .confirmation,
    confirmTitle: "Continue",
    cancelTitle: "Cancel",
    onConfirm: {
        print("Confirmed")
    },
    onCancel: {
        print("Cancelled")
    },
    content: {
        Text("Any extra view can sit inside the sheet.")
    }
)
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

## Screen Recording

[Watch the demo walkthrough](https://thinkpalm-my.sharepoint.com/personal/jobin_p_thinkpalm_com/_layouts/15/stream.aspx?id=%2Fpersonal%2Fjobin%5Fp%5Fthinkpalm%5Fcom%2FDocuments%2FAttachments%2FScreen%20Recording%202026%2D10%2D27%20at%206%2E10%2E14%E2%80%AFPM%2Emov&ct=1793105987422&or=OWA%2DNT%2DMail&cid=58b59a80%2D105b%2D2138%2D6551%2Dea733b8ead8a&ga=1&referrer=StreamWebApp%2EWeb&referrerScenario=AddressBarCopied%2Eview%2Ef52153b7%2D2e1f%2D4926%2D8080%2Db7ff3c152fb1)

## Learning Outcomes

This project demonstrates reusable SwiftUI views, property-driven configuration, closures, `@State`, `@Binding`, environment-based dismissal, modal presentation, and basic form validation.

## Scope

The demo uses local state only. It does not include a backend, persistent storage, or production authentication.

## License

This project is available under the MIT License. See `LICENSE` for details.
