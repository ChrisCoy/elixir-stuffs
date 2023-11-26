defmodule Stuffs.Condition do
  def max(a, b) do
    # inline if
    if a >= b, do: a, else: b
  end

  def max(a, b) do
    # inline if
    unless a >= b, do: b, else: a
  end

  def inline_if(condition \\ false) do
    # using inline if in a expression
    result = 10 + if condition, do: 10, else: 20

    result
  end

  def max_cond(a, b) do
    cond do
      a >= b -> a
      true -> b
    end
  end

  def max_case(a, b) do
    case a >= b do
      true -> a
      false -> b
      _ -> :error
    end
  end

  def with_example(user) do
    with {:ok, login} <- extract_login(user),
         {:ok, email} <- extract_email(user),
         {:ok, password} <- extract_password(user) do
      {:ok, %{login: login, email: email, password: password}}
    end
  end

  defp extract_login(%{"login" => login}), do: {:ok, login}
  defp extract_login(_), do: {:error, "login is missing"}
  defp extract_email(%{"email" => email}), do: {:ok, email}
  defp extract_email(_), do: {:error, "email is missing"}
  defp extract_password(%{"password" => password}), do: {:ok, password}
  defp extract_password(_), do: {:error, "password is missing"}
end
