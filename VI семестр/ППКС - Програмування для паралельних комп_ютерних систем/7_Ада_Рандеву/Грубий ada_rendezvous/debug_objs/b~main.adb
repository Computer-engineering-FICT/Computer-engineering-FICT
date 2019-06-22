pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b~main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b~main.adb");

with System.Restrictions;

package body ada_main is
   pragma Warnings (Off);

   procedure Do_Finalize;
   pragma Import (C, Do_Finalize, "system__standard_library__adafinal");

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   procedure adainit is
      E020 : Boolean; pragma Import (Ada, E020, "system__secondary_stack_E");
      E016 : Boolean; pragma Import (Ada, E016, "system__soft_links_E");
      E026 : Boolean; pragma Import (Ada, E026, "system__exception_table_E");
      E112 : Boolean; pragma Import (Ada, E112, "ada__io_exceptions_E");
      E088 : Boolean; pragma Import (Ada, E088, "ada__tags_E");
      E097 : Boolean; pragma Import (Ada, E097, "ada__streams_E");
      E049 : Boolean; pragma Import (Ada, E049, "interfaces__c_E");
      E051 : Boolean; pragma Import (Ada, E051, "interfaces__c__strings_E");
      E105 : Boolean; pragma Import (Ada, E105, "system__finalization_root_E");
      E114 : Boolean; pragma Import (Ada, E114, "system__os_lib_E");
      E107 : Boolean; pragma Import (Ada, E107, "system__finalization_implementation_E");
      E103 : Boolean; pragma Import (Ada, E103, "ada__finalization_E");
      E119 : Boolean; pragma Import (Ada, E119, "ada__finalization__list_controller_E");
      E117 : Boolean; pragma Import (Ada, E117, "system__file_control_block_E");
      E101 : Boolean; pragma Import (Ada, E101, "system__file_io_E");
      E096 : Boolean; pragma Import (Ada, E096, "ada__text_io_E");
      E061 : Boolean; pragma Import (Ada, E061, "system__task_info_E");
      E149 : Boolean; pragma Import (Ada, E149, "system__tasking__initialization_E");
      E155 : Boolean; pragma Import (Ada, E155, "system__tasking__protected_objects_E");
      E006 : Boolean; pragma Import (Ada, E006, "ada__real_time_E");
      E159 : Boolean; pragma Import (Ada, E159, "system__tasking__protected_objects__entries_E");
      E163 : Boolean; pragma Import (Ada, E163, "system__tasking__queuing_E");
      E169 : Boolean; pragma Import (Ada, E169, "system__tasking__stages_E");
      E121 : Boolean; pragma Import (Ada, E121, "matrix_pack_E");

      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Zero_Cost_Exceptions : Integer;
      pragma Import (C, Zero_Cost_Exceptions, "__gl_zero_cost_exceptions");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Leap_Seconds_Support : Integer;
      pragma Import (C, Leap_Seconds_Support, "__gl_leap_seconds_support");

      procedure Install_Handler;
      pragma Import (C, Install_Handler, "__gnat_install_handler");

      Handler_Installed : Integer;
      pragma Import (C, Handler_Installed, "__gnat_handler_installed");
   begin
      Main_Priority := -1;
      Time_Slice_Value := -1;
      WC_Encoding := 'b';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      System.Restrictions.Run_Time_Restrictions :=
        (Set =>
          (False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False),
         Value => (0, 0, 0, 0, 0, 0, 0),
         Violated =>
          (False, False, True, True, False, False, False, True, 
           True, True, False, False, True, False, False, True, 
           True, False, True, True, True, True, True, True, 
           False, True, True, False, True, False, False, False, 
           False, False, True, False, False, False, True, False, 
           False, True, False, False, False, False, True, False, 
           True, False, True, True, True, False, False, True, 
           False, True, True, False, True, True, True, False, 
           False, True, True, False, False, False),
         Count => (0, 0, 6, 1, 0, 0, 0),
         Unknown => (False, False, False, True, False, False, False));
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Zero_Cost_Exceptions := 1;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;
      Leap_Seconds_Support := 0;

      if Handler_Installed = 0 then
         Install_Handler;
      end if;

      System.Soft_Links'Elab_Body;
      E016 := True;
      System.Secondary_Stack'Elab_Body;
      E020 := True;
      System.Exception_Table'Elab_Body;
      E026 := True;
      Ada.Io_Exceptions'Elab_Spec;
      E112 := True;
      Ada.Tags'Elab_Spec;
      Ada.Streams'Elab_Spec;
      E097 := True;
      Interfaces.C'Elab_Spec;
      E049 := True;
      Interfaces.C.Strings'Elab_Spec;
      E051 := True;
      System.Finalization_Root'Elab_Spec;
      E105 := True;
      System.Os_Lib'Elab_Body;
      E114 := True;
      System.Finalization_Implementation'Elab_Spec;
      System.Finalization_Implementation'Elab_Body;
      E107 := True;
      Ada.Finalization'Elab_Spec;
      E103 := True;
      Ada.Finalization.List_Controller'Elab_Spec;
      E119 := True;
      System.File_Control_Block'Elab_Spec;
      E117 := True;
      System.File_Io'Elab_Body;
      E101 := True;
      Ada.Tags'Elab_Body;
      E088 := True;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E096 := True;
      System.Task_Info'Elab_Spec;
      E061 := True;
      System.Tasking.Initialization'Elab_Body;
      E149 := True;
      System.Tasking.Protected_Objects'Elab_Body;
      E155 := True;
      Ada.Real_Time'Elab_Spec;
      E006 := True;
      System.Tasking.Protected_Objects.Entries'Elab_Spec;
      E159 := True;
      System.Tasking.Queuing'Elab_Body;
      E163 := True;
      System.Tasking.Stages'Elab_Body;
      E169 := True;
      E121 := True;
   end adainit;

   procedure adafinal is
   begin
      Do_Finalize;
   end adafinal;

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      procedure initialize (Addr : System.Address);
      pragma Import (C, initialize, "__gnat_initialize");

      procedure finalize;
      pragma Import (C, finalize, "__gnat_finalize");

      procedure Ada_Main_Program;
      pragma Import (Ada, Ada_Main_Program, "_ada_main");

      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      gnat_argc := argc;
      gnat_argv := argv;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Break_Start;
      Ada_Main_Program;
      Do_Finalize;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   d:\kache\adaworkspace\adarondevouz\debug_objs\Matrix_Pack.o
   --   d:\kache\adaworkspace\adarondevouz\debug_objs\main.o
   --   -Ld:\kache\adaworkspace\adarondevouz\debug_objs\
   --   -LC:/GNAT/2009/lib/gcc/i686-pc-mingw32/4.3.4/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
   --   -Xlinker
   --   --stack=0x200000,0x1000
   --   -mthreads
   --   -Wl,--stack=0x2000000
--  END Object file/option list   

end ada_main;
