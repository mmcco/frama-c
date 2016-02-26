(**************************************************************************)
(*                                                                        *)
(*  This file is part of Frama-C.                                         *)
(*                                                                        *)
(*  Copyright (C) 2007-2015                                               *)
(*    CEA (Commissariat à l'énergie atomique et aux énergies              *)
(*         alternatives)                                                  *)
(*                                                                        *)
(*  you can redistribute it and/or modify it under the terms of the GNU   *)
(*  Lesser General Public License as published by the Free Software       *)
(*  Foundation, version 2.1.                                              *)
(*                                                                        *)
(*  It is distributed in the hope that it will be useful,                 *)
(*  but WITHOUT ANY WARRANTY; without even the implied warranty of        *)
(*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *)
(*  GNU Lesser General Public License for more details.                   *)
(*                                                                        *)
(*  See the GNU Lesser General Public License version 2.1                 *)
(*  for more details (enclosed in the file licenses/LGPLv2.1).            *)
(*                                                                        *)
(**************************************************************************)

(** Maps from bases to memory maps. The memory maps are those of the
    [Offsetmap] module.
    @plugin development guide *)

module Make_LOffset
  (V: module type of Offsetmap_lattice_with_isotropy)
  (Offsetmap: module type of Offsetmap_sig
              with type v = V.t
              and type widen_hint = V.widen_hint)
  (Default_offsetmap: sig
    val default_offsetmap : Base.t -> [`Bottom | `Map of Offsetmap.t]
    val is_default_offsetmap: Base.t -> Offsetmap.t -> bool
  end):
  module type of Lmap_sig
    with type v = V.t
    and type widen_hint_base = V.widen_hint
    and type offsetmap = Offsetmap.t

(*
Local Variables:
compile-command: "make -C ../../.."
End:
*)
