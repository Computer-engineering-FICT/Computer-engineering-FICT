
                                          PAGE   60,132 
                                          TITLE  COMPILATION UNIT _elab_tab 
                       ;                                
                       Listing of Generated Code        
                       ;                                
                       EXCEP              RECORD FLAG:1, SPSAV:1, IPCOUNT:6 
                       ;                                
                       CODE               SEGMENT PUBLIC BYTE 'CODE' USE32 ;  _elab_tab
                                          ASSUME CS:CODE 


; ************* Constant segment :
                                          ALIGN 4       
     000000            rts_restrictions_info DD  00000000 
     000004            rts_config_pragma_info DD 00000000 
     000008            _rts_main_prio_info DD    FFFFD8F0 
     00000C            _rts_main_stack_size_info DD FFFFFFFF 
     000010            rts_history_level_info DD 00000001 
     000014            _ObjectAda__main_unit_ptr DD lab2_sepcomp3 
     000018            _elab_func_array   DD     system__elab_spec 
                                          DD     ada__elab_spec 
                                          DD     system__elab_body 
                                          DD     system.rts__elab_spec 
                                          DD     system.rts.tgt__elab_spec 
                                          DD     ada.characters__elab_spec 
                                          DD     ada.characters.handling__elab_spec 
                                          DD     ada.characters.handling__elab_body 
                                          DD     system.rts.tgt.kernel__elab_spec 
                                          DD     system.rts.target_float_types__elab_spec 
                                          DD     system.rts.dbg__elab_spec 
                                          DD     system.rts.config__elab_spec 
                                          DD     system.rts.dbg__elab_body 
                                          DD     ada.io_exceptions__elab_spec 
                                          DD     system.rts.tgt.float_attributes_pkg__elab_spec 
                                          DD     system.rts.tgt.float_representation__elab_spec 
                                          DD     interfaces__elab_spec 
                                          DD     system.rts.tgt.float_attributes_pkg__elab_body 
                                          DD     ada.streams__elab_spec 
                                          DD     ada.tags__elab_spec 
                                          DD     system.rts.tcb_tdep__elab_spec 
                                          DD     system.rts.tcb__elab_spec 
                                          DD     system.rts.tgt.sec_stack_pkg__elab_spec 
                                          DD     system.storage_elements__elab_spec 
                                          DD     system.rts.tgt.sec_stack_pkg__elab_body 
                                          DD     ada.tags__elab_body 
                                          DD     system.rts.win32__elab_spec 
                                          DD     system.rts.traces__elab_spec 
                                          DD     system.rts.traces__elab_body 
                                          DD     system.rts.win32__elab_body 
                                          DD     system.rts.tgt.exception_reason_pkg__elab_spec 
                                          DD     system.rts.tgt.exception_reason_pkg__elab_body 
                                          DD     system.rts.exception_types__elab_spec 
                                          DD     system.rts.temp_io__elab_spec 
                                          DD     system.rts.lexer__elab_spec 
                                          DD     system.rts.lexer__elab_body 
                                          DD     system.rts.float_image_and_value_pkg__elab_spec 
                                          DD     system.rts.float_io_support__elab_spec 
                                          DD     system.rts.float_io_support.scaling__elab_spec 
                                          DD     system.rts.float_io_support__elab_body 
                                          DD     system.rts.float_image_and_value_pkg__elab_body 
                                          DD     system.rts.tgt.program__elab_spec 
                                          DD     system.rts.temp_io__elab_body 
                                          DD     system.rts.tgt.exception_manager__elab_spec 
                                          DD     system.rts.tgt.exception_manager__elab_body 
                                          DD     system.rts.tgt.exception_manager.tdep__elab_spec 
                                          DD     system.rts.tgt.exception_manager.debug__elab_spec 
                                          DD     system.rts.tgt.exception_manager.debug__elab_body 
                                          DD     system.rts.tgt.exception_manager.trace_io__elab_spec 
                                          DD     system.address_image_and_value__elab_spec 
                                          DD     system.rts.tgt.exception_manager.trace_io__elab_body 
                                          DD     system.rts.tgt.exception_manager.types__elab_spec 
                                          DD     system.rts.tgt.exception_manager.types.ada_code_table__elab_spec 
                                          DD     system.rts.tgt.exception_manager.types__elab_body 
                                          DD     system.rts.tgt.exception_manager.prop__elab_spec 
                                          DD     system.rts.tgt.exception_manager.hist__elab_spec 
                                          DD     system.rts.tgt.frames__elab_spec 
                                          DD     system.rts.tgt.exception_manager.glue__elab_spec 
                                          DD     system.rts.tgt.exception_traceback_pkg__elab_spec 
                                          DD     system.rts.tgt.code_lookup__elab_spec 
                                          DD     system.rts.tgt.code_lookup__elab_body 
                                          DD     system.rts.tgt.exception_traceback_pkg__elab_body 
                                          DD     system.rts.tgt.exception_manager.glue__elab_body 
                                          DD     system.rts.tgt.exception_manager.hist__elab_body 
                                          DD     system.rts.tgt.exception_manager.debugger_interface__elab_spec 
                                          DD     system.rts.tgt.exception_manager.debugger_interface__elab_body 
                                          DD     system.rts.tgt.exception_manager.prop__elab_body 
                                          DD     system.rts.tgt.exception_manager.tdep__elab_body 
                                          DD     system.rts.tgt.exception_manager.main__elab_spec 
                                          DD     system.rts.tgt.exception_manager.main__elab_body 
                                          DD     ada.finalization__elab_spec 
                                          DD     ada.finalization__elab_body 
                                          DD     system.storage_pools__elab_spec 
                                          DD     system.rts.init_pkg__elab_spec 
                                          DD     system.rts.init_pkg.nt__elab_spec 
                                          DD     system.rts.tgt.kernel.threads__elab_spec 
                                          DD     system.rts.init_pkg.machine__elab_spec 
                                          DD     system.rts.init_pkg.machine__elab_body 
                                          DD     system.rts.tgt.kernel.threads.abort_signals__elab_spec 
                                          DD     system.rts.integer_image_and_value_pkg__elab_spec 
                                          DD     system.rts.integer_state_tables__elab_spec 
                                          DD     system.rts.integer_image_and_value_pkg__elab_body 
                                          DD     system.rts.init_pkg.nt.buildopts__elab_spec 
                                          DD     system.rts.tgt.kernel.threads.nt__elab_spec 
                                          DD     system.rts.heap_storage_pkg__elab_spec 
                                          DD     system.rts.tgt.heap_pkg__elab_spec 
                                          DD     system.rts.tgt.heap_pkg__elab_body 
                                          DD     system.rts.heap_storage_pkg__elab_body 
                                          DD     system.rts.tgt.kernel.threads__elab_body 
                                          DD     system.rts.tgt.kernel.threads.nt__elab_body 
                                          DD     system.rts.tgt.kernel.mutexes__elab_spec 
                                          DD     system.rts.tgt.kernel.mutexes__elab_body 
                                          DD     system.rts.init_pkg.nt__elab_body 
                                          DD     system.rts.tgt.finalization_pkg__elab_spec 
                                          DD     system.rts.tgt.finalization_pkg__elab_body 
                                          DD     system.rts.interface_types__elab_spec 
                                          DD     system.rts.protected_type_descriptor_pkg__elab_spec 
                                          DD     system.rts.tgt.kernel.timers__elab_spec 
                                          DD     system.rts.timer_class__elab_spec 
                                          DD     ada.real_time__elab_spec 
                                          DD     ada.real_time__elab_body 
                                          DD     system.rts.tgt.kernel.timers.real_time__elab_spec 
                                          DD     system.rts.tgt.kernel.threads.imtimers__elab_spec 
                                          DD     system.rts.tgt.kernel.threads.imtimers__elab_body 
                                          DD     system.rts.tgt.kernel.timers.real_time__elab_body 
                                          DD     ada.calendar__elab_spec 
                                          DD     ada.calendar.tgt__elab_spec 
                                          DD     ada.calendar.tgt__elab_body 
                                          DD     ada.calendar__elab_body 
                                          DD     system.rts.tgt.kernel.timers.calendar__elab_spec 
                                          DD     system.rts.tgt.kernel.timers.calendar__elab_body 
                                          DD     system.rts.timer_class__elab_body 
                                          DD     system.rts.tgt.kernel.atc__elab_spec 
                                          DD     ada.exceptions__elab_spec 
                                          DD     system.rts.tgt.exception_manager.finalization_support__elab_spec 
                                          DD     system.rts.exception_manager__elab_spec 
                                          DD     system.rts.tgt.exceptions__elab_spec 
                                          DD     system.rts.exception_manager__elab_body 
                                          DD     ada.exceptions__elab_body 
                                          DD     system.rts.protected_types_pkg__elab_spec 
                                          DD     system.rts.protected_interface__elab_spec 
                                          DD     system.rts.tasking_types_pkg__elab_spec 
                                          DD     system.rts.finalization_pkg__elab_spec 
                                          DD     system.rts.master_pkg__elab_spec 
                                          DD     system.rts.protected_operations_pkg__elab_spec 
                                          DD     system.rts.tgt.interrupt_types__elab_spec 
                                          DD     ada.interrupts__elab_spec 
                                          DD     system.rts.tgt.handler_conversions__elab_spec 
                                          DD     system.rts.tgt.handler_conversions__elab_body 
                                          DD     system.rts.tgt.kernel.interrupts__elab_spec 
                                          DD     system.rts.tgt.kernel.interrupts__elab_body 
                                          DD     ada.interrupts__elab_body 
                                          DD     system.rts.two_dimension_queue_pkg__elab_spec 
                                          DD     system.rts.ecd_queue_pkg__elab_spec 
                                          DD     system.rts.ecd_queue_pkg__elab_body 
                                          DD     system.rts.two_dimension_queue_pkg__elab_body 
                                          DD     system.rts.tgt.utils__elab_spec 
                                          DD     system.rts.tgt.utils__elab_body 
                                          DD     system.rts.tgt.call_outs_driver__elab_spec 
                                          DD     system.rts.tgt.call_outs_driver__elab_body 
                                          DD     ada.exceptions.rts_utils__elab_spec 
                                          DD     ada.exceptions.rts_utils__elab_body 
                                          DD     system.rts.protected_operations_pkg__elab_body 
                                          DD     system.rts.master_pkg__elab_body 
                                          DD     system.rts.tgt.kernel.timers.relative__elab_spec 
                                          DD     system.rts.tgt.kernel.timers.relative__elab_body 
                                          DD     system.rts.protected_interface__elab_body 
                                          DD     system.rts.memory_pkg__elab_spec 
                                          DD     system.rts.finalization_pkg__elab_body 
                                          DD     system.rts.tasking_types_pkg__elab_body 
                                          DD     system.rts.init_pkg__elab_body 
                                          DD     system.rts.tgt.kernel.threads.abort_signals__elab_body 
                                          DD     ada.text_io__elab_spec 
                                          DD     system.rts.tgt.io_constants__elab_spec 
                                          DD     system.rts.string_utilities__elab_spec 
                                          DD     system.rts.string_utilities__elab_body 
                                          DD     system.rts.tgt.basic_io__elab_spec 
                                          DD     system.rts.low_level_io__elab_spec 
                                          DD     system.rts.low_level_io__elab_body 
                                          DD     system.rts.tgt.basic_io__elab_body 
                                          DD     system.rts.tgt.char_io__elab_spec 
                                          DD     system.rts.tgt.char_io__elab_body 
                                          DD     ada.text_io__elab_body 
                                          DD     ada.integer_text_io__elab_spec 
                                          DD     vector_f1__elab_subp 
                                          DD     vector_f1.matrix_f2__elab_subp 
                                          DD     vector_f1.matrix_f2.fio__elab_subp 
                                          DD     vector_f1.matrix_f2.f3__elab_subp 
                                          DD     system.rts.post_elab_pkg__elab_spec 
                                          DD     lab2_sepcomp3 
                                          DD     00000000 
; ********* End of segment, Total Size = 708

                       ;                                
                       CODE               ENDS          

