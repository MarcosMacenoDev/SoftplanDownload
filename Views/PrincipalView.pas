unit PrincipalView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, PrincipalController;

type
  TFPrincipalView = class(TForm)

    PanelBottom: TPanel;
    btnExibirHistoricoDownloads: TButton;
    PanelTop: TPanel;
    edURLDownload: TEdit;
    Label1: TLabel;
    btnIniciarDownload: TButton;
    ScrollBoxDonwnloads: TScrollBox;
    procedure btnExibirHistoricoDownloadsClick(Sender: TObject);
    procedure btnIniciarDownloadClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);

  private

    { Private declarations }
    Controller: TPrincipalController;

  public

    { Public declarations }

  end;

var
  FPrincipalView: TFPrincipalView;

implementation


{$R *.dfm}

uses HistoricoDownloadsView, ControlsDownloadModel, ThreadDownloadModel;

procedure TFPrincipalView.FormCreate(Sender: TObject);
begin

  Controller := TPrincipalController.Create;

end;

procedure TFPrincipalView.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  Controller.Free;

end;

procedure TFPrincipalView.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin

  if (Controller.ObterDownloadsEmAndamento > 0) and (Application.MessageBox(PChar('Existem download(s) em andamento, deseja interrompe-lo?'), 'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDNo) then
    CanClose := False;

end;

procedure TFPrincipalView.btnIniciarDownloadClick(Sender: TObject);
begin

  Controller.Download(edURLDownload.Text, ScrollBoxDonwnloads);
  edURLDownload.Clear;

end;

procedure TFPrincipalView.btnExibirHistoricoDownloadsClick(Sender: TObject);
begin

  FHistoricoDownloadsView := TFHistoricoDownloadsView.Create(Self);

  try

    FHistoricoDownloadsView.ShowModal;

  finally

    FreeAndNil(FHistoricoDownloadsView);

  end;

end;


end.
