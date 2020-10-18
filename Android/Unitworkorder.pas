unit Unitworkorder;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Ani, System.IOUtils, System.JSON,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TForm2 = class(TForm)
    Rectangle2: TRectangle;
    GradientAnimation1: TGradientAnimation;
    Label2: TLabel;
    RoundRect1: TRoundRect;
    Edit1: TEdit;
    Rectangle1: TRectangle;
    Rectangle3: TRectangle;
    RoundRect2: TRoundRect;
    Label1: TLabel;
    RoundRect3: TRoundRect;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    IdHTTP1: TIdHTTP;
    function GetWorkOrderDetails : string;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

uses GlobalVar;

function TForm2.GetWorkOrderDetails : string;
var
  login_url: string;
  sResponse: string;
  JsonToSend: TStringList;
begin
  //
  login_url:= BaseUrl+'get_workorder_details/';
  //ShowMessage(login_url);
  //ShowMessage(flash_user_id);

  try
   IdHTTP1.HandleRedirects := true;
   IdHTTP1.ReadTimeout := 5000;

   IdHTTP1.Request.UserAgent:='Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36';
   IdHTTP1.Request.Accept := 'application/json, text/javascript, */*; q=0.01';
   IdHTTP1.Request.ContentType := 'application/x-www-form-urlencoded; charset=UTF-8';
   IdHTTP1.Request.CharSet:='utf-8';

   jsonToSend := TStringList.create;
   jsonToSend.values['workorder_id'] := flash_user_id;

   try
    sResponse := IdHTTP1.post(login_url, jsonToSend);
   except
    on E: Exception do
     ShowMessage('Error on request: '#13#10 + e.Message);
   end;
  finally
   jsonToSend.free;
  end;

  GetWorkOrderDetails := sResponse;
end;

procedure TForm2.FormShow(Sender: TObject);
Var
  Json,Json2: TJSONObject;
  workorder_id : string;
  s,st : string;
begin
 //
 //WorkorderL
 //JSON:=TJSONObject.ParseJSONValue(Listworkorders[1],False, True) as TJSONObject;
 flash_user_id:=JSON.Values['workorder_id'].Value;

 s:=GetWorkOrderDetails;
 st:=copy(s,2,length(s)-2);
 //JSON2:=TJSONObject.ParseJSONValue(st,False, True) as TJSONObject;
 //ShowMessage(s);
 Label5.Text:=JSON2.Values['addressworkplace'].Value;
 Label8.Text:=JSON2.Values['workevents'].Value;
 Label10.Text:=JSON2.Values['createuserfio'].Value;
 Label12.Text:=JSON2.Values['workerfio'].Value;

end;

end.
