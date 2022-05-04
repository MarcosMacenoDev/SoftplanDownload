unit HttpClientNetModel;

interface

uses
  HttpClientInterface, System.Net.URLClient, System.Net.HttpClient,
  System.Net.HttpClientComponent, ControlsDownloadModel, System.Classes,
  ObserverInterface, SubjectModel;

type

  THttpClientNet = class(TInterfacedObject, iHttpClient)

  private

    FPararDownload: Boolean;
    FObserver: TSubjectModel;
    NetHTTPClient: TNetHTTPClient;
    NetHTTPRequest: TNetHTTPRequest;
    procedure NetHTTPRequestReceiveData(const Sender: TObject; AContentLength, AReadCount: Int64; var AAbort: Boolean);

  public

    constructor Create;
    destructor Destroy; override;
    class function New: iHttpClient;
    function Download(URL: string; Observer: iObserver): iHttpClient;
    function PararDownload: iHttpClient;

  end;

implementation

uses
  System.SysUtils;

{ THttpClientNet }

constructor THttpClientNet.Create;
begin

  FObserver :=  TSubjectModel.Create;
  NetHTTPClient := TNetHTTPClient.Create(nil);
  NetHTTPRequest := TNetHTTPRequest.Create(nil);
  NetHTTPRequest.Client := NetHTTPClient;
  NetHTTPRequest.OnReceiveData := NetHTTPRequestReceiveData;

end;

destructor THttpClientNet.Destroy;
begin

  FreeAndNil(NetHTTPClient);
  FreeAndNil(NetHTTPRequest);
  inherited;

end;

procedure THttpClientNet.NetHTTPRequestReceiveData(const Sender: TObject; AContentLength, AReadCount: Int64; var AAbort: Boolean);
var
  PercDownloaded: Double;
begin

  AAbort := FPararDownload;
  PercDownloaded := 0;

  if (AContentLength > 0) then
    PercDownloaded := (AReadCount / AContentLength) * 100;

  FObserver.Notify(AContentLength, Trunc(PercDownloaded));

end;

class function THttpClientNet.New: iHttpClient;
begin

  Result := Self.Create;

end;

function THttpClientNet.PararDownload: iHttpClient;
begin

  FPararDownload := True;

end;

function THttpClientNet.Download(URL: string; Observer: iObserver): iHttpClient;
begin

  Result := Self;
  FObserver.AddObserver(Observer);

  try

    NetHTTPRequest.Get(URL, nil);

  except

    on E:Exception do
    begin

      raise Exception.Create(E.Message);

    end;

  end;

end;

end.


