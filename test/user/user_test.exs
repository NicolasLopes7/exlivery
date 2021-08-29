defmodule Exlivery.Users.UserTest do
  alias Exlivery.Users.User
  import Exlivery.Factory
  use ExUnit.Case

  describe "build/5" do
    test "should return an user struct with all valid params" do
      {:ok, response} =
        User.build("Nicolas", "nicolaslopesaquino@gmail.com", "11029314462", 18, "Minha rua")

      expected_response = build(:user)

      assert response == expected_response
    end

    test "should return an error, because the age are lower than 18" do
      {result, _reason} =
        User.build("Nicolas", "nicolaslopesaquino@gmail.com", "11029314462", 17, "Minha rua")

      assert result == :error
    end
  end
end
