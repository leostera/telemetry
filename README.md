# telemetry

Telemetry is a lightweight library for dynamic dispatching of events, with a
focus on metrics and instrumentation. Any OCaml library can use telemetry to
emit events, then application code and other libraries can then hook into those
events and run custom handlers.

## Getting Started

Install from Opam:

```
opam install telemetry
```

Create some events in your library or application code:

```ocaml
type Telemetry.event += Web_request_done of { latency: int }
Telemetry.emit (Web_request_done { latency = 10 });
```

And now attach listeners:

```ocaml
Telemetry.attach (fun ev ->
    match ev with
    | Web_request_done {latency} ->
       Printf.printf "Web request took %sms" latency
    | _ -> ()
);
```
