type Telemetry.event += Web_request_done of { verb : string }

let () =
  let collected_events : Telemetry.event list ref = ref [] in

  Telemetry.attach (fun ev ->
      collected_events := ev :: collected_events.contents);
  Telemetry.emit (Web_request_done { verb = "GET" });
  match collected_events.contents with
  | [ Web_request_done { verb = "GET" } ] -> exit 0
  | _ -> assert false
