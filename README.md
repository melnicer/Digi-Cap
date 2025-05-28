MEMBERS:
1. Mel Marvin Nicer
2. Junel Niemes
3. Kendrew Ychon

Digi Cap is a basic digital time capsule application. 

FEATURES:
1. Creation of new time capsules
2. View past/unlocked time capsules
3. View future/locked time capsules
4. Deletion of time capsules
5. Navigate between pages
6. Scrollable once number of time capsules exceed screen size

HOW IT WORKS:
There are 3 main pages: create page, unlocked page, and locked page. 

Creation - Users are taken to a page where they can create a time capsule for their future self which contains a title(required), a message(required), the date it was created, and the date it was set to open(required). 

Locked Time Capsules - Whenever a user creates a time capsule, it automatically gets locked and put in the locked page. In the locked page you can see each locked time capsule, their title, and their unlock date. Locked capsules cannot be open until its set date. Capsules are arranged from earliest unlock date(top) to last unlock date(bottom)

Unlocked Time Capsules - Whenever the set open date matches the current date, it unlocks and gets transferred to the unlocked page. To open an unlocked time capsule, press the box dark gray tile containing the title, icon, and date. Capsules are arranged from most recently unlocked(top) to least recent(bottom)

Deletion of Time Capsules - Users can delete time capsules by tap and holding a specific time capsule then swiping it to the left and pressing the delete button

Navigation - Users can navigate using the bottom navigation bar

DISCLAIMERS: 
This app has no database yet. For testing purpose, picking a date in the past is allowed in order for them to be considered as unlocked and show up in the unlocked page. 

This app is also not designed to be responsive. An overflow of pixels might occur depending on screen size. Dimensions less than 390 x 844 may have an overflow of pixels. Safe options for screen dimension are: Pixel 7, Iphone 12 Pro

HOW TO RUN ON YOUR COMPUTER:
Step 1
1. Download Flutter SDK - https://docs.flutter.dev/get-started/install
2. Choose which operating system, then choose mobile
3. Download and Extract the folder to Local Disk (C:)
4. Add folder location to environment variables > system variables > PATH > edit > new

Step 2
1. Download Android Studio (latest version) - https://developer.android.com/studio
2. Run the android studio setup application and install android studio.
3. After installing, open android studio and click More Actions > SDK Manager > SDK Tools > Android SDK Command-line Tools (latest) > Apply

Step 3
1. Download Visual Studio Code - https://code.visualstudio.com/download
2. Open VS Code then open the digi_cap_finals folder
3. Open a terminal in VS Code then run this command: flutter pub get
4. At the bottom right of VS Code, select chrome as the device to use.
5. Click the main.dart file in lib folder then run it without debugging
6. Once chrome shows the application, open inspect then click toggle device toolbar beside the Elements tab.
7. Change the dimensions to any of the following screen sizes: Pixel 7, Iphone 12 Pro, Iphone 14 Pro or any phone size larger than these three.

