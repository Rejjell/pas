unit Solver

interface
Type

TEquationRoot =class( TObject )
Private
FGetValueEvent : TGetValueEvent;
FOutput : TNotifyEvent
Protected
FIteration,
FErrorCode : integer
Function	FX( aArgument : Double ) : Double; virtual;
Public
Constructor	Create;
Destructor	Destroy; override;
Function 	Calculate( aLeft, aRight : Double ) : Double; virtual;
Procedure	Stop; virtual;
Property 	OnGetValue : TGetValueEvent 	read  FGetValueEvent
		write FGetValueEvent;
Property	OnOutput : TNotifyEvent read FOnOutput write FOnOutput;
Property	Iteration : integer read FIteration;
Property	ErrorCode : integer read FErrorCode;
End;

implementation

end.
