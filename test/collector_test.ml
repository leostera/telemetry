type Telemetry.event += Web_request_done | Web_request_done_error

let () =
  let collected_events : Telemetry.event list ref = ref [] in
  let collected_errors : Telemetry.event list ref = ref [] in

  Telemetry.attach (fun ev ->
      match ev with
      | Web_request_done -> collected_events := ev :: collected_events.contents
      | _ -> ());

  Telemetry.attach (fun ev ->
      match ev with
      | Web_request_done_error ->
          collected_errors := ev :: collected_errors.contents
      | _ -> ());
  Telemetry.emit Web_request_done;
  Telemetry.emit Web_request_done;
  Telemetry.emit Web_request_done_error;
  match (collected_events.contents, collected_errors.contents) with
  | [ _a; _b ], [ _c ] -> exit 0
  | _ -> assert false
