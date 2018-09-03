# README

Rails version 5.2.1

App for viewing and writing movie reviews.

# USAGE

After starting your local server at http://localhost:3000/, you are able to create users, add/view/edit reviews from a specified list of movies (depending on your user status).

# INSTALL DIRECTIONS

1. Enter "git clone git@github.com:coryjbergquist/RailsMovieReviewApp.git" into your terminal, while in your desired directory.
2. Navigate to newly created directory.
3. Run "bundle install" to install all gems.
4. Run rake db:migrate rake db:seed
5. If you wish to have use of the facebook login feature:
  visit "https://developers.facebook.com/apps" to make your own app.
  make a .env file and enter your facebook_key and facebook_secret into it,
  then add .env to the .gitignore file.
    ...If you don't wish to use the facebook login, you can skip this step.
6. Enter "rails s" in your terminal to start your local server.

# CONTRIBUTIONS

Bug reports and pull requests are welcome at https://github.com/coryjbergquist/RailsMovieReviewApp

# LICENSE

 This project has been licensed under the MIT open source license:
 https://github.com/coryjbergquist/RailsMovieReviewApp/blob/master/LICENSE.md
