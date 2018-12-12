# README

Rails version 5.2.1

App for viewing and writing movie reviews with Rails and JavaScript.

# USAGE

After starting your local server at http://localhost:3000/, you are able to create users, add/view/edit reviews from a specified list of movies (depending on your user status).

# INSTALL DIRECTIONS

1. Enter "git clone git@github.com:coryjbergquist/RailsMovieReviewApp.git" into your terminal, while in your desired directory.
2. Navigate to newly created directory.
3. Run "bundle install" to install all gems.
4. Run "brew install redis" to install Redis for use of "sideqik"
4. Run "rake db:migrate" and  "rake db:seed" to populate database
5. If you wish to have use of the facebook login feature:
  visit "https://developers.facebook.com/apps" to make your own app.
    make an .env file and enter your facebook_key and facebook_secret into it,
    then add .env to the .gitignore file.
      ...If you don't wish to use the facebook login, you can skip this step.
6. Enter "rails s" in your terminal to start your local server.
7. Create a new user by clicking "create new user" on the main index page.
    Then you will be able to create/edit your own reviews.
9. The use of ActiveAdmin is not fully functioning, to enter admin mode,
    navigate to: "http://localhost:3000/admin" and login using username: "admin@example.com" and password: "password". As of now the admin has the ability to delete users and movies, so use with caution. To learn more about ActiveAdmin, visit: "https://github.com/activeadmin/activeadmin"

# CONTRIBUTIONS

Bug reports and pull requests are welcome at https://github.com/coryjbergquist/RailsMovieReviewApp

# LICENSE

 This project has been licensed under the MIT open source license:
 https://github.com/coryjbergquist/RailsMovieReviewApp/blob/master/LICENSE.md
