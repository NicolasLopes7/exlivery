defmodule Exlivery.Factory do
  alias Exlivery.Orders.Item
  alias Exlivery.Orders.Order
  alias Exlivery.Users.User
  use ExMachina

  def user_factory do
    %User{
      name: "Nicolas",
      email: "nicolaslopesaquino@gmail.com",
      cpf: "11029314462",
      age: 18,
      address: "Minha rua"
    }
  end

  def item_factory do
    %Item{
      description: "Pizza",
      category: :pizza,
      unity_price: 10,
      quantity: 1
    }
  end

  def order_factory do
    %Order{
      delivery_address: "Minha rua",
      items: build_list(2, :item),
      total_price: 20,
      user_cpf: "11029314462"
    }
  end
end
