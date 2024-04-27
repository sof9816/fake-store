# Fake Store

The **Fake Store** app is built using SwiftUI, chosen to support iOS 14 and cater to a wide user base. To ensure simplicity and convenience, the MVVM architecture was employed. This architecture separates concerns and facilitates maintainability.

## Key Features and Architecture:

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


