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

- `redis` - for caching weather details for some time
- `rspec-rails` - for writing tests
- `dotenv-rails` - for managing environment variables securely
- `httparty` - for making HTTP requests to external APIs

## External APIs Used

- **Google Places API**  
  Used to convert the address text entered by the user into latitude and longitude coordinates.  
  (Places API: Text Search → Lat/Lng)

- **Google Geocode API**  
  Used to fetch the zipcode for a given latitude and longitude.  
  (Geocode API: Lat/Lng → Zipcode)

- **OpenWeatherMap API**  
  Used to get the current weather details (temperature, description) for the given zipcode.

## Environment Variables

- API keys for Google and OpenWeatherMap are stored in a `.env` file.  
  This is handled by the `dotenv-rails` gem.  
  Example (add this to your `.env` file in the project root):

  **Do not commit your `.env` file to version control. Add `.env*` to your `.gitignore`.**

## How to Start

1. Clone this project.
2. Run `bundle install` to get all gems.
3. Copy `.env.example` to `.env` and fill in your own API keys.
4. Start Redis server on your system.
5. If you need, run `rails db:setup`.
6. Start the app by running `rails server`.

## What was Skipped

While creating this app, we skipped some Rails parts which are not currently needed (might add based on necessity):
- No Action Cable, Mailbox, Active Storage, System Test, or Javascript.

## Testing

- RSpec is used for writing and running tests.
- Ran `rails generate rspec:install` to set up RSpec in this project.
- Run `rspec` or `bundle exec rspec` to execute testcases.

## Browser-based testing

- Capybara is used for browser-based/system tests.
- Before running system tests, ensure Capybara is installed.

## Install Turbo and ImportMap to use Turbo Stream

- `bin/rails importmap:install`
- `bin/rails turbo:install`

## Note

- Created a simple HomeController for the landing page.
- Landing page contains search bar, which can be used for weather-related information.