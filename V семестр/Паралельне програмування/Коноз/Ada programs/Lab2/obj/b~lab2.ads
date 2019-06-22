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
                    "GNAT Version: GPL 2014 (20140331)" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_lab2" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure adafinal;
   pragma Export (C, adafinal, "adafinal");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#66e0b5d0#;
   pragma Export (C, u00001, "lab2B");
   u00002 : constant Version_32 := 16#fbff4c67#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#5c291747#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#3ffc8e18#;
   pragma Export (C, u00004, "adaS");
   u00005 : constant Version_32 := 16#7bf4f215#;
   pragma Export (C, u00005, "ada__calendar__delaysB");
   u00006 : constant Version_32 := 16#474dd4b1#;
   pragma Export (C, u00006, "ada__calendar__delaysS");
   u00007 : constant Version_32 := 16#65712768#;
   pragma Export (C, u00007, "ada__calendarB");
   u00008 : constant Version_32 := 16#e791e294#;
   pragma Export (C, u00008, "ada__calendarS");
   u00009 : constant Version_32 := 16#eaff8cdc#;
   pragma Export (C, u00009, "ada__exceptionsB");
   u00010 : constant Version_32 := 16#6a2091f5#;
   pragma Export (C, u00010, "ada__exceptionsS");
   u00011 : constant Version_32 := 16#032105bb#;
   pragma Export (C, u00011, "ada__exceptions__last_chance_handlerB");
   u00012 : constant Version_32 := 16#2b293877#;
   pragma Export (C, u00012, "ada__exceptions__last_chance_handlerS");
   u00013 : constant Version_32 := 16#5fc8ae56#;
   pragma Export (C, u00013, "systemS");
   u00014 : constant Version_32 := 16#daf76b33#;
   pragma Export (C, u00014, "system__soft_linksB");
   u00015 : constant Version_32 := 16#1517cb64#;
   pragma Export (C, u00015, "system__soft_linksS");
   u00016 : constant Version_32 := 16#c8ed38da#;
   pragma Export (C, u00016, "system__parametersB");
   u00017 : constant Version_32 := 16#591236e4#;
   pragma Export (C, u00017, "system__parametersS");
   u00018 : constant Version_32 := 16#c96bf39e#;
   pragma Export (C, u00018, "system__secondary_stackB");
   u00019 : constant Version_32 := 16#f4a9613f#;
   pragma Export (C, u00019, "system__secondary_stackS");
   u00020 : constant Version_32 := 16#39a03df9#;
   pragma Export (C, u00020, "system__storage_elementsB");
   u00021 : constant Version_32 := 16#720be452#;
   pragma Export (C, u00021, "system__storage_elementsS");
   u00022 : constant Version_32 := 16#41837d1e#;
   pragma Export (C, u00022, "system__stack_checkingB");
   u00023 : constant Version_32 := 16#d177c5be#;
   pragma Export (C, u00023, "system__stack_checkingS");
   u00024 : constant Version_32 := 16#393398c1#;
   pragma Export (C, u00024, "system__exception_tableB");
   u00025 : constant Version_32 := 16#f1d1c843#;
   pragma Export (C, u00025, "system__exception_tableS");
   u00026 : constant Version_32 := 16#ce4af020#;
   pragma Export (C, u00026, "system__exceptionsB");
   u00027 : constant Version_32 := 16#37abc3a0#;
   pragma Export (C, u00027, "system__exceptionsS");
   u00028 : constant Version_32 := 16#2652ec14#;
   pragma Export (C, u00028, "system__exceptions__machineS");
   u00029 : constant Version_32 := 16#b895431d#;
   pragma Export (C, u00029, "system__exceptions_debugB");
   u00030 : constant Version_32 := 16#ec2ab7e8#;
   pragma Export (C, u00030, "system__exceptions_debugS");
   u00031 : constant Version_32 := 16#570325c8#;
   pragma Export (C, u00031, "system__img_intB");
   u00032 : constant Version_32 := 16#5d134e94#;
   pragma Export (C, u00032, "system__img_intS");
   u00033 : constant Version_32 := 16#ff5c7695#;
   pragma Export (C, u00033, "system__tracebackB");
   u00034 : constant Version_32 := 16#77cc310b#;
   pragma Export (C, u00034, "system__tracebackS");
   u00035 : constant Version_32 := 16#8c33a517#;
   pragma Export (C, u00035, "system__wch_conB");
   u00036 : constant Version_32 := 16#44b58c84#;
   pragma Export (C, u00036, "system__wch_conS");
   u00037 : constant Version_32 := 16#9721e840#;
   pragma Export (C, u00037, "system__wch_stwB");
   u00038 : constant Version_32 := 16#69a4a085#;
   pragma Export (C, u00038, "system__wch_stwS");
   u00039 : constant Version_32 := 16#9b29844d#;
   pragma Export (C, u00039, "system__wch_cnvB");
   u00040 : constant Version_32 := 16#4b023677#;
   pragma Export (C, u00040, "system__wch_cnvS");
   u00041 : constant Version_32 := 16#69adb1b9#;
   pragma Export (C, u00041, "interfacesS");
   u00042 : constant Version_32 := 16#ece6fdb6#;
   pragma Export (C, u00042, "system__wch_jisB");
   u00043 : constant Version_32 := 16#cb722f56#;
   pragma Export (C, u00043, "system__wch_jisS");
   u00044 : constant Version_32 := 16#8cb17bcd#;
   pragma Export (C, u00044, "system__traceback_entriesB");
   u00045 : constant Version_32 := 16#ead9cec4#;
   pragma Export (C, u00045, "system__traceback_entriesS");
   u00046 : constant Version_32 := 16#769e25e6#;
   pragma Export (C, u00046, "interfaces__cB");
   u00047 : constant Version_32 := 16#3b563890#;
   pragma Export (C, u00047, "interfaces__cS");
   u00048 : constant Version_32 := 16#d950d226#;
   pragma Export (C, u00048, "system__os_primitivesB");
   u00049 : constant Version_32 := 16#ef19227f#;
   pragma Export (C, u00049, "system__os_primitivesS");
   u00050 : constant Version_32 := 16#0881bbf8#;
   pragma Export (C, u00050, "system__task_lockB");
   u00051 : constant Version_32 := 16#3e429938#;
   pragma Export (C, u00051, "system__task_lockS");
   u00052 : constant Version_32 := 16#bc10dd48#;
   pragma Export (C, u00052, "system__win32S");
   u00053 : constant Version_32 := 16#1a9147da#;
   pragma Export (C, u00053, "system__win32__extS");
   u00054 : constant Version_32 := 16#ee80728a#;
   pragma Export (C, u00054, "system__tracesB");
   u00055 : constant Version_32 := 16#add5c6fc#;
   pragma Export (C, u00055, "system__tracesS");
   u00056 : constant Version_32 := 16#f64b89a4#;
   pragma Export (C, u00056, "ada__integer_text_ioB");
   u00057 : constant Version_32 := 16#f1daf268#;
   pragma Export (C, u00057, "ada__integer_text_ioS");
   u00058 : constant Version_32 := 16#1ac8b3b4#;
   pragma Export (C, u00058, "ada__text_ioB");
   u00059 : constant Version_32 := 16#ba9eea88#;
   pragma Export (C, u00059, "ada__text_ioS");
   u00060 : constant Version_32 := 16#1b5643e2#;
   pragma Export (C, u00060, "ada__streamsB");
   u00061 : constant Version_32 := 16#2564c958#;
   pragma Export (C, u00061, "ada__streamsS");
   u00062 : constant Version_32 := 16#db5c917c#;
   pragma Export (C, u00062, "ada__io_exceptionsS");
   u00063 : constant Version_32 := 16#034d7998#;
   pragma Export (C, u00063, "ada__tagsB");
   u00064 : constant Version_32 := 16#ce72c228#;
   pragma Export (C, u00064, "ada__tagsS");
   u00065 : constant Version_32 := 16#c3335bfd#;
   pragma Export (C, u00065, "system__htableB");
   u00066 : constant Version_32 := 16#db0a1dbc#;
   pragma Export (C, u00066, "system__htableS");
   u00067 : constant Version_32 := 16#089f5cd0#;
   pragma Export (C, u00067, "system__string_hashB");
   u00068 : constant Version_32 := 16#795476c2#;
   pragma Export (C, u00068, "system__string_hashS");
   u00069 : constant Version_32 := 16#0ece3cf9#;
   pragma Export (C, u00069, "system__unsigned_typesS");
   u00070 : constant Version_32 := 16#4266b2a8#;
   pragma Export (C, u00070, "system__val_unsB");
   u00071 : constant Version_32 := 16#1e66d1c2#;
   pragma Export (C, u00071, "system__val_unsS");
   u00072 : constant Version_32 := 16#27b600b2#;
   pragma Export (C, u00072, "system__val_utilB");
   u00073 : constant Version_32 := 16#f36818a8#;
   pragma Export (C, u00073, "system__val_utilS");
   u00074 : constant Version_32 := 16#d1060688#;
   pragma Export (C, u00074, "system__case_utilB");
   u00075 : constant Version_32 := 16#7bc1c781#;
   pragma Export (C, u00075, "system__case_utilS");
   u00076 : constant Version_32 := 16#9f23726e#;
   pragma Export (C, u00076, "interfaces__c_streamsB");
   u00077 : constant Version_32 := 16#bb1012c3#;
   pragma Export (C, u00077, "interfaces__c_streamsS");
   u00078 : constant Version_32 := 16#75131373#;
   pragma Export (C, u00078, "system__crtlS");
   u00079 : constant Version_32 := 16#967994fc#;
   pragma Export (C, u00079, "system__file_ioB");
   u00080 : constant Version_32 := 16#e3384250#;
   pragma Export (C, u00080, "system__file_ioS");
   u00081 : constant Version_32 := 16#b7ab275c#;
   pragma Export (C, u00081, "ada__finalizationB");
   u00082 : constant Version_32 := 16#19f764ca#;
   pragma Export (C, u00082, "ada__finalizationS");
   u00083 : constant Version_32 := 16#95817ed8#;
   pragma Export (C, u00083, "system__finalization_rootB");
   u00084 : constant Version_32 := 16#103addc6#;
   pragma Export (C, u00084, "system__finalization_rootS");
   u00085 : constant Version_32 := 16#d0432c8d#;
   pragma Export (C, u00085, "system__img_enum_newB");
   u00086 : constant Version_32 := 16#3e84a896#;
   pragma Export (C, u00086, "system__img_enum_newS");
   u00087 : constant Version_32 := 16#a25be73b#;
   pragma Export (C, u00087, "system__os_libB");
   u00088 : constant Version_32 := 16#94c13856#;
   pragma Export (C, u00088, "system__os_libS");
   u00089 : constant Version_32 := 16#1a817b8e#;
   pragma Export (C, u00089, "system__stringsB");
   u00090 : constant Version_32 := 16#2177bf30#;
   pragma Export (C, u00090, "system__stringsS");
   u00091 : constant Version_32 := 16#906f0f88#;
   pragma Export (C, u00091, "system__file_control_blockS");
   u00092 : constant Version_32 := 16#a4371844#;
   pragma Export (C, u00092, "system__finalization_mastersB");
   u00093 : constant Version_32 := 16#2bde8716#;
   pragma Export (C, u00093, "system__finalization_mastersS");
   u00094 : constant Version_32 := 16#57a37a42#;
   pragma Export (C, u00094, "system__address_imageB");
   u00095 : constant Version_32 := 16#fe24336c#;
   pragma Export (C, u00095, "system__address_imageS");
   u00096 : constant Version_32 := 16#7268f812#;
   pragma Export (C, u00096, "system__img_boolB");
   u00097 : constant Version_32 := 16#aa11dfbd#;
   pragma Export (C, u00097, "system__img_boolS");
   u00098 : constant Version_32 := 16#d7aac20c#;
   pragma Export (C, u00098, "system__ioB");
   u00099 : constant Version_32 := 16#c18a5919#;
   pragma Export (C, u00099, "system__ioS");
   u00100 : constant Version_32 := 16#6d4d969a#;
   pragma Export (C, u00100, "system__storage_poolsB");
   u00101 : constant Version_32 := 16#aa9329d2#;
   pragma Export (C, u00101, "system__storage_poolsS");
   u00102 : constant Version_32 := 16#e34550ca#;
   pragma Export (C, u00102, "system__pool_globalB");
   u00103 : constant Version_32 := 16#c88d2d16#;
   pragma Export (C, u00103, "system__pool_globalS");
   u00104 : constant Version_32 := 16#3a4ba6c3#;
   pragma Export (C, u00104, "system__memoryB");
   u00105 : constant Version_32 := 16#06b5c862#;
   pragma Export (C, u00105, "system__memoryS");
   u00106 : constant Version_32 := 16#7b002481#;
   pragma Export (C, u00106, "system__storage_pools__subpoolsB");
   u00107 : constant Version_32 := 16#e3b008dc#;
   pragma Export (C, u00107, "system__storage_pools__subpoolsS");
   u00108 : constant Version_32 := 16#63f11652#;
   pragma Export (C, u00108, "system__storage_pools__subpools__finalizationB");
   u00109 : constant Version_32 := 16#fe2f4b3a#;
   pragma Export (C, u00109, "system__storage_pools__subpools__finalizationS");
   u00110 : constant Version_32 := 16#f6fdca1c#;
   pragma Export (C, u00110, "ada__text_io__integer_auxB");
   u00111 : constant Version_32 := 16#b9793d30#;
   pragma Export (C, u00111, "ada__text_io__integer_auxS");
   u00112 : constant Version_32 := 16#e0da2b08#;
   pragma Export (C, u00112, "ada__text_io__generic_auxB");
   u00113 : constant Version_32 := 16#a6c327d3#;
   pragma Export (C, u00113, "ada__text_io__generic_auxS");
   u00114 : constant Version_32 := 16#d48b4eeb#;
   pragma Export (C, u00114, "system__img_biuB");
   u00115 : constant Version_32 := 16#c8ecb4b4#;
   pragma Export (C, u00115, "system__img_biuS");
   u00116 : constant Version_32 := 16#2b864520#;
   pragma Export (C, u00116, "system__img_llbB");
   u00117 : constant Version_32 := 16#892ba44a#;
   pragma Export (C, u00117, "system__img_llbS");
   u00118 : constant Version_32 := 16#9777733a#;
   pragma Export (C, u00118, "system__img_lliB");
   u00119 : constant Version_32 := 16#4e87fb87#;
   pragma Export (C, u00119, "system__img_lliS");
   u00120 : constant Version_32 := 16#c2d63ebb#;
   pragma Export (C, u00120, "system__img_llwB");
   u00121 : constant Version_32 := 16#204787dc#;
   pragma Export (C, u00121, "system__img_llwS");
   u00122 : constant Version_32 := 16#8ed53197#;
   pragma Export (C, u00122, "system__img_wiuB");
   u00123 : constant Version_32 := 16#a6ad3326#;
   pragma Export (C, u00123, "system__img_wiuS");
   u00124 : constant Version_32 := 16#f8f38c17#;
   pragma Export (C, u00124, "system__val_intB");
   u00125 : constant Version_32 := 16#176d8469#;
   pragma Export (C, u00125, "system__val_intS");
   u00126 : constant Version_32 := 16#e892b88e#;
   pragma Export (C, u00126, "system__val_lliB");
   u00127 : constant Version_32 := 16#c5ec48f6#;
   pragma Export (C, u00127, "system__val_lliS");
   u00128 : constant Version_32 := 16#1e25d3f1#;
   pragma Export (C, u00128, "system__val_lluB");
   u00129 : constant Version_32 := 16#743c6b8b#;
   pragma Export (C, u00129, "system__val_lluS");
   u00130 : constant Version_32 := 16#4eafb909#;
   pragma Export (C, u00130, "ada__real_timeB");
   u00131 : constant Version_32 := 16#41de19c7#;
   pragma Export (C, u00131, "ada__real_timeS");
   u00132 : constant Version_32 := 16#1607bce4#;
   pragma Export (C, u00132, "system__arith_64B");
   u00133 : constant Version_32 := 16#7628ba1d#;
   pragma Export (C, u00133, "system__arith_64S");
   u00134 : constant Version_32 := 16#20babadf#;
   pragma Export (C, u00134, "system__taskingB");
   u00135 : constant Version_32 := 16#36778bfd#;
   pragma Export (C, u00135, "system__taskingS");
   u00136 : constant Version_32 := 16#1da6a0d9#;
   pragma Export (C, u00136, "system__task_primitivesS");
   u00137 : constant Version_32 := 16#9d17a46c#;
   pragma Export (C, u00137, "system__os_interfaceS");
   u00138 : constant Version_32 := 16#877b0450#;
   pragma Export (C, u00138, "interfaces__c__stringsB");
   u00139 : constant Version_32 := 16#603c1c44#;
   pragma Export (C, u00139, "interfaces__c__stringsS");
   u00140 : constant Version_32 := 16#6c27b264#;
   pragma Export (C, u00140, "system__task_primitives__operationsB");
   u00141 : constant Version_32 := 16#d11d0a3c#;
   pragma Export (C, u00141, "system__task_primitives__operationsS");
   u00142 : constant Version_32 := 16#1b28662b#;
   pragma Export (C, u00142, "system__float_controlB");
   u00143 : constant Version_32 := 16#bf34ed6a#;
   pragma Export (C, u00143, "system__float_controlS");
   u00144 : constant Version_32 := 16#1826115c#;
   pragma Export (C, u00144, "system__interrupt_managementB");
   u00145 : constant Version_32 := 16#a0a25a36#;
   pragma Export (C, u00145, "system__interrupt_managementS");
   u00146 : constant Version_32 := 16#f65595cf#;
   pragma Export (C, u00146, "system__multiprocessorsB");
   u00147 : constant Version_32 := 16#67643125#;
   pragma Export (C, u00147, "system__multiprocessorsS");
   u00148 : constant Version_32 := 16#b5dc4d53#;
   pragma Export (C, u00148, "system__task_infoB");
   u00149 : constant Version_32 := 16#882ea7a1#;
   pragma Export (C, u00149, "system__task_infoS");
   u00150 : constant Version_32 := 16#13b33e5d#;
   pragma Export (C, u00150, "system__tasking__debugB");
   u00151 : constant Version_32 := 16#f32cb5c6#;
   pragma Export (C, u00151, "system__tasking__debugS");
   u00152 : constant Version_32 := 16#fd83e873#;
   pragma Export (C, u00152, "system__concat_2B");
   u00153 : constant Version_32 := 16#5d687986#;
   pragma Export (C, u00153, "system__concat_2S");
   u00154 : constant Version_32 := 16#2b70b149#;
   pragma Export (C, u00154, "system__concat_3B");
   u00155 : constant Version_32 := 16#54b8f2f3#;
   pragma Export (C, u00155, "system__concat_3S");
   u00156 : constant Version_32 := 16#a83b7c85#;
   pragma Export (C, u00156, "system__concat_6B");
   u00157 : constant Version_32 := 16#8d0f83e4#;
   pragma Export (C, u00157, "system__concat_6S");
   u00158 : constant Version_32 := 16#608e2cd1#;
   pragma Export (C, u00158, "system__concat_5B");
   u00159 : constant Version_32 := 16#d896ed78#;
   pragma Export (C, u00159, "system__concat_5S");
   u00160 : constant Version_32 := 16#932a4690#;
   pragma Export (C, u00160, "system__concat_4B");
   u00161 : constant Version_32 := 16#21ac8576#;
   pragma Export (C, u00161, "system__concat_4S");
   u00162 : constant Version_32 := 16#4bc4ed76#;
   pragma Export (C, u00162, "system__stack_usageB");
   u00163 : constant Version_32 := 16#09222097#;
   pragma Export (C, u00163, "system__stack_usageS");
   u00164 : constant Version_32 := 16#43ea2935#;
   pragma Export (C, u00164, "dataB");
   u00165 : constant Version_32 := 16#0b92d1db#;
   pragma Export (C, u00165, "dataS");
   u00166 : constant Version_32 := 16#ded60134#;
   pragma Export (C, u00166, "system__tasking__stagesB");
   u00167 : constant Version_32 := 16#4a36ba98#;
   pragma Export (C, u00167, "system__tasking__stagesS");
   u00168 : constant Version_32 := 16#100eaf58#;
   pragma Export (C, u00168, "system__restrictionsB");
   u00169 : constant Version_32 := 16#1344a388#;
   pragma Export (C, u00169, "system__restrictionsS");
   u00170 : constant Version_32 := 16#f0dca0fc#;
   pragma Export (C, u00170, "system__tasking__initializationB");
   u00171 : constant Version_32 := 16#f20398cb#;
   pragma Export (C, u00171, "system__tasking__initializationS");
   u00172 : constant Version_32 := 16#1d8f750b#;
   pragma Export (C, u00172, "system__soft_links__taskingB");
   u00173 : constant Version_32 := 16#e47ef8be#;
   pragma Export (C, u00173, "system__soft_links__taskingS");
   u00174 : constant Version_32 := 16#17d21067#;
   pragma Export (C, u00174, "ada__exceptions__is_null_occurrenceB");
   u00175 : constant Version_32 := 16#8b1b3b36#;
   pragma Export (C, u00175, "ada__exceptions__is_null_occurrenceS");
   u00176 : constant Version_32 := 16#cbb1adb5#;
   pragma Export (C, u00176, "system__tasking__queuingB");
   u00177 : constant Version_32 := 16#3d02e133#;
   pragma Export (C, u00177, "system__tasking__queuingS");
   u00178 : constant Version_32 := 16#21c37fe5#;
   pragma Export (C, u00178, "system__tasking__protected_objectsB");
   u00179 : constant Version_32 := 16#6fa056d1#;
   pragma Export (C, u00179, "system__tasking__protected_objectsS");
   u00180 : constant Version_32 := 16#61dc6741#;
   pragma Export (C, u00180, "system__tasking__protected_objects__entriesB");
   u00181 : constant Version_32 := 16#7671a6ef#;
   pragma Export (C, u00181, "system__tasking__protected_objects__entriesS");
   u00182 : constant Version_32 := 16#055106b8#;
   pragma Export (C, u00182, "system__tasking__rendezvousB");
   u00183 : constant Version_32 := 16#6c6c00bf#;
   pragma Export (C, u00183, "system__tasking__rendezvousS");
   u00184 : constant Version_32 := 16#8b31dbf8#;
   pragma Export (C, u00184, "system__tasking__entry_callsB");
   u00185 : constant Version_32 := 16#e5160f9e#;
   pragma Export (C, u00185, "system__tasking__entry_callsS");
   u00186 : constant Version_32 := 16#561f22c0#;
   pragma Export (C, u00186, "system__tasking__protected_objects__operationsB");
   u00187 : constant Version_32 := 16#fae24494#;
   pragma Export (C, u00187, "system__tasking__protected_objects__operationsS");
   u00188 : constant Version_32 := 16#a19fa84a#;
   pragma Export (C, u00188, "system__tasking__utilitiesB");
   u00189 : constant Version_32 := 16#35b8be73#;
   pragma Export (C, u00189, "system__tasking__utilitiesS");
   u00190 : constant Version_32 := 16#bd6fc52e#;
   pragma Export (C, u00190, "system__traces__taskingB");
   u00191 : constant Version_32 := 16#33a47127#;
   pragma Export (C, u00191, "system__traces__taskingS");
   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  interfaces%s
   --  system%s
   --  system.arith_64%s
   --  system.case_util%s
   --  system.case_util%b
   --  system.float_control%s
   --  system.float_control%b
   --  system.htable%s
   --  system.img_bool%s
   --  system.img_bool%b
   --  system.img_enum_new%s
   --  system.img_enum_new%b
   --  system.img_int%s
   --  system.img_int%b
   --  system.img_lli%s
   --  system.img_lli%b
   --  system.io%s
   --  system.io%b
   --  system.multiprocessors%s
   --  system.os_primitives%s
   --  system.parameters%s
   --  system.parameters%b
   --  system.crtl%s
   --  interfaces.c_streams%s
   --  interfaces.c_streams%b
   --  system.restrictions%s
   --  system.restrictions%b
   --  system.standard_library%s
   --  system.exceptions_debug%s
   --  system.exceptions_debug%b
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.stack_checking%s
   --  system.stack_checking%b
   --  system.stack_usage%s
   --  system.stack_usage%b
   --  system.string_hash%s
   --  system.string_hash%b
   --  system.htable%b
   --  system.strings%s
   --  system.strings%b
   --  system.os_lib%s
   --  system.task_lock%s
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  ada.exceptions%s
   --  system.arith_64%b
   --  ada.exceptions.is_null_occurrence%s
   --  ada.exceptions.is_null_occurrence%b
   --  system.soft_links%s
   --  system.task_lock%b
   --  system.traces%s
   --  system.traces%b
   --  system.unsigned_types%s
   --  system.img_biu%s
   --  system.img_biu%b
   --  system.img_llb%s
   --  system.img_llb%b
   --  system.img_llw%s
   --  system.img_llw%b
   --  system.img_wiu%s
   --  system.img_wiu%b
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
   --  ada.exceptions.last_chance_handler%s
   --  ada.exceptions.last_chance_handler%b
   --  system.address_image%s
   --  system.concat_2%s
   --  system.concat_2%b
   --  system.concat_3%s
   --  system.concat_3%b
   --  system.concat_4%s
   --  system.concat_4%b
   --  system.concat_5%s
   --  system.concat_5%b
   --  system.concat_6%s
   --  system.concat_6%b
   --  system.exception_table%s
   --  system.exception_table%b
   --  ada.io_exceptions%s
   --  ada.tags%s
   --  ada.streams%s
   --  ada.streams%b
   --  interfaces.c%s
   --  system.multiprocessors%b
   --  interfaces.c.strings%s
   --  system.exceptions%s
   --  system.exceptions%b
   --  system.exceptions.machine%s
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  ada.finalization%s
   --  ada.finalization%b
   --  system.storage_pools%s
   --  system.storage_pools%b
   --  system.finalization_masters%s
   --  system.storage_pools.subpools%s
   --  system.storage_pools.subpools.finalization%s
   --  system.storage_pools.subpools.finalization%b
   --  system.win32%s
   --  system.os_interface%s
   --  system.interrupt_management%s
   --  system.interrupt_management%b
   --  system.task_info%s
   --  system.task_info%b
   --  system.task_primitives%s
   --  system.tasking%s
   --  system.task_primitives.operations%s
   --  system.tasking%b
   --  system.tasking.debug%s
   --  system.traces.tasking%s
   --  system.traces.tasking%b
   --  system.win32.ext%s
   --  system.task_primitives.operations%b
   --  system.os_primitives%b
   --  ada.calendar%s
   --  ada.calendar%b
   --  ada.calendar.delays%s
   --  ada.calendar.delays%b
   --  system.memory%s
   --  system.memory%b
   --  system.standard_library%b
   --  system.pool_global%s
   --  system.pool_global%b
   --  system.file_control_block%s
   --  system.file_io%s
   --  system.secondary_stack%s
   --  system.file_io%b
   --  system.tasking.debug%b
   --  system.storage_pools.subpools%b
   --  system.finalization_masters%b
   --  interfaces.c.strings%b
   --  interfaces.c%b
   --  ada.tags%b
   --  system.soft_links%b
   --  system.os_lib%b
   --  system.secondary_stack%b
   --  system.address_image%b
   --  system.soft_links.tasking%s
   --  system.soft_links.tasking%b
   --  system.tasking.entry_calls%s
   --  system.tasking.initialization%s
   --  system.tasking.utilities%s
   --  system.traceback%s
   --  ada.exceptions%b
   --  system.traceback%b
   --  system.tasking.initialization%b
   --  ada.real_time%s
   --  ada.real_time%b
   --  ada.text_io%s
   --  ada.text_io%b
   --  ada.text_io.generic_aux%s
   --  ada.text_io.generic_aux%b
   --  ada.text_io.integer_aux%s
   --  ada.text_io.integer_aux%b
   --  ada.integer_text_io%s
   --  ada.integer_text_io%b
   --  system.tasking.protected_objects%s
   --  system.tasking.protected_objects%b
   --  system.tasking.protected_objects.entries%s
   --  system.tasking.protected_objects.entries%b
   --  system.tasking.queuing%s
   --  system.tasking.queuing%b
   --  system.tasking.utilities%b
   --  system.tasking.rendezvous%s
   --  system.tasking.protected_objects.operations%s
   --  system.tasking.protected_objects.operations%b
   --  system.tasking.rendezvous%b
   --  system.tasking.entry_calls%b
   --  system.tasking.stages%s
   --  system.tasking.stages%b
   --  data%s
   --  data%b
   --  lab2%b
   --  END ELABORATION ORDER


end ada_main;
