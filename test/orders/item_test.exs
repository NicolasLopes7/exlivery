defmodule Exlivery.Orders.ItemTest do
  alias Exlivery.Orders.Item
  import Exlivery.Factory
  use ExUnit.Case

  describe "build/4" do
    test "should return an item struct with all valid params" do
      {:ok, response} = Item.build("Pizza", :pizza, 10, 1)

      expected_response = build(:item)

      assert response == expected_response
    end

    test "should return an error, because the category aren't allowed" do
      result = Item.build("avocado are sweet", :avocado, 10, 1)

      assert result == {:error, "Invalid parameters"}
    end

    test "should return an error, because the quantity are lower than 0" do
      result = Item.build("avocado are sweet", :avocado, 10, -1)

      assert result == {:error, "Invalid parameters"}
    end
  end
end
