# MQPal
### By Faran Sepehrisadr - 47393416


This is deliverable 2 of the COMP3130 Major Project. The application is designed for students around the MQU campus; and will allows users to submit inquiries to MQPal regarding their studies and experiences around campus.


#### Main functionalities and features
 - Users will be able to view an interactive map of the MQU campus (to interact on android emulator: CTRL + LMB and then move mouse)
 - Users will be able to submit inquiries regarding their experiences on campus.
 - Users will be able to edit, delete, and update their inquiries.
 - Users will be able to switch the theme between dark mode and light mode using the button on the right side of the top navbar.
 - Inquiries are saved into cloud storage through Firebase Storage API.
 - The current theme is saved into cloud storage through Firebase Storage API, and is retieved and applied to the application upon launch.
 - Responsive UI to different screen sizes. Done with some help of Sizer package.

#### Differences since original design:
 - CHANGED -> The inquiry submission form is now a pop-up form instead of a whole new page. This is done to prevent overwhelming the user with too many pages.
 - ADDED -> Interactive campus map.
 - ADDED -> Dark mode.
 - REMOVED -> Coffee subsystem. Realised the application would make more sense with just a map and an inquiries subsystem.

#### Compatible platforms:
 - Large Android
 - Small Phone
 - Pixel 6a
 - Pixel 7
 - Pixel 7 Pro
 - Chrome
 - Edge

#### Incompatible platforms:
 - Windows Application (this is due to firebase not having proper support for windows applications).
 - iOS.

#### Third-party packages/tools used:
 - Faker: A visual code extension that generates fake data for fields. This was used in the test file.
 - Sizer: Makes the application UI responsive to different screen sizes. Done by wrapping the MaterialApp and all of its parents in a Sizer().
 - Mockito: Used to create mock objects of already implemented classes.
 - Firebase Storage API: Used to store user inquiries and config file.
