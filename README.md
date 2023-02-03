# RecipeManager
The app presents a flexible and modular architecture with loosely coupled modules, making it easy to test, scale, and maintain. Developed mostly using Test Driven Development (TDD) methodology, with a few exceptions due to time constraints, the unit tests serve as the best documentation, defining specs and requirements for alternative paths.

This app was created using:
 - Swift lang
 - UIKit as a UI framework
 - XCTests to create unit tests
 - Third party library (Alamofire) to deal with networking
 - User Defults to persis in memory some data
 
 The code you will find is clean, and follows good coding practices, including SOLID principles, clearly named modules, methods, and variables, comprehensive unit tests, concise and well-defined methods, and strategic dependency injections to promote loosely coupled modules and layers. The app leverages Swift's concurrency API for handling network fetch operations.
 
 The **MVVM** architectural pattern was chosen for its suitability in promoting modularity and loose coupling between modules. To bind information from the view models to their view controllers, property closures were utilized as they provided a simple solution for the limited number of bindings required. Adding more robust tools would have been excessive.
 
The source code frequently employs the **Strategy pattern** to enhance testability and scalability. This can be observed in the Recipe list where the view model is dependent on an abstraction (RecipeService) instead of a specific API class. Similarly, the persistence manager is based on another abstraction (PersistenceManager), promoting loose coupling and improved maintainability.

The **Adapter pattern** is applied to connect the API module with the view models, avoiding direct coupling and violating the dependency inversion principle. The adapter facilitates collaboration between the API and view models while avoiding a direct dependency between them.
 
### The app:
The app was developed using the Test Driven Development (TDD) methodology, with a few exceptions due to time constraints. You'll find 85 passing unit tests that provide insight into the assumed functionalities and alternative paths taken, which were not explicitly defined in the original tasks. These tests serve as the best documentation for the code.

1. It show a **splash screen** when starting. This was created on the xib provided by default when you create the project from scratch.

2. The main controlles is a navigation contoller and its first view is the **list of Recipes**, so this is the first screen that appears once the app finishes launching.
This screen has a functional table showing all the recipes, a functional search field that filters over the recipe title and a viewModel that allows the view only to deal with UI related things.
The images of the cells, are managed for a third party library, and that allows to fetch images and cache them too. *I wanted and actually started to implement that funcionality but then I notice I was not gonna be to to id because of the available time to deliver this test*
Each cell of the table has a 'star' button that toggles the status of a recipe in terms of if it is favorite or not. This is persisted in memory, using **User Defaults**.

3. Selecting a recipe in the app navigates to the detail screen, which is a purely static display of the selected recipe's information. Like the list view, the detail screen has a view model to handle the business logic and utilizes the same image library.

Each **viewModel** communicates with a chain of modules to get the recipes data. The **adapter** dependens on the **RecipeAPI** to give back the fetched data to the viewModels.
**RecipeAPI** depends on the network manager and this asks to it to fetch the recipes and recipes details.
**Network manager** uses Alamofire library to fetch the data and serializes it to give it back to it caller.

Some helper functions where added as native classes extensions.

### Module separated design:
As mentioned, the application has a modular architecture featuring the following layers

 - **UI** layer (Presented as "Views" directory)
 - **Presentation** layer (Presented as "ViewModels" directory)
 -  **Composition** layer
 - **Domain** layer (Presented as "Model" directory)
 - **API** layer
 - **Networking** layer
 - **Main** layer
 -  **Persistance** layer

Following the app's layer diagram:

The diagram illustrates the layers and components mentioned, depicting the relationships between them and showing the loosely coupled modules with strict dependencies. This structure ensures that higher-order modules do not depend on lower-order ones and enables easy addition of new modules without significant code changes.

# Technical information

- iOS version supported: iOS 16.2
- Develop using XCode Version 14.2 (14C18)
- Swift 5

# Included third party libraries
- Alamofire
- Kingfisher
- ProgressHD

# Possible improvements and more
IThe app has some limitations and room for improvement. The priority was to develop the app quickly, and incorporating numerous unit tests increased the overall effort, resulting in some areas not being as polished as desired.
-  The networking and API layers were developed quickly and lack unit tests and also it is tightly coupled with related modules. This could be addressed.
-   Error handling could be improved, with a well-defined error module that covers all types of errors (network, UI, etc.).
-   The progress indicator library could be replaced with a custom implementation.
- Right now the service only returns few Recipes. I found *offset* attribute on the API, to get more. Since while dveloping the app I had an issue of meeting the quota of request that are given for free and API topped working for me, I decided to only keep those few items. 
- URL present on detail view could be clickable
- A custom solution could be implemented to fetch and cache images instead of using a library.
- Other improvements could be discussed with you.



