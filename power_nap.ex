power_nap = fn ->
  time = :rand.uniform(10_000)
  :timer.sleep(time)
  time
end

caller = self()

spawn(fn -> send(caller, {:slept, power_nap.()}) end)

message = receive do
  {:slept, time} ->
    time
end

IO.puts("Slept #{inspect message} ms")
