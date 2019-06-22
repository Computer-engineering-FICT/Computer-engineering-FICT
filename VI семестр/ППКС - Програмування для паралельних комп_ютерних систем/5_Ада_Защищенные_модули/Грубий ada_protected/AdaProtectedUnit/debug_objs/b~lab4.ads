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

   Ada_Main_Program_Name : constant String := "_ada_lab4" & ASCII.NUL;
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
   u00001 : constant Version_32 := 16#69a56c22#;
   u00002 : constant Version_32 := 16#6385d640#;
   u00003 : constant Version_32 := 16#c332087d#;
   u00004 : constant Version_32 := 16#9c7dd3ea#;
   u00005 : constant Version_32 := 16#eff31f01#;
   u00006 : constant Version_32 := 16#8535bfda#;
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
   u00044 : constant Version_32 := 16#7b40079a#;
   u00045 : constant Version_32 := 16#46b49d08#;
   u00046 : constant Version_32 := 16#4eeb7510#;
   u00047 : constant Version_32 := 16#59507545#;
   u00048 : constant Version_32 := 16#e98c0dd7#;
   u00049 : constant Version_32 := 16#85250faf#;
   u00050 : constant Version_32 := 16#03bc737c#;
   u00051 : constant Version_32 := 16#614b54f8#;
   u00052 : constant Version_32 := 16#0a7e05c0#;
   u00053 : constant Version_32 := 16#89667d4f#;
   u00054 : constant Version_32 := 16#647de85b#;
   u00055 : constant Version_32 := 16#2fa8111e#;
   u00056 : constant Version_32 := 16#0d0a8d0c#;
   u00057 : constant Version_32 := 16#5440dba9#;
   u00058 : constant Version_32 := 16#895f8c1e#;
   u00059 : constant Version_32 := 16#10ed8c5f#;
   u00060 : constant Version_32 := 16#4e66f673#;
   u00061 : constant Version_32 := 16#5d4e287b#;
   u00062 : constant Version_32 := 16#a8d17654#;
   u00063 : constant Version_32 := 16#62e56d2b#;
   u00064 : constant Version_32 := 16#ced5a363#;
   u00065 : constant Version_32 := 16#74e99aba#;
   u00066 : constant Version_32 := 16#f1de4b60#;
   u00067 : constant Version_32 := 16#2681d8be#;
   u00068 : constant Version_32 := 16#1a3a7ed3#;
   u00069 : constant Version_32 := 16#37a7e042#;
   u00070 : constant Version_32 := 16#6d0998e1#;
   u00071 : constant Version_32 := 16#7f2a6758#;
   u00072 : constant Version_32 := 16#a0a00019#;
   u00073 : constant Version_32 := 16#7fae2656#;
   u00074 : constant Version_32 := 16#293ff6f7#;
   u00075 : constant Version_32 := 16#00934dae#;
   u00076 : constant Version_32 := 16#2461b049#;
   u00077 : constant Version_32 := 16#0aa29e81#;
   u00078 : constant Version_32 := 16#2274d34a#;
   u00079 : constant Version_32 := 16#b9e451e5#;
   u00080 : constant Version_32 := 16#a0aa86d6#;
   u00081 : constant Version_32 := 16#cc47afb0#;
   u00082 : constant Version_32 := 16#c6d1a624#;
   u00083 : constant Version_32 := 16#d93d8ca1#;
   u00084 : constant Version_32 := 16#4be846ff#;
   u00085 : constant Version_32 := 16#e42a19e8#;
   u00086 : constant Version_32 := 16#6ffd7991#;
   u00087 : constant Version_32 := 16#d8af02ef#;
   u00088 : constant Version_32 := 16#b8ac4cbc#;
   u00089 : constant Version_32 := 16#2f3f02be#;
   u00090 : constant Version_32 := 16#d9f6bc78#;
   u00091 : constant Version_32 := 16#1acb98ae#;
   u00092 : constant Version_32 := 16#0255db5c#;
   u00093 : constant Version_32 := 16#f913b5f9#;
   u00094 : constant Version_32 := 16#8ab10de5#;
   u00095 : constant Version_32 := 16#fcd6b425#;
   u00096 : constant Version_32 := 16#17c88cd6#;
   u00097 : constant Version_32 := 16#ee360a5d#;
   u00098 : constant Version_32 := 16#76b10c12#;
   u00099 : constant Version_32 := 16#06e6ef50#;
   u00100 : constant Version_32 := 16#91b7530a#;
   u00101 : constant Version_32 := 16#4c1a6f15#;
   u00102 : constant Version_32 := 16#294c3b74#;
   u00103 : constant Version_32 := 16#dc5caf17#;
   u00104 : constant Version_32 := 16#3131a464#;
   u00105 : constant Version_32 := 16#45a56406#;
   u00106 : constant Version_32 := 16#5056e8dd#;
   u00107 : constant Version_32 := 16#32cc4e27#;
   u00108 : constant Version_32 := 16#4756a3d4#;
   u00109 : constant Version_32 := 16#c59c6f02#;
   u00110 : constant Version_32 := 16#9e7c905a#;
   u00111 : constant Version_32 := 16#7627ffbb#;
   u00112 : constant Version_32 := 16#e5909a78#;
   u00113 : constant Version_32 := 16#2ea7bd7e#;
   u00114 : constant Version_32 := 16#c2f59d50#;
   u00115 : constant Version_32 := 16#6c09f761#;
   u00116 : constant Version_32 := 16#ba04edcd#;
   u00117 : constant Version_32 := 16#b9080752#;
   u00118 : constant Version_32 := 16#3f288a63#;
   u00119 : constant Version_32 := 16#90f7ef9d#;
   u00120 : constant Version_32 := 16#2d9562d4#;
   u00121 : constant Version_32 := 16#0dec879a#;
   u00122 : constant Version_32 := 16#514a38e7#;
   u00123 : constant Version_32 := 16#1d47e989#;
   u00124 : constant Version_32 := 16#b66d2de8#;
   u00125 : constant Version_32 := 16#765bc4ab#;
   u00126 : constant Version_32 := 16#218c434b#;
   u00127 : constant Version_32 := 16#0c7c4759#;
   u00128 : constant Version_32 := 16#c4aa5052#;
   u00129 : constant Version_32 := 16#23de3b06#;
   u00130 : constant Version_32 := 16#80e564ae#;
   u00131 : constant Version_32 := 16#3346551f#;
   u00132 : constant Version_32 := 16#7903ab8c#;
   u00133 : constant Version_32 := 16#ac661806#;
   u00134 : constant Version_32 := 16#433495b0#;
   u00135 : constant Version_32 := 16#1db7bf5e#;
   u00136 : constant Version_32 := 16#e6bedf82#;
   u00137 : constant Version_32 := 16#ea5b790e#;
   u00138 : constant Version_32 := 16#fa8631cb#;
   u00139 : constant Version_32 := 16#437ec74a#;
   u00140 : constant Version_32 := 16#dd19c62c#;
   u00141 : constant Version_32 := 16#e1500669#;
   u00142 : constant Version_32 := 16#9b936ce6#;
   u00143 : constant Version_32 := 16#3a821709#;
   u00144 : constant Version_32 := 16#8d02aab0#;
   u00145 : constant Version_32 := 16#d4e6143a#;
   u00146 : constant Version_32 := 16#eeb3fe26#;
   u00147 : constant Version_32 := 16#3e7d115b#;
   u00148 : constant Version_32 := 16#033da8fd#;
   u00149 : constant Version_32 := 16#2eb14fc1#;
   u00150 : constant Version_32 := 16#8810a4ad#;
   u00151 : constant Version_32 := 16#26c4cfb1#;
   u00152 : constant Version_32 := 16#f634ad37#;
   u00153 : constant Version_32 := 16#7069514a#;
   u00154 : constant Version_32 := 16#d857218c#;
   u00155 : constant Version_32 := 16#04948819#;
   u00156 : constant Version_32 := 16#499c33c1#;
   u00157 : constant Version_32 := 16#8e705356#;
   u00158 : constant Version_32 := 16#45bf3e03#;
   u00159 : constant Version_32 := 16#a8989934#;
   u00160 : constant Version_32 := 16#0b8f725f#;
   u00161 : constant Version_32 := 16#0da3a4e8#;
   u00162 : constant Version_32 := 16#26a40708#;
   u00163 : constant Version_32 := 16#3f3210e2#;
   u00164 : constant Version_32 := 16#38f4727f#;
   u00165 : constant Version_32 := 16#50691ea1#;
   u00166 : constant Version_32 := 16#6a76a80a#;
   u00167 : constant Version_32 := 16#6cc3057f#;
   u00168 : constant Version_32 := 16#b34398f4#;
   u00169 : constant Version_32 := 16#440f7999#;
   u00170 : constant Version_32 := 16#a9b1294b#;
   u00171 : constant Version_32 := 16#b01848d8#;
   u00172 : constant Version_32 := 16#5f1f7f10#;
   u00173 : constant Version_32 := 16#8eff6502#;
   u00174 : constant Version_32 := 16#b965e108#;
   u00175 : constant Version_32 := 16#79471145#;
   u00176 : constant Version_32 := 16#91f9f4f9#;
   u00177 : constant Version_32 := 16#dd979c43#;
   u00178 : constant Version_32 := 16#bb852b1e#;
   u00179 : constant Version_32 := 16#c8eda076#;

   pragma Export (C, u00001, "lab4B");
   pragma Export (C, u00002, "system__standard_libraryB");
   pragma Export (C, u00003, "system__standard_libraryS");
   pragma Export (C, u00004, "adaS");
   pragma Export (C, u00005, "ada__calendarB");
   pragma Export (C, u00006, "ada__calendarS");
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
   pragma Export (C, u00044, "system__os_primitivesB");
   pragma Export (C, u00045, "system__os_primitivesS");
   pragma Export (C, u00046, "system__win32S");
   pragma Export (C, u00047, "interfaces__cB");
   pragma Export (C, u00048, "interfaces__cS");
   pragma Export (C, u00049, "system__win32__extS");
   pragma Export (C, u00050, "ada__integer_text_ioB");
   pragma Export (C, u00051, "ada__integer_text_ioS");
   pragma Export (C, u00052, "ada__tagsB");
   pragma Export (C, u00053, "ada__tagsS");
   pragma Export (C, u00054, "system__val_unsB");
   pragma Export (C, u00055, "system__val_unsS");
   pragma Export (C, u00056, "system__val_utilB");
   pragma Export (C, u00057, "system__val_utilS");
   pragma Export (C, u00058, "system__case_utilB");
   pragma Export (C, u00059, "system__case_utilS");
   pragma Export (C, u00060, "ada__text_ioB");
   pragma Export (C, u00061, "ada__text_ioS");
   pragma Export (C, u00062, "ada__streamsS");
   pragma Export (C, u00063, "interfaces__c_streamsB");
   pragma Export (C, u00064, "interfaces__c_streamsS");
   pragma Export (C, u00065, "system__crtlS");
   pragma Export (C, u00066, "system__file_ioB");
   pragma Export (C, u00067, "system__file_ioS");
   pragma Export (C, u00068, "ada__finalizationB");
   pragma Export (C, u00069, "ada__finalizationS");
   pragma Export (C, u00070, "system__finalization_rootB");
   pragma Export (C, u00071, "system__finalization_rootS");
   pragma Export (C, u00072, "system__finalization_implementationB");
   pragma Export (C, u00073, "system__finalization_implementationS");
   pragma Export (C, u00074, "system__restrictionsB");
   pragma Export (C, u00075, "system__restrictionsS");
   pragma Export (C, u00076, "system__stream_attributesB");
   pragma Export (C, u00077, "system__stream_attributesS");
   pragma Export (C, u00078, "ada__io_exceptionsS");
   pragma Export (C, u00079, "system__os_libB");
   pragma Export (C, u00080, "system__os_libS");
   pragma Export (C, u00081, "system__stringsB");
   pragma Export (C, u00082, "system__stringsS");
   pragma Export (C, u00083, "system__file_control_blockS");
   pragma Export (C, u00084, "ada__finalization__list_controllerB");
   pragma Export (C, u00085, "ada__finalization__list_controllerS");
   pragma Export (C, u00086, "ada__text_io__integer_auxB");
   pragma Export (C, u00087, "ada__text_io__integer_auxS");
   pragma Export (C, u00088, "ada__text_io__generic_auxB");
   pragma Export (C, u00089, "ada__text_io__generic_auxS");
   pragma Export (C, u00090, "system__img_biuB");
   pragma Export (C, u00091, "system__img_biuS");
   pragma Export (C, u00092, "system__img_intB");
   pragma Export (C, u00093, "system__img_intS");
   pragma Export (C, u00094, "system__img_llbB");
   pragma Export (C, u00095, "system__img_llbS");
   pragma Export (C, u00096, "system__img_lliB");
   pragma Export (C, u00097, "system__img_lliS");
   pragma Export (C, u00098, "system__img_llwB");
   pragma Export (C, u00099, "system__img_llwS");
   pragma Export (C, u00100, "system__img_wiuB");
   pragma Export (C, u00101, "system__img_wiuS");
   pragma Export (C, u00102, "system__val_intB");
   pragma Export (C, u00103, "system__val_intS");
   pragma Export (C, u00104, "system__val_lliB");
   pragma Export (C, u00105, "system__val_lliS");
   pragma Export (C, u00106, "system__val_lluB");
   pragma Export (C, u00107, "system__val_lluS");
   pragma Export (C, u00108, "ada__real_timeB");
   pragma Export (C, u00109, "ada__real_timeS");
   pragma Export (C, u00110, "system__arith_64B");
   pragma Export (C, u00111, "system__arith_64S");
   pragma Export (C, u00112, "system__task_primitivesS");
   pragma Export (C, u00113, "system__os_interfaceS");
   pragma Export (C, u00114, "interfaces__c__stringsB");
   pragma Export (C, u00115, "interfaces__c__stringsS");
   pragma Export (C, u00116, "system__task_primitives__operationsB");
   pragma Export (C, u00117, "system__task_primitives__operationsS");
   pragma Export (C, u00118, "system__interrupt_managementB");
   pragma Export (C, u00119, "system__interrupt_managementS");
   pragma Export (C, u00120, "system__task_infoB");
   pragma Export (C, u00121, "system__task_infoS");
   pragma Export (C, u00122, "system__taskingB");
   pragma Export (C, u00123, "system__taskingS");
   pragma Export (C, u00124, "system__stack_usageB");
   pragma Export (C, u00125, "system__stack_usageS");
   pragma Export (C, u00126, "system__ioB");
   pragma Export (C, u00127, "system__ioS");
   pragma Export (C, u00128, "system__tasking__debugB");
   pragma Export (C, u00129, "system__tasking__debugS");
   pragma Export (C, u00130, "system__concat_2B");
   pragma Export (C, u00131, "system__concat_2S");
   pragma Export (C, u00132, "system__concat_3B");
   pragma Export (C, u00133, "system__concat_3S");
   pragma Export (C, u00134, "system__concat_6B");
   pragma Export (C, u00135, "system__concat_6S");
   pragma Export (C, u00136, "system__concat_5B");
   pragma Export (C, u00137, "system__concat_5S");
   pragma Export (C, u00138, "system__concat_4B");
   pragma Export (C, u00139, "system__concat_4S");
   pragma Export (C, u00140, "system__img_enum_newB");
   pragma Export (C, u00141, "system__img_enum_newS");
   pragma Export (C, u00142, "system__img_unsB");
   pragma Export (C, u00143, "system__img_unsS");
   pragma Export (C, u00144, "system__img_realB");
   pragma Export (C, u00145, "system__img_realS");
   pragma Export (C, u00146, "system__fat_llfS");
   pragma Export (C, u00147, "system__img_lluB");
   pragma Export (C, u00148, "system__img_lluS");
   pragma Export (C, u00149, "system__powten_tableS");
   pragma Export (C, u00150, "system__tasking__protected_objectsB");
   pragma Export (C, u00151, "system__tasking__protected_objectsS");
   pragma Export (C, u00152, "system__soft_links__taskingB");
   pragma Export (C, u00153, "system__soft_links__taskingS");
   pragma Export (C, u00154, "ada__exceptions__is_null_occurrenceB");
   pragma Export (C, u00155, "ada__exceptions__is_null_occurrenceS");
   pragma Export (C, u00156, "system__tracesB");
   pragma Export (C, u00157, "system__tracesS");
   pragma Export (C, u00158, "system__tasking__protected_objects__entriesB");
   pragma Export (C, u00159, "system__tasking__protected_objects__entriesS");
   pragma Export (C, u00160, "system__tasking__initializationB");
   pragma Export (C, u00161, "system__tasking__initializationS");
   pragma Export (C, u00162, "system__tasking__protected_objects__operationsB");
   pragma Export (C, u00163, "system__tasking__protected_objects__operationsS");
   pragma Export (C, u00164, "system__tasking__entry_callsB");
   pragma Export (C, u00165, "system__tasking__entry_callsS");
   pragma Export (C, u00166, "system__tasking__queuingB");
   pragma Export (C, u00167, "system__tasking__queuingS");
   pragma Export (C, u00168, "system__tasking__utilitiesB");
   pragma Export (C, u00169, "system__tasking__utilitiesS");
   pragma Export (C, u00170, "system__traces__taskingB");
   pragma Export (C, u00171, "system__traces__taskingS");
   pragma Export (C, u00172, "system__tasking__rendezvousB");
   pragma Export (C, u00173, "system__tasking__rendezvousS");
   pragma Export (C, u00174, "system__tasking__stagesB");
   pragma Export (C, u00175, "system__tasking__stagesS");
   pragma Export (C, u00176, "system__address_imageB");
   pragma Export (C, u00177, "system__address_imageS");
   pragma Export (C, u00178, "system__memoryB");
   pragma Export (C, u00179, "system__memoryS");

   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  interfaces%s
   --  system%s
   --  system.address_image%s
   --  system.arith_64%s
   --  system.case_util%s
   --  system.case_util%b
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
   --  system.htable%s
   --  system.img_enum_new%s
   --  system.img_enum_new%b
   --  system.img_int%s
   --  system.img_int%b
   --  system.img_lli%s
   --  system.img_lli%b
   --  system.img_real%s
   --  system.io%s
   --  system.io%b
   --  system.os_primitives%s
   --  system.parameters%s
   --  system.parameters%b
   --  system.crtl%s
   --  interfaces.c_streams%s
   --  interfaces.c_streams%b
   --  system.powten_table%s
   --  system.restrictions%s
   --  system.restrictions%b
   --  system.standard_library%s
   --  system.exceptions%s
   --  system.exceptions%b
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.secondary_stack%s
   --  system.address_image%b
   --  system.stack_checking%s
   --  system.stack_checking%b
   --  system.stack_usage%s
   --  system.stack_usage%b
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
   --  system.arith_64%b
   --  ada.exceptions.is_null_occurrence%s
   --  ada.exceptions.is_null_occurrence%b
   --  ada.exceptions.last_chance_handler%s
   --  system.soft_links%s
   --  system.soft_links%b
   --  ada.exceptions.last_chance_handler%b
   --  system.secondary_stack%b
   --  system.exception_table%s
   --  system.exception_table%b
   --  ada.calendar%s
   --  ada.calendar%b
   --  ada.io_exceptions%s
   --  ada.tags%s
   --  ada.streams%s
   --  interfaces.c%s
   --  interfaces.c%b
   --  interfaces.c.strings%s
   --  interfaces.c.strings%b
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  system.memory%s
   --  system.memory%b
   --  system.standard_library%b
   --  system.os_lib%s
   --  system.os_lib%b
   --  system.soft_links.tasking%s
   --  system.traces%s
   --  system.traces%b
   --  system.unsigned_types%s
   --  system.fat_llf%s
   --  system.img_biu%s
   --  system.img_biu%b
   --  system.img_llb%s
   --  system.img_llb%b
   --  system.img_llu%s
   --  system.img_llu%b
   --  system.img_llw%s
   --  system.img_llw%b
   --  system.img_uns%s
   --  system.img_uns%b
   --  system.img_real%b
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
   --  system.soft_links.tasking%b
   --  system.tasking.debug%s
   --  system.tasking.debug%b
   --  system.tasking.entry_calls%s
   --  system.tasking.initialization%s
   --  system.tasking.initialization%b
   --  system.tasking.protected_objects%s
   --  system.tasking.protected_objects%b
   --  system.tasking.utilities%s
   --  system.traces.tasking%s
   --  system.traces.tasking%b
   --  system.win32.ext%s
   --  system.task_primitives.operations%b
   --  system.os_primitives%b
   --  ada.real_time%s
   --  ada.real_time%b
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
   --  lab4%b
   --  END ELABORATION ORDER

end ada_main;
