Feature: User moves pawn

  Scenario: User moves pawn forward
    Given I start a new game
    When I click on a pawn
    And I right click on a space in front of that pawn
    Then that pawn should move to that space
