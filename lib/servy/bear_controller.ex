defmodule Servy.BearController do

  alias Servy.Wildthings
  alias Servy.Bear

  @template_path Path.expand("../../template", __DIR__)

  def render(conv, template, bindings \\ []) do
    content =
      @template_path
      |> Path.join(template)
      |> EEx.eval_file(bindings)

    %{conv | status: 200, resp_body: content}
  end

  defp bear_item(bear) do
    "<li>#{bear.name} - #{bear.type}</li>"
  end

  def index(conv) do
    bears =
      Wildthings.list_bears()
      |> Enum.sort(&Bear.order_asc_by_name/2)
    render(conv, "index.eex", bears: bears)
  end

  def show(conv, %{"id" => id}) do
    bear = Wildthings.get_bear(id)
    render(conv, "show.eex", bear: bear)
  end

  def create(conv, %{"name" => name, "type" => type} = params) do
    %{conv | status: 201,
      resp_body: "Create a #{type} named #{name}"}
  end

end