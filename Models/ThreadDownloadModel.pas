unit ThreadDownloadModel;

interface

uses
  System.Threading, ControlsDownloadModel, LogDownloadDAOInterface, ObserverModel,
  HttpClientInterface;

type

  TThreadDownload = class

  private

    FHttpClient: iHttpClient;
    FControlsDownload: TControlsDownload;
    FEmExecucao: Boolean;
    FTask: ITask;
    procedure ButtonPararClick(Sender: TObject);
    procedure ButtonExibirMensagemClick(Sender: TObject);

  public

    property EmExecucao: Boolean read FEmExecucao write FEmExecucao;
    procedure EfetuarDownload(URL: String; ControlsDownload: TControlsDownload);

  end;

implementation

uses
  System.Classes, FactoryHttpClientController, System.SysUtils, LogDownloadDAO,
  Vcl.Dialogs;

{ ThreadDownload }

procedure TThreadDownload.EfetuarDownload(URL: String; ControlsDownload: TControlsDownload);
var
  Observer: TObserverModel;
begin

  FControlsDownload := ControlsDownload;

  FTask := TTask.Create(procedure
  begin

    try

      try

        FEmExecucao := True;
        FControlsDownload.ButtonParar.OnClick := ButtonPararClick;
        FControlsDownload.ButtonExibirMensagem.OnClick := ButtonExibirMensagemClick;
        Observer := TObserverModel.Create(FControlsDownload.ProgressBar);
        FHttpClient := TFactoryHttpClientController.New.HttpClient;
        FHttpClient.Download(URL, Observer);
        TLogDownloadDAO.New.Gravar(URL);

      except

        on E:Exception do
        begin

          TThread.Synchronize(nil, procedure
          begin

            FControlsDownload.Texto.Caption := E.Message;
            FControlsDownload.Texto.Visible := True;

          end);

        end;

      end;

    finally

      FEmExecucao := False;

    end;

  end);

  FTask.Start;

end;

procedure TThreadDownload.ButtonPararClick(Sender: TObject);
begin

  FTask.Cancel;
  FHttpClient.PararDownload;
  //FEmExecucao := False;
  FControlsDownload.Texto.Caption := 'Download interrompido';
  FControlsDownload.Texto.Visible := True;

end;

procedure TThreadDownload.ButtonExibirMensagemClick(Sender: TObject);
begin

  ShowMessage('Percentual download '+ FControlsDownload.ProgressBar.Position.ToString + '%');

end;

end.
