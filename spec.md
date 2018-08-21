# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
  Rails is used
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes)
  Movie has_many reviews
- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
  Review belongs_to a Movie
- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
  Movie has_many users through Reviews
- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
  reviews have user submittable titles, content, and rating for a movie.
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
  Users can't be created without name or password, reviews can't be created without title, content, and rating.
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
  Movies can be listed by highest average rating, and reviews can be sorted by movie title.
- [x] Include signup (how e.g. Devise)
  User signup page is present.
- [x] Include login (how e.g. Devise)
  User login page is present.
- [x] Include logout (how e.g. Devise)
  Logout link is present on user show page.
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
  Login with Facebook is available on login page.
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
  movies/1/reviews takes user to all review index for that particular movie.
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
  movies/1/reviews/new takes user to a form to create a new review.
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
  User validation errors are displayed in the new user form.

Confirm:
- [x] The application is pretty DRY
  application controller methods are present, as well as helper methods.
- [x] Limited logic in controllers
  movies/reviews controllers use methods defined in application controller.
- [x] Views use helper methods if appropriate
  helper methods are present
- [x] Views use partials if appropriate
  partial forms are used to edit reviews. 
