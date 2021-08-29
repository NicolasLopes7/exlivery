defmodule Exlivery.Orders.Order do
  alias Exlivery.Orders.Item
  alias Exlivery.Users.User

  @keys [:user_cpf, :delivery_address, :items, :total_price]
  @enforce_keys @keys
  defstruct @keys

  def build(%User{cpf: cpf, address: address}, [%Item{} | _items] = items) do
    {:ok,
     %__MODULE__{
       user_cpf: cpf,
       delivery_address: address,
       items: items,
       total_price: get_items_total_price(items)
     }}
  end

  def build(_user, _items), do: {:error, "Invalid parameters"}

  defp get_items_total_price(items) do
    items
    |> Enum.reduce(0, &sum_prices(&1, &2))
  end

  defp sum_prices(%Item{unity_price: price, quantity: qtd}, acc), do: acc + price * qtd
end
