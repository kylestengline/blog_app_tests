# Practice with RSPEC and Capybara

## Notes

1. Setup rspec by adding the gem.
2. ``` rails g rspec:install ``` Installs rspec and spec folders.
- ``` rails g controller articles index ``` generates controller with index.html and adds a test and controller for articles within spec folder.

### Important Links
- [Installing and Using guard](https://github.com/guard/guard-rspec)
- [Rails Controller Testing](https://github.com/rails/rails-controller-testing)

### Small Issues with Rails 5 and RSpec, Capybara. April 22, 2016
- For error: ``` email already taken ``` run ``` bundle exec rails db:test:prepare ``` cleans the db so you can run your tests again without them failing.
- For error: ``` nomethoderror for expect(response).to render_template... ``` for running tests in your controller specs. Install ``` gem 'rails-controller-testing' ``` and go into your rails_helper.rb and write the following code ``` RSpec.configure do |config|
  config.include Rails::Controller::Testing::TestProcess
  config.include Rails::Controller::Testing::TemplateAssertions
  config.include Rails::Controller::Testing::Integration
end ``` This will allow controller testing within your rails 5 project without erroring out.
[Refer to the Github](https://github.com/rails/rails-controller-testing)