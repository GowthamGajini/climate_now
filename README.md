# Climate Now

This is a simple Ruby on Rails app.  
It will show the weather forecast for an address you enter.  
It uses Redis for fast data and will cache searched results for 30 minutes.  

## Versions Used

- Ruby: 3.2.2
- Rails: 8.0.2

## Database Used

This app uses **PostgreSQL** as the database.  
Please make sure PostgreSQL is installed and running on your system before starting the app.

- You can change the database settings in `config/database.yml` if needed.

## Important Gems

- `redis` - for storing weather details for some time
- `rspec-rails` - for writing tests

## How to Start

1. Clone this project.
2. Run `bundle install` to get all gems.
3. Start Redis server on your system.
4. If you need, run `rails db:setup`.
5. Start the app by running `rails server`.

## What was Skipped

While creating this app, We skipped some Rails parts which are not currently needed, might add based on necessity:
- No Action Cable, Mailbox, Active Storage, System Test, or Javascript.

