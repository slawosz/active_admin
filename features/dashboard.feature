Feature: Dashboard

  Background:
    Given I am logged in


  Scenario: With no configuration
    Given a configuration of:
      """
      """
    When I go to the dashboard
    Then I should see the default welcome message

  Scenario: Displaying a dashboard widget
    Given a configuration of:
      """
      ActiveAdmin::Dashboards.build do
        section 'Hello World' do
          para "Hello world from the content"
        end
      end
      """
    When I go to the dashboard
    Then I should not see the default welcome message
    And I should see a dashboard widget "Hello World"
    And I should see "Hello world from the content"

  Scenario: With logout_link_path set to :logout_path (the symbol)
    Given a configuration of:
      """
      ActiveAdmin.setup do |config|
        config.logout_link_path = :logout_path
      end
      """
    When I go to the dashboard
    Then I should see the default welcome message
