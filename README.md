# Sazim App DEMO
First of all, Thank you for this opportunity. I enjoyed working on it.  
Kindly watch the video for a general walkthrough of the total implemented system.  

[Project Demo video](assets/media/XRecorder_07122024_075803.mp4)

## Project Run
1. Run the Django backend in the local network
    ```bash 
    python manage.py runserver 0.0.0.0:8000
    ```
2. Collect the base url. First run on windows | mac/linux
    ```bash
    ipconfig or ifconfig 
    ```
   Collect your ip address.
3. Then modify the lib/app/core/constant/end_points.dart. update the base url. Change the ip
    ```bash
    static final baseUrl = "http://192.168.229.222:8000/api";
    ```
4. Then from the root of the project, run
    ```bash
    flutter pub get
    ```
5. Then run.
    ```bash
    flutter run 
    ```

## Code Structure
A base level of the current folder structure
```bash
  lib
    └───app
        ├───core
        │   ├───constant
        │   ├───custom_controllers
        │   ├───dependency_injection
        │   ├───networking
        │   │   └───setup
        │   ├───services                    # Top level service 
        │   ├───theme
        │   ├───utility
        │   └───widgets                     #Global widgets
        │       ├───buttons
        │       ├───cards
        │       └───input_widgets
        ├───data
        │   ├───data_source
        │   │   └───local_data_source
        │   │       └───storage_service     # Local storage
        │   ├───dto_model                   # Data transfer objects
        │   ├───models                      # Data models
        │   └───repositories                # implementation of the repositories
        ├───domain
        │   ├───entities  
        │   └───repositories                # abstract repo 
        ├───modules
        │   ├───auth
        │   │   ├───login
        │   │   │   ├───bindings
        │   │   │   ├───controllers
        │   │   │   ├───views
        │   │   │   └───widgets
        │   │   └───sign_up
        │   │       ├───bindings
        │   │       ├───controllers
        │   │       └───views
        │   ├───edit_product
        │   │   ├───bindings
        │   │   ├───controllers
        │   │   └───views
        │   ├───history
        │   │   ├───bindings
        │   │   ├───controllers
        │   │   └───views
        │   ├───home
        │   │   ├───bindings
        │   │   ├───controllers
        │   │   └───views
        │   ├───shop
        │   │   ├───bindings
        │   │   ├───controllers
        │   │   └───views
        │   └───user_products
        │       ├───bindings
        │       ├───controllers
        │       └───views
        └───routes


```


## Task Implementation

### User auth
1. Login with email and pass
2. User registration
3. Biometric Auth + face auth

-> For availing the biometric auth:  
1. User need to register/login
2. For successful auth, I store the user credential.
3. When we validate the biometric the we get the data from the local storage & call login as we need the user ID.

### Product add,edit & delete implementation
1. Used the given wireframe with a modified UI to implement the product creation in 6 different pages through central service & local controllers. In addition to back & forth edit it can hold state as any change made is saved when user goes to the next page.
2. Product edit  
3. single click delete with Home UI update
4. 10 sec description full view on home page

### Product Listing & History
1. Product listing in shop 
2. History (borrow,sell,lend,buy)
   * For this feature I have used a simple rule to separate the data from all_product based on the given data and type of scope. 
3. product purchase & rent from shop with refresh enabled
4. On purchase/rent Firebase push notification 


## Research and documentation
Other then the bellow mentioned, sources such as Medium, Stack overflow has been used.

1. [Biometric implementation doc](https://pub.dev/packages/local_auth)
2. [env setup doc](https://pub.dev/packages/flutter_dotenv)
3. [Tab View syntax](https://docs.flutter.dev/cookbook/design/tabs)
4. [ChatGPT Url](https://chatgpt.com/share/6753af86-30e4-8005-942f-e25edf20456d)
4. [ChatGPT Url](https://chatgpt.com/share/6753badb-b67c-8005-8a59-b7c00921cb05)