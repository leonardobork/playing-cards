defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck makes 65 cards" do
    assert length(Cards.create_deck) == 65
  end

  test "shuffling randomizes cards" do
    refute Cards.create_deck == Cards.shuffle Cards.create_deck
  end

  test "contains works for a deck" do
    assert Cards.contains?(Cards.create_deck,"Ace of Spades")
  end

  test "save saves deck" do
    refute Cards.save("test.txt", Cards.create_deck) == "That file doesn't exist"
  end

  test "loads deck" do
    deck = Cards.create_deck
    Cards.save("test.txt", deck)
    assert Cards.load("test.txt") == deck
  end

  test "deal" do
    deck = Cards.create_deck
    {hand, deck} = Cards.deal(deck, 2)
    assert hand == ["Ace of Spades", "Two of Spades"]
  end
end
