defmodule Servy.Wildthings do
  alias Servy.Bear

  def list_bears do
    [
      %Bear{id: 1, name: "Lily", type: "ddd"},
      %Bear{id: 2, name: "Lily1", type: "ddsd"},
      %Bear{id: 3, name: "Lily2", type: "ddadd"},
      %Bear{id: 5, name: "Lily34", type: "dddd"},
      %Bear{id: 4, name: "Lily4", type: "ddd"},
      %Bear{id: 7, name: "Lily4", type: "addd"},
      %Bear{id: 8, name: "Lily4", type: "ddd"},
    ]
  end

  def get_bear(id) when is_integer(id) do
    Enum.find(list_bears(), fn b -> b.id == id end)
  end

  def get_bear(id) when is_binary(id) do
    id |> String.to_integer |> get_bear
  end

end