# Foodish-iOS
 
 ### An iOS mobile application that;
* Popular dishes and categories of the regions are listed.
* When the user clicks on the region or category, the user reaches the list of the relevant region or category. 
* Then, the user who wants to go to the details of the food opens the detail page by clicking on the relevant dish.

 ### 1) Home Page
 *![1](https://user-images.githubusercontent.com/58864953/148657981-0b9e3046-1703-4c13-ad47-dfadeb402405.png)
 
 ### 2) Explore Meals
 * Regions are taken from the following url as Json data by sending request, and shown as Collection View.
   https://www.themealdb.com/api/json/v1/1/list.php?a=list
 * The categories are taken from the following url as Json data by sending request, and displayed in Table View.
   https://www.themealdb.com/api/json/v1/1/categories.php
 * Collection View can be scrolled horizontally, Table View can be scrolled vertically.
 
![2](https://user-images.githubusercontent.com/58864953/148658077-55e17c1f-b4e6-4984-8d7e-691e8cb5d19d.png)

### 3) Food List
* The user can reach this screen in two different ways, by clicking on the region or category.
* When the region is clicked, the dishes belonging to that region will be listed.
* When the user click on the category, the dishes belonging to that category will be listed.

  ![3](https://user-images.githubusercontent.com/58864953/148658302-186e2d43-1e94-4c44-87b3-3ebfebabbd16.png)
  ![4](https://user-images.githubusercontent.com/58864953/148658304-d3591d27-48bd-4629-a101-90ee718c8b93.png)
  
### 3) Meal Detail
* When user click a meal in the Food List page, it directs to the Meal Details page and shows the details of the selected meal.
* In the Meal Detail page, user can add the meal to favorite list by clicking the star button, in the second click it will remove from the favorite list.

![5](https://user-images.githubusercontent.com/58864953/148658617-560ac95b-7f4f-49e2-9758-273615a4ceb3.png)
![tsi6VwMBIA](https://user-images.githubusercontent.com/58864953/148658756-e7c404b6-9e38-42cc-baf4-989885fbb9c1.png)

### 3) Favorite List
* User can see the favorite meals by clicking the Favorite Meals button.
* Core Data is used to store the favorite meals.

![4Sh1M7dP4z](https://user-images.githubusercontent.com/58864953/148658847-a3ab4733-311d-4c33-904b-ed6c37f3d5fb.png)


* You need to download Cocoapods Alamofire library on your computer to run the project.

