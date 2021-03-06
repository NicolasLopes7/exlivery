defmodule Exlivery.Orders.Item do
  @categories [:pizza, :hamburger, :meat, :sushi, :dessert]
  @keys [:description, :category, :unity_price, :quantity]
  @enforce_keys @keys
  defstruct @keys

  def build(description, category, unity_price, quantity)
      when category in @categories and quantity > 0 do
    build_item(description, category, quantity, unity_price)
  end

  def build(_description, _category, _unity_price, _quantity), do: {:error, "Invalid parameters"}

  defp build_item(description, category, quantity, unity_price) do
    {:ok,
     %__MODULE__{
       description: description,
       category: category,
       unity_price: unity_price,
       quantity: quantity
     }}
  end
end
