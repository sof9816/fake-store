# Fake Store

The **Fake Store** app is built using SwiftUI, chosen to support iOS 14 and cater to a wide user base. To ensure simplicity and convenience, the MVVM architecture was employed. This architecture separates concerns and facilitates maintainability.

## Key Features and Architecture

- **MVVM Architecture:** Employed for simplicity and separation of concerns.
- **API Client:** A separate API client was developed to handle API requests using URLSession. This decision was made to enhance scalability and maintainability.
- **API Manager:** It's recommended to create a separate API manager for each business logic to maintain a well-structured codebase.
- **Model Layer:** Developed to manage each business model efficiently.
- **ViewModel Layer:** Created to connect the model with the API and present data to the view/screen.
- **Product Cell:** Implemented to display all products. Utilized the Kingfisher Swift package for efficient image caching.
- **Product Detail Page:** Designed to display single product details. Also, employed Kingfisher for image handling.
- **Error Handling:** Integrated error handling alongside the API client. Errors are passed to the screen and managed to ensure a seamless user experience.
- **Loading State:** Incorporated loading indicators to provide users with feedback during product loading.
- **Network Connectivity:** Added functionality to inform users about their internet connection status, ensuring an informed user experience.

By implementing these features and adhering to best practices, the **Fake Store** app offers a robust and user-friendly shopping experience.

**Powered by ChatGPT**

The development process of the Fake Store app was further streamlined and enriched by leveraging ChatGPT. Integrating ChatGPT into the project, including the README, served as a force multiplier, accelerating development timelines and augmenting the robustness of the codebase.

## How to Run the iOS Project

1. Clone the repository containing the Fake Store app from the Git repository.
2. Open the project in Xcode.
3. Ensure that Xcode is configured to use a compatible iOS simulator or connect a physical iOS device.
4. Build and run the project by selecting the appropriate target device and clicking the "Run" button in Xcode.

Ensure that you have the necessary dependencies installed and configured, such as Swift Package Manager dependencies or any required Cocoapods.

Packages used:
- [Kingfisher](https://github.com/onevcat/Kingfisher)

With these steps, you'll be able to run the Fake Store app on your iOS simulator or device, experiencing its robust features and user-friendly interface firsthand.

## Demo

https://github.com/sof9816/fake-store/assets/29151929/d708506d-4ddc-4b38-bc31-86bf983a9560



