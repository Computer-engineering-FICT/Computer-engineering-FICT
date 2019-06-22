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
                    "GNAT Version: GPL 2015 (20150428-49)" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_lab5" & ASCII.NUL;
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
   u00001 : constant Version_32 := 16#89977c5b#;
   pragma Export (C, u00001, "lab5B");
   u00002 : constant Version_32 := 16#fbff4c67#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#f72f352b#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#3ffc8e18#;
   pragma Export (C, u00004, "adaS");
   u00005 : constant Version_32 := 16#b612ca65#;
   pragma Export (C, u00005, "ada__exceptionsB");
   u00006 : constant Version_32 := 16#1d190453#;
   pragma Export (C, u00006, "ada__exceptionsS");
   u00007 : constant Version_32 := 16#a46739c0#;
   pragma Export (C, u00007, "ada__exceptions__last_chance_handlerB");
   u00008 : constant Version_32 := 16#3aac8c92#;
   pragma Export (C, u00008, "ada__exceptions__last_chance_handlerS");
   u00009 : constant Version_32 := 16#f4ce8c3a#;
   pragma Export (C, u00009, "systemS");
   u00010 : constant Version_32 := 16#a207fefe#;
   pragma Export (C, u00010, "system__soft_linksB");
   u00011 : constant Version_32 := 16#af945ded#;
   pragma Export (C, u00011, "system__soft_linksS");
   u00012 : constant Version_32 := 16#b01dad17#;
   pragma Export (C, u00012, "system__parametersB");
   u00013 : constant Version_32 := 16#8ae48145#;
   pragma Export (C, u00013, "system__parametersS");
   u00014 : constant Version_32 := 16#b19b6653#;
   pragma Export (C, u00014, "system__secondary_stackB");
   u00015 : constant Version_32 := 16#5faf4353#;
   pragma Export (C, u00015, "system__secondary_stackS");
   u00016 : constant Version_32 := 16#39a03df9#;
   pragma Export (C, u00016, "system__storage_elementsB");
   u00017 : constant Version_32 := 16#d90dc63e#;
   pragma Export (C, u00017, "system__storage_elementsS");
   u00018 : constant Version_32 := 16#41837d1e#;
   pragma Export (C, u00018, "system__stack_checkingB");
   u00019 : constant Version_32 := 16#7a71e7d2#;
   pragma Export (C, u00019, "system__stack_checkingS");
   u00020 : constant Version_32 := 16#393398c1#;
   pragma Export (C, u00020, "system__exception_tableB");
   u00021 : constant Version_32 := 16#5ad7ea2f#;
   pragma Export (C, u00021, "system__exception_tableS");
   u00022 : constant Version_32 := 16#ce4af020#;
   pragma Export (C, u00022, "system__exceptionsB");
   u00023 : constant Version_32 := 16#9cade1cc#;
   pragma Export (C, u00023, "system__exceptionsS");
   u00024 : constant Version_32 := 16#37d758f1#;
   pragma Export (C, u00024, "system__exceptions__machineS");
   u00025 : constant Version_32 := 16#b895431d#;
   pragma Export (C, u00025, "system__exceptions_debugB");
   u00026 : constant Version_32 := 16#472c9584#;
   pragma Export (C, u00026, "system__exceptions_debugS");
   u00027 : constant Version_32 := 16#570325c8#;
   pragma Export (C, u00027, "system__img_intB");
   u00028 : constant Version_32 := 16#f6156cf8#;
   pragma Export (C, u00028, "system__img_intS");
   u00029 : constant Version_32 := 16#b98c3e16#;
   pragma Export (C, u00029, "system__tracebackB");
   u00030 : constant Version_32 := 16#6af355e1#;
   pragma Export (C, u00030, "system__tracebackS");
   u00031 : constant Version_32 := 16#9ed49525#;
   pragma Export (C, u00031, "system__traceback_entriesB");
   u00032 : constant Version_32 := 16#f4957a4a#;
   pragma Export (C, u00032, "system__traceback_entriesS");
   u00033 : constant Version_32 := 16#8c33a517#;
   pragma Export (C, u00033, "system__wch_conB");
   u00034 : constant Version_32 := 16#efb3aee8#;
   pragma Export (C, u00034, "system__wch_conS");
   u00035 : constant Version_32 := 16#9721e840#;
   pragma Export (C, u00035, "system__wch_stwB");
   u00036 : constant Version_32 := 16#c2a282e9#;
   pragma Export (C, u00036, "system__wch_stwS");
   u00037 : constant Version_32 := 16#92b797cb#;
   pragma Export (C, u00037, "system__wch_cnvB");
   u00038 : constant Version_32 := 16#e004141b#;
   pragma Export (C, u00038, "system__wch_cnvS");
   u00039 : constant Version_32 := 16#6033a23f#;
   pragma Export (C, u00039, "interfacesS");
   u00040 : constant Version_32 := 16#ece6fdb6#;
   pragma Export (C, u00040, "system__wch_jisB");
   u00041 : constant Version_32 := 16#60740d3a#;
   pragma Export (C, u00041, "system__wch_jisS");
   u00042 : constant Version_32 := 16#f64b89a4#;
   pragma Export (C, u00042, "ada__integer_text_ioB");
   u00043 : constant Version_32 := 16#f1daf268#;
   pragma Export (C, u00043, "ada__integer_text_ioS");
   u00044 : constant Version_32 := 16#28f088c2#;
   pragma Export (C, u00044, "ada__text_ioB");
   u00045 : constant Version_32 := 16#1a9b0017#;
   pragma Export (C, u00045, "ada__text_ioS");
   u00046 : constant Version_32 := 16#10558b11#;
   pragma Export (C, u00046, "ada__streamsB");
   u00047 : constant Version_32 := 16#2e6701ab#;
   pragma Export (C, u00047, "ada__streamsS");
   u00048 : constant Version_32 := 16#db5c917c#;
   pragma Export (C, u00048, "ada__io_exceptionsS");
   u00049 : constant Version_32 := 16#12c8cd7d#;
   pragma Export (C, u00049, "ada__tagsB");
   u00050 : constant Version_32 := 16#ce72c228#;
   pragma Export (C, u00050, "ada__tagsS");
   u00051 : constant Version_32 := 16#c3335bfd#;
   pragma Export (C, u00051, "system__htableB");
   u00052 : constant Version_32 := 16#700c3fd0#;
   pragma Export (C, u00052, "system__htableS");
   u00053 : constant Version_32 := 16#089f5cd0#;
   pragma Export (C, u00053, "system__string_hashB");
   u00054 : constant Version_32 := 16#d25254ae#;
   pragma Export (C, u00054, "system__string_hashS");
   u00055 : constant Version_32 := 16#699628fa#;
   pragma Export (C, u00055, "system__unsigned_typesS");
   u00056 : constant Version_32 := 16#b44f9ae7#;
   pragma Export (C, u00056, "system__val_unsB");
   u00057 : constant Version_32 := 16#793ec5c1#;
   pragma Export (C, u00057, "system__val_unsS");
   u00058 : constant Version_32 := 16#27b600b2#;
   pragma Export (C, u00058, "system__val_utilB");
   u00059 : constant Version_32 := 16#586e3ac4#;
   pragma Export (C, u00059, "system__val_utilS");
   u00060 : constant Version_32 := 16#d1060688#;
   pragma Export (C, u00060, "system__case_utilB");
   u00061 : constant Version_32 := 16#d0c7e5ed#;
   pragma Export (C, u00061, "system__case_utilS");
   u00062 : constant Version_32 := 16#84a27f0d#;
   pragma Export (C, u00062, "interfaces__c_streamsB");
   u00063 : constant Version_32 := 16#8bb5f2c0#;
   pragma Export (C, u00063, "interfaces__c_streamsS");
   u00064 : constant Version_32 := 16#845f5a34#;
   pragma Export (C, u00064, "system__crtlS");
   u00065 : constant Version_32 := 16#431faf3c#;
   pragma Export (C, u00065, "system__file_ioB");
   u00066 : constant Version_32 := 16#53bf6d5f#;
   pragma Export (C, u00066, "system__file_ioS");
   u00067 : constant Version_32 := 16#b7ab275c#;
   pragma Export (C, u00067, "ada__finalizationB");
   u00068 : constant Version_32 := 16#19f764ca#;
   pragma Export (C, u00068, "ada__finalizationS");
   u00069 : constant Version_32 := 16#95817ed8#;
   pragma Export (C, u00069, "system__finalization_rootB");
   u00070 : constant Version_32 := 16#bb3cffaa#;
   pragma Export (C, u00070, "system__finalization_rootS");
   u00071 : constant Version_32 := 16#769e25e6#;
   pragma Export (C, u00071, "interfaces__cB");
   u00072 : constant Version_32 := 16#4a38bedb#;
   pragma Export (C, u00072, "interfaces__cS");
   u00073 : constant Version_32 := 16#ee0f26dd#;
   pragma Export (C, u00073, "system__os_libB");
   u00074 : constant Version_32 := 16#d7b69782#;
   pragma Export (C, u00074, "system__os_libS");
   u00075 : constant Version_32 := 16#1a817b8e#;
   pragma Export (C, u00075, "system__stringsB");
   u00076 : constant Version_32 := 16#8a719d5c#;
   pragma Export (C, u00076, "system__stringsS");
   u00077 : constant Version_32 := 16#09511692#;
   pragma Export (C, u00077, "system__file_control_blockS");
   u00078 : constant Version_32 := 16#f6fdca1c#;
   pragma Export (C, u00078, "ada__text_io__integer_auxB");
   u00079 : constant Version_32 := 16#b9793d30#;
   pragma Export (C, u00079, "ada__text_io__integer_auxS");
   u00080 : constant Version_32 := 16#181dc502#;
   pragma Export (C, u00080, "ada__text_io__generic_auxB");
   u00081 : constant Version_32 := 16#a6c327d3#;
   pragma Export (C, u00081, "ada__text_io__generic_auxS");
   u00082 : constant Version_32 := 16#18d57884#;
   pragma Export (C, u00082, "system__img_biuB");
   u00083 : constant Version_32 := 16#afb4a0b7#;
   pragma Export (C, u00083, "system__img_biuS");
   u00084 : constant Version_32 := 16#e7d8734f#;
   pragma Export (C, u00084, "system__img_llbB");
   u00085 : constant Version_32 := 16#ee73b049#;
   pragma Export (C, u00085, "system__img_llbS");
   u00086 : constant Version_32 := 16#9777733a#;
   pragma Export (C, u00086, "system__img_lliB");
   u00087 : constant Version_32 := 16#e581d9eb#;
   pragma Export (C, u00087, "system__img_lliS");
   u00088 : constant Version_32 := 16#0e8808d4#;
   pragma Export (C, u00088, "system__img_llwB");
   u00089 : constant Version_32 := 16#471f93df#;
   pragma Export (C, u00089, "system__img_llwS");
   u00090 : constant Version_32 := 16#428b07f8#;
   pragma Export (C, u00090, "system__img_wiuB");
   u00091 : constant Version_32 := 16#c1f52725#;
   pragma Export (C, u00091, "system__img_wiuS");
   u00092 : constant Version_32 := 16#7ebd8839#;
   pragma Export (C, u00092, "system__val_intB");
   u00093 : constant Version_32 := 16#bc6ba605#;
   pragma Export (C, u00093, "system__val_intS");
   u00094 : constant Version_32 := 16#b3aa7b17#;
   pragma Export (C, u00094, "system__val_lliB");
   u00095 : constant Version_32 := 16#6eea6a9a#;
   pragma Export (C, u00095, "system__val_lliS");
   u00096 : constant Version_32 := 16#06052bd0#;
   pragma Export (C, u00096, "system__val_lluB");
   u00097 : constant Version_32 := 16#13647f88#;
   pragma Export (C, u00097, "system__val_lluS");
   u00098 : constant Version_32 := 16#91613c5c#;
   pragma Export (C, u00098, "ada__real_timeB");
   u00099 : constant Version_32 := 16#87ade2f4#;
   pragma Export (C, u00099, "ada__real_timeS");
   u00100 : constant Version_32 := 16#1f99af62#;
   pragma Export (C, u00100, "system__arith_64B");
   u00101 : constant Version_32 := 16#d4b08bf7#;
   pragma Export (C, u00101, "system__arith_64S");
   u00102 : constant Version_32 := 16#30bb6e97#;
   pragma Export (C, u00102, "system__taskingB");
   u00103 : constant Version_32 := 16#8d6ada58#;
   pragma Export (C, u00103, "system__taskingS");
   u00104 : constant Version_32 := 16#01715bc2#;
   pragma Export (C, u00104, "system__task_primitivesS");
   u00105 : constant Version_32 := 16#f4bb5b54#;
   pragma Export (C, u00105, "system__os_interfaceS");
   u00106 : constant Version_32 := 16#2c7d263c#;
   pragma Export (C, u00106, "interfaces__c__stringsB");
   u00107 : constant Version_32 := 16#603c1c44#;
   pragma Export (C, u00107, "interfaces__c__stringsS");
   u00108 : constant Version_32 := 16#1716ff24#;
   pragma Export (C, u00108, "system__win32S");
   u00109 : constant Version_32 := 16#e2725713#;
   pragma Export (C, u00109, "system__task_primitives__operationsB");
   u00110 : constant Version_32 := 16#12291044#;
   pragma Export (C, u00110, "system__task_primitives__operationsS");
   u00111 : constant Version_32 := 16#1b28662b#;
   pragma Export (C, u00111, "system__float_controlB");
   u00112 : constant Version_32 := 16#1432cf06#;
   pragma Export (C, u00112, "system__float_controlS");
   u00113 : constant Version_32 := 16#da8ccc08#;
   pragma Export (C, u00113, "system__interrupt_managementB");
   u00114 : constant Version_32 := 16#c90ea50e#;
   pragma Export (C, u00114, "system__interrupt_managementS");
   u00115 : constant Version_32 := 16#f65595cf#;
   pragma Export (C, u00115, "system__multiprocessorsB");
   u00116 : constant Version_32 := 16#cc621349#;
   pragma Export (C, u00116, "system__multiprocessorsS");
   u00117 : constant Version_32 := 16#f4bb3578#;
   pragma Export (C, u00117, "system__os_primitivesB");
   u00118 : constant Version_32 := 16#441f0013#;
   pragma Export (C, u00118, "system__os_primitivesS");
   u00119 : constant Version_32 := 16#0881bbf8#;
   pragma Export (C, u00119, "system__task_lockB");
   u00120 : constant Version_32 := 16#9544bb54#;
   pragma Export (C, u00120, "system__task_lockS");
   u00121 : constant Version_32 := 16#1a9147da#;
   pragma Export (C, u00121, "system__win32__extS");
   u00122 : constant Version_32 := 16#77769007#;
   pragma Export (C, u00122, "system__task_infoB");
   u00123 : constant Version_32 := 16#232885cd#;
   pragma Export (C, u00123, "system__task_infoS");
   u00124 : constant Version_32 := 16#ab9ad34e#;
   pragma Export (C, u00124, "system__tasking__debugB");
   u00125 : constant Version_32 := 16#f1f2435f#;
   pragma Export (C, u00125, "system__tasking__debugS");
   u00126 : constant Version_32 := 16#fd83e873#;
   pragma Export (C, u00126, "system__concat_2B");
   u00127 : constant Version_32 := 16#f66e5bea#;
   pragma Export (C, u00127, "system__concat_2S");
   u00128 : constant Version_32 := 16#2b70b149#;
   pragma Export (C, u00128, "system__concat_3B");
   u00129 : constant Version_32 := 16#ffbed09f#;
   pragma Export (C, u00129, "system__concat_3S");
   u00130 : constant Version_32 := 16#d0432c8d#;
   pragma Export (C, u00130, "system__img_enum_newB");
   u00131 : constant Version_32 := 16#95828afa#;
   pragma Export (C, u00131, "system__img_enum_newS");
   u00132 : constant Version_32 := 16#118e865d#;
   pragma Export (C, u00132, "system__stack_usageB");
   u00133 : constant Version_32 := 16#00bc3311#;
   pragma Export (C, u00133, "system__stack_usageS");
   u00134 : constant Version_32 := 16#d7aac20c#;
   pragma Export (C, u00134, "system__ioB");
   u00135 : constant Version_32 := 16#6a8c7b75#;
   pragma Export (C, u00135, "system__ioS");
   u00136 : constant Version_32 := 16#3c1c3c3b#;
   pragma Export (C, u00136, "ada__synchronous_task_controlB");
   u00137 : constant Version_32 := 16#2415617e#;
   pragma Export (C, u00137, "ada__synchronous_task_controlS");
   u00138 : constant Version_32 := 16#ed6e8092#;
   pragma Export (C, u00138, "dataB");
   u00139 : constant Version_32 := 16#393d98f1#;
   pragma Export (C, u00139, "dataS");
   u00140 : constant Version_32 := 16#5933ea28#;
   pragma Export (C, u00140, "system__tasking__protected_objectsB");
   u00141 : constant Version_32 := 16#63b50013#;
   pragma Export (C, u00141, "system__tasking__protected_objectsS");
   u00142 : constant Version_32 := 16#001f972c#;
   pragma Export (C, u00142, "system__soft_links__taskingB");
   u00143 : constant Version_32 := 16#e47ef8be#;
   pragma Export (C, u00143, "system__soft_links__taskingS");
   u00144 : constant Version_32 := 16#17d21067#;
   pragma Export (C, u00144, "ada__exceptions__is_null_occurrenceB");
   u00145 : constant Version_32 := 16#9a9e8fd3#;
   pragma Export (C, u00145, "ada__exceptions__is_null_occurrenceS");
   u00146 : constant Version_32 := 16#ee80728a#;
   pragma Export (C, u00146, "system__tracesB");
   u00147 : constant Version_32 := 16#06d3e490#;
   pragma Export (C, u00147, "system__tracesS");
   u00148 : constant Version_32 := 16#3ea9332d#;
   pragma Export (C, u00148, "system__tasking__protected_objects__entriesB");
   u00149 : constant Version_32 := 16#7671a6ef#;
   pragma Export (C, u00149, "system__tasking__protected_objects__entriesS");
   u00150 : constant Version_32 := 16#100eaf58#;
   pragma Export (C, u00150, "system__restrictionsB");
   u00151 : constant Version_32 := 16#efa60774#;
   pragma Export (C, u00151, "system__restrictionsS");
   u00152 : constant Version_32 := 16#92d5df45#;
   pragma Export (C, u00152, "system__tasking__initializationB");
   u00153 : constant Version_32 := 16#d9930fa8#;
   pragma Export (C, u00153, "system__tasking__initializationS");
   u00154 : constant Version_32 := 16#d89f9b67#;
   pragma Export (C, u00154, "system__tasking__task_attributesB");
   u00155 : constant Version_32 := 16#952bcf5e#;
   pragma Export (C, u00155, "system__tasking__task_attributesS");
   u00156 : constant Version_32 := 16#6f8919f6#;
   pragma Export (C, u00156, "system__tasking__protected_objects__operationsB");
   u00157 : constant Version_32 := 16#eb67f071#;
   pragma Export (C, u00157, "system__tasking__protected_objects__operationsS");
   u00158 : constant Version_32 := 16#72d3cb03#;
   pragma Export (C, u00158, "system__tasking__entry_callsB");
   u00159 : constant Version_32 := 16#e903595c#;
   pragma Export (C, u00159, "system__tasking__entry_callsS");
   u00160 : constant Version_32 := 16#94c4f9d9#;
   pragma Export (C, u00160, "system__tasking__queuingB");
   u00161 : constant Version_32 := 16#3117b7f1#;
   pragma Export (C, u00161, "system__tasking__queuingS");
   u00162 : constant Version_32 := 16#c6ee4b22#;
   pragma Export (C, u00162, "system__tasking__utilitiesB");
   u00163 : constant Version_32 := 16#ea41a805#;
   pragma Export (C, u00163, "system__tasking__utilitiesS");
   u00164 : constant Version_32 := 16#bd6fc52e#;
   pragma Export (C, u00164, "system__traces__taskingB");
   u00165 : constant Version_32 := 16#3fb127e5#;
   pragma Export (C, u00165, "system__traces__taskingS");
   u00166 : constant Version_32 := 16#3cc73d8e#;
   pragma Export (C, u00166, "system__tasking__rendezvousB");
   u00167 : constant Version_32 := 16#71fce298#;
   pragma Export (C, u00167, "system__tasking__rendezvousS");
   u00168 : constant Version_32 := 16#d6fbdf05#;
   pragma Export (C, u00168, "system__tasking__stagesB");
   u00169 : constant Version_32 := 16#f8a082a4#;
   pragma Export (C, u00169, "system__tasking__stagesS");
   u00170 : constant Version_32 := 16#57a37a42#;
   pragma Export (C, u00170, "system__address_imageB");
   u00171 : constant Version_32 := 16#55221100#;
   pragma Export (C, u00171, "system__address_imageS");
   u00172 : constant Version_32 := 16#2bce1226#;
   pragma Export (C, u00172, "system__memoryB");
   u00173 : constant Version_32 := 16#adb3ea0e#;
   pragma Export (C, u00173, "system__memoryS");
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
   --  system.file_control_block%s
   --  system.file_io%s
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  ada.finalization%s
   --  ada.finalization%b
   --  system.win32%s
   --  system.os_interface%s
   --  system.interrupt_management%s
   --  system.interrupt_management%b
   --  system.task_info%s
   --  system.task_info%b
   --  system.task_primitives%s
   --  ada.synchronous_task_control%s
   --  system.tasking%s
   --  system.task_primitives.operations%s
   --  system.tasking%b
   --  ada.synchronous_task_control%b
   --  system.tasking.debug%s
   --  system.tasking.debug%b
   --  system.traces.tasking%s
   --  system.traces.tasking%b
   --  system.win32.ext%s
   --  system.task_primitives.operations%b
   --  system.os_primitives%b
   --  system.memory%s
   --  system.memory%b
   --  system.standard_library%b
   --  system.secondary_stack%s
   --  system.file_io%b
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
   --  system.tasking.task_attributes%s
   --  system.tasking.task_attributes%b
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
   --  lab5%b
   --  END ELABORATION ORDER


end ada_main;
