unit PrincipalController;

interface

uses
  VCL.Forms, ThreadDownloadModel, System.Generics.Collections;

type

  TPrincipalController = class

  private

    FListaThreads: TList<TThreadDownload>;

  public

    constructor Create;
    Destructor Destroy; override;
    procedure Download(URL: string; Parent: TScrollBox);
    function ObterDownloadsEmAndamento: Integer;

  end;

implementation

uses
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls, ControlsDownloadModel, Vcl.Graphics,
  Vcl.Controls, System.SysUtils;

{ TPrincipalController }

constructor TPrincipalController.Create;
begin

  FListaThreads := TList<TThreadDownload>.Create;

end;

destructor TPrincipalController.Destroy;
begin

  FreeAndNil(FListaThreads);
  inherited;

end;

procedure TPrincipalController.Download(URL: string; Parent: TScrollBox);
var
  Panel: TPanel;
  LabelURL, LabelMensagem: TLabel;
  ProgressBar: TProgressBar;
  ControlsDownload: TControlsDownload;
  ThreadDownload: TThreadDownload;
  ButtonParar, ButtonExibirMensagem: TButton;
begin

  Panel := TPanel.Create(Parent);
  Panel.Parent := Parent;
  Panel.Align := alTop;
  Panel.Height := 81;
  Panel.Visible := True;
  LabelURL := TLabel.Create(Panel);
  LabelURL.Parent := Panel;
  LabelURL.Caption := URL;
  LabelURL.Top := 16;
  LabelURL.Left := 8;
  LabelURL.Visible := True;
  LabelMensagem := TLabel.Create(Panel);
  LabelMensagem.Parent := Panel;
  LabelMensagem.Caption := 'Mensagem';
  LabelMensagem.Top := 58;
  LabelMensagem.Left := 8;
  LabelMensagem.Visible := False;
  LabelMensagem.Font.Color := clRed;
  ProgressBar := TProgressBar.Create(Panel);
  ProgressBar.Parent := Panel;
  ProgressBar.Top := 35;
  ProgressBar.Left := 8;
  ProgressBar.Width := 457;//657;
  ProgressBar.Visible := True;
  ButtonParar := TButton.Create(Panel);
  ButtonParar.Parent := Panel;
  ButtonParar.Caption := 'Parar downlad';
  ButtonParar.Top := 35;
  ButtonParar.Left := 470;
  ButtonParar.Width := 100;
  ButtonParar.Visible := True;
  ButtonExibirMensagem := TButton.Create(Panel);
  ButtonExibirMensagem.Parent := Panel;
  ButtonExibirMensagem.Caption := 'Exibir mensagem';
  ButtonExibirMensagem.Top := 35;
  ButtonExibirMensagem.Left := 580;
  ButtonExibirMensagem.Width := 100;
  ButtonExibirMensagem.Visible := True;
  ControlsDownload := TControlsDownload.Create;
  ControlsDownload.Texto := LabelMensagem;
  ControlsDownload.ProgressBar := ProgressBar;
  ControlsDownload.ButtonParar := ButtonParar;
  ControlsDownload.ButtonExibirMensagem := ButtonExibirMensagem;
  ThreadDownload := TThreadDownload.Create;
  ThreadDownload.EfetuarDownload(URL, ControlsDownload);
  FListaThreads.Add(ThreadDownload);

end;

function TPrincipalController.ObterDownloadsEmAndamento: Integer;
var
  i: Integer;
begin

  Result := 0;

  for i := 0 to Pred(FListaThreads.Count) do
  begin

    if (FListaThreads[i].EmExecucao) then
      Inc(Result);

  end;

end;

end.
