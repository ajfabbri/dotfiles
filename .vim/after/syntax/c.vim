" Qumulo Color Matching

" _var definitions
syn match qVar "\v\k+_var>"
syn match qPtrVarNull "\v\k+ptr_var_null>"
syn match qPtrVarRef "\v\k+ptr_var_ref>"
hi def link qVar Type
hi def link qPtrVarNull Type
hi def link qPtrVarRef Type

" global variables
syn keyword qGlobalVar global_variable
hi def link qGlobalVar Type

" foreach loops
syn keyword qForeachSingle foreach
hi def link qForeachSingle Repeat

" restart loops
syn match qRestartLoop "\v\k+_run_restartable>"
hi def link qRestartLoop Repeat

" with
syn keyword qWith with with_scope with_transaction
hi def link qWith Label

" patch
syn keyword qPatchable PATCHABLE
hi def link qPatchable Statement

" GENERATE
syn keyword qGen GENERATE a_generate module_define module_define_for_file linker_set_requires STRINGIFY
hi def link qGen Statement

" error handling
syn keyword qErr epanic ereturn eignore eretry eforward
syn keyword qIfErr if_error
hi def link qErr Statement
hi def link qIfErr Conditional

" test
syn keyword qTEST TEST FIXTURE_SET_UP FIXTURE_TEAR_DOWN
hi def link qTEST Type

" compiler flags
syn keyword qFLAGS a_warn_unused_result a_aligned a_packed a_transparent_union a_unused a_used a_cleanup a_section a_always_inline a_format_qumulo a_no_inline a_warn_unused_result a_weak a_interface_method a_const a_pure a_malloc a_getter a_setter a_implements a_implements_synchronized a_overloadable
hi def link qFLAGS Label

" asserts
syn keyword qASSERTS assert assert_false assert_implies assert_iff panic not_reached assert_equal assert_not_equal assert_less assert_not_less assert_less_equal assert_not_less_equal assert_greater assert_not_greater assert_greater_equal assert_not_greater_equal assert_between_exclusive assert_between_inclusive assert_equal_epsilon assert_matches assert_null assert_not_null assert_empty assert_not_empty assert_size assert_valid assert_not_valid assert_bytes_equal assert_contains assert_not_contains assert_locked assert_unlocked assert_rlocked assert_wlocked assert_runlocked assert_wunlocked assert_contains_set assert_mutually_exclusive assert_subset assert_not_subset assert_superset assert_not_superset assert_disjoint assert_not_disjoint must_be_true must_be_false must_not_be_null assert_debug assert_xor assert_error_is_class assert_error_is_subclass
hi def link qASSERTS Statement

" Qumulo Style end

