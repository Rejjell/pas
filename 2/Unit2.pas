unit Unit2;

interface


Type

TGetValueEvent = procedure( Sender:TObject;

aArgument:Double;

var aValue:Double) of Object;

TIntegrator=class( TObject )
Private

FGetValueEvent : TGetValueEvent;

Protected

Function	Integrand( aArgument : Double ) : Double; virtual;

Public

Constructor	Create;


Destructor	Destroy; override;

Function Calculate( aLeft, aRight : Double ) : Double; virtual;

Property OnGetValue : TGetValueEvent read FGetValueEvent

write FGetValueEvent;

End;

implementation

Function	TIntegrator.Integrand( aArgument : Double ) : Double;
begin

end;

Constructor	TIntegrator.Create;
begin

end;

Destructor	TIntegrator.Destroy;
begin

end;
Function TIntegrator.Calculate( aLeft, aRight : Double ) : Double;
begin

end;

end.
 