unit Solver;

interface
Type

TEquationRoot =class( TObject )
Private
FGetValueEvent : integer; //; TGetValueEvent;
FOutput, FOnOutput : Integer;//TNotifyEvent;
Protected
FIteration,
FErrorCode : integer;
Function	FX( aArgument : Double ) : Double; virtual;
Public
Constructor	Create;
Destructor	Destroy; override;
Function 	Calculate( aLeft, aRight : Double ) : Double; virtual;
Procedure	Stop; virtual;
Property 	OnGetValue : {TGetValueEvent} integer 	read  FGetValueEvent
		write FGetValueEvent;
Property	OnOutput : {TNotifyEvent}integer read FOnOutput write FOnOutput;
Property	Iteration : integer read FIteration;
Property	ErrorCode : integer read FErrorCode;
End;

implementation

Function	TEquationRoot.FX( aArgument : Double ) : Double;
begin

end;
Constructor	TEquationRoot.Create;
begin

end;  
Destructor	TEquationRoot.Destroy;
begin

end;
Function 	TEquationRoot.Calculate( aLeft, aRight : Double ) : Double;
begin

end;
Procedure	TEquationRoot.Stop;
begin

end;
end.
