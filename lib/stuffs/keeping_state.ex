defmodule Stuffs.KeepingState do
  def start do
    spawn(fn -> loop(0) end)
  end

  def view(server_pid) do
    send(server_pid, {:view, self()})

    receive do
      {:response, value} ->
        value
    end
  end

  def add(pid, value), do: send(pid, {:add, value})
  def sub(pid, value), do: send(pid, {:sub, value})
  def mult(pid, value), do: send(pid, {:mult, value})
  def div(pid, value), do: send(pid, {:div, value})
  def mod(pid, value), do: send(pid, {:mod, value})

  def loop(current_value) do
    new_value =
      receive do
        {:view, caller_pid} ->
          send(caller_pid, {:response, current_value})

        {:add, value} ->
          current_value + value

        {:sub, value} ->
          current_value - value

        {:mult, value} ->
          current_value * value

        {:div, value} ->
          current_value / value

        {:mod, value} ->
          rem(current_value, value)

        _ ->
          IO.puts("Invalid Message")
      end

    loop(new_value)
  end
end
