defmodule Exlivery.Orders.OrderTest do
  alias Exlivery.Orders.Order
  import Exlivery.Factory
  use ExUnit.Case

  describe "build/2" do
    test "should return an order struct with all valid params" do
      user = build(:user)
      items = build_list(2, :item)
      {:ok, response} = Order.build(user, items)

      expected_response = build(:order)

      assert response == expected_response
    end

    test "should return an error, because there's no items" do
      user = build(:user)
      items = []
      {result, _reason} = Order.build(user, items)

      assert result == :error
    end

    test "should return an error, because there's no user" do
      user = nil
      items = build_list(2, :item)
      {result, _reason} = Order.build(user, items)

      assert result == :error
    end
  end
end
