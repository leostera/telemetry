(lang dune 3.10)

(name telemetry)

(generate_opam_files true)

(source (github leostera/telemetry))

(authors "Leandro Ostera <leandro@abstractmachines.dev>")

(maintainers "Leandro Ostera <leandro@abstractmachines.dev>")

(license MIT)

(package
 (name telemetry)
 (synopsis "A lightweight library for dispatching and handling events, with a focus on metrics and instrumentation")
 (description "Telemetry is a lightweight library for dynamic dispatching of events, with a
focus on metrics and instrumentation. Any OCaml library can use telemetry to
emit events, then application code and other libraries can then hook into those
events and run custom handlers.")
 (depends
   (ocaml (>= "4.12.0"))
   dune)
 (tags
  (topics telemetry events metrics instrumentation)))
