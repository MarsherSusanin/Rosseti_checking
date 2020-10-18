unit main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, FMX.Edit, FMX.ScrollBox, FMX.Memo, System.IOUtils, System.JSON, XSuperObject;

type
  TForm1 = class(TForm)
    StyleBook1: TStyleBook;
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Button1: TButton;
    IdHTTP1: TIdHTTP;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses GlobalVar, HeaderFooterTemplate;



procedure TForm1.Button1Click(Sender: TObject);
var
  login_url: string;
  sResponse: string;
  JsonToSend: TStringList;
  O: ISuperObject;
begin
 BaseUrl:='http://35.235.124.15:80/';
 login_url:= BaseUrl+'login/';

  try
   IdHTTP1.HandleRedirects := true;
   IdHTTP1.ReadTimeout := 5000;

   IdHTTP1.Request.UserAgent:='Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36';
   IdHTTP1.Request.Accept := 'application/json, text/javascript, */*; q=0.01';
   IdHTTP1.Request.ContentType := 'application/x-www-form-urlencoded; charset=UTF-8';
   IdHTTP1.Request.CharSet:='utf-8';

   jsonToSend := TStringList.create;
   jsonToSend.values['Name'] := Edit1.text;
   jsonToSend.values['Password'] := Edit2.text;

   try
    sResponse := IdHTTP1.post(login_url, jsonToSend);
    user_id := sResponse;

    if user_id <> '' then
      begin
       O := SO;
       O.S['base_url'] := BaseUrl;
       O.S['user_id'] :=user_id;
       O.SaveTo(System.IOUtils.TPath.Combine(System.IOUtils.TPath.GetHomePath, 'settings.json'));
       ShowMessage('Вы вошли в систему!');
      end
       else
        begin
          ShowMessage('Вход в систему не выполнен!');
        end;
   except
    on E: Exception do
     ShowMessage('Error on request: '#13#10 + e.Message);
   end;
  finally
   jsonToSend.free;
  end;

  //close;
  Form1.Hide;
  HeaderFooterForm.Show;
end;

end.
