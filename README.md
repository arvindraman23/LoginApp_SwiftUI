LOGIN APP

LoginApp is a SwiftUI-based iOS application that demonstrates a simple login functionality with username and password validation, along with navigation to a secondary view upon successful login. It follows the MVVM (Model-View-ViewModel) architecture, which separates the business logic (view model) from the UI layer (views). This application also includes unit tests using XCTest and UI tests using XCUITest.

Features
- Simple login page with username and password fields
- Navigation to a "Home Page" (SecondView) upon successful login
- Validation of credentials within the ViewModel
- Unit tests for logic using XCTest
- UI tests for user interface interaction using XCUITest

Screens
1. ContentView
ContentView is the primary login screen that contains two input fields (username and password) and a "Login" button. When the button is pressed, the credentials are validated through the ViewModel, and the user is either navigated to SecondView on success or shown an alert on failure.

Key components:

TextField: For username input. (For testing purpose, Valid Username: Arvind)

SecureField: For password input. (For testing purpose, Valid Password: 111)

Button: To trigger the login action.

NavigationLink: To navigate to SecondView upon successful authentication.

3. ViewModel
The ViewModel handles the business logic of validating the username and password. It exposes a isAuthenticated boolean, which drives the navigation flow in the ContentView. By separating the logic from the view, the ViewModel ensures that the UI remains testable and scalable.

Key responsibilities:

Validate user credentials (hardcoded for now).

Manage the state of whether the user is authenticated or not.

4. SecondView

SecondView is the destination view that users are navigated to after successful login. It displays a simple "Welcome" message and includes a back navigation button.

Key components:

Text: Displays a welcoming message.

Navigation Bar: The "Back" button in the navigation bar allows users to return to ContentView.

Unit Testing with XCTest

The unit tests in LoginAppTests focus on testing the logic within the ViewModel. These tests validate whether the login logic works as expected for both valid and invalid inputs.

Test cases include:

Valid login test: Ensures that the login succeeds when the correct username (Arvind) and password (111) are provided.

Invalid login test: Ensures that the login fails and an alert is displayed when incorrect credentials are entered.

UI Testing with XCUITest

LoginAppUITests includes tests that simulate real user interactions with the app. The UI tests verify that the navigation and alert displays work as expected when users interact with the ContentView and SecondView.

Key UI tests include:

Login navigation test: Verifies that upon successful login, the app navigates to SecondView.

Back navigation test: Verifies that tapping the "Back" button on SecondView returns the user to the login screen.
