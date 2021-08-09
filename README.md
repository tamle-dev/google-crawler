## System Dependencies
- Ruby: Version 2.6.2
- Rails Version 5.2.6
- PostgreSQL: Database Management System (DBMS) used for this particular project
- Google Cloud Storage: Store upload files
## Setup & Configuration
1. Install PostgresSQL
```
brew install postgresql
```
2. Install Ruby: Download Ruby 2.6.2 by rvm
3. Clone project
```
git clone git@github.com:tamle-dev/google-crawler.git
```
4. Install dependencies
```sh
bundle install
```
5. Create database
```
rake db:create
```
6. Migrations and Seed data
```
rake db:migrate
rake db:seed
```
7. Start application
```sh
rails c
```
8. Access http://localhost:3000
## How to use?
1. Access http://localhost:3000
2. Default email & password
```
admin@nimblehq.co
123456
```
3. Upload file csv
4. View list of keywords
5. View the search result information for each keyword.
