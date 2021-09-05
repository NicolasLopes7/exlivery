defmodule Exlivery do
  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Users.CreateOrUpdate

  def start_agents do
    UserAgent.start_link(%{})
  end

  defdelegate create_or_update_user(params), to: CreateOrUpdate, as: :call
  defdelegate get_user(cpf), to: UserAgent, as: :get
end
