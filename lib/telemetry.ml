type event = ..
type handler = event -> unit

let handlers : handler list Atomic.t = Atomic.make []

let rec attach_many fn =
  let old_hs = Atomic.get handlers in
  let new_hs = fn :: old_hs in
  if Atomic.compare_and_set handlers old_hs new_hs then () else attach_many fn

let attach handler = attach_many handler

let emit event =
  let handlers = Atomic.get handlers in
  List.iter (fun h -> h event) handlers
