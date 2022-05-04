unit ObserverModel;

interface

uses
  ObserverInterface, Vcl.ComCtrls;

type

  TObserverModel = class(TInterfacedObject, iObserver)

  private

    FProgressBar: TProgressBar;

  public

    constructor Create(ProgressBar: TProgressBar);
    destructor Destroy; override;
    function Update(ContentLength, PercDownloaded: Int64): iObserver;

  end;


implementation

{ TObserverModel }

constructor TObserverModel.Create(ProgressBar: TProgressBar);
begin

  FProgressBar := ProgressBar;

end;

destructor TObserverModel.Destroy;
begin

  inherited;

end;

function TObserverModel.Update(ContentLength, PercDownloaded: Int64): iObserver;
begin

  FProgressBar.Position := PercDownloaded;

end;

end.
