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
                    "GNAT Version: GPL 2009 (20090519)" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_lab2" & ASCII.NUL;
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
   u00001 : constant Version_32 := 16#b45d0c7e#;
   u00002 : constant Version_32 := 16#6385d640#;
   u00003 : constant Version_32 := 16#c332087d#;
   u00004 : constant Version_32 := 16#9c7dd3ea#;
   u00005 : constant Version_32 := 16#03bc737c#;
   u00006 : constant Version_32 := 16#614b54f8#;
   u00007 : constant Version_32 := 16#b63f3caa#;
   u00008 : constant Version_32 := 16#eea4b732#;
   u00009 : constant Version_32 := 16#ba011fb9#;
   u00010 : constant Version_32 := 16#e3d85f73#;
   u00011 : constant Version_32 := 16#0e6ea6c5#;
   u00012 : constant Version_32 := 16#63a35e59#;
   u00013 : constant Version_32 := 16#92dfa46e#;
   u00014 : constant Version_32 := 16#2ea84b20#;
   u00015 : constant Version_32 := 16#fd40f02c#;
   u00016 : constant Version_32 := 16#18c4823a#;
   u00017 : constant Version_32 := 16#78788d18#;
   u00018 : constant Version_32 := 16#bcda8803#;
   u00019 : constant Version_32 := 16#aabbdae3#;
   u00020 : constant Version_32 := 16#892f4d5b#;
   u00021 : constant Version_32 := 16#e2a4447e#;
   u00022 : constant Version_32 := 16#2f60aa04#;
   u00023 : constant Version_32 := 16#d9ad4092#;
   u00024 : constant Version_32 := 16#e43c4f3d#;
   u00025 : constant Version_32 := 16#56db7cfd#;
   u00026 : constant Version_32 := 16#ebfc0b85#;
   u00027 : constant Version_32 := 16#668b0bd3#;
   u00028 : constant Version_32 := 16#88c8686c#;
   u00029 : constant Version_32 := 16#4a31e901#;
   u00030 : constant Version_32 := 16#6997f8be#;
   u00031 : constant Version_32 := 16#8d294e8f#;
   u00032 : constant Version_32 := 16#ce975c20#;
   u00033 : constant Version_32 := 16#08a5f9f2#;
   u00034 : constant Version_32 := 16#3eaa2b04#;
   u00035 : constant Version_32 := 16#776b72d1#;
   u00036 : constant Version_32 := 16#badd64f5#;
   u00037 : constant Version_32 := 16#906233be#;
   u00038 : constant Version_32 := 16#954a6cef#;
   u00039 : constant Version_32 := 16#a69cad5c#;
   u00040 : constant Version_32 := 16#093802d2#;
   u00041 : constant Version_32 := 16#1dd92a55#;
   u00042 : constant Version_32 := 16#fe5e1c6e#;
   u00043 : constant Version_32 := 16#a80054a5#;
   u00044 : constant Version_32 := 16#0a7e05c0#;
   u00045 : constant Version_32 := 16#89667d4f#;
   u00046 : constant Version_32 := 16#647de85b#;
   u00047 : constant Version_32 := 16#2fa8111e#;
   u00048 : constant Version_32 := 16#0d0a8d0c#;
   u00049 : constant Version_32 := 16#5440dba9#;
   u00050 : constant Version_32 := 16#895f8c1e#;
   u00051 : constant Version_32 := 16#10ed8c5f#;
   u00052 : constant Version_32 := 16#4e66f673#;
   u00053 : constant Version_32 := 16#5d4e287b#;
   u00054 : constant Version_32 := 16#a8d17654#;
   u00055 : constant Version_32 := 16#62e56d2b#;
   u00056 : constant Version_32 := 16#ced5a363#;
   u00057 : constant Version_32 := 16#74e99aba#;
   u00058 : constant Version_32 := 16#f1de4b60#;
   u00059 : constant Version_32 := 16#2681d8be#;
   u00060 : constant Version_32 := 16#1a3a7ed3#;
   u00061 : constant Version_32 := 16#37a7e042#;
   u00062 : constant Version_32 := 16#6d0998e1#;
   u00063 : constant Version_32 := 16#7f2a6758#;
   u00064 : constant Version_32 := 16#a0a00019#;
   u00065 : constant Version_32 := 16#7fae2656#;
   u00066 : constant Version_32 := 16#293ff6f7#;
   u00067 : constant Version_32 := 16#00934dae#;
   u00068 : constant Version_32 := 16#2461b049#;
   u00069 : constant Version_32 := 16#0aa29e81#;
   u00070 : constant Version_32 := 16#2274d34a#;
   u00071 : constant Version_32 := 16#59507545#;
   u00072 : constant Version_32 := 16#e98c0dd7#;
   u00073 : constant Version_32 := 16#b9e451e5#;
   u00074 : constant Version_32 := 16#a0aa86d6#;
   u00075 : constant Version_32 := 16#cc47afb0#;
   u00076 : constant Version_32 := 16#c6d1a624#;
   u00077 : constant Version_32 := 16#d93d8ca1#;
   u00078 : constant Version_32 := 16#4be846ff#;
   u00079 : constant Version_32 := 16#e42a19e8#;
   u00080 : constant Version_32 := 16#6ffd7991#;
   u00081 : constant Version_32 := 16#d8af02ef#;
   u00082 : constant Version_32 := 16#b8ac4cbc#;
   u00083 : constant Version_32 := 16#2f3f02be#;
   u00084 : constant Version_32 := 16#d9f6bc78#;
   u00085 : constant Version_32 := 16#1acb98ae#;
   u00086 : constant Version_32 := 16#0255db5c#;
   u00087 : constant Version_32 := 16#f913b5f9#;
   u00088 : constant Version_32 := 16#8ab10de5#;
   u00089 : constant Version_32 := 16#fcd6b425#;
   u00090 : constant Version_32 := 16#17c88cd6#;
   u00091 : constant Version_32 := 16#ee360a5d#;
   u00092 : constant Version_32 := 16#76b10c12#;
   u00093 : constant Version_32 := 16#06e6ef50#;
   u00094 : constant Version_32 := 16#91b7530a#;
   u00095 : constant Version_32 := 16#4c1a6f15#;
   u00096 : constant Version_32 := 16#294c3b74#;
   u00097 : constant Version_32 := 16#dc5caf17#;
   u00098 : constant Version_32 := 16#3131a464#;
   u00099 : constant Version_32 := 16#45a56406#;
   u00100 : constant Version_32 := 16#5056e8dd#;
   u00101 : constant Version_32 := 16#32cc4e27#;
   u00102 : constant Version_32 := 16#95df2695#;
   u00103 : constant Version_32 := 16#64f2d59d#;
   u00104 : constant Version_32 := 16#706b7614#;
   u00105 : constant Version_32 := 16#499dbf2f#;
   u00106 : constant Version_32 := 16#2a264ea2#;
   u00107 : constant Version_32 := 16#a808a573#;
   u00108 : constant Version_32 := 16#54d99733#;
   u00109 : constant Version_32 := 16#33b44665#;
   u00110 : constant Version_32 := 16#bb852b1e#;
   u00111 : constant Version_32 := 16#c8eda076#;

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
   pragma Export (C, u00026, "system__string_hashB");
   pragma Export (C, u00027, "system__string_hashS");
   pragma Export (C, u00028, "system__exceptionsB");
   pragma Export (C, u00029, "system__exceptionsS");
   pragma Export (C, u00030, "system__tracebackB");
   pragma Export (C, u00031, "system__tracebackS");
   pragma Export (C, u00032, "system__unsigned_typesS");
   pragma Export (C, u00033, "system__wch_conB");
   pragma Export (C, u00034, "system__wch_conS");
   pragma Export (C, u00035, "system__wch_stwB");
   pragma Export (C, u00036, "system__wch_stwS");
   pragma Export (C, u00037, "system__wch_cnvB");
   pragma Export (C, u00038, "system__wch_cnvS");
   pragma Export (C, u00039, "interfacesS");
   pragma Export (C, u00040, "system__wch_jisB");
   pragma Export (C, u00041, "system__wch_jisS");
   pragma Export (C, u00042, "system__traceback_entriesB");
   pragma Export (C, u00043, "system__traceback_entriesS");
   pragma Export (C, u00044, "ada__tagsB");
   pragma Export (C, u00045, "ada__tagsS");
   pragma Export (C, u00046, "system__val_unsB");
   pragma Export (C, u00047, "system__val_unsS");
   pragma Export (C, u00048, "system__val_utilB");
   pragma Export (C, u00049, "system__val_utilS");
   pragma Export (C, u00050, "system__case_utilB");
   pragma Export (C, u00051, "system__case_utilS");
   pragma Export (C, u00052, "ada__text_ioB");
   pragma Export (C, u00053, "ada__text_ioS");
   pragma Export (C, u00054, "ada__streamsS");
   pragma Export (C, u00055, "interfaces__c_streamsB");
   pragma Export (C, u00056, "interfaces__c_streamsS");
   pragma Export (C, u00057, "system__crtlS");
   pragma Export (C, u00058, "system__file_ioB");
   pragma Export (C, u00059, "system__file_ioS");
   pragma Export (C, u00060, "ada__finalizationB");
   pragma Export (C, u00061, "ada__finalizationS");
   pragma Export (C, u00062, "system__finalization_rootB");
   pragma Export (C, u00063, "system__finalization_rootS");
   pragma Export (C, u00064, "system__finalization_implementationB");
   pragma Export (C, u00065, "system__finalization_implementationS");
   pragma Export (C, u00066, "system__restrictionsB");
   pragma Export (C, u00067, "system__restrictionsS");
   pragma Export (C, u00068, "system__stream_attributesB");
   pragma Export (C, u00069, "system__stream_attributesS");
   pragma Export (C, u00070, "ada__io_exceptionsS");
   pragma Export (C, u00071, "interfaces__cB");
   pragma Export (C, u00072, "interfaces__cS");
   pragma Export (C, u00073, "system__os_libB");
   pragma Export (C, u00074, "system__os_libS");
   pragma Export (C, u00075, "system__stringsB");
   pragma Export (C, u00076, "system__stringsS");
   pragma Export (C, u00077, "system__file_control_blockS");
   pragma Export (C, u00078, "ada__finalization__list_controllerB");
   pragma Export (C, u00079, "ada__finalization__list_controllerS");
   pragma Export (C, u00080, "ada__text_io__integer_auxB");
   pragma Export (C, u00081, "ada__text_io__integer_auxS");
   pragma Export (C, u00082, "ada__text_io__generic_auxB");
   pragma Export (C, u00083, "ada__text_io__generic_auxS");
   pragma Export (C, u00084, "system__img_biuB");
   pragma Export (C, u00085, "system__img_biuS");
   pragma Export (C, u00086, "system__img_intB");
   pragma Export (C, u00087, "system__img_intS");
   pragma Export (C, u00088, "system__img_llbB");
   pragma Export (C, u00089, "system__img_llbS");
   pragma Export (C, u00090, "system__img_lliB");
   pragma Export (C, u00091, "system__img_lliS");
   pragma Export (C, u00092, "system__img_llwB");
   pragma Export (C, u00093, "system__img_llwS");
   pragma Export (C, u00094, "system__img_wiuB");
   pragma Export (C, u00095, "system__img_wiuS");
   pragma Export (C, u00096, "system__val_intB");
   pragma Export (C, u00097, "system__val_intS");
   pragma Export (C, u00098, "system__val_lliB");
   pragma Export (C, u00099, "system__val_lliS");
   pragma Export (C, u00100, "system__val_lluB");
   pragma Export (C, u00101, "system__val_lluS");
   pragma Export (C, u00102, "vector_f1B");
   pragma Export (C, u00103, "vector_f1S");
   pragma Export (C, u00104, "vector_f1__matrix_f2B");
   pragma Export (C, u00105, "vector_f1__matrix_f2S");
   pragma Export (C, u00106, "vector_f1__matrix_f2__f3B");
   pragma Export (C, u00107, "vector_f1__matrix_f2__f3S");
   pragma Export (C, u00108, "vector_f1__matrix_f2__ioB");
   pragma Export (C, u00109, "vector_f1__matrix_f2__ioS");
   pragma Export (C, u00110, "system__memoryB");
   pragma Export (C, u00111, "system__memoryS");

   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  interfaces%s
   --  system%s
   --  system.case_util%s
   --  system.case_util%b
   --  system.htable%s
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
   --  system.string_hash%s
   --  system.string_hash%b
   --  system.htable%b
   --  system.strings%s
   --  system.strings%b
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
   --  interfaces.c%s
   --  interfaces.c%b
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  system.memory%s
   --  system.memory%b
   --  system.standard_library%b
   --  system.os_lib%s
   --  system.os_lib%b
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
   --  vector_f1%s
   --  vector_f1%b
   --  vector_f1.matrix_f2%s
   --  vector_f1.matrix_f2%b
   --  vector_f1.matrix_f2.f3%s
   --  vector_f1.matrix_f2.f3%b
   --  vector_f1.matrix_f2.io%s
   --  vector_f1.matrix_f2.io%b
   --  lab2%b
   --  END ELABORATION ORDER

end ada_main;
