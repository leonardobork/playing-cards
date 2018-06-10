defmodule Cards do
  @moduledoc """
    Methods for creating and handling a deck of cards

  """

  @doc """
    Returns a list of strings, representing the cards
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight",
              "Nine", "Ten", "Jack", "Queen", "King"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds", "Stars"]

    for suit <- suits, value <- values do
        "#{value} of #{suit}"
    end
  end
  
  @doc """
    Shuffles the passed deck and returns a new shuffled deck
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Checks if card is contained in deck
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end
  
  @doc """
    Divides a deck into a hand and rest of the deck, 
    `hand_size` argument indicates how many cards should be in the hand

  ##Example
      iex> deck = Cards.create_deck
      iex> {hand, deck} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
    Saves deck as a binary file, `filename` stands for the name of the saved file
  """
  def save(filename, deck) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  @doc """
    Loads a deck from a binary file
  """
  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, _reason} -> "That file doesn't exist"
    end
  end

  @doc """
    Creates a hand from scratch
  """
  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
end
