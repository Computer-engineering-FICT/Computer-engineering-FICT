pragma Ada_95;
with System;
package ada_main is
   pragma Warnings (Off);

   gnat_argc : Integer;
   gnat_argv : System.Address;
   gnat_envp : System.Address;

   pragma Import (C, gnat_argc);
   pragma Import (C, gnat_argv);
   pragma Import (C, gnat_envp);

   gnat_exit_status : Integer;
   pragma Import (C, gnat_exit_status);

   GNAT_Version : constant String :=
                    "GNAT Version: 4.3.3" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_lab2" & Ascii.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adafinal;
   pragma Export (C, adafinal, "adafinal");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure Break_Start;
   pragma Import (C, Break_Start, "__gnat_break_start");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#87f94eef#;
   u00002 : constant Version_32 := 16#a448b566#;
   u00003 : constant Version_32 := 16#cb24d150#;
   u00004 : constant Version_32 := 16#9c7dd3ea#;
   u00005 : constant Version_32 := 16#03bc737c#;
   u00006 : constant Version_32 := 16#23afd868#;
   u00007 : constant Version_32 := 16#a8a5666f#;
   u00008 : constant Version_32 := 16#1045e437#;
   u00009 : constant Version_32 := 16#7d7a78ec#;
   u00010 : constant Version_32 := 16#ecad2c4f#;
   u00011 : constant Version_32 := 16#e2b32c27#;
   u00012 : constant Version_32 := 16#91c0f6c5#;
   u00013 : constant Version_32 := 16#56918bcb#;
   u00014 : constant Version_32 := 16#4c0302b0#;
   u00015 : constant Version_32 := 16#119d7ace#;
   u00016 : constant Version_32 := 16#4dd9543a#;
   u00017 : constant Version_32 := 16#8819d287#;
   u00018 : constant Version_32 := 16#a97dd90b#;
   u00019 : constant Version_32 := 16#f3b7e4a6#;
   u00020 : constant Version_32 := 16#e1e7b9d6#;
   u00021 : constant Version_32 := 16#d6ccdf4e#;
   u00022 : constant Version_32 := 16#dbf34042#;
   u00023 : constant Version_32 := 16#246b012b#;
   u00024 : constant Version_32 := 16#1a63fe0c#;
   u00025 : constant Version_32 := 16#94136b37#;
   u00026 : constant Version_32 := 16#5b8b9839#;
   u00027 : constant Version_32 := 16#3a7fb590#;
   u00028 : constant Version_32 := 16#0a4e56be#;
   u00029 : constant Version_32 := 16#66ec5ef5#;
   u00030 : constant Version_32 := 16#573451fa#;
   u00031 : constant Version_32 := 16#907d3c44#;
   u00032 : constant Version_32 := 16#9c49ee35#;
   u00033 : constant Version_32 := 16#88ddf8cf#;
   u00034 : constant Version_32 := 16#224ad6c2#;
   u00035 : constant Version_32 := 16#743d3d0d#;
   u00036 : constant Version_32 := 16#49b1abbe#;
   u00037 : constant Version_32 := 16#ccde3404#;
   u00038 : constant Version_32 := 16#cdc6e44f#;
   u00039 : constant Version_32 := 16#2c57c517#;
   u00040 : constant Version_32 := 16#c222a0d8#;
   u00041 : constant Version_32 := 16#a69cad5c#;
   u00042 : constant Version_32 := 16#300a43f3#;
   u00043 : constant Version_32 := 16#e90bfca8#;
   u00044 : constant Version_32 := 16#99c8a881#;
   u00045 : constant Version_32 := 16#5fec0b74#;
   u00046 : constant Version_32 := 16#820fd89a#;
   u00047 : constant Version_32 := 16#68b12451#;
   u00048 : constant Version_32 := 16#a8d17654#;
   u00049 : constant Version_32 := 16#52e22fd2#;
   u00050 : constant Version_32 := 16#8ec8b2ff#;
   u00051 : constant Version_32 := 16#647de85b#;
   u00052 : constant Version_32 := 16#c3759bfc#;
   u00053 : constant Version_32 := 16#8213b492#;
   u00054 : constant Version_32 := 16#b89d514b#;
   u00055 : constant Version_32 := 16#44c7af1b#;
   u00056 : constant Version_32 := 16#73293f23#;
   u00057 : constant Version_32 := 16#62e56d2b#;
   u00058 : constant Version_32 := 16#a8e5b34e#;
   u00059 : constant Version_32 := 16#fe040075#;
   u00060 : constant Version_32 := 16#06c4e987#;
   u00061 : constant Version_32 := 16#b782cf7b#;
   u00062 : constant Version_32 := 16#fcec4850#;
   u00063 : constant Version_32 := 16#16dfe486#;
   u00064 : constant Version_32 := 16#6d0998e1#;
   u00065 : constant Version_32 := 16#93f7edba#;
   u00066 : constant Version_32 := 16#47048e11#;
   u00067 : constant Version_32 := 16#2216744e#;
   u00068 : constant Version_32 := 16#293ff6f7#;
   u00069 : constant Version_32 := 16#fa1253bc#;
   u00070 : constant Version_32 := 16#716a9db2#;
   u00071 : constant Version_32 := 16#40ea6cd5#;
   u00072 : constant Version_32 := 16#2274d34a#;
   u00073 : constant Version_32 := 16#53d0166e#;
   u00074 : constant Version_32 := 16#923573c8#;
   u00075 : constant Version_32 := 16#183b4446#;
   u00076 : constant Version_32 := 16#6ffd7991#;
   u00077 : constant Version_32 := 16#9a4b8e7f#;
   u00078 : constant Version_32 := 16#c572d19b#;
   u00079 : constant Version_32 := 16#6ddb8e2e#;
   u00080 : constant Version_32 := 16#d9f6bc78#;
   u00081 : constant Version_32 := 16#f616124c#;
   u00082 : constant Version_32 := 16#0255db5c#;
   u00083 : constant Version_32 := 16#15ce3f1b#;
   u00084 : constant Version_32 := 16#8ab10de5#;
   u00085 : constant Version_32 := 16#100b3ec7#;
   u00086 : constant Version_32 := 16#17c88cd6#;
   u00087 : constant Version_32 := 16#02eb80bf#;
   u00088 : constant Version_32 := 16#76b10c12#;
   u00089 : constant Version_32 := 16#ea3b65b2#;
   u00090 : constant Version_32 := 16#91b7530a#;
   u00091 : constant Version_32 := 16#a0c7e5f7#;
   u00092 : constant Version_32 := 16#294c3b74#;
   u00093 : constant Version_32 := 16#308125f5#;
   u00094 : constant Version_32 := 16#3131a464#;
   u00095 : constant Version_32 := 16#a978eee4#;
   u00096 : constant Version_32 := 16#5056e8dd#;
   u00097 : constant Version_32 := 16#de11c4c5#;
   u00098 : constant Version_32 := 16#fc8bbedf#;
   u00099 : constant Version_32 := 16#3205e75b#;
   u00100 : constant Version_32 := 16#b1525a65#;
   u00101 : constant Version_32 := 16#023700bd#;
   u00102 : constant Version_32 := 16#45fa9d27#;
   u00103 : constant Version_32 := 16#a1b7bc04#;
   u00104 : constant Version_32 := 16#c11aa62e#;
   u00105 : constant Version_32 := 16#dcab49c0#;
   u00106 : constant Version_32 := 16#daba2cb1#;
   u00107 : constant Version_32 := 16#e6e46743#;

   pragma Export (C, u00001, "lab2B");
   pragma Export (C, u00002, "system__standard_libraryB");
   pragma Export (C, u00003, "system__standard_libraryS");
   pragma Export (C, u00004, "adaS");
   pragma Export (C, u00005, "ada__integer_text_ioB");
   pragma Export (C, u00006, "ada__integer_text_ioS");
   pragma Export (C, u00007, "ada__exceptionsB");
   pragma Export (C, u00008, "ada__exceptionsS");
   pragma Export (C, u00009, "ada__exceptions__last_chance_handlerB");
   pragma Export (C, u00010, "ada__exceptions__last_chance_handlerS");
   pragma Export (C, u00011, "systemS");
   pragma Export (C, u00012, "system__soft_linksB");
   pragma Export (C, u00013, "system__soft_linksS");
   pragma Export (C, u00014, "system__parametersB");
   pragma Export (C, u00015, "system__parametersS");
   pragma Export (C, u00016, "system__secondary_stackB");
   pragma Export (C, u00017, "system__secondary_stackS");
   pragma Export (C, u00018, "system__storage_elementsB");
   pragma Export (C, u00019, "system__storage_elementsS");
   pragma Export (C, u00020, "system__stack_checkingB");
   pragma Export (C, u00021, "system__stack_checkingS");
   pragma Export (C, u00022, "system__exception_tableB");
   pragma Export (C, u00023, "system__exception_tableS");
   pragma Export (C, u00024, "system__htableB");
   pragma Export (C, u00025, "system__htableS");
   pragma Export (C, u00026, "system__exceptionsB");
   pragma Export (C, u00027, "system__exceptionsS");
   pragma Export (C, u00028, "system__string_opsB");
   pragma Export (C, u00029, "system__string_opsS");
   pragma Export (C, u00030, "system__string_ops_concat_3B");
   pragma Export (C, u00031, "system__string_ops_concat_3S");
   pragma Export (C, u00032, "system__tracebackB");
   pragma Export (C, u00033, "system__tracebackS");
   pragma Export (C, u00034, "system__unsigned_typesS");
   pragma Export (C, u00035, "system__wch_conB");
   pragma Export (C, u00036, "system__wch_conS");
   pragma Export (C, u00037, "system__wch_stwB");
   pragma Export (C, u00038, "system__wch_stwS");
   pragma Export (C, u00039, "system__wch_cnvB");
   pragma Export (C, u00040, "system__wch_cnvS");
   pragma Export (C, u00041, "interfacesS");
   pragma Export (C, u00042, "system__wch_jisB");
   pragma Export (C, u00043, "system__wch_jisS");
   pragma Export (C, u00044, "system__traceback_entriesB");
   pragma Export (C, u00045, "system__traceback_entriesS");
   pragma Export (C, u00046, "ada__text_ioB");
   pragma Export (C, u00047, "ada__text_ioS");
   pragma Export (C, u00048, "ada__streamsS");
   pragma Export (C, u00049, "ada__tagsB");
   pragma Export (C, u00050, "ada__tagsS");
   pragma Export (C, u00051, "system__val_unsB");
   pragma Export (C, u00052, "system__val_unsS");
   pragma Export (C, u00053, "system__val_utilB");
   pragma Export (C, u00054, "system__val_utilS");
   pragma Export (C, u00055, "system__case_utilB");
   pragma Export (C, u00056, "system__case_utilS");
   pragma Export (C, u00057, "interfaces__c_streamsB");
   pragma Export (C, u00058, "interfaces__c_streamsS");
   pragma Export (C, u00059, "system__crtlS");
   pragma Export (C, u00060, "system__file_ioB");
   pragma Export (C, u00061, "system__file_ioS");
   pragma Export (C, u00062, "ada__finalizationB");
   pragma Export (C, u00063, "ada__finalizationS");
   pragma Export (C, u00064, "system__finalization_rootB");
   pragma Export (C, u00065, "system__finalization_rootS");
   pragma Export (C, u00066, "system__finalization_implementationB");
   pragma Export (C, u00067, "system__finalization_implementationS");
   pragma Export (C, u00068, "system__restrictionsB");
   pragma Export (C, u00069, "system__restrictionsS");
   pragma Export (C, u00070, "system__stream_attributesB");
   pragma Export (C, u00071, "system__stream_attributesS");
   pragma Export (C, u00072, "ada__io_exceptionsS");
   pragma Export (C, u00073, "system__file_control_blockS");
   pragma Export (C, u00074, "ada__finalization__list_controllerB");
   pragma Export (C, u00075, "ada__finalization__list_controllerS");
   pragma Export (C, u00076, "ada__text_io__integer_auxB");
   pragma Export (C, u00077, "ada__text_io__integer_auxS");
   pragma Export (C, u00078, "ada__text_io__generic_auxB");
   pragma Export (C, u00079, "ada__text_io__generic_auxS");
   pragma Export (C, u00080, "system__img_biuB");
   pragma Export (C, u00081, "system__img_biuS");
   pragma Export (C, u00082, "system__img_intB");
   pragma Export (C, u00083, "system__img_intS");
   pragma Export (C, u00084, "system__img_llbB");
   pragma Export (C, u00085, "system__img_llbS");
   pragma Export (C, u00086, "system__img_lliB");
   pragma Export (C, u00087, "system__img_lliS");
   pragma Export (C, u00088, "system__img_llwB");
   pragma Export (C, u00089, "system__img_llwS");
   pragma Export (C, u00090, "system__img_wiuB");
   pragma Export (C, u00091, "system__img_wiuS");
   pragma Export (C, u00092, "system__val_intB");
   pragma Export (C, u00093, "system__val_intS");
   pragma Export (C, u00094, "system__val_lliB");
   pragma Export (C, u00095, "system__val_lliS");
   pragma Export (C, u00096, "system__val_lluB");
   pragma Export (C, u00097, "system__val_lluS");
   pragma Export (C, u00098, "moduleB");
   pragma Export (C, u00099, "moduleS");
   pragma Export (C, u00100, "module__f2B");
   pragma Export (C, u00101, "module__f2S");
   pragma Export (C, u00102, "module__f2__f3B");
   pragma Export (C, u00103, "module__f2__f3S");
   pragma Export (C, u00104, "module__f2__fioB");
   pragma Export (C, u00105, "module__f2__fioS");
   pragma Export (C, u00106, "system__memoryB");
   pragma Export (C, u00107, "system__memoryS");

   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  interfaces%s
   --  system%s
   --  system.case_util%s
   --  system.case_util%b
   --  system.htable%s
   --  system.htable%b
   --  system.img_int%s
   --  system.img_int%b
   --  system.img_lli%s
   --  system.img_lli%b
   --  system.parameters%s
   --  system.parameters%b
   --  system.crtl%s
   --  interfaces.c_streams%s
   --  interfaces.c_streams%b
   --  system.restrictions%s
   --  system.restrictions%b
   --  system.standard_library%s
   --  system.exceptions%s
   --  system.exceptions%b
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.secondary_stack%s
   --  system.stack_checking%s
   --  system.stack_checking%b
   --  system.string_ops%s
   --  system.string_ops%b
   --  system.string_ops_concat_3%s
   --  system.string_ops_concat_3%b
   --  system.traceback%s
   --  system.traceback%b
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  ada.exceptions%s
   --  ada.exceptions.last_chance_handler%s
   --  system.soft_links%s
   --  system.soft_links%b
   --  ada.exceptions.last_chance_handler%b
   --  system.secondary_stack%b
   --  system.exception_table%s
   --  system.exception_table%b
   --  ada.io_exceptions%s
   --  ada.tags%s
   --  ada.streams%s
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  system.memory%s
   --  system.memory%b
   --  system.standard_library%b
   --  system.unsigned_types%s
   --  system.img_biu%s
   --  system.img_biu%b
   --  system.img_llb%s
   --  system.img_llb%b
   --  system.img_llw%s
   --  system.img_llw%b
   --  system.img_wiu%s
   --  system.img_wiu%b
   --  system.stream_attributes%s
   --  system.stream_attributes%b
   --  system.finalization_implementation%s
   --  system.finalization_implementation%b
   --  ada.finalization%s
   --  ada.finalization%b
   --  ada.finalization.list_controller%s
   --  ada.finalization.list_controller%b
   --  system.file_control_block%s
   --  system.file_io%s
   --  system.file_io%b
   --  system.val_int%s
   --  system.val_lli%s
   --  system.val_llu%s
   --  system.val_uns%s
   --  system.val_util%s
   --  system.val_util%b
   --  system.val_uns%b
   --  system.val_llu%b
   --  system.val_lli%b
   --  system.val_int%b
   --  system.wch_con%s
   --  system.wch_con%b
   --  system.wch_cnv%s
   --  system.wch_jis%s
   --  system.wch_jis%b
   --  system.wch_cnv%b
   --  system.wch_stw%s
   --  system.wch_stw%b
   --  ada.tags%b
   --  ada.exceptions%b
   --  ada.text_io%s
   --  ada.text_io%b
   --  ada.text_io.generic_aux%s
   --  ada.text_io.generic_aux%b
   --  ada.text_io.integer_aux%s
   --  ada.text_io.integer_aux%b
   --  ada.integer_text_io%s
   --  ada.integer_text_io%b
   --  module%s
   --  module%b
   --  module.f2%s
   --  module.f2%b
   --  module.f2.f3%s
   --  module.f2.f3%b
   --  module.f2.fio%s
   --  module.f2.fio%b
   --  lab2%b
   --  END ELABORATION ORDER

end ada_main;
