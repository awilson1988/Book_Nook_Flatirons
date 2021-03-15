# Book_Nook_Flatirons

Book Nook!

Welcome to Book Nook, a Sinatra Web-app to log your reading adventures. With Book Nook, the user creates an account, adds books they have read, comment on books posted by other users, and can modify and/or delete their own books.

Installation

You can install this app by running git clone git@github.com:awilson1988/Book_Nook_Flatirons.git

Usage

After cloning the repository, change directory by running cd Book_Nook_Flatirons/. Then, run the following:

bundle install
rake db:migrate
rake db:seed
shotgun

Then, paste http://localhost:9393/ into your web browser.