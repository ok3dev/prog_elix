defmodule Timer do
  def remind(reminder, time_in_seconds) do
    time_in_seconds
    |> seconds_to_mill()
    |> :timer.sleep()

    IO.puts(reminder)
  end

  defp seconds_to_mill(seconds) do
    seconds * 1000
  end
end
