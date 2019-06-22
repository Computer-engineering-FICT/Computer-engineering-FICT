pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__lab7.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__lab7.adb");
pragma Suppress (Overflow_Check);

with System.Restrictions;
with Ada.Exceptions;

package body ada_main is
   pragma Warnings (Off);

   E074 : Short_Integer; pragma Import (Ada, E074, "system__os_lib_E");
   E013 : Short_Integer; pragma Import (Ada, E013, "system__soft_links_E");
   E023 : Short_Integer; pragma Import (Ada, E023, "system__exception_table_E");
   E048 : Short_Integer; pragma Import (Ada, E048, "ada__io_exceptions_E");
   E050 : Short_Integer; pragma Import (Ada, E050, "ada__tags_E");
   E047 : Short_Integer; pragma Import (Ada, E047, "ada__streams_E");
   E072 : Short_Integer; pragma Import (Ada, E072, "interfaces__c_E");
   E107 : Short_Integer; pragma Import (Ada, E107, "interfaces__c__strings_E");
   E025 : Short_Integer; pragma Import (Ada, E025, "system__exceptions_E");
   E077 : Short_Integer; pragma Import (Ada, E077, "system__file_control_block_E");
   E066 : Short_Integer; pragma Import (Ada, E066, "system__file_io_E");
   E070 : Short_Integer; pragma Import (Ada, E070, "system__finalization_root_E");
   E068 : Short_Integer; pragma Import (Ada, E068, "ada__finalization_E");
   E123 : Short_Integer; pragma Import (Ada, E123, "system__task_info_E");
   E137 : Short_Integer; pragma Import (Ada, E137, "ada__synchronous_task_control_E");
   E017 : Short_Integer; pragma Import (Ada, E017, "system__secondary_stack_E");
   E147 : Short_Integer; pragma Import (Ada, E147, "system__tasking__initialization_E");
   E099 : Short_Integer; pragma Import (Ada, E099, "ada__real_time_E");
   E045 : Short_Integer; pragma Import (Ada, E045, "ada__text_io_E");
   E155 : Short_Integer; pragma Import (Ada, E155, "system__tasking__protected_objects_E");
   E159 : Short_Integer; pragma Import (Ada, E159, "system__tasking__protected_objects__entries_E");
   E163 : Short_Integer; pragma Import (Ada, E163, "system__tasking__queuing_E");
   E169 : Short_Integer; pragma Import (Ada, E169, "system__tasking__stages_E");
   E139 : Short_Integer; pragma Import (Ada, E139, "data_E");

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      E159 := E159 - 1;
      declare
         procedure F1;
         pragma Import (Ada, F1, "system__tasking__protected_objects__entries__finalize_spec");
      begin
         F1;
      end;
      E045 := E045 - 1;
      declare
         procedure F2;
         pragma Import (Ada, F2, "ada__text_io__finalize_spec");
      begin
         F2;
      end;
      declare
         procedure F3;
         pragma Import (Ada, F3, "system__file_io__finalize_body");
      begin
         E066 := E066 - 1;
         F3;
      end;
      E137 := E137 - 1;
      declare
         procedure F4;
         pragma Import (Ada, F4, "ada__synchronous_task_control__finalize_spec");
      begin
         F4;
      end;
      declare
         procedure Reraise_Library_Exception_If_Any;
            pragma Import (Ada, Reraise_Library_Exception_If_Any, "__gnat_reraise_library_exception_if_any");
      begin
         Reraise_Library_Exception_If_Any;
      end;
   end finalize_library;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (C, s_stalib_adafinal, "system__standard_library__adafinal");

      procedure Runtime_Finalize;
      pragma Import (C, Runtime_Finalize, "__gnat_runtime_finalize");

   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      Runtime_Finalize;
      s_stalib_adafinal;
   end adafinal;

   type No_Param_Proc is access procedure;

   procedure adainit is
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
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Leap_Seconds_Support : Integer;
      pragma Import (C, Leap_Seconds_Support, "__gl_leap_seconds_support");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
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
           False, False, False, False, False, False, False, False, 
           True, False, False, False, False, False, False, False, 
           False, False, False, False, False, False),
         Value => (0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         Violated =>
          (False, False, False, True, True, False, False, False, 
           False, False, False, True, True, True, False, False, 
           True, False, False, True, True, False, True, True, 
           False, True, True, True, True, False, False, True, 
           False, True, False, False, True, False, False, False, 
           False, True, False, False, False, True, False, False, 
           False, True, False, False, False, False, True, False, 
           True, False, True, True, True, False, False, True, 
           False, False, True, False, True, True, False, True, 
           True, True, False, True, False, False, False, False, 
           False, True, True, False, False, False),
         Count => (0, 0, 0, 0, 0, 2, 1, 0, 0, 0),
         Unknown => (False, False, False, False, False, False, True, False, False, False));
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;
      Leap_Seconds_Support := 0;

      Runtime_Initialize (1);

      Finalize_Library_Objects := finalize_library'access;

      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E023 := E023 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E048 := E048 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Streams'Elab_Spec;
      E047 := E047 + 1;
      Interfaces.C'Elab_Spec;
      Interfaces.C.Strings'Elab_Spec;
      System.Exceptions'Elab_Spec;
      E025 := E025 + 1;
      System.File_Control_Block'Elab_Spec;
      E077 := E077 + 1;
      System.Finalization_Root'Elab_Spec;
      E070 := E070 + 1;
      Ada.Finalization'Elab_Spec;
      E068 := E068 + 1;
      System.Task_Info'Elab_Spec;
      E123 := E123 + 1;
      Ada.Synchronous_Task_Control'Elab_Spec;
      E137 := E137 + 1;
      System.File_Io'Elab_Body;
      E066 := E066 + 1;
      E107 := E107 + 1;
      E072 := E072 + 1;
      Ada.Tags'Elab_Body;
      E050 := E050 + 1;
      System.Soft_Links'Elab_Body;
      E013 := E013 + 1;
      System.Os_Lib'Elab_Body;
      E074 := E074 + 1;
      System.Secondary_Stack'Elab_Body;
      E017 := E017 + 1;
      System.Tasking.Initialization'Elab_Body;
      E147 := E147 + 1;
      Ada.Real_Time'Elab_Spec;
      Ada.Real_Time'Elab_Body;
      E099 := E099 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E045 := E045 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E155 := E155 + 1;
      System.Tasking.Protected_Objects.Entries'Elab_Spec;
      E159 := E159 + 1;
      System.Tasking.Queuing'Elab_Body;
      E163 := E163 + 1;
      System.Tasking.Stages'Elab_Body;
      E169 := E169 + 1;
      E139 := E139 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_lab7");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      gnat_argc := argc;
      gnat_argv := argv;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   C:\Users\alexe_000\Desktop\Lab7pro2\data.o
   --   C:\Users\alexe_000\Desktop\Lab7pro2\lab7.o
   --   -LC:\Users\alexe_000\Desktop\Lab7pro2\
   --   -LC:\Users\alexe_000\Desktop\Lab7pro2\
   --   -LC:/gnat/2015/lib/gcc/i686-pc-mingw32/4.9.3/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
   --   -Xlinker
   --   --stack=0x200000,0x1000
   --   -mthreads
   --   -Wl,--stack=0x2000000
--  END Object file/option list   

end ada_main;
