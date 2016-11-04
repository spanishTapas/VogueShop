# VogueShop
This is an interview coding test. 

Below are the directions: 

* Can be written in Swift or Objective-C
* Touch targets should be at least 40x40
* Properly comment your code
* Use Keynote to get proper measurements/sizes/alignment for interface elements
   * Measurements are generally 2x what they should be in the storyboard or code

* Use IonIcons for icons
   * https://ionicons.com
   * https://github.com/sweetmandm/ionicons-iOS

* Screens
   * 1-2
       * User clicks login and is prompted to use touchid to authenticate

   * 3-6
       * The scrollview of products should scroll infinitely
       * Use the provided api to get the loyalty points to show
           * http://54.191.35.66:8181/pfchang/api/buy username=Michael&grandTotal=0
           * Request is POST

   * 7
       * When a user clicks to add an item to cart, the cart icon in the top right should display a bubble with a number to show how many items have been added to the cart
