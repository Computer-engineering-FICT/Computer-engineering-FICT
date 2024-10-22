unit maintype;

interface
type inttype=longint;
type realtype=double;

Type Tgraphgenetic=record
            n:inttype;
            point:array of inttype;
            links:array of array of inttype;
            end;
Type Tsystemgenetic=record
            n:inttype;
            point:array of inttype;
            links:array of array of inttype;
            duplex:array of array of inttype;
            end;

type Toutmsg=record
             tkrit:inttype;
             time:inttype;
             proc:array of record
                  N:inttype;
                  Event:array of record
                                 process:inttype;
                                 timebegin:inttype;
                                 timeend:inttype;
                                 end;
                  end;
             links:array of array of record
                   N:inttype;
                   Event:array of record
                                  from:inttype;
                                  into:inttype;
                                  timebegin:inttype;
                                  timeend:inttype;
                                  end;
                   end;
             end;

implementation

end.
