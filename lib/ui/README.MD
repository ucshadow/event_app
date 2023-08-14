this is where all the views are stored (flutter code)
The folder structure logic is as follows:

* each screen has a folder. A screen is defined as a view that creates a `Scaffold`, and from a 
user perspective, it's a screen that the user can navigate to, in other words a Page.

* each screen folder has it's screen implementation, a `style_provider` if needed and sub-folders
consisting in a `widgets` folder for simple widgets or `$name` folder for more complex widgets that
may need their own logic.

* shared folder contains shared widgets, since a screen folder will not access another screen folder
for a widget that it may use. In time the `shared` folder will grow quite large, so maybe a better
approach would be needed.

