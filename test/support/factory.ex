defmodule Exlivery.Factory do
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
end
