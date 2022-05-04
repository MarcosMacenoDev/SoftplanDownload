unit SubjectModel;

interface

uses
  ObserverInterface, System.Generics.Collections;

type

  TSubjectModel = class(TInterfacedObject, iSubject)

  private

    FLista: TList<iObserver>;

  public

    constructor Create;
    destructor Destroy; override;
    function AddObserver(Value: iObserver): iSubject;
    function RemoveObserver(Value: iObserver): iSubject;
    function Notify(ContentLength, PercDownloaded: Int64): iSubject;
    class function New: iSubject;

  end;

implementation

uses
  System.SysUtils;

{ TObserverModel }

constructor TSubjectModel.Create;
begin

  FLista := TList<iObserver>.Create;

end;

destructor TSubjectModel.Destroy;
begin

  FreeAndNil(FLista);
  inherited;

end;

class function TSubjectModel.New: iSubject;
begin

  Result := Self.Create;

end;

function TSubjectModel.AddObserver(Value: iObserver): iSubject;
begin

  Result := Self;
  FLista.Add(Value);

end;

function TSubjectModel.RemoveObserver(Value: iObserver): iSubject;
begin

  Result := Self;
  FLista.Remove(Value);

end;

function TSubjectModel.Notify(ContentLength, PercDownloaded: Int64): iSubject;
var
  i: integer;
begin

  Result := Self;

  for i := 0 to Pred(FLista.Count) do
     FLista.Items[i].Update(ContentLength, PercDownloaded);

end;

end.
