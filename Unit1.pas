unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls,
  dateutils, ExtCtrls,

  sgp_init,sgp_time,sgp_math,sgp_conv,sgp4sdp4,sgp_obs,
  support,minmax,
  extMath,
   ComCtrls,

  FileCtrl, jpeg, pngimage, inifiles, math ;

type

  TWidHei=record
    pixelLimits:TPoint;
    tileLimits:TPoint;
    threshold:record
      low:integer;
      high:integer;
    end;
  end;

  TAWidAHei=array[4..12] of TWidHei;

  TDrawMethod = (NightMethod, RGBMethod, FalseColorMethod);

  TSweepMethod = (SatPixel, EarthAlpha);// SatPixel - ������� � �������, ������ � ��� ���� ��� ������ �� ��������
                                        // EarthAlpha - ���������� ����, �.�. ����� ������� ������������ ������ �������� ����������� �����
                                        //  (������� ������������ ����, ���������� �� ������ �����)

  THideHue = record
    hide36:bool;
    hide60:bool;
    hide80:bool;
    hide120:bool;
    hide180:bool;
  end;

  TForm1 = class(TForm)
    od2: TOpenDialog;
    SpeedButton4: TSpeedButton;
    Image3: TImage;
    SpeedButton5: TSpeedButton;
    sd1: TSaveDialog;
    SpeedButton6: TSpeedButton;
    ScrollBox1: TScrollBox;
    Image2: TImage;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    od1: TOpenDialog;
    SpeedButton2: TSpeedButton;
    Edit2: TEdit;
    TabSheet2: TTabSheet;
    Label24: TLabel;
    Label29: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    TrackBar3: TTrackBar;
    TrackBar6: TTrackBar;
    TrackBar7: TTrackBar;
    Label34: TLabel;
    SpeedButton8: TSpeedButton;
    Memo2: TMemo;
    TabSheet3: TTabSheet;
    Memo1: TMemo;
    TabSheet4: TTabSheet;
    SpeedButton9: TSpeedButton;
    Edit3: TEdit;
    Label47: TLabel;
    TabSheet5: TTabSheet;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
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
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    SpeedButton3: TSpeedButton;
    Edit1: TEdit;
    Edit4: TEdit;
    SpeedButton11: TSpeedButton;
    Edit5: TEdit;
    Label52: TLabel;
    SpeedButton12: TSpeedButton;
    Label53: TLabel;
    Label54: TLabel;
    PageControl2: TPageControl;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    Label22: TLabel;
    Label23: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    TrackBar1: TTrackBar;
    TrackBar2: TTrackBar;
    TrackBar4: TTrackBar;
    TrackBar5: TTrackBar;
    Label31: TLabel;
    Label30: TLabel;
    Label28: TLabel;
    Label27: TLabel;
    SpeedButton7: TSpeedButton;
    Image1: TImage;
    SpeedButton10: TSpeedButton;
    Image4: TImage;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    TrackBar15: TTrackBar;
    TrackBar16: TTrackBar;
    TrackBar17: TTrackBar;
    TrackBar18: TTrackBar;
    TrackBar19: TTrackBar;
    TrackBar20: TTrackBar;
    TrackBar21: TTrackBar;
    TrackBar22: TTrackBar;
    TrackBar23: TTrackBar;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    ProgressBar1: TProgressBar;
    Image5: TImage;
    TrackBar24: TTrackBar;
    Label76: TLabel;
    Label77: TLabel;
    TrackBar25: TTrackBar;
    Label78: TLabel;
    Label79: TLabel;
    SpeedButton13: TSpeedButton;
    CheckBox1: TCheckBox;
    Label80: TLabel;
    Label81: TLabel;
    TrackBar26: TTrackBar;
    Label82: TLabel;
    TrackBar27: TTrackBar;
    Label83: TLabel;
    Label84: TLabel;
    SpeedButton14: TSpeedButton;
    Label85: TLabel;
    TrackBar28: TTrackBar;
    Label86: TLabel;
    CheckBox2: TCheckBox;
    Label87: TLabel;
    Label88: TLabel;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    Label89: TLabel;
    Label90: TLabel;
    Label91: TLabel;
    Label92: TLabel;
    Label93: TLabel;
    Label94: TLabel;
    Label95: TLabel;
    TrackBar29: TTrackBar;
    TrackBar30: TTrackBar;
    TrackBar31: TTrackBar;
    TrackBar32: TTrackBar;
    Label96: TLabel;
    Label97: TLabel;
    TrackBar33: TTrackBar;
    TrackBar34: TTrackBar;
    Image6: TImage;
    SpeedButton15: TSpeedButton;
    od3: TOpenDialog;
    Label98: TLabel;
    Label99: TLabel;
    Label100: TLabel;
    Label101: TLabel;
    Label102: TLabel;
    Label103: TLabel;
    Edit6: TEdit;
    Bevel1: TBevel;
    TabSheet9: TTabSheet;
    TabSheet10: TTabSheet;
    SpeedButton16: TSpeedButton;
    Memo3: TMemo;
    TrackBar35: TTrackBar;
    Image7: TImage;
    Label104: TLabel;
    Image8: TImage;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Bevel2: TBevel;
    Panel1: TPanel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    TrackBar8: TTrackBar;
    TrackBar9: TTrackBar;
    TrackBar10: TTrackBar;
    TrackBar11: TTrackBar;
    TrackBar12: TTrackBar;
    TrackBar13: TTrackBar;
    TrackBar14: TTrackBar;
    TrackBar36: TTrackBar;
    Label105: TLabel;
    Label106: TLabel;
    SpeedButton17: TSpeedButton;
    Label107: TLabel;
    TabSheet11: TTabSheet;
    Memo4: TMemo;
    SpeedButton18: TSpeedButton;
    ScrollBar1: TScrollBar;
    Timer1: TTimer;
    procedure CombinePicture( drawMethod: TDrawMethod;
// Night method
  channelLeft,channelRight:byte; // *** mercator bottom layer is disabled now rgbCompressPercent:integer;
  cloudShift, cloudCompressionPercent:integer;
// RGB method
  sharpness:integer;
  rChannel:byte; rBright:integer; rContrast:integer;
  gChannel:byte; gBright:integer; gContrast:integer;
  bChannel:byte; bBright:integer; bContrast:integer;
  tilesTransparency:single;
// False color method
  tChChannel:byte; tChBright:integer; tChContrast:integer;
  bChChannel:byte; bChBright:integer; bChContrast:integer;

  sweepMethod:TSweepMethod; scale:double; rotateLeftRight:double; moveLeftRight:double; stepWidth:double;
  showTilesBorder:bool; hideHue:THideHue;
  zScaleTilesCorrection:double);

    procedure SetImageSize();
    procedure calcAWidAHei();
    procedure WriteIniFile();
    procedure ReadIniFile();
    procedure ProcessMSUFileName();
    procedure Image7Draw();
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
    procedure TrackBar3Change(Sender: TObject);
    procedure TrackBar4Change(Sender: TObject);
    procedure TrackBar5Change(Sender: TObject);
    procedure TrackBar6Change(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Memo2Change(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure ScrollBox1Resize(Sender: TObject);
    procedure ScrollBox1MouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure Image2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ScrollBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure TrackBar7Change(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure TrackBar8Change(Sender: TObject);
    procedure TrackBar9Change(Sender: TObject);
    procedure TrackBar10Change(Sender: TObject);
    procedure TrackBar11Change(Sender: TObject);
    procedure TrackBar12Change(Sender: TObject);
    procedure TrackBar13Change(Sender: TObject);
    procedure TrackBar14Change(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure TrackBar21Change(Sender: TObject);
    procedure TrackBar22Change(Sender: TObject);
    procedure TrackBar23Change(Sender: TObject);
    procedure TrackBar15Change(Sender: TObject);
    procedure TrackBar17Change(Sender: TObject);
    procedure TrackBar19Change(Sender: TObject);
    procedure TrackBar16Change(Sender: TObject);
    procedure TrackBar18Change(Sender: TObject);
    procedure TrackBar20Change(Sender: TObject);
    procedure TrackBar24Change(Sender: TObject);
    procedure TrackBar25Change(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure TrackBar26Change(Sender: TObject);
    procedure TrackBar27Change(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure TrackBar28Change(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure TrackBar29Change(Sender: TObject);
    procedure TrackBar32Change(Sender: TObject);
    procedure TrackBar30Change(Sender: TObject);
    procedure TrackBar33Change(Sender: TObject);
    procedure TrackBar31Change(Sender: TObject);
    procedure TrackBar34Change(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure TrackBar35Change(Sender: TObject);
    procedure Image7MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image8MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TrackBar36Change(Sender: TObject);
    procedure SpeedButton17Click(Sender: TObject);
    procedure SpeedButton18Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

type
 PMSUChannelLine = ^TMSUChannelLine;
 TMSUChannelLine =
   record
     pixels:array of word;
   end;
 TMSUChannelData = array of TMSUChannelLine;

 TVector = record
   vectorValue:vector;
   valueExists:bool;
 end;

 TMSUVectorLine = record
   aVectorValue:array of TVector;
   datetime:TDateTime;
   timeset:time_set;
   jtime:double;
 end;
 TMSUVectorData = array of TMSUVectorLine;

 TMSUFullStruct=record
   MSUChannelsData:array[0..5] of TMSUChannelData;
   MSUVectorData:array of TMSUVectorLine;
   MSULinesInFile:integer;
   MSULastLineInFileUserWant:integer;//���������� ���� � ����
   timeIncrementer:integer;     //����������� ������ �������� - ����� �� ����� ��� ����,
                                // ��� ����� ����� �� ����� ��������� �������� ����� ������������ �����,
                                // ����� ������������ �� ����� �������� ������� �����������
   sat_gd:vector;
   NightUserCalibrFirstLine:integer;
   NightUserCalibrLastLine:integer;
 end;

 TTile = record
   aScanLine:array[0..255] of pByteArray;
   jpg:TJPEGImage;
   loadedJpgFilename:string;
   png:TPNGObject;
   loadedPngFilename:string;
   addrHash:integer;
   fileLoaded:bool;
   origin:string;
   //bitmap:TBitmap;
 end;

 TThreeWords = array[-1..1] of word;

 TRGBColor = record
   R,G,B : Byte;
 end;

 THSBColor = record
   Hue,Sat,Br : Double;
 end;

const
 MSUFrameLen=11850;
 ChannelsCount=6;
 MSUCalibrStart=35;
 MSUCalibrLen=15;
 MSUVideoStart=50;
 MSUVideoLen=11790;
 MSUVideoLen16bit=(MSUVideoLen*8) div 10; // 8 and 10 are because 10bit bytes are saved in 8bit file memory //(MSUVideoLen*16) div 10;
 MSUVideoChannelLen16bit=MSUVideoLen16bit div ChannelsCount;
 MSUVideoChannelHalfLen16bit=MSUVideoChannelLen16bit div 2;
// MSUVideoChannelLen8bit=(MSUVideoLen*8) div 10 div ChannelsCount;

 msecBetweenLines=153;
 tilesCount=100; //������ ���� ������ (atiles), ����� �� ������ ������� ���� ��� �����

var
 stopFlag:bool;

 dtFromMSUFileName:tdatetime;

 MSUFullStruct:TMSUFullStruct;

 image2FullSizeMode:bool;
 rotatedByUser:bool;

 jpgdir:string;
 pngdir:string;

 aWidaHei:TAWidAHei;
 thresholdAngle:integer;
 atiles:array[1..tilesCount] of TTile; //��� ������, ����� �� ������ ������� ���� ��� �����

 FalseColorMap:array[0..255,0..255,0..2] of byte;

procedure up10to16bits(pIn:PByteArray; pOut:PWordArray; posIn,PosOut:integer; lenIn:integer);
var
 i:integer;
 shift:integer;
 curAddr:integer;
 w:^word;
 //bh,bl:byte;
begin
  shift:=0;
  curAddr:=posIn;
  i:=PosOut;
  getmem(w,sizeof(w^));
  while curAddr<(posIn+lenIn) do
    begin
    {
      bh:=byte( pIn[curAddr] shl shift ); // H_igh information at the good leftest place already
      //bl:=byte( pIn[curAddr+1] shr (6-shift) ); // Low informtion at the lowest place
      bl:=byte( pIn[curAddr+1] shl (shift) ); // Low informtion at the good leftest place already
      bl:=bl and $C0; //kill next "10-bit byte" bits
      (PByteArray(w))[0]:=bl;
//      (PByteArray(w))[0]:=0;
      (PByteArray(w))[1]:=bh;
      }
      (PByteArray(w))[0]:=pIn[curAddr+1]; //low byte
      (PByteArray(w))[1]:=pIn[curAddr]; //high byte
      pOut[i]:=word(w^ shl (shift)) and $FFC0;
      shift:=shift+2;
      curAddr:=curAddr+1;
      if shift = 8 then
        begin
          shift:=0;
          curAddr:=curaddr+1;
        end;
      i:=i+1;
    end;
end;

procedure ExtractChannel16bit(pMSU10to16:PWordArray; outWordLine:TMSUChannelLine; lenAs16bit:integer; channel:integer);
var
 j:integer;
 x,xx,xblock:integer;
begin
  for j:=0 to lenAs16bit-1 do
    begin
//     if j=lenAs16bit-1 then
//       MessageBox(0,'ef','sg',0);
      xblock:=j div 24; // current block (data stored in array: 6 channels of 4 bytes blocks)
      xx:=j mod 24; // pointer shift in current block
      if ((channel*4) <= xx) and ( xx <= (channel*4)+3) then //if j in our channel block
        begin
          x:=(xblock * 4) + (xx - (channel*4));
          if channel<3 then
            outWordLine.pixels[x]:=pMSU10to16[j]
           else
            outWordLine.pixels[x]:=65535 - pMSU10to16[j];
        end;
    end;
end;

procedure SetImgBitmapFormat(img:TImage; widthSize:integer; rowsCount:integer);
begin
  img.Picture.Bitmap.Width:=widthSize; //1572;
  img.Picture.Bitmap.HandleType:=bmDIB;
  img.Picture.Bitmap.PixelFormat:=pf24bit;
  img.Picture.Bitmap.Height:=rowsCount;
end;


procedure FillRGBArray16bit(rgbArray:PByteArray; r,g,b:TMSUChannelLine; len:integer; mask:byte; bright:byte);
var
 i:integer;
 val:integer;
begin
  if bright=10 then
    begin
      if (mask and 4)=4 then
        for i:= 0 to len-1 do
          begin
            rgbArray[i*3 +2]:=r.pixels[i] shr 8; //red
          end;
      if (mask and 2)=2 then
        for i:= 0 to len-1 do
          begin
            rgbArray[i*3 +1]:=g.pixels[i] shr 8; //green
          end;
      if (mask and 1)=1 then
        for i:= 0 to len-1 do
          begin
            rgbArray[i*3 +0]:=b.pixels[i] shr 8; //blue
          end;
    end
   else
    begin
      if (mask and 4)=4 then
        for i:= 0 to len-1 do
          begin
            val:=(r.pixels[i]*bright) div 2560;// ... / 256 / 10   =   ... shr 8 / 10
            if val>255 then val:=255;
            rgbArray[i*3 +2]:=val; //red
          end;
      if (mask and 2)=2 then
        for i:= 0 to len-1 do
          begin
            val:=(g.pixels[i]*bright) div 2560;
            if val>255 then val:=255;
            rgbArray[i*3 +1]:=val; //green
          end;
      if (mask and 1)=1 then
        for i:= 0 to len-1 do
          begin
            val:=(b.pixels[i]*bright) div 2560;
            if val>255 then val:=255;
            rgbArray[i*3 +1]:=val; //blue
          end;
    end;
end;

function TimeIn6Hours(hour1, hour2:integer):bool;
var
 res:bool;
begin
  res:=false;
  if abs(hour1-hour2)<6 then res:=true;
  TimeIn6Hours:=res;
end;

function IntToStrFixWidth(val, len:integer):string;
var
 s:string;
begin
  s:=IntToStr(val);
  while length(s)<len do
    s:='0'+s;
  IntToStrFixWidth:=s;
end;

function ExtractTimeOfLine(MSULine:PByteArray; {year,month,day,} UTCFromFileName:TDateTime; prevLineUTC:TDateTime; addMsecIfErr:bool; var errorCounter:integer; var dtWOErrorCounter:integer; var catchErrorCounter:integer; var dtCatched:bool):TDateTime;
var
 //prevYear,prevMonth,prevDay,prevHour,prevMinute,prevSecond,prevMsec:word;
 year,month,day,hour,minute,second,msec:word;
 fileHour:word;
 dt:TDateTime;
 goodValues:bool;

 diff:int64;
 errDetected:bool;
begin
  //DecodeDateTime(prevLineUTC,prevYear,prevMonth,prevDay,prevHour,prevMinute,prevSecond,prevMsec);
  DecodeDateTime(UTCFromFileName,year,month,day,hour,minute,second,msec);
  fileHour:=hour;
  //20:48 msc
  goodValues:=true;
  errDetected:=false;
  hour:=msuLine[8];
  minute:=msuLine[9];
  second:=msuLine[10];
  msec:=msuLine[11]*4;
  if (hour>=0) and (hour<24) and (minute>=0) and (minute<60) and (second>=0) and (second<60) and (msec>=0) and (msec<1000) then
    begin
      try
        dt:=EncodeDateTime(year,month,day,hour,minute,second,msec);
        dt:=inchour(dt,-3);//meteor transmits in msk time
        DecodeDateTime(dt,year,month,day,hour,minute,second,msec);
      except
        goodValues:=false;
      end;
      if goodValues then
        begin
          if not TimeIn6Hours(hour, fileHour) then
            begin
              dt:=IncDay(dt,1);
            end;

          diff:=MilliSecondsBetween(prevLineUTC,dt);
          if(diff<500) then
            begin
              catchErrorCounter:=0;
            end
           else
            begin
              if not dtCatched then
                begin
                  dtCatched:=true;
                  catchErrorCounter:=0;
                end
               else
                errDetected:=true;
            end;
        end
       else
        errDetected:=true;
    end
   else
    errDetected:=true;
  if errDetected then
    begin
      errorCounter:=errorCounter+1;
      catchErrorCounter:=catchErrorCounter+1;
      dt:=prevLineUTC;
      if addMsecIfErr then
        dt:=IncMilliSecond(dt,msecBetweenLines);
    end;
  ExtractTimeOfLine:=dt;
end;


function ToTimeSet(dt:TDateTime):time_set;
var
 ts:time_set;
 year,month,day,hour,minute,second,msec:word;
begin
  DecodeDateTime(dt,year,month,day,hour,minute,second,msec);
  ts.yr:=year;
  ts.mo:=month;
  ts.dy:=day;
  ts.hr:=hour;
  ts.mi:=minute;
  ts.se:=second;
  ts.hu:=msec div 10;
  ToTimeSet:=ts;
end;

function limitDouble(d:double):double;
var
 dd:double;
begin
  dd:=d;
  if dd>360 then dd:=dd-360;
  if dd<0 then dd:=dd+360;
  limitDouble:=dd;
end;

function RGBToHSB(rgb : TRGBColor) : THSBColor;
 var
    minRGB, maxRGB, delta : Double;
    h , s , b : Double ;
 begin
    H := 0.0 ;
    minRGB := Min(Min(rgb.R, rgb.G), rgb.B) ;
    maxRGB := Max(Max(rgb.R, rgb.G), rgb.B) ;
    delta := ( maxRGB - minRGB ) ;
    b := maxRGB ;
    if (maxRGB <> 0.0) then s := 255.0 * Delta / maxRGB
    else s := 0.0;
    if (s <> 0.0) then
    begin
      if rgb.R = maxRGB then h := (rgb.G - rgb.B) / Delta
      else
        if rgb.G = maxRGB then h := 2.0 + (rgb.B - rgb.R) / Delta
        else
          if rgb.B = maxRGB then h := 4.0 + (rgb.R - rgb.G) / Delta
    end
    else h := -1.0;
    h := h * 60 ;
    if h < 0.0 then h := h + 360.0;
    with result do
    begin
      Hue := h;
      Sat := s * 100 / 255;
      Br := b * 100 / 255;
    end;
 end;

procedure CombineColors(drawMethod:TDrawMethod;
 {***rgbColor:TColor; rgbCompressPercent:integer;***}
 // Night method
 cloud:byte; cloudShift, cloudCompressionPercent:integer;
 // RGB method
 sharpness:integer;
 rValue:integer; rBright:integer; rContrast:integer;
 gValue:integer; gBright:integer; gContrast:integer;
 bValue:integer; bBright:integer; bContrast:integer;
 // False color method
 tChValue:integer; tChBright:integer; tChContrast:integer;
 bChValue:integer; bChBright:integer; bChContrast:integer;

 // Tiles layer
 layerAlpha:byte; rLayerColor,gLayerColor,bLayerColor:byte;
 hideHue:THideHue;
 // Result colors
 var dstRColor,dstGColor,dstBColor:byte);
var
 r,g,b:integer;
 tVal,bVal:integer;
 mod_cloud:integer;

 rgbColor:TRGBColor;
 hsbColor:THSBColor;
 layerAlphaMod:byte;
// resColor:TColor;
begin
//  resColor:=0;
  // *** mercator map as bottom layer is disabled now
  // * if rgbColor>=0 then
  // *   begin
  // * r:=(GetRValue(rgbColor)*rgbCompressPercent) div 100;
  // * g:=(GetGValue(rgbColor)*rgbCompressPercent) div 100;
  // * b:=(GetBValue(rgbColor)*rgbCompressPercent) div 100;
  // * mod_cloud:=((cloud-cloudShift)*cloudCompressionPercent) div 100;
  // * if mod_cloud<0 then mod_cloud:=0;
  // * if mod_cloud>255 then mod_cloud:=252;
  // * r:=r+(mod_cloud*(255-r) div 255);
  // * g:=g+(mod_cloud*(255-g) div 255);
  // * b:=b+(mod_cloud*(255-b) div 255);
  // mercator map *** //

  if drawMethod=NightMethod then
    begin
      mod_cloud:=((cloud-cloudShift)*cloudCompressionPercent) div 100;
      if mod_cloud<0 then mod_cloud:=0;
      if mod_cloud>255 then mod_cloud:=255;
      r:=mod_cloud;
      g:=mod_cloud;
      b:=mod_cloud;

      if layerAlpha>0 then
        begin
          r:=((r*(255-layerAlpha)) div 255)+((layerAlpha*rlayerColor) div 255);
          g:=((g*(255-layerAlpha)) div 255)+((layerAlpha*glayerColor) div 255);
          b:=((b*(255-layerAlpha)) div 255)+((layerAlpha*blayerColor) div 255);
        end;
      {
      if layerColor>0 then
        resColor:=layerColor
       else
        resColor:=(rgb(r,g,b));
      }
//      resColor:=rgb(r,g,b);
      dstRColor:=r;
      dstGColor:=g;
      dstBColor:=b;
  // *   end
  // *  else
  // *   begin
  // *     resColor:=rgb(0,0,0);
  // *   end;
    end;
  if drawMethod=RGBMethod then
    begin
      r:=rValue;//[0] + (((rValue[0]*2-rValue[-1]-rValue[1]) * sharpness ) div 10);
      r:=((r+(rBright shl 8))*rContrast) div 25600;
      if r<0 then r:=0;
      if r>255 then r:=255;
      g:=gValue;//[0] + (((gValue[0]*2-gValue[-1]-gValue[1]) * sharpness ) div 10);
      g:=((g+(gBright shl 8))*gContrast) div 25600;
      if g<0 then g:=0;
      if g>255 then g:=255;
      b:=bValue;//[0] + (((bValue[0]*2-bValue[-1]-bValue[1]) * sharpness ) div 10);
      b:=((b+(bBright shl 8))*bContrast) div 25600;
      if b<0 then b:=0;
      if b>255 then b:=255;

      layerAlphaMod:=layerAlpha;
      rgbColor.R:=rLayerColor;
      rgbColor.G:=gLayerColor;
      rgbColor.B:=bLayerColor;
      hsbColor:=RGBToHSB(rgbColor);
      if hideHue.hide36 then
        if (30 < hsbColor.Hue) and (hsbColor.Hue <= 50) then
          layerAlphaMod:=0;
      if hideHue.hide60 then
        if (50 < hsbColor.Hue) and (hsbColor.Hue <= 70) then
          layerAlphaMod:=0;
      if hideHue.hide80 then
        if (70 < hsbColor.Hue) and (hsbColor.Hue <= 90) then
          layerAlphaMod:=0;
      if hideHue.hide120 then
        if (110 < hsbColor.Hue) and (hsbColor.Hue <= 130) then
          layerAlphaMod:=0;
      if hideHue.hide180 then
        if (170 < hsbColor.Hue) and (hsbColor.Hue <= 190) then
          layerAlphaMod:=0;
      if layerAlphaMod>0 then
        begin
          r:=((r*(255-layerAlpha)) div 255)+((layerAlpha*rLayerColor) div 255);
          g:=((g*(255-layerAlpha)) div 255)+((layerAlpha*gLayerColor) div 255);
          b:=((b*(255-layerAlpha)) div 255)+((layerAlpha*bLayerColor) div 255);
        end;

//      resColor:=rgb(r,g,b);
      dstRColor:=r;
      dstGColor:=g;
      dstBColor:=b;
    end;


  if drawMethod=FalseColorMethod then
    begin
      tVal:=((tChValue+(tChBright shl 8))*tChContrast) div 25600;//256*100
      if tVal<0 then tVal:=0;
      if tVal>255 then tVal:=255;
      bVal:=((bChValue+(bChBright shl 8))*bChContrast) div 25600;
      if bVal<0 then bVal:=0;
      if bVal>255 then bVal:=255;
      r:=FalseColorMap[tVal,bVal,0];//[0] + (((rValue[0]*2-rValue[-1]-rValue[1]) * sharpness ) div 10);
      g:=FalseColorMap[tVal,bVal,1];//[0] + (((gValue[0]*2-gValue[-1]-gValue[1]) * sharpness ) div 10);
      b:=FalseColorMap[tVal,bVal,2];//[0] + (((bValue[0]*2-bValue[-1]-bValue[1]) * sharpness ) div 10);

      layerAlphaMod:=layerAlpha;
      rgbColor.R:=rLayerColor;
      rgbColor.G:=gLayerColor;
      rgbColor.B:=bLayerColor;
      hsbColor:=RGBToHSB(rgbColor);
      if hideHue.hide36 then
        if (30 < hsbColor.Hue) and (hsbColor.Hue <= 50) then
          layerAlphaMod:=0;
      if hideHue.hide60 then
        if (50 < hsbColor.Hue) and (hsbColor.Hue <= 70) then
          layerAlphaMod:=0;
      if hideHue.hide80 then
        if (70 < hsbColor.Hue) and (hsbColor.Hue <= 90) then
          layerAlphaMod:=0;
      if hideHue.hide120 then
        if (110 < hsbColor.Hue) and (hsbColor.Hue <= 130) then
          layerAlphaMod:=0;
      if hideHue.hide180 then
        if (170 < hsbColor.Hue) and (hsbColor.Hue <= 190) then
          layerAlphaMod:=0;
      if layerAlphaMod>0 then
        begin
          r:=((r*(255-layerAlpha)) div 255)+((layerAlpha*rLayerColor) div 255);
          g:=((g*(255-layerAlpha)) div 255)+((layerAlpha*gLayerColor) div 255);
          b:=((b*(255-layerAlpha)) div 255)+((layerAlpha*bLayerColor) div 255);
        end;

//      resColor:=rgb(r,g,b);
      dstRColor:=r;
      dstGColor:=g;
      dstBColor:=b;
    end;

  //CombineColors:=resColor;
end;


procedure TForm1.SetImageSize();
begin
  if image2FullSizeMode then
    begin
      image2.Width:=image2.Picture.Bitmap.Width;
      image2.Height:=image2.Picture.Bitmap.Height;
    end
   else
    begin
      image2.Width:=ScrollBox1.ClientWidth;
      if image2.Picture.Bitmap.Width>0 then
        begin
          image2.Height:=(image2.Width * image2.Picture.Bitmap.Height) div image2.Picture.Bitmap.Width;
        end
      else image2.Height:=ScrollBox1.ClientHeight;
    end;
end;

procedure makePathAndXYPos(xx,yy:double; zScale:byte; var {jpgpath,}pngpath:string; var hash:integer; var x,y:double);
//���������� ������� �������� ��������
var
//  jpgdir,pngdir:string;
//  filepath:string;
  tileX,tileY:integer;
  falseExit:bool;
begin
  //jpgdir:='E:\SAS.Planet.121010\cache\yasat\z7\0\';
  //pngdir:='E:\SAS.Planet.121010\cache\yahyb\z7\0\';
  tileX:=trunc(xx) div 256;
  tiley:=trunc(yy) div 256;
  hash:=tileX*tileY;
  falseExit:=false;
  if (tileX<0) or (tileX>=aWidaHei[zScale].tileLimits.X) or (tileY<0) or (tileY>=aWidaHei[zScale].tileLimits.Y) then
    falseExit:=true;
  if not falseExit then
    begin
      //J:\SAS.Planet.Release.121010\cache\yasat\z7\0\x5\0\y17.jpg
      //jpgpath:=jpgdir+'\z'+inttostr(zScale)+'\0\x'+inttostr(tileX)+'\0\y'+inttostr(tileY)+'.jpg';
      pngpath:=pngdir+'\z'+inttostr(zScale)+'\0\x'+inttostr(tileX)+'\0\y'+inttostr(tileY)+'.png';
      x:=xx-tileX*256;
      y:=yy-tileY*256;
    end
   else
    begin
      //jpgpath:=jpgdir+'\z'+inttostr(zScale)+'\0\x'+inttostr(0)+'\0\y'+inttostr(0)+'.jpg';
      pngpath:=pngdir+'\z'+inttostr(zScale)+'\0\x'+inttostr(0)+'\0\y'+inttostr(0)+'.png';
      x:=xx-tileX*256;
      y:=yy-tileY*256;
    end;
end;

function calcZScale_old(latitude:integer{; angle:integer}{; scaleZoom:bool}):byte;
var
 b:byte;
 i:byte;
begin
  b:=6;
  for i:=low(aWidaHei)+1 to high(aWidaHei) do
    begin
      //if ((-aWidaHei[i].threshold.high)<(latitude-90)) and ((latitude-90)<(-aWidaHei[i].threshold.low)) then
      //  b:=i;
      if (aWidaHei[i].threshold.low<=(latitude)) and ((latitude)<aWidaHei[i].threshold.high) then
        b:=i;
    end;
  //** ��� ���� �� ����������� ����� ����� if angle>thresholdAngle then b:=b-1;

  //if scaleZoom then b:=b-2;
  if b<5 then b:=5;

  calcZScale_old:=b;
end;

function calcZScale(latitude:double; scale:double; zScaleTilesCorrection:double):double;
var
 b:double;
 //i:byte;
 latitudeLength:double;//length of circle of latitude
begin
  latitudeLength:=cos(latitude*piDiv180) * scale;
  if latitudeLength>0.0078125 then
    begin
      b:={round}(Log2(latitudeLength*256)) + ( -zScaleTilesCorrection +5)/5;
      if b>10 then b:=10;
      if b<5 then b:=5;
    end
   else b:=5;

  calcZScale:=b;
end;


function F_SQRT_LineStyle(x:double):double;
//function make 2*x for {0; 0.5} and 1.0 for {0.5; 1}
var
  xx:double;
begin
  xx:=x*2;
  if xx>1 then xx:=1;
  F_SQRT_LineStyle:=xx;
end;


procedure TForm1.calcAWidAHei();
// ������� �������� ���� ��� Z-��������� ������ 5, 6, 7, ... 12,
//  � ����� ���� �� �������� � �������� �������� ����� (������ ������������)
var
 i:integer;
begin
  thresholdAngle:=TrackBar14.Position;
  for i:=low(aWidaHei) to high(aWidaHei) do
    begin
      if i=low(aWidaHei) then
        begin
          if i=4 then
            begin
              aWidaHei[i].pixelLimits.X:=8*256;
              aWidaHei[i].pixelLimits.Y:=8*256;
              aWidaHei[i].tileLimits.X:=8;
              aWidaHei[i].tileLimits.Y:=8;
              aWidaHei[i].threshold.low:=90;
              aWidaHei[i].threshold.high:=90;
            end;
        end
       else
        begin
          aWidaHei[i].pixelLimits.X:=aWidaHei[i-1].pixelLimits.X * 2;
          aWidaHei[i].pixelLimits.Y:=aWidaHei[i-1].pixelLimits.Y * 2;
          aWidaHei[i].tileLimits.X:=aWidaHei[i-1].tileLimits.X * 2;
          aWidaHei[i].tileLimits.Y:=aWidaHei[i-1].tileLimits.Y * 2;
          if i=6 then begin
              aWidaHei[i].threshold.low:=TrackBar8.Position;
              aWidaHei[i].threshold.high:=90;
            end;
          if i=7 then begin
              aWidaHei[i].threshold.low:=TrackBar9.Position;
              aWidaHei[i].threshold.high:=TrackBar8.Position;
            end;
          if i=8 then begin
              aWidaHei[i].threshold.low:=TrackBar10.Position;
              aWidaHei[i].threshold.high:=TrackBar9.Position;
            end;
          if i=9 then begin
              aWidaHei[i].threshold.low:=TrackBar11.Position;
              aWidaHei[i].threshold.high:=TrackBar10.Position;
            end;
          if i=10 then begin
              aWidaHei[i].threshold.low:=TrackBar12.Position;
              aWidaHei[i].threshold.high:=TrackBar11.Position;
            end;
          if i=11 then begin
              aWidaHei[i].threshold.low:=TrackBar13.Position;
              aWidaHei[i].threshold.high:=TrackBar12.Position;
            end;
          if i=12 then begin
              aWidaHei[i].threshold.low:=0;
              aWidaHei[i].threshold.high:=TrackBar13.Position;
            end;
        end;
    end;
end;

function findTile(filename:string; hash:integer):integer;
var
 i,j,res:integer;
 //readed:bool;
begin
  res:=-1;
  for i:=1 to tilesCount do
    begin
      if atiles[i].fileloaded then
        if atiles[i].addrHash=hash then
          begin
            if atiles[i].loadedJpgFilename=filename then
              begin
                res:=i;
                break;
              end;
            if atiles[i].loadedPngFilename=filename then
              begin
                res:=i;
                break;
              end;
          end;
    end;
  if res=-1 then
    begin
      atiles[tilesCount].png.Free();
      for i:= tilesCount downto 2 do
        begin
          atiles[i]:=atiles[i-1];
        end;
      //i:=random(tilesCount)+1;
      i:=1;
      res:=i;
      if FileExists(filename) then
        begin
          //readed:=false;
          try
            atiles[i].png:=TPNGObject.Create();
            atiles[i].png.LoadFromFile(filename);
            for j:=0 to 255 do
              atiles[i].aScanLine[j]:=atiles[i].png.Scanline[j];
            //atiles[i].png.RemoveTransparency();
            //Application.ProcessMessages();
          {
          if atiles[i].bitmap <> nil then atiles[i].bitmap.Free;
          atiles[i].bitmap:=TBitmap.Create();
          atiles[i].bitmap.Width:=256;
          atiles[i].bitmap.Height:=256;
          atiles[i].bitmap.Canvas.Brush.Color:=clBlack;
          atiles[i].bitmap.Canvas.FillRect(rect(0,0,256,256));
          }
 //***!!!!! atiles[i].bitmap.Assign(atiles[i].png);
            {
            atiles[i].bitmap.Canvas.pen.Color:=clYellow;
            atiles[i].bitmap.Canvas.pen.Width:=10;
            atiles[i].bitmap.Canvas.MoveTo(5,256);
            atiles[i].bitmap.Canvas.LineTo(5,5);
            atiles[i].bitmap.Canvas.LineTo(256,5);
            }{
            atiles[i].bitmap.Canvas.font.Color:=clwhite;
            atiles[i].bitmap.Canvas.TextOut(256-atiles[i].bitmap.Canvas.TextWidth(filename),0,filename);
            atiles[i].bitmap.Canvas.TextOut(256-atiles[i].bitmap.Canvas.TextWidth(filename),50,filename);
            atiles[i].bitmap.Canvas.TextOut(256-atiles[i].bitmap.Canvas.TextWidth(filename),100,filename);
            atiles[i].bitmap.Canvas.TextOut(256-atiles[i].bitmap.Canvas.TextWidth(filename),150,filename);
            atiles[i].bitmap.Canvas.TextOut(256-atiles[i].bitmap.Canvas.TextWidth(filename),200,filename);
            atiles[i].bitmap.Canvas.TextOut(256-atiles[i].bitmap.Canvas.TextWidth(filename),230,filename);
            }
            atiles[i].loadedPngFilename:=filename;
            atiles[i].addrHash:=hash;
            atiles[i].origin:='from file';
            atiles[i].fileLoaded:=true;
            //readed:=true;
          except
//       // MessageBox(0,'�� ��','��',0);
          end;
          {if not readed then
            try
              atiles[i].jpg.LoadFromFile(filename);
              //Application.ProcessMessages();
              atiles[i].bitmap.Assign(atiles[i].jpg);
              atiles[i].loadedJpgFilename:=filename;
              atiles[i].fileLoaded:=true;
              readed:=true;
            except
//       // MessageBox(0,'�� ��','��',0);
            end; }
        end
       else
        begin
          atiles[i].origin:='CreateBlank';
          atiles[i].fileLoaded:=true;
          //atiles[i].fileLoaded:=false;
          atiles[i].loadedPngFilename:=filename;
          atiles[i].addrHash:=hash;
          {
          if atiles[i].bitmap <> nil then atiles[i].bitmap.Free;
          atiles[i].bitmap:=TBitmap.Create();
          atiles[i].bitmap.Width:=256;
          atiles[i].bitmap.Height:=256;
          atiles[i].bitmap.Canvas.Brush.Color:=clBlack;
          atiles[i].bitmap.Canvas.FillRect(rect(0,0,256,256));
          }
          //if atiles[i].png <> nil then atiles[i].png.Free;
          //atiles[i].png:=TPNGObject.Create();
          atiles[i].png:=TPNGObject.CreateBlank(COLOR_RGBALPHA,4,256,256);
          atiles[i].png.Canvas.Brush.Color:=clBlack;
          atiles[i].png.Canvas.Brush.Style:=bsSolid;
          atiles[i].png.Canvas.FillRect(rect(0,0,256,256));
          for j:=0 to 255 do
            atiles[i].aScanLine[j]:=atiles[i].png.Scanline[j];
        end;
      //Application.ProcessMessages();
    end;
  findTile:=res;
end;

procedure TForm1.WriteIniFile();
var
 inif:TIniFile;
 path:string;
begin
  path:=ExtractFilePath(ParamStr(0))+'\config.ini';
  inif:=TIniFile.Create(path);

  inif.WriteString('TLE','filepath',edit2.Text);
  inif.WriteString('TLE','markerstring',edit5.Text+';');

  inif.WriteInteger('IMAGE','RotateLeftRight',TrackBar7.Position);
  inif.WriteInteger('IMAGE','MoveLeftRight',TrackBar24.Position);
  inif.WriteInteger('IMAGE','StepWidth',TrackBar25.Position);
  inif.WriteInteger('IMAGE','Method',PageControl2.ActivePageIndex);
  inif.WriteInteger('IMAGE NightMethod','LeftChannel',TrackBar1.Position);
  inif.WriteInteger('IMAGE NightMethod','RightChannel',TrackBar2.Position);
  inif.WriteInteger('IMAGE NightMethod','CloudShift',TrackBar4.Position);
  inif.WriteInteger('IMAGE NightMethod','CloudCompress',TrackBar5.Position);
  inif.WriteInteger('IMAGE RGBMethod','sharpness',TrackBar27.Position);
  inif.WriteInteger('IMAGE RGBMethod','rChannel',TrackBar21.Position);
  inif.WriteInteger('IMAGE RGBMethod','rBright',TrackBar15.Position);
  inif.WriteInteger('IMAGE RGBMethod','rContrast',TrackBar16.Position);
  inif.WriteInteger('IMAGE RGBMethod','gChannel',TrackBar22.Position);
  inif.WriteInteger('IMAGE RGBMethod','gBright',TrackBar17.Position);
  inif.WriteInteger('IMAGE RGBMethod','gContrast',TrackBar18.Position);
  inif.WriteInteger('IMAGE RGBMethod','bChannel',TrackBar23.Position);
  inif.WriteInteger('IMAGE RGBMethod','bBright',TrackBar19.Position);
  inif.WriteInteger('IMAGE RGBMethod','bContrast',TrackBar20.Position);
  inif.WriteInteger('IMAGE RGBMethod','TilesTransparency',TrackBar26.Position);
  inif.WriteInteger('IMAGE FCMethod','tChChannel',TrackBar29.Position);
  inif.WriteInteger('IMAGE FCMethod','tChBright',TrackBar30.Position);
  inif.WriteInteger('IMAGE FCMethod','tChContrast',TrackBar31.Position);
  inif.WriteInteger('IMAGE FCMethod','bChChannel',TrackBar32.Position);
  inif.WriteInteger('IMAGE FCMethod','bChBright',TrackBar33.Position);
  inif.WriteInteger('IMAGE FCMethod','bChContrast',TrackBar34.Position);
  inif.WriteString('IMAGE FCMethod','mapfilepath',edit6.Text);

  inif.WriteString('TILES','filepath',edit3.Text);
  inif.WriteInteger('TILES','z6',TrackBar8.Position);
  inif.WriteInteger('TILES','z7',TrackBar9.Position);
  inif.WriteInteger('TILES','z8',TrackBar10.Position);
  inif.WriteInteger('TILES','z9',TrackBar11.Position);
  inif.WriteInteger('TILES','z10',TrackBar12.Position);
  inif.WriteInteger('TILES','z11',TrackBar13.Position);
  inif.WriteInteger('TILES','maxangle',TrackBar14.Position);
  inif.WriteInteger('TILES','thresold',TrackBar36.Position);

  inif.WriteInteger('MSU','timezone',strtointdef(edit4.Text,0));
  inif.WriteString('MSU','filepath',edit1.Text);
  inif.WriteInteger('MSU Therapy','maxDeviation',TrackBar28.Position);
end;

procedure LoadFalseColorMap(filepath:string; image:TImage);
var
 i,j:integer;
 clr:TColor;
begin
  image.Picture.Bitmap.LoadFromFile(filepath);
  for i:=0 to 255 do
    for j:=0 to 255 do
      begin
        clr:=image.Picture.Bitmap.Canvas.Pixels[i,j];
        FalseColorMap[i,255-j,0]:=GetRValue(clr);
        FalseColorMap[i,255-j,1]:=GetGValue(clr);
        FalseColorMap[i,255-j,2]:=GetBValue(clr);
      end;
end;

procedure TForm1.ReadIniFile();
var
 inif:TIniFile;
 path:string;
begin
  path:=ExtractFilePath(ParamStr(0))+'\config.ini';
  inif:=TIniFile.Create(path);

//  inif.WriteString('TLE','filepath',edit2.Text);
  edit2.Text:=inif.ReadString('TLE','filepath','');
  edit5.Text:=inif.ReadString('TLE','markerstring','METEOR-M 2              ');
  edit5.Text:=copy(edit5.Text, 1,length(edit5.Text)-1);
  SpeedButton11Click(form1);

  TrackBar7.Position:=inif.ReadInteger('IMAGE','RotateLeftRight',0);
  TrackBar24.Position:=inif.ReadInteger('IMAGE','MoveLeftRight',0);
  TrackBar25.Position:=inif.ReadInteger('IMAGE','StepWidth',0);
  PageControl2.ActivePageIndex:=inif.ReadInteger('IMAGE','Method',0);
  TrackBar1.Position:=inif.ReadInteger('IMAGE NightMethod','LeftChannel',0);
  TrackBar2.Position:=inif.ReadInteger('IMAGE NightMethod','RightChannel',0);
  TrackBar4.Position:=inif.ReadInteger('IMAGE NightMethod','CloudShift',0);
  TrackBar5.Position:=inif.ReadInteger('IMAGE NightMethod','CloudCompress',100);
  TrackBar27.Position:=inif.ReadInteger('IMAGE RGBMethod','sharpness',0);
  TrackBar21.Position:=inif.ReadInteger('IMAGE RGBMethod','rChannel',0);
  TrackBar15.Position:=inif.ReadInteger('IMAGE RGBMethod','rBright',0);
  TrackBar16.Position:=inif.ReadInteger('IMAGE RGBMethod','rContrast',100);
  TrackBar22.Position:=inif.ReadInteger('IMAGE RGBMethod','gChannel',0);
  TrackBar17.Position:=inif.ReadInteger('IMAGE RGBMethod','gBright',0);
  TrackBar18.Position:=inif.ReadInteger('IMAGE RGBMethod','gContrast',100);
  TrackBar23.Position:=inif.ReadInteger('IMAGE RGBMethod','bChannel',0);
  TrackBar19.Position:=inif.ReadInteger('IMAGE RGBMethod','bBright',0);
  TrackBar20.Position:=inif.ReadInteger('IMAGE RGBMethod','bContrast',100);
  TrackBar26.Position:=inif.ReadInteger('IMAGE RGBMethod','TilesTransparency',100);
  TrackBar29.Position:=inif.ReadInteger('IMAGE FCMethod','tChChannel',5);
  TrackBar30.Position:=inif.ReadInteger('IMAGE FCMethod','tChBright',0);
  TrackBar31.Position:=inif.ReadInteger('IMAGE FCMethod','tChContrast',100);
  TrackBar32.Position:=inif.ReadInteger('IMAGE FCMethod','bChChannel',2);
  TrackBar33.Position:=inif.ReadInteger('IMAGE FCMethod','bChBright',0);
  TrackBar34.Position:=inif.ReadInteger('IMAGE FCMethod','bChContrast',100);
  edit6.Text:=inif.ReadString('IMAGE FCMethod','mapfilepath','');
//  if edit6.Text<>'' then
      try
        LoadFalseColorMap(edit6.Text,image6);
      except
        MessageBox(0,'Please set FalseColor map file','Attention!',0);
      end;

  edit3.Text:=inif.ReadString('TILES','filepath','');
  TrackBar8.Position:=inif.ReadInteger('TILES','z6',60);
  TrackBar9.Position:=inif.ReadInteger('TILES','z7',40);
  TrackBar10.Position:=inif.ReadInteger('TILES','z8',20);
  TrackBar11.Position:=inif.ReadInteger('TILES','z9',0);
  TrackBar12.Position:=inif.ReadInteger('TILES','z10',0);
  TrackBar13.Position:=inif.ReadInteger('TILES','z11',0);
  TrackBar14.Position:=inif.ReadInteger('TILES','maxangle',45);
  TrackBar36.Position:=inif.ReadInteger('TILES','thresold',5);

  edit4.Text:=inttostr(inif.ReadInteger('MSU','timezone',0));
  edit1.Text:=inif.ReadString('MSU','filepath','');
  if edit1.Text<>'' then
    begin
      SpeedButton3.Enabled:=true;
      ProcessMSUFileName();
    end;
  TrackBar28.Position:=inif.ReadInteger('MSU Therapy','maxDeviation',0);
end;


function calcAngle(sat_gd_this, sat_gd_next:vector):double;
var
 zScaleXX_this,zScaleYY_this, zScaleXX_next,zScaleYY_next:double;
 zScale:byte;
 angle:double;
begin
  zScale:=6;//any number simple like const
  zScaleXX_this:=DolgotaToX(Degrees(sat_gd_this[2]),aWidaHei[zScale].pixelLimits.X);
  zScaleYY_this:=ShirotaToY(sat_gd_this[1],aWidaHei[zScale].pixelLimits.Y);
  zScaleXX_next:=DolgotaToX(Degrees(sat_gd_next[2]),aWidaHei[zScale].pixelLimits.X);
  zScaleYY_next:=ShirotaToY(sat_gd_next[1],aWidaHei[zScale].pixelLimits.Y);

  angle:=arctan((zScaleYY_next-zScaleYY_this)/(zScaleXX_next-zScaleXX_this))*piIn180;
  calcAngle:=angle;
end;

procedure getLayerColor(pngFilename:string; hash:integer; xInTile,yInTile:double; var alpha:byte; var rColor,gColor,bColor:byte; showTilesBorder:bool; tilesTransparency:single);
var
  x0,y0,x1,y1:integer;
  xp,yp:double;
  //bitmap:TBitmap;
  tileIndex:integer;
  color00,color01,color10,color11:TColor;
  color00r,color00g,color00b:byte;
  r,g,b,alps:single;
  ri,gi,bi,alpi:integer;
begin
  x0:=trunc(xInTile);
  y0:=trunc(yInTile);
  x1:=x0+1;
  y1:=y0+1;
  xp:=xInTile-x0;
  yp:=yInTile-y0;
  if x1>255 then
    begin
      x1:=255;
      xp:=0;
    end;
  if y1>255 then
    begin
      y1:=255;
      yp:=0;
    end;

  tileIndex:=findTile(pngFilename, hash);
//  bitmap:=atiles[tileIndex].bitmap;
  {
  color00:=atiles[tileIndex].bitmap.Canvas.Pixels[x0,y0];
  color01:=atiles[tileIndex].bitmap.Canvas.Pixels[x0,y1];
  color10:=atiles[tileIndex].bitmap.Canvas.Pixels[x1,y0];
  color11:=atiles[tileIndex].bitmap.Canvas.Pixels[x1,y1];
  }

  alps:=   0+(1-xp)*(1-yp)*atiles[tileIndex].png.AlphaScanline[y0][x0];
  alps:=alps+( xp )*(1-yp)*atiles[tileIndex].png.AlphaScanline[y0][x1];
  alps:=alps+(1-xp)*( yp )*atiles[tileIndex].png.AlphaScanline[y1][x0];
  alps:=alps+( xp )*( yp )*atiles[tileIndex].png.AlphaScanline[y1][x1];
  alps:=alps*tilesTransparency;
  alpi:=round(alps);
  if alpi<0 then alpi:=0;
  if alpi>255 then alpi:=255;

  if showTilesBorder then
    if (x0=0) or (x0=255)or (y0=0) or (y0=255) then
      if alpi=0 then alpi:=96;

  if alpi>0 then
    begin

      r:=0+(1-xp)*(1-yp)*pbytearray(atiles[tileIndex].aScanLine[y0])[x0*3+2];
      r:=r+(1-xp)*( yp )*pbytearray(atiles[tileIndex].aScanLine[y1])[x0*3+2];
      r:=r+( xp )*(1-yp)*pbytearray(atiles[tileIndex].aScanLine[y0])[x1*3+2];
      r:=r+( xp )*( yp )*pbytearray(atiles[tileIndex].aScanLine[y1])[x1*3+2];
      ri:=round(r);
      if ri<0 then ri:=0;
      if ri>255 then ri:=255;

      g:=0+(1-xp)*(1-yp)*pbytearray(atiles[tileIndex].aScanLine[y0])[x0*3+1];
      g:=g+(1-xp)*( yp )*pbytearray(atiles[tileIndex].aScanLine[y1])[x0*3+1];
      g:=g+( xp )*(1-yp)*pbytearray(atiles[tileIndex].aScanLine[y0])[x1*3+1];
      g:=g+( xp )*( yp )*pbytearray(atiles[tileIndex].aScanLine[y1])[x1*3+1];
      gi:=round(g);
      if gi<0 then gi:=0;
      if gi>255 then gi:=255;

      b:=0+(1-xp)*(1-yp)*pbytearray(atiles[tileIndex].aScanLine[y0])[x0*3+0];
      b:=b+(1-xp)*( yp )*pbytearray(atiles[tileIndex].aScanLine[y1])[x0*3+0];
      b:=b+( xp )*(1-yp)*pbytearray(atiles[tileIndex].aScanLine[y0])[x1*3+0];
      b:=b+( xp )*( yp )*pbytearray(atiles[tileIndex].aScanLine[y1])[x1*3+0];
      bi:=round(b);
      if bi<0 then bi:=0;
      if bi>255 then bi:=255;

{
      rgbColor.R:=0;
      rgbColor.G:=127;
      rgbColor.B:=0;
      hsbColor:=RGBToHSB(rgbColor);
      if (0 < hsbColor.Hue) and (hsbColor.Hue < 360) then
        alpi:=0;
}
    end
   else
    begin
      ri:=0;
      gi:=0;
      bi:=0;
    end;

  alpha:=alpi;
  rColor:=ri;
  gColor:=gi;
  bColor:=bi;
  //color:=rgb(ri,gi,bi);
end;

procedure TForm1.ProcessMSUFileName();
var
 fn:string;
 year,month,day,hour,minute,second,msec:word;
begin
      fn:=ExtractFileName(edit1.Text);
      if length(fn)=42 then
        begin
          label2.Caption:=fn[17]+fn[18];
          label4.Caption:=fn[19]+fn[20];
          label6.Caption:=fn[21]+fn[22]+fn[23]+fn[24];
          label8.Caption:=fn[26]+fn[27];
          label10.Caption:=fn[28]+fn[29];
          label12.Caption:=fn[30]+fn[31];

          year:=StrToInt(label6.Caption);
          month:=StrToInt(label4.Caption);
          day:=StrToInt(label2.Caption);
          hour:=StrToInt(label8.Caption);
          minute:=StrToInt(label10.Caption);
          second:=StrToInt(label12.Caption);
          msec:=0;
          dtFromMSUFileName:=EncodeDateTime(year,month,day,hour,minute,second,msec);

          dtFromMSUFileName:=IncHour(dtFromMSUFileName,-StrToIntDef(edit4.Text,0));

          DecodeDateTime(dtFromMSUFileName,year,month,day,hour,minute,second,msec);
          label15.Caption:=IntToStrFixWidth(day,2);
          label16.Caption:=IntToStrFixWidth(month,2);
          label17.Caption:=IntToStrFixWidth(year,4);
          label18.Caption:=IntToStrFixWidth(hour,2);
          label19.Caption:=IntToStrFixWidth(minute,2);
          label20.Caption:=IntToStrFixWidth(second,2);

          speedbutton3.Enabled:=true;
        end;
end;


function GetSharpnessPixel(channel:byte; row:integer; col:integer; sharpness:integer):integer;
var
 i,j:integer;
 res:integer;
begin
  res:=0;
  if (0<=col) and (col < length(MSUFullStruct.MSUChannelsData[Channel][row].pixels)) then
    if sharpness <> 0 then
      begin
        if (col>1) and (col<MSUVideoChannelLen16bit-1) and (row>1) and (row<MSUFullStruct.MSULinesInFile-1) then
          begin
            for i:=-1 to 1 do
              for j:=-1 to 1 do
                begin
                  if (i+j=1) or (i+j=-1) then
                    res:=res + MSUFullStruct.MSUChannelsData[Channel][row+i].pixels[col+j];
                  if ((i=-1) and (j=-1)) or ((i=-1) and (j=1)) or ((i=1) and (j=-1)) or ((i=1) and (j=1)) then
                    res:=res + ((MSUFullStruct.MSUChannelsData[Channel][row+i].pixels[col+j] * 10) div 14);
                end;
            res:= MSUFullStruct.MSUChannelsData[Channel][row].pixels[col] + (((((((MSUFullStruct.MSUChannelsData[Channel][row].pixels[col] * 96) div 14) - res) * 14) div 96) * sharpness) div 10);
          end
         else
          begin
            res:=MSUFullStruct.MSUChannelsData[Channel][row].pixels[col];
          end;
      end
     else
      begin
        res:=MSUFullStruct.MSUChannelsData[Channel][row].pixels[col];
      end;
  GetSharpnessPixel:=res;
end;

procedure RepairBrokenPixel(channel:byte; row:integer; col:integer; wide:integer);
label healthy;
var
 i,j:integer;
 thisValue,minValue,maxValue,minSecondValue,maxSecondValue:word;
 midValue:integer;
 aBitEffect:array [-1..7] of word; //-1 corresponds no bit change
 aBit:array [-1..7] of word; //-1 corresponds no bit change
 optimumBitChange, dispersBit:Shortint;
begin
  thisValue:=MSUFullStruct.MSUChannelsData[Channel][row].pixels[col];

  if (col>wide) and (col<MSUVideoChannelLen16bit-wide) and (row>wide) and (row<MSUFullStruct.MSULinesInFile-wide) then
    begin
      aBit[-1]:=0; //-1 corresponds no bit change
      aBit[0]:=$0100;
      aBit[1]:=$0200;
      aBit[2]:=$0400;
      aBit[3]:=$0800;
      aBit[4]:=$1000;
      aBit[5]:=$2000;
      aBit[6]:=$4000;
      aBit[7]:=$8000;
      minValue:=65535;
      minSecondValue:=65535;
      maxValue:=0;
      maxSecondValue:=0;
      midValue:=0;
      for i:=-wide to wide do
        for j:=-wide to wide do
          begin
            if (i <> 0) or (j <> 0) then //not this pixel
              begin
                midValue:=midValue+MSUFullStruct.MSUChannelsData[Channel][row+i].pixels[col+j];
                if minValue > MSUFullStruct.MSUChannelsData[Channel][row+i].pixels[col+j] then
                  begin
                    minSecondValue:=minValue;
                    minValue := MSUFullStruct.MSUChannelsData[Channel][row+i].pixels[col+j];
                  end
                 else
                   begin
                     if minSecondValue > MSUFullStruct.MSUChannelsData[Channel][row+i].pixels[col+j] then
                       begin
                         minSecondValue := MSUFullStruct.MSUChannelsData[Channel][row+i].pixels[col+j];
                       end;
                   end;
                if maxValue < MSUFullStruct.MSUChannelsData[Channel][row+i].pixels[col+j] then
                  begin
                    maxSecondValue:=maxValue;
                    maxValue := MSUFullStruct.MSUChannelsData[Channel][row+i].pixels[col+j];
                  end
                 else
                  begin
                    if maxSecondValue < MSUFullStruct.MSUChannelsData[Channel][row+i].pixels[col+j] then
                      begin
                        maxSecondValue := MSUFullStruct.MSUChannelsData[Channel][row+i].pixels[col+j];
                      end;
                  end;
              end;
          end;
      midValue:=(midValue-minValue-minSecondValue-maxValue-maxSecondValue) div (((wide+1+wide)*(wide+1+wide)-1)-4);
      dispersBit:=7;
      for i:=0 to 7 do
        if (maxSecondValue-minSecondValue)>aBit[i] then dispersBit:=i+2;
//      if (thisValue < minValue-maxDeviation) or (thisValue > maxValue+maxDeviation) then
      if (thisValue < minValue) or (thisValue > maxValue) then
//        if not ((thisValue > minValue-maxDeviation) or (thisValue < maxValue+maxDeviation)) then
          begin
          //therapy
            aBitEffect[-1]:=abs(thisValue - midValue); //-1 corresponds no bit change
{            aBitEffect[0]:=abs((thisValue xor $0100) - midValue);
            aBitEffect[1]:=abs((thisValue xor $0200) - midValue);
            aBitEffect[2]:=abs((thisValue xor $0400) - midValue);
            aBitEffect[3]:=abs((thisValue xor $0800) - midValue);
            aBitEffect[4]:=abs((thisValue xor $1000) - midValue);
            aBitEffect[5]:=abs((thisValue xor $2000) - midValue);
            aBitEffect[6]:=abs((thisValue xor $4000) - midValue);
            aBitEffect[7]:=;}
            optimumBitChange:=-1;
            for i:= dispersBit to 7 do
              begin
                aBitEffect[i]:=abs((thisValue xor aBit[i]) - midValue);
              end;
            for i:= dispersBit to 7 do
              begin
                if aBitEffect[i]<aBitEffect[optimumBitChange] then
                  optimumBitChange:=i;
              end;
            thisValue:=(thisValue xor aBit[optimumBitChange]);
            //if optimumBitChange>=0 then thisValue:=$ffff;
            {
            if (((thisValue xor $0100) >= minValue-maxDeviation) and ((thisValue xor $0100) <= maxValue+maxDeviation)) then begin thisValue:=(thisValue xor $0100); goto healthy end;
            if (((thisValue xor $0200) >= minValue-maxDeviation) and ((thisValue xor $0200) <= maxValue+maxDeviation)) then begin thisValue:=(thisValue xor $0200); goto healthy end;
            if (((thisValue xor $0400) >= minValue-maxDeviation) and ((thisValue xor $0400) <= maxValue+maxDeviation)) then begin thisValue:=(thisValue xor $0400); goto healthy end;
            if (((thisValue xor $0800) >= minValue-maxDeviation) and ((thisValue xor $0800) <= maxValue+maxDeviation)) then begin thisValue:=(thisValue xor $0800); goto healthy end;
            if (((thisValue xor $1000) >= minValue-maxDeviation) and ((thisValue xor $1000) <= maxValue+maxDeviation)) then begin thisValue:=(thisValue xor $1000); goto healthy end;
            if (((thisValue xor $2000) >= minValue-maxDeviation) and ((thisValue xor $2000) <= maxValue+maxDeviation)) then begin thisValue:=(thisValue xor $2000); goto healthy end;
            if (((thisValue xor $4000) >= minValue-maxDeviation) and ((thisValue xor $4000) <= maxValue+maxDeviation)) then begin thisValue:=(thisValue xor $4000); goto healthy end;
            if (((thisValue xor $8000) >= minValue-maxDeviation) and ((thisValue xor $8000) <= maxValue+maxDeviation)) then begin thisValue:=(thisValue xor $8000); goto healthy end;
            }
          end;
healthy:
      MSUFullStruct.MSUChannelsData[Channel][row].pixels[col]:=thisValue;
    end;
end;



procedure TForm1.Image7Draw();
var
 i,j:integer;
 dataLinesInImage7StretchRow:integer;
 rowLimit:integer;
 pImageScanLine : PByteArray;
begin
  SetImgBitmapFormat(Image7,MSUVideoChannelLen16bit,MSUFullStruct.MSULinesInFile);
  for i:=0 to MSUFullStruct.MSULinesInFile-1 do
    begin
      pImageScanLine:=Image7.Picture.Bitmap.ScanLine[i];
      FillRGBArray16bit(pImageScanLine,MSUFullStruct.MSUChannelsData[0][i],MSUFullStruct.MSUChannelsData[2][i],MSUFullStruct.MSUChannelsData[4][i],MSUVideoChannelLen16bit, $07, 10);
    end;

  //** ��������� ����� ����� �������� ������, ������� ������ �������������
  dataLinesInImage7StretchRow:=Image7.Picture.Bitmap.Height div Image7.Height;
  rowLimit:=MSUFullStruct.MSULastLineInFileUserWant + (2 * dataLinesInImage7StretchRow);
  if rowLimit > (MSUFullStruct.MSULinesInFile-1) then rowLimit := (MSUFullStruct.MSULinesInFile-1);
  for i:=MSUFullStruct.MSULastLineInFileUserWant+1 to rowLimit do
    begin
      pImageScanLine:=Image7.Picture.Bitmap.ScanLine[i];
      for j:= 0 to (Image7.Picture.Bitmap.Width*3)-1 do
        begin
          pImageScanLine[j]:=round((sin(j/220)+1)*127);
        end;
    end;   
  image7.Repaint();
  label104.Caption:='����� '+IntToStr(MSUFullStruct.MSULinesInFile)+' �����, ������� '+IntToStr(MSUFullStruct.MSULastLineInFileUserWant+1);

end;




//***************                ***************//
//************** FORM1 procedures **************//
//***************                ***************//




procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  od1.FileName:=edit1.Text;
  if od1.Execute then
    begin
      edit1.Text:=od1.FileName;
//      edit2.Text:=ChangeFileExt(edit1.Text,'.MN2');
      //edit2.Text:=edit1.Text+'.dat';
      ProcessMSUFileName();

    end;
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
var
// MSUChannelLine:TMSUChannelLine;


 fnMSU:string;
 fMSU:file;
 MSUfilesize:integer;

 pMSUFromFile:PByteArray;
 pMSU10to16:PWordArray;

 i,j:integer;
 pos:integer;
 iLine:integer;
 MSUReadPlan,MSUReaded:integer;
 pChannelVideoLine : PWordArray;

 //calibr:PCalibration;
 //a6images:array[0..5] of TImage;

 pImageScanLine : PByteArray;
 dtLast:TDateTime;
 dtErrorCounter, dtWOErrorCounter, catchErrorCounter:integer;   //dtErrorCounter - ���������� ������ ������ , catchErrorCounter - ���������� ������� ����� ������
 dtCatched:bool;

 sat_gd:vector;
 mapY,mapY_prev:integer;
begin
  fnMSU:=edit1.Text;

  if FileExists(fnMSU) then
    begin

      speedbutton6.Enabled:=false;
      screen.Cursor:=crHourGlass;
      Application.ProcessMessages();


      FileMode := 0;  {Set file access to read only }

      AssignFile(fMSU,fnMSU);
      Reset(fMSU,1);
      MSUfilesize:=FileSize(fMSU);
      //image1.Picture.Bitmap.Height:=MSUfilesize div 11850;

      MSUFullStruct.MSULinesInFile:=MSUfilesize div MSUFrameLen;
      for i:=0 to ChannelsCount-1 do
        begin
            SetLength(MSUFullStruct.MSUChannelsData[i],MSUFullStruct.MSULinesInFile);
            for j:=0 to MSUFullStruct.MSULinesInFile-1 do
              begin
                SetLength(MSUFullStruct.MSUChannelsData[i][j].pixels,MSUVideoChannelLen16bit);
              end;
        end;
      SetLength(MSUFullStruct.MSUVectorData,MSUFullStruct.MSULinesInFile);
      for j:=0 to MSUFullStruct.MSULinesInFile-1 do
        begin
          SetLength(MSUFullStruct.MSUVectorData[j].aVectorValue,MSUVideoChannelLen16bit);
          for i:=0 to MSUVideoChannelLen16bit-1 do
            MSUFullStruct.MSUVectorData[j].aVectorValue[i].valueExists:=false;
        end;

      GetMem(pMSUFromFile,MSUFrameLen);
      GetMem(pMSU10to16,MSUVideoLen*sizeof(pMSU10to16[0]));
      //GetMem(pChannelVideoLine, MSUVideoChannelLen16bit*sizeof(pChannelVideoLine[0])); // ������ ������� ������� ����� ��������� ��� ���������, ����� ��� ����

      iLine:=0;
      dtErrorCounter:=0;
      dtCatched:=false;
      memo1.Lines.Clear();
      MSUFullStruct.timeIncrementer:=0;

      sat_data[1][1]:=memo2.Lines[0];
      sat_data[1][2]:=memo2.Lines[1];
      Convert_Satellite_Data(1);

      ProgressBar1.Position:=0;
      ProgressBar1.Max:=MSUFullStruct.MSULinesInFile;
      repeat
        //if iLine= MSULinesInFile then
        //  MessageBox(0,'','',0);
        MSUReadPlan:=MSUFrameLen;
        BlockRead(fMSU,pMSUFromFile[0],MSUReadPlan,MSUReaded);
        if MSUReaded<>MSUReadPlan then break;

        pos:=MSUVideoStart;

        up10to16bits(pMSUFromFile,pMSU10to16,pos,0,MSUVideoLen);
        for i:= 0 to ChannelsCount-1 do
          begin
            ExtractChannel16bit(pMSU10to16,MSUFullStruct.MSUChannelsData[i][iLine],MSUVideoLen16bit,i);
          end;
        if catchErrorCounter> 21 then
          begin
            dtCatched:=false;
            //catchErrorCounter:=0;
          end;
        dtLast:=ExtractTimeOfLine(pMSUFromFile,dtFromMSUFileName,dtLast, true, dtErrorCounter, dtWOErrorCounter, catchErrorCounter, dtCatched);
        //memo1.Lines.Add('msec: '+IntToStr(MilliSecondOf(dtLast))+' caErrCnt: '+IntToStr(catchErrorCounter));
        MSUFullStruct.MSUVectorData[iLine].datetime:=dtLast;
        MSUFullStruct.MSUVectorData[iLine].timeset:=ToTimeSet(dtLast);
        MSUFullStruct.MSUVectorData[iLine].jtime:=Julian_Date(MSUFullStruct.MSUVectorData[iLine].timeset);


        getLatLonAltPlusOrtoVector(MSUFullStruct.MSUVectorData[iLine].jtime,0,sat_gd);
        MSUFullStruct.sat_gd:=sat_gd;
        mapY:=round(ShirotaToY({Degrees}(sat_gd[1]),1000));
        if iLine>0 then
          begin
            if mapY > mapY_prev then
              begin
                MSUFullStruct.timeIncrementer:=MSUFullStruct.timeIncrementer+1;
              end;
            if mapY < mapY_prev then
              begin
                MSUFullStruct.timeIncrementer:=MSUFullStruct.timeIncrementer-1;
              end;
          end;
        mapY_prev:=mapY;
        iLine:=iLine+1;
        if iLine mod 100 = 0 then
          begin
            ProgressBar1.Position:=iLine;
            Application.ProcessMessages();
          end;

      until MSUReaded<>MSUReadPlan;
      ProgressBar1.Position:=0;

      CloseFile(fMSU);

      FreeMem(pMSUFromFile);
      FreeMem(pMSU10to16);
      {
      SetImgBitmapFormat(Image1,MSUVideoChannelLen16bit,MSUFullStruct.MSULinesInFile);
      //MessageBox(0,'','',0);
      for i:=0 to MSUFullStruct.MSULinesInFile-1 do
        begin
          pImageScanLine:=Image1.Picture.Bitmap.ScanLine[i];
//////      FillRGBArray16bit(pImageScanLine,MSUFullStruct.MSUChannelsData[3][i],MSUFullStruct.MSUChannelsData[3][i],MSUFullStruct.MSUChannelsData[3][i],MSUVideoChannelLen16bit, $07, 10); // ������������� ����� ����� �� ���� /2 � � ��������� 3� ������� ����
          FillRGBArray16bit(pImageScanLine,MSUFullStruct.MSUChannelsData[4][i],MSUFullStruct.MSUChannelsData[4][i],MSUFullStruct.MSUChannelsData[4][i],MSUVideoChannelLen16bit, $07, 10); // ������������� ����� ����� �� ���� /2 � � ��������� 3� ������� ����
        end;
      image1.Repaint(); }
      memo1.Lines.add('dtErrorCounter: '+IntToStr(dtErrorCounter));


      MSUFullStruct.MSULastLineInFileUserWant:=MSUFullStruct.MSULinesInFile-1;
      MSUFullStruct.NightUserCalibrFirstLine:=127;
      MSUFullStruct.NightUserCalibrLastLine:=127;
      Image7Draw();

      SpeedButton7Click(Sender);    //��������� ����� �������� �� ������� Night Method
      SpeedButton10Click(Sender);   //��������� ������ �������� �� ������� Night Method


      speedbutton6.Enabled:=true;
      speedbutton7.Enabled:=true;
      speedbutton10.Enabled:=true;
      speedbutton14.Enabled:=true;

      screen.Cursor:=crDefault;
    end
  else
    begin
      MessageBox(form1.Handle,'File not found!','Error',0);
    end;
{
  ������ ������ ���

  ProgressBar1.Max:=MSUfilesize div MSULen;

  GetMem(pMSUFromFile,MSULen);
  GetMem(pMSU10to16,MSULen*sizeof(pMSU10to16[0]));
  GetMem(pCalibr10to16,MSUCalibrLen*sizeof(pCalibr10to16[0]));
  GetMem(calibr, MSUCalibrLen * sizeof(calibr[0]) );
  GetMem(pChannelVideoLine,(MSUVideoLen16bit*sizeof(pChannelVideoLine[0])) div ChannelsCount); // ������ ������� ������� ����� ��������� ��� ���������, ����� ��� ����


  GetMem(pHSBLine_H,(MSUVideoLen16bit*sizeof(pHSBLine_H[0])) div ChannelsCount); // ������ ������� ������� ����� ��������� ��� ���������, ����� ��� ����
  GetMem(pHSBLine_S,(MSUVideoLen16bit*sizeof(pHSBLine_S[0])) div ChannelsCount); // ������ ������� ������� ����� ��������� ��� ���������, ����� ��� ����
  GetMem(pHSBLine_B,(MSUVideoLen16bit*sizeof(pHSBLine_B[0])) div ChannelsCount); // ������ ������� ������� ����� ��������� ��� ���������, ����� ��� ����

  report:='';
  reportpart:='';

// ���� 1 - ����������
  if not calibration16bitExecuted then
  begin
  panel2.Visible:=true;

  iTransport:=0;
  CalibrationProFirstStepInit16bit();
  repeat
    MSUReadPlan:=MSUVideoLen;
    BlockRead(fMSU,pMSUFromFile[0],MSUReadPlan,MSUReaded);
    if MSUReaded<>MSUReadPlan then break;

    pos:=MSUCalibrStart;

    up10to16bits(pMSUFromFile,pCalibr10to16,pos,0,MSUCalibrLen);
    calibr[0,1]:=pCalibr10to16[0];
    calibr[0,0]:=pCalibr10to16[1];
    calibr[1,1]:=pCalibr10to16[2];
    calibr[1,0]:=pCalibr10to16[3];
    calibr[2,1]:=pCalibr10to16[4];
    calibr[2,0]:=pCalibr10to16[5];

    calibr[3,0]:=pCalibr10to16[6];
    calibr[3,1]:=pCalibr10to16[7];
    calibr[4,0]:=pCalibr10to16[8];
    calibr[4,1]:=pCalibr10to16[9];
    calibr[5,0]:=pCalibr10to16[10];
    calibr[5,1]:=pCalibr10to16[11];


    pos:=MSUVideoStart;

    up10to16bits(pMSUFromFile,pMSU10to16,pos,0,MSUVideoLen);

    for i:= 0 to ChannelsCount-1 do
      begin
        ExtractChannel16bit(pMSU10to16,pChannelVideoLine,MSUVideoLen16bit,i);
        CalibrationProFirstStep16bit(pChannelVideoLine, MSUVideoLen16bit div ChannelsCount, i);
      end;

    if length(reportpart)>10000 then
      begin
        report:=report+reportpart;
        reportpart:='';
      end;


    iTransport:=iTransport+1;
    if (iTransport mod 50) = 0 then
      begin
        ProgressBar1.Position:=iTransport;
        panel2.Visible:=not panel2.Visible;
      end;
    Application.ProcessMessages();
  until MSUReaded<>MSUReadPlan;
  CalibrationProFirstStepFinish16bit();
  calibration16bitExecuted:=true;
  panel2.Visible:=false;
  end;

// ���� 2 - ���������

  Seek(fMSU,0);
  iTransport:=0;
  rChannel:=strtointdef(edit5.Text,1) - 1;
  gChannel:=strtointdef(edit6.Text,2) - 1;
  bChannel:=strtointdef(edit7.Text,1) - 1;
  rBright:=TrackBar1.Position;
  gBright:=TrackBar2.Position;
  bBright:=TrackBar3.Position;

  hsbHChannel:=strtointdef(edit8.Text,4) - 1;
  hsbSChannel:=strtointdef(edit9.Text,1) - 1;
  hsbBChannel:=strtointdef(edit11.Text,1) - 1;
  hsbHueShift:=TrackBar4.Position;
  hsbHueRange:=TrackBar5.Position*10;
  hsbSaturShift:=(TrackBar6.Position*2) - 65535;
  hsbSaturRange:=TrackBar7.Position*10;
  hsbBright:=TrackBar8.Position*10;
  hsbHueInvert:=CheckBox1.Checked;
  hsbSaturInvert:=CheckBox2.Checked;

  a6images[0]:=image1;
  a6images[1]:=image2;
  a6images[2]:=image3;
  a6images[3]:=image4;
  a6images[4]:=image5;
  a6images[5]:=image6;

  repeat

    MSUReadPlan:=MSULen;
    BlockRead(fMSU,pMSUFromFile[0],MSUReadPlan,MSUReaded);
    if MSUReaded<>MSUReadPlan then break;

    pos:=MSUCalibrStart;

    up10to16bits(pMSUFromFile,pCalibr10to16,pos,0,MSUCalibrLen);
    calibr[0,1]:=pCalibr10to16[0];
    calibr[0,0]:=pCalibr10to16[1];
    calibr[1,1]:=pCalibr10to16[2];
    calibr[1,0]:=pCalibr10to16[3];
    calibr[2,1]:=pCalibr10to16[4];
    calibr[2,0]:=pCalibr10to16[5];

    calibr[3,0]:=pCalibr10to16[6];
    calibr[3,1]:=pCalibr10to16[7];
    calibr[4,0]:=pCalibr10to16[8];
    calibr[4,1]:=pCalibr10to16[9];
    calibr[5,0]:=pCalibr10to16[10];
    calibr[5,1]:=pCalibr10to16[11];

    pos:=MSUVideoStart;

    up10to16bits(pMSUFromFile,pMSU10to16,pos,0,MSUVideoLen);

    p7:=image7.Picture.Bitmap.ScanLine[iTransport];
    p8:=image8.Picture.Bitmap.ScanLine[iTransport];
    p9:=image9.Picture.Bitmap.ScanLine[iTransport];
    p10:=image10.Picture.Bitmap.ScanLine[iTransport];

    for i:= 0 to ChannelsCount-1 do
      begin
        pScanLine:=a6images[i].Picture.Bitmap.ScanLine[iTransport];

        ExtractChannel16bit(pMSU10to16,pChannelVideoLine,MSUVideoLen16bit,i);

        if i=hsbHChannel then
          begin
            for j:=0 to MSUVideoChannelLen16bit-1 do
              begin
                tmpHue:=pChannelVideoLine[j];
                if hsbHueInvert then tmpHue:=65535-tmpHue;
                tmpHue:=AddIn65536((tmpHue*hsbHueRange) div 100, hsbHueShift-32768);
                pHSBLine_H[j]:=tmpHue;
              end;
          end;

        CalibrationPro16bit(pChannelVideoLine, MSUVideoLen16bit div 6, i);


        if i=hsbSChannel then
          begin
            for j:=0 to MSUVideoChannelLen16bit-1 do
              begin
                tmpSatur:=pChannelVideoLine[j];
                if hsbSaturInvert then tmpSatur:=65535-tmpSatur;
                tmpSatur:=tmpSatur + hsbSaturShift;
                tmpSatur:=((tmpSatur*hsbSaturRange) div 100);
                if tmpSatur<0 then tmpSatur:=0;
                if tmpSatur>65535 then tmpSatur:=65535;
                pHSBLine_S[j]:=tmpSatur;
              end;
          end;

        if i=hsbBChannel then
          begin
            CopyMemory(pHSBLine_B,pChannelVideoLine,MSUVideoChannelLen16bit * 2);
          end;

        FillRGBArray16bit(pScanLine,pChannelVideoLine,pChannelVideoLine,pChannelVideoLine,MSUVideoChannelLen16bit, $07, 10); // ������������� ����� ����� �� ���� /2 � � ��������� 3� ������� ����

        if i=rChannel then
          FillRGBArray16bit(p7,pChannelVideoLine,pChannelVideoLine,pChannelVideoLine,MSUVideoChannelLen16bit, $01, rBright);
        if i=gChannel then
          FillRGBArray16bit(p7,pChannelVideoLine,pChannelVideoLine,pChannelVideoLine,MSUVideoChannelLen16bit, $02, gBright);
        if i=bChannel then
          FillRGBArray16bit(p7,pChannelVideoLine,pChannelVideoLine,pChannelVideoLine,MSUVideoChannelLen16bit, $04, bBright);

        if i=0 then
          begin

          end;
        if i=3 then
          begin

          end;

        FillRGBArray16bit(p9,pHSBLine_H,pHSBLine_H,pHSBLine_H,MSUVideoChannelLen16bit, $07, 10); // ������������� ����� ����� �� ���� /2 � � ��������� 3� ������� ����
        FillRGBArray16bit(p10,pHSBLine_S,pHSBLine_S,pHSBLine_S,MSUVideoChannelLen16bit, $07, 10); // ������������� ����� ����� �� ���� /2 � � ��������� 3� ������� ����

      end;


    for i:=0 to MSUVideoChannelLen16bit-1 do
      begin
        tmpColor:=HSVtoRGB(pHSBLine_H[i]/65535.0,pHSBLine_S[i]/65535.0,pHSBLine_B[i]/65535.0);
        p8[i*3+0]:=GetBValue(tmpColor);
        p8[i*3+1]:=GetGValue(tmpColor);
        p8[i*3+2]:=GetRValue(tmpColor);
      end;


    iTransport:=iTransport+1;
    if (iTransport mod 50) = 0 then
      begin
        ProgressBar1.Position:=iTransport;
      end;
    if (iTransport mod (ProgressBar1.Max div 15)) = 0 then
      ImagesRepaint();
    Application.ProcessMessages();
  until MSUReaded<>MSUReadPlan;

  ImagesRepaint();
  for i:=0 to 255 do
    begin
      image11.Picture.Bitmap.Canvas.Pixels[i,0]:=rgb(i,i,i);
      image11.Picture.Bitmap.Canvas.Pixels[i,1]:=HSVtoRGB(i/256.0,0.5,0.5);
    end;
  ProgressBar1.Position:=ProgressBar1.Max;

  report:=report+reportpart;
  memo1.Lines.Clear();
  memo1.Lines.Add(report);

  // �������� ������

  CloseFile(fMSU);

  FreeMem(pMSUFromFile);
  FreeMem(pMSU10to16);
  FreeMem(pCalibr10to16);
  FreeMem(calibr);
  FreeMem(pChannelVideoLine);

  }

  //MessageBox(0,'Done','Ok',0);

end;

procedure TForm1.CombinePicture(drawMethod: TDrawMethod;
// Night method
  channelLeft,channelRight:byte; // *** mercator bottom layer (��������� ����� ��� ������) is disabled now rgbCompressPercent:integer;
  cloudShift, cloudCompressionPercent:integer;
// RGB method
  sharpness:integer;
  rChannel:byte; rBright:integer; rContrast:integer;
  gChannel:byte; gBright:integer; gContrast:integer;
  bChannel:byte; bBright:integer; bContrast:integer;
  tilesTransparency:single;
// False color method
  tChChannel:byte; tChBright:integer; tChContrast:integer;
  bChChannel:byte; bChBright:integer; bChContrast:integer;

  sweepMethod:TSweepMethod; scale:double; rotateLeftRight:double; moveLeftRight:double; stepWidth:double;
  showTilesBorder:bool; hideHue:THideHue {hideRegionBorder:bool};
  zScaleTilesCorrection:double);
label stop;
var
 i, iLastProgress:longint;
 pImageScanLine : PByteArray;
 timeOfMSULine : time_set;
 jTimeOfMSULine : double;

 //sat_pos,sat_vel,  sat_gd:vector;
 minifier_good:double;
 sat_pos:vector;
 maxAlpha:double;
 normalPixelAlpha:double;//normal - �������, �.�. ������� ��� ��������� - �� ������ ������, � �� �����
 gamma,pixelAlpha,kAlphaGamma:double;
 sat_gd_left,sat_gd_right{,sat_gd_left_prev,sat_gd_right_prev}:vector;
 ipixel{,ipixelScaled},ipixelScaled_1,ipixelScaled_2,iLineScaled_1,iLineScaled_2:integer;
 ipixelScaled,kPixel,iLineScaled,kLine:double;
 mapX,mapY:integer;
 wid,hei:integer;
 scaledRow,scaledCol:integer;
 markerRadius:Integer;

 // RGB method
 rValue:integer;
 gValue:integer;
 bValue:integer;

 //False color method
 tChValue:integer;
 bChValue:integer;

 // *** mapColor:TColor;
 rLayerColor,gLayerColor,bLayerColor:byte;
 layerAlpha:byte;
 layerAlpha_tmp,rlayerColor_tmp,glayerColor_tmp,blayerColor_tmp:byte;
 cloudValue,zScale:byte;
 zScaleXX,zScaleYY,zScaleReal,zScaleFrac:double;
 xInTile,yInTile:double;
 pngFilename:string;
 tileHash:integer;
 pScanLine:pByteArray;
 dstRColor,dstGColor,dstBColor:byte;

 cloudValueShifter:integer;

 pixelsInPicLine, linesInPicture:integer;
begin
  //** ������ ����� �� ����� TLE
  //  sat_data[1][1]:='1 40069U 14037A   15066.45495429  .00000030  00000-0  34506-4 0  9999';
  //  sat_data[1][2]:='2 40069  98.7719 121.9644 0006834  95.0656 265.1299 14.20599116 34325';
  sat_data[1][1]:=memo2.Lines[0];
  sat_data[1][2]:=memo2.Lines[1];
  Convert_Satellite_Data(1);

  ProgressBar1.Position:=0;

  calcAWidAHei();   // �������� ��������� �������� �������� ���� � ���� �������� ��������� ������ � �������� �������� �����
  //  minifier_good:=1{/2.5} * 55.4/180*pi;
  minifier_good:=1{/2.5} * (55.4 + (stepWidth/5))*piDiv180;    // ��� �������� ���� ������, �.�. �� ������� �� ����


  //** ���������� �������� � ������ �����������
  if sweepMethod=SatPixel then
    begin
      pixelsInPicLine:=trunc(MSUVideoChannelLen16bit * scale);
      linesInPicture:=trunc(MSUFullStruct.MSULastLineInFileUserWant * scale);
    end;
  if sweepMethod=EarthAlpha then
    begin
      jTimeOfMSULine := MSUFullStruct.MSUVectorData[0].jtime;
      getSat_Pos(jTimeOfMSULine, sat_pos);
      //�������� ���� alpha ��� 1 ������� �������������� �����, ������������ �� ������ ������ ������
      normalPixelAlpha:= AlphaFromGamma_version2(sat_pos, minifier_good/scale/MSUVideoChannelHalfLen16bit);
      kAlphaGamma:= normalPixelAlpha / minifier_good/scale/MSUVideoChannelHalfLen16bit; // =1/7.78
      //�������� ���� alpha ��� �������� ������ ������, ������������ �� ������ ������ ������
      maxAlpha:= AlphaFromGamma_version2(sat_pos, minifier_good);
      pixelsInPicLine:=trunc(maxAlpha/normalPixelAlpha)*2;

      linesInPicture:=trunc(MSUFullStruct.MSULastLineInFileUserWant * scale);
    end;

  ProgressBar1.Max:=linesInPicture-1;


  //**��� ����, ����� ���� ����� �� �����������: SetImgBitmapFormat(Image2,MSUVideoChannelLen16bit div scale ,(MSUFullStruct.MSULastLineInFileUserWant+1) div scale);
  SetImgBitmapFormat(Image2, pixelsInPicLine, linesInPicture);
  SetImageSize(); // ������ Image, � �� Bitmap � ���

  // *** mercator map as bottom layer is disabled now
  //* image3.Picture.Bitmap.LoadFromFile(ExtractFileDir(ParamStr(0))+'\files\merkator_foto.bmp');
  // *** mercator map FIN COMMENT


  //** Image5 - ��� ��������� �����, �� ������� ������ �������
  image5.Picture.Bitmap.Canvas.Draw(0,0,image3.Picture.Bitmap);
  image5.Picture.Bitmap.Canvas.Pen.Color:=clBlack;
  wid:=image5.Picture.Bitmap.Width;
  hei:=image5.Picture.Bitmap.Height;
  markerRadius:=wid div 360;

  //** ���������
    // ����� ����� ���������� �������� �� ���������
      jTimeOfMSULine := MSUFullStruct.MSUVectorData[MSUFullStruct.MSULastLineInFileUserWant *9 div 10].jtime;  //  ��� ����� ����������� �� ����� Read MSU
      getSat_Pos(jTimeOfMSULine, sat_pos);
      getLatLonAltPlusOrtoVector(jTimeOfMSULine, 1.1*minifier_good, sat_gd_left);  // -- ������ �������� - ��� �����,
      mapX:=round(DolgotaToX(Degrees(sat_gd_left[2]),wid));                        // -- � ���������-������� ��������� �����
      mapY:=round(ShirotaToY({Degrees}(sat_gd_left[1]),hei));
      image5.Picture.Bitmap.Canvas.Ellipse(rect(mapX - markerRadius,mapY - markerRadius,mapX + markerRadius,mapY + markerRadius ));

      getLatLonAltPlusOrtoVector(jTimeOfMSULine, -1.1*minifier_good, sat_gd_right);
      mapX:=round(DolgotaToX(Degrees(sat_gd_right[2]),wid));
      mapY:=round(ShirotaToY({Degrees}(sat_gd_right[1]),hei));
      image5.Picture.Bitmap.Canvas.Ellipse(rect(mapX - markerRadius,mapY - markerRadius,mapX + markerRadius,mapY + markerRadius ));

  for i:=0 to linesInPicture-1 do
    begin
      if stopFlag then goto stop;


      iLineScaled:=i/linesInPicture*MSUFullStruct.MSULastLineInFileUserWant;

      iLineScaled_1:=trunc(iLineScaled);
      kLine:=frac(iLineScaled);
      iLineScaled_2:=iLineScaled_1+1;


      jTimeOfMSULine := MSUFullStruct.MSUVectorData[iLineScaled_1].jtime*(1-kLine) + MSUFullStruct.MSUVectorData[iLineScaled_2].jtime*kLine;  //  ��� ����� ����������� �� ����� Read MSU
      getSat_Pos(jTimeOfMSULine, sat_pos);

      //timeOfMSULine:=MSUFullStruct.MSUVectorData[i].timeset;
      //jTimeOfMSULine := Julian_Date(timeOfMSULine);
      // ** this three rows calculate sattelite Lat and Long
      // ** SGP(jTimeOfMSULine,sat_pos,sat_vel);
      // ** Convert_Sat_State(sat_pos,sat_vel); //����������� ������������� ������ � ����������� ���������
      // ** Calculate_LatLonAlt(sat_pos,jt,sat_gd);


      //** ��������� ����� ��������� �������� �� ��������� (����� � ������ �������)
      getLatLonAltPlusOrtoVector(jTimeOfMSULine, 1.1*minifier_good, sat_gd_left);  // -- ������ �������� - ��� �����,
      mapX:=round(DolgotaToX(Degrees(sat_gd_left[2]),wid));                        // -- � ���������-������� ��������� �����
      mapY:=round(ShirotaToY({Degrees}(sat_gd_left[1]),hei));
      image5.Picture.Bitmap.Canvas.Ellipse(rect(mapX - markerRadius,mapY - markerRadius,mapX + markerRadius,mapY + markerRadius ));

      getLatLonAltPlusOrtoVector(jTimeOfMSULine, -1.1*minifier_good, sat_gd_right);
      mapX:=round(DolgotaToX(Degrees(sat_gd_right[2]),wid));
      mapY:=round(ShirotaToY({Degrees}(sat_gd_right[1]),hei));
      image5.Picture.Bitmap.Canvas.Ellipse(rect(mapX - markerRadius,mapY - markerRadius,mapX + markerRadius,mapY + markerRadius ));

      //pImageScanLine:=Image2.Picture.Bitmap.ScanLine[i];
      //FillRGBArray16bit(pImageScanLine,MSUFullStruct.MSUChannelsData[4][i],MSUFullStruct.MSUChannelsData[4][i],MSUFullStruct.MSUChannelsData[4][i],MSUVideoChannelLen16bit, $07, 10);

      
          //** MSUFullStruct.timeIncrementer - ����������� ��������
          //**   (���� �� ����� �����, �� ������ ����� ����������� ���� � �������� ������� �� ����� i 
          //** scaledRow - ����� ������ � �������� �����������
          if MSUFullStruct.timeIncrementer>0 then
            scaledRow:=i
           else
            scaledRow:=image2.Picture.Bitmap.Height -1 - i ;


          //** ����� ��������� �� ������ ����������� � ������� ��� ���������
          pScanLine:=image2.Picture.Bitmap.ScanLine[scaledRow];
          //��� ����, ����� ���� ����� �� �����������: for ipixel:=0 to (MSUVideoChannelHalfLen16bit div scale)-1 do
          for ipixel:={0}-(pixelsInPicLine div 2 )+2 to (pixelsInPicLine div 2 )-2  do    // +-2 because {pScanLine[scaledCol*3+2]:=dstRColor;} give me error on 8x scale
              begin                                                                       // before this problem +-1 was here
                  //form1.Caption:='ipixel='+inttostr(ipixel);
                  //Application.ProcessMessages();
                  //if ipixel=871 then
                  //  form1.Caption:='ipixel=!!!'+inttostr(ipixel);



              //** ����� �������
              //** ipixelScaled - �/�/�/�/�/� �� ������ - ������� � ������ ������
              //** scaledCol - ������� � ������� � �����������
              //** ��� �� ������, ����� ���� ����� �� �������������: ipixelScaled:=MSUVideoChannelHalfLen16bit-(ipixel*scale);
              pixelAlpha:=normalPixelAlpha * ipixel;
              gamma:=GammaFromAlpha_version2(sat_pos,pixelAlpha);
              // * ipixelScaled *
              ipixelScaled:={trunc}((1-gamma/minifier_good ) * MSUVideoChannelHalfLen16bit);
              // * scaledCol *
              if MSUFullStruct.timeIncrementer>0 then
                scaledCol:=(pixelsInPicLine div 2 )-ipixel
               else
                scaledCol:=(pixelsInPicLine div 2 )+ipixel;


              //** ���� ���������� ���� �������� ��� �� ���� ���������, ������� � ���������� ���� ����
              //** �� ������ IF'� sat_gd_left - ������� � ������
              //** sat_gd_left[2] - �������
              //** sat_gd_left[1] - ������
              {
              if not MSUFullStruct.MSUVectorData[i].aVectorValue[ipixelScaled].valueExists then
                begin
                  // sat shift - ��� ������ �������� ������������
                  //** ��� �� ������...  getLatLonAltPlusOrtoVectorSatShift(jTimeOfMSULine,-(ipixel*scale)*minifier_good/MSUVideoChannelHalfLen16bit-(rotateLeftRight*piDiv180),-moveLeftRight*5,sat_gd_left);
                  getLatLonAltPlusOrtoVectorSatShift(jTimeOfMSULine,-gamma-(rotateLeftRight*piDiv180),-moveLeftRight*5,sat_gd_left);
                  MSUFullStruct.MSUVectorData[i].aVectorValue[ipixelScaled].vectorValue:=sat_gd_left;
                  MSUFullStruct.MSUVectorData[i].aVectorValue[ipixelScaled].valueExists:=true;
                end
               else
                sat_gd_left:=MSUFullStruct.MSUVectorData[i].aVectorValue[ipixelScaled].vectorValue;
              }
              getLatLonAltPlusOrtoVectorSatShift(jTimeOfMSULine,-gamma-(rotateLeftRight*piDiv180),-moveLeftRight*5,sat_gd_left);
              //mapX:=trunc(DolgotaToX(Degrees(sat_gd_left[2]),wid));
              //mapY:=trunc(ShirotaToY({Degrees}(sat_gd_left[1]),hei));

              // *** mercator map as bottom layer is disabled now
              //* mapColor:=image3.Picture.Bitmap.Canvas.Pixels[round(mapx),round(mapy)];
              // *** mercator map FIN COMMENT

              //if ipixel>0 then zScale:=calcZScale(trunc((sat_gd_left[1])*piIn180),round(calcAngle(sat_gd_left,sat_gd_left_prev)))
              // else zScale:=calcZScale(trunc((sat_gd_left[1])*piIn180),0);


              //** Z - ��� ���� �������� ������
              zScaleReal:=calcZScale({trunc}((sat_gd_left[1])*piIn180){, 0} {(ipixel * scale * 100 ) div MSUVideoChannelHalfLen16bit}, scale, zScaleTilesCorrection);
              zScale:=trunc(zScaleReal);
              //** zScaleXX � zScaleYY - ���������� ������� ����� �� �������� ���������
              zScaleXX:=DolgotaToX(Degrees(sat_gd_left[2]),aWidaHei[zScale].pixelLimits.X);
              zScaleYY:=ShirotaToY({Degrees}(sat_gd_left[1]),aWidaHei[zScale].pixelLimits.Y);
              //** ������ pngFilename � ������� ������� ������ ����� �����
              makePathAndXYPos(zScaleXX,zScaleYY,zScale,pngFilename,tileHash,xInTile,yInTile);

              //** ���������� R, G, B � ������������ ����� �� ����� (������� ��������� ����������� ��� ��������� �� ������� �������)
              getLayerColor(pngFilename,tileHash,xInTile,yInTile,layerAlpha,rlayerColor,glayerColor,blayerColor,showTilesBorder,tilesTransparency);

              zScaleFrac:=frac(zScaleReal);
              if zScaleFrac<0.04 then
                begin
                  zScaleFrac:=zScaleFrac*25;

                  zScale:=trunc(zScaleReal)-1;
                  //** zScaleXX � zScaleYY - ���������� ������� ����� �� �������� ���������
                  zScaleXX:=DolgotaToX(Degrees(sat_gd_left[2]),aWidaHei[zScale].pixelLimits.X);
                  zScaleYY:=ShirotaToY({Degrees}(sat_gd_left[1]),aWidaHei[zScale].pixelLimits.Y);
                  //** ������ pngFilename � ������� ������� ������ ����� �����
                  makePathAndXYPos(zScaleXX,zScaleYY,zScale,pngFilename,tileHash,xInTile,yInTile);

                  //** ���������� R, G, B � ������������ ����� �� ����� (������� ��������� ����������� ��� ��������� �� ������� �������)
                  getLayerColor(pngFilename,tileHash,xInTile,yInTile,layerAlpha_tmp,rlayerColor_tmp,glayerColor_tmp,blayerColor_tmp,showTilesBorder,tilesTransparency);

                  {
                  layerAlpha:=max(layerAlpha,layerAlpha_tmp);
                  rlayerColor:=max(rlayerColor,rlayerColor_tmp);
                  glayerColor:=max(glayerColor,glayerColor_tmp);
                  blayerColor:=max(blayerColor,blayerColor_tmp);
                  }
                  layerAlpha:=min( trunc(layerAlpha*((zScaleFrac))+layerAlpha_tmp*((1-zScaleFrac))) ,255);
                  rlayerColor:=min( trunc(rlayerColor*(F_SQRT_LineStyle(zScaleFrac))+rlayerColor_tmp*(F_SQRT_LineStyle(1-zScaleFrac))) ,255);
                  glayerColor:=min( trunc(glayerColor*(F_SQRT_LineStyle(zScaleFrac))+glayerColor_tmp*(F_SQRT_LineStyle(1-zScaleFrac))) ,255);
                  blayerColor:=min( trunc(blayerColor*(F_SQRT_LineStyle(zScaleFrac))+blayerColor_tmp*(F_SQRT_LineStyle(1-zScaleFrac))) ,255);

                end;

              //��������� ������������ ���������� �� ������������� � �����������
              // ����������� - ��� �������� � �������������
              ipixelScaled_1:=trunc(ipixelScaled);
              kPixel:=frac(ipixelScaled);
              if kPixel>0 then
                begin
                  ipixelScaled_2:=ipixelScaled_1+1;
                end
              else
                begin
                  ipixelScaled_2:=ipixelScaled_1-1;
                  kPixel:=-kPixel;
                end;

              if drawMethod=NightMethod then
                begin
                  //** channelLeft - ��� ������� ������ - ��������� ������������� ����� ��� ����� �������� ��������
                  if (0<=ipixelScaled_1) and (0<=ipixelScaled_2) and (ipixelScaled_1<length(MSUFullStruct.MSUChannelsData[channelLeft][0].pixels)) and (ipixelScaled_2<length(MSUFullStruct.MSUChannelsData[channelLeft][0].pixels)) 
                     and (0<=iLineScaled_1) and (0<=iLineScaled_2) and (iLineScaled_1<MSUFullStruct.MSULinesInFile) and (iLineScaled_2<MSUFullStruct.MSULinesInFile) then
                    begin
                      //cloudValue:=round(
                      //  (MSUFullStruct.MSUChannelsData[channelLeft][i].pixels[ipixelScaled_1] shr 8) * (1-kPixel) +
                      //  (MSUFullStruct.MSUChannelsData[channelLeft][i].pixels[ipixelScaled_2] shr 8) * kPixel );

                      cloudValue:=round(
                          ((MSUFullStruct.MSUChannelsData[channelLeft][iLineScaled_1].pixels[ipixelScaled_1] shr 8) * (1-kPixel) + (MSUFullStruct.MSUChannelsData[channelLeft][iLineScaled_1].pixels[ipixelScaled_2] shr 8) * kPixel )*(1-kLine) +
                          ((MSUFullStruct.MSUChannelsData[channelLeft][iLineScaled_2].pixels[ipixelScaled_1] shr 8) * (1-kPixel) + (MSUFullStruct.MSUChannelsData[channelLeft][iLineScaled_2].pixels[ipixelScaled_2] shr 8) * kPixel )*kLine
                        );
                    end
                  else cloudValue:=0;

                  //** �������� ��� ��������� ����� ����������� ���������� ��� � ������
                  cloudValueShifter:=round(MSUFullStruct.NightUserCalibrFirstLine*(1-(i/MSUFullStruct.MSULastLineInFileUserWant)));
                  cloudValueShifter:=round(cloudValueShifter+MSUFullStruct.NightUserCalibrLastLine*(i/MSUFullStruct.MSULastLineInFileUserWant));
                  cloudValueShifter:=cloudValue-cloudValueShifter+127;
                  if cloudValueShifter<0 then cloudValueShifter:=0;
                  if cloudValueShifter>255 then cloudValueShifter:=255;
                  cloudValue:=cloudValueShifter;
                end;
              //rValue:=MSUFullStruct.MSUChannelsData[rChannel][i].pixels[ipixelScaled];
              if drawMethod=RGBMethod then
                begin
                  //** sharpness - ������� ��������� �������� ��� ����������
                  //rValue:=round(GetSharpnessPixel(rChannel,i,ipixelScaled_1,sharpness) * (1-kPixel) + GetSharpnessPixel(rChannel,i,ipixelScaled_2,sharpness) * kPixel);
                  //gValue:=round(GetSharpnessPixel(gChannel,i,ipixelScaled_1,sharpness) * (1-kPixel) + GetSharpnessPixel(gChannel,i,ipixelScaled_2,sharpness) * kPixel);
                  //bValue:=round(GetSharpnessPixel(bChannel,i,ipixelScaled_1,sharpness) * (1-kPixel) + GetSharpnessPixel(bChannel,i,ipixelScaled_2,sharpness) * kPixel);

                  if (0<=ipixelScaled_1) and (0<=ipixelScaled_2) and (ipixelScaled_1<length(MSUFullStruct.MSUChannelsData[channelLeft][0].pixels)) and (ipixelScaled_2<length(MSUFullStruct.MSUChannelsData[channelLeft][0].pixels))
                     and (0<=iLineScaled_1) and (0<=iLineScaled_2) and (iLineScaled_1<MSUFullStruct.MSULinesInFile) and (iLineScaled_2<MSUFullStruct.MSULinesInFile) then
                    begin       
                      rValue:=round(
                          (GetSharpnessPixel(rChannel,iLineScaled_1,ipixelScaled_1,sharpness) * (1-kPixel) + GetSharpnessPixel(rChannel,iLineScaled_1,ipixelScaled_2,sharpness) * kPixel)*(1-kLine) +
                          (GetSharpnessPixel(rChannel,iLineScaled_2,ipixelScaled_1,sharpness) * (1-kPixel) + GetSharpnessPixel(rChannel,iLineScaled_2,ipixelScaled_2,sharpness) * kPixel)*kLine
                        );
                      gValue:=round(
                          (GetSharpnessPixel(gChannel,iLineScaled_1,ipixelScaled_1,sharpness) * (1-kPixel) + GetSharpnessPixel(gChannel,iLineScaled_1,ipixelScaled_2,sharpness) * kPixel)*(1-kLine) +
                          (GetSharpnessPixel(gChannel,iLineScaled_2,ipixelScaled_1,sharpness) * (1-kPixel) + GetSharpnessPixel(gChannel,iLineScaled_2,ipixelScaled_2,sharpness) * kPixel)*kLine
                        );
                      bValue:=round(
                          (GetSharpnessPixel(bChannel,iLineScaled_1,ipixelScaled_1,sharpness) * (1-kPixel) + GetSharpnessPixel(bChannel,iLineScaled_1,ipixelScaled_2,sharpness) * kPixel)*(1-kLine) +
                          (GetSharpnessPixel(bChannel,iLineScaled_2,ipixelScaled_1,sharpness) * (1-kPixel) + GetSharpnessPixel(bChannel,iLineScaled_2,ipixelScaled_2,sharpness) * kPixel)*kLine
                        );
                    end
                  else
                   begin
                     rValue:=0;
                     gValue:=0;
                     bValue:=0;
                   end;                

                end;
                //image2.Picture.Bitmap.Canvas.Pixels[scaledCol,scaledRow]:=CombineColors(
              if drawMethod=FalseColorMethod then
                begin
                  if (0<=ipixelScaled_1) and (0<=ipixelScaled_2) and (ipixelScaled_1<length(MSUFullStruct.MSUChannelsData[channelLeft][0].pixels)) and (ipixelScaled_2<length(MSUFullStruct.MSUChannelsData[channelLeft][0].pixels))
                     and (0<=iLineScaled_1) and (0<=iLineScaled_2) and (iLineScaled_1<MSUFullStruct.MSULinesInFile) and (iLineScaled_2<MSUFullStruct.MSULinesInFile) then
                    begin
                      //** t - �����������, b - �������
                      tChValue:=round(
                          (GetSharpnessPixel(tChChannel,iLineScaled_1,ipixelScaled_1,sharpness) * (1-kPixel) + GetSharpnessPixel(tChChannel,iLineScaled_1,ipixelScaled_2,sharpness) * kPixel)*(1-kLine) +
                          (GetSharpnessPixel(tChChannel,iLineScaled_2,ipixelScaled_1,sharpness) * (1-kPixel) + GetSharpnessPixel(tChChannel,iLineScaled_2,ipixelScaled_2,sharpness) * kPixel)*kLine
                        );
                      bChValue:=round(
                          (GetSharpnessPixel(bChChannel,iLineScaled_1,ipixelScaled_1,sharpness) * (1-kPixel) + GetSharpnessPixel(bChChannel,iLineScaled_1,ipixelScaled_2,sharpness) * kPixel)*(1-kLine) +
                          (GetSharpnessPixel(bChChannel,iLineScaled_2,ipixelScaled_1,sharpness) * (1-kPixel) + GetSharpnessPixel(bChChannel,iLineScaled_2,ipixelScaled_2,sharpness) * kPixel)*kLine
                        );
                    end
                  else
                   begin
                     tChValue:=0;
                     bChValue:=0;
                   end;
                end;

              CombineColors(

                  drawMethod,
                  // *** mapColor,
                  // *** rgbCompressPercent,
                  cloudValue,
                  cloudShift,cloudCompressionPercent,

                  sharpness,
                  rValue, rBright, rContrast,
                  gValue, gBright, gContrast,
                  bValue, bBright, bContrast,

                  tChValue,tChBright,tChContrast,
                  bChValue,bChBright,bChContrast,

                  layerAlpha,
                  rlayerColor,glayerColor,blayerColor,
                  hideHue,

                  dstRColor,dstGColor,dstBColor);
              if scaledCol*3+2 <= 65535 then
                begin
                  pScanLine[scaledCol*3+2]:=dstRColor;
                  pScanLine[scaledCol*3+1]:=dstGColor;
                  pScanLine[scaledCol*3  ]:=dstBColor;
                end;

              (*
            //������ �������
              ipixelScaled:=MSUVideoChannelHalfLen16bit+(ipixel*scale);
              if MSUFullStruct.timeIncrementer>0 then
                scaledCol:=(MSUVideoChannelHalfLen16bit div scale)+ipixel
               else
                scaledCol:=(MSUVideoChannelHalfLen16bit div scale)-ipixel;
              if not MSUFullStruct.MSUVectorData[i].aVectorValue[ipixelScaled].valueExists then
                begin
                  getLatLonAltPlusOrtoVectorSatShift(jTimeOfMSULine,+(ipixel*scale)*minifier_good/MSUVideoChannelHalfLen16bit-(rotateLeftRight*piDiv180),-moveLeftRight*5,sat_gd_right);
                  //sat_gd_right[2]:=sat_gd_right[2]-moveLeftRight;
                  MSUFullStruct.MSUVectorData[i].aVectorValue[ipixelScaled].vectorValue:=sat_gd_right;
                  MSUFullStruct.MSUVectorData[i].aVectorValue[ipixelScaled].valueExists:=true;
                end
               else
                sat_gd_right:=MSUFullStruct.MSUVectorData[i].aVectorValue[ipixelScaled].vectorValue;
              //mapX:=trunc(DolgotaToX(Degrees(sat_gd_right[2]),wid));
              //mapY:=trunc(ShirotaToY({Degrees}(sat_gd_right[1]),hei));

  // *** mercator map as bottom layer is disabled now
  // * mapColor:=image3.Picture.Bitmap.Canvas.Pixels[round(mapx),round(mapy)];
  // mercator map *** //

              //if ipixel>0 then zScale:=calcZScale(trunc((sat_gd_right[1])*piIn180),round(calcAngle(sat_gd_right_prev,sat_gd_right)))
              // else zScale:=calcZScale(trunc((sat_gd_right[1])*piIn180),0);
              zScale:=calcZScale(trunc((sat_gd_right[1])*piIn180),(ipixel * scale * 100 ) div MSUVideoChannelHalfLen16bit , scale>1);
              zScaleXX:=DolgotaToX(Degrees(sat_gd_right[2]),aWidaHei[zScale].pixelLimits.X);
              zScaleYY:=ShirotaToY({Degrees}(sat_gd_right[1]),aWidaHei[zScale].pixelLimits.Y);
              makePathAndXYPos(zScaleXX,zScaleYY,zScale,pngFilename,tileHash,xInTile,yInTile);

              getLayerColor(pngFilename,tileHash,xInTile,yInTile,layerAlpha,rlayerColor,glayerColor,blayerColor,showTilesBorder,tilesTransparency);

              if drawMethod=NightMethod then
                begin
                  //** channelLeft - ��� ������� ������ - ��������� ������������� ����� ��� ����� �������� ��������
                  cloudValue:=MSUFullStruct.MSUChannelsData[channelRight][i].pixels[ipixelScaled] shr 8;

                  //** �������� ��� ��������� ����� ����������� ����������� ��� � ������
                  cloudValueShifter:=round(MSUFullStruct.NightUserCalibrFirstLine*(1-(i/MSUFullStruct.MSULastLineInFileUserWant)));
                  cloudValueShifter:=round(cloudValueShifter+MSUFullStruct.NightUserCalibrLastLine*(i/MSUFullStruct.MSULastLineInFileUserWant));
                  cloudValueShifter:=cloudValue-cloudValueShifter+127;
                  if cloudValueShifter<0 then cloudValueShifter:=0;
                  if cloudValueShifter>255 then cloudValueShifter:=255;
                  cloudValue:=cloudValueShifter;
                end;
              //rValue:=MSUFullStruct.MSUChannelsData[rChannel][i].pixels[ipixelScaled];
              if drawMethod=RGBMethod then
                begin
                  rValue:=GetSharpnessPixel(rChannel,i,ipixelScaled,sharpness);
                  gValue:=GetSharpnessPixel(gChannel,i,ipixelScaled,sharpness);
                  bValue:=GetSharpnessPixel(bChannel,i,ipixelScaled,sharpness);
                end;
                //image2.Picture.Bitmap.Canvas.Pixels[scaledCol,scaledRow]:=CombineColors(
              if drawMethod=FalseColorMethod then
                begin
                  form1.Caption:='ipixelScaled='+inttostr(ipixelScaled);
                  Application.ProcessMessages();
                  if ipixelScaled=1572 then
                    MessageBox(0,'','',0);
                  tChValue:=GetSharpnessPixel(tChChannel,i,ipixelScaled,sharpness);
                  bChValue:=GetSharpnessPixel(bChChannel,i,ipixelScaled,sharpness);
                end;
              CombineColors(
                  drawMethod,
                  // *** mapColor,
                  // *** rgbCompressPercent,
                  cloudValue,
                  cloudShift,cloudCompressionPercent,

                  sharpness,
                  rValue, rBright, rContrast,
                  gValue, gBright, gContrast,
                  bValue, bBright, bContrast,

                  tChValue,tChBright,tChContrast,
                  bChValue,bChBright,bChContrast,

                  layerAlpha,
                  rlayerColor,glayerColor,blayerColor,
                  hideHue,

                  dstRColor,dstGColor,dstBColor);
              pScanLine[scaledCol*3+2]:=dstRColor;
              pScanLine[scaledCol*3+1]:=dstGColor;
              pScanLine[scaledCol*3  ]:=dstBColor;

              //sat_gd_left_prev:=sat_gd_left;
              //sat_gd_right_prev:=sat_gd_right;

              *)
            end;


      //if (i mod 200) = 0 then
      //  begin
      //  end;
      if (i div 50) <> (iLastProgress div 50) then
        begin
          ProgressBar1.Position:=i;
          if MSUFullStruct.timeIncrementer>0 then
            image2.Picture.Bitmap.Canvas.FillRect(rect(0,scaledRow+1,image2.Picture.Bitmap.Width,scaledRow+10))
           else
            image2.Picture.Bitmap.Canvas.FillRect(rect(0,scaledRow-1,image2.Picture.Bitmap.Width,scaledRow-10));
          image2.Repaint();
          application.ProcessMessages();
        end;
      iLastProgress:=i;
    end;
  ProgressBar1.Position:=0;
  image5.Picture.Bitmap.Canvas.Font.Size:=image3.Picture.Bitmap.Height div 10;
  image5.Picture.Bitmap.Canvas.TextOut(image5.Picture.Bitmap.Width div 10,image5.Picture.Bitmap.Height-(2*image5.Picture.Bitmap.Canvas.Font.Size),'Fin.');
  stop:
  image2.Repaint();
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
var
 i:longint;

 pImageScanLine : PByteArray;

 time1,time2,dtime   : time_set;
        jtime1,jt : double;

{

  sol_pos,
  obs_pos,obs_vel,
  obs_gd,
  obs,obs_sol         : vector;
}
 sat_pos,sat_vel,  sat_gd:vector;
 minifier_good:double;
 sat_gd_left,sat_gd_right:vector;
 ipixel:integer;
 mapX,mapY:double;
 xx,yy,wid,hei:integer;

begin
  SetImgBitmapFormat(Image2,MSUVideoChannelLen16bit,MSUFullStruct.MSULinesInFile);
  //for i:=0 to MSUFullStruct.MSULinesInFile-1 do
  for i:=0 to 100-1 do
    begin
      pImageScanLine:=Image2.Picture.Bitmap.ScanLine[i];
      FillRGBArray16bit(pImageScanLine,MSUFullStruct.MSUChannelsData[0][i],MSUFullStruct.MSUChannelsData[0][i],MSUFullStruct.MSUChannelsData[0][i],MSUVideoChannelLen16bit, $07, 10); // ������������� ����� ����� �� ���� /2 � � ��������� 3� ������� ����
    end;
  image2.Repaint();


  minifier_good:=1{/2.5} * 55.4/180*pi;

  sat_data[1][1]:='1 40069U 14037A   15066.45495429  .00000030  00000-0  34506-4 0  9999';
  sat_data[1][2]:='2 40069  98.7719 121.9644 0006834  95.0656 265.1299 14.20599116 34325';
  Convert_Satellite_Data(1);

  image3.Picture.Bitmap.Canvas.Pen.Color:=clWhite;

  image3.Picture.Bitmap.LoadFromFile(  ExtractFileDir(ParamStr(0))+'\files\merkator_foto.bmp');
  wid:=image3.Picture.Bitmap.Width;
  hei:=image3.Picture.Bitmap.Height;

  for i:=0 to MSUFullStruct.MSULinesInFile-1 do
    begin
      time1:=MSUFullStruct.MSUVectorData[i].timeset;
      jt := Julian_Date(time1);
      SGP(jt,sat_pos,sat_vel);
      Convert_Sat_State(sat_pos,sat_vel); //����������� ������������� ������ � ����������� ���������

      Calculate_LatLonAlt(sat_pos,jt,sat_gd);

         {   memo1.Lines.Add('---ECI ����������');
            memo1.Lines.Add(floattostr(sat_pos[1]));
            memo1.Lines.Add(floattostr(sat_pos[2]));
            memo1.Lines.Add(floattostr(sat_pos[3]));
            memo1.Lines.Add(floattostr(sat_pos[4]));
            memo1.Lines.Add('---�������/������');
            memo1.Lines.Add(floattostr(Degrees(sat_gd[1])));
            memo1.Lines.Add(floattostr(Degrees(sat_gd[2])));
            memo1.Lines.Add(floattostr(sat_gd[3]));
            memo1.Lines.Add(floattostr(Degrees(sat_gd[4])));
            memo1.Lines.Add('+++ECI ��������');
            memo1.Lines.Add(floattostr(sat_vel[1]));
            memo1.Lines.Add(floattostr(sat_vel[2]));
            memo1.Lines.Add(floattostr(sat_vel[3]));
            memo1.Lines.Add(floattostr(sat_vel[4]));
            memo1.Lines.Add('===');
          }
      {
      image3.Picture.Bitmap.Canvas.Ellipse(rect(
       round( limitDouble(180+Degrees(sat_gd[2]))*5 -10),
       round( (90-Degrees(sat_gd[1]))*5 -10),
       round( limitDouble(180+Degrees(sat_gd[2]))*5 +10),
       round( (90-Degrees(sat_gd[1]))*5 +10) ));
      }
      getLatLonAltPlusOrtoVector(jt,1*minifier_good,sat_gd_left);
      getLatLonAltPlusOrtoVector(jt,-1*minifier_good,sat_gd_right);
      {
      image3.Picture.Bitmap.Canvas.Ellipse(rect(
       round( limitDouble(180+Degrees(sat_gd_left[2]))*5 -5),
       round( (90-Degrees(sat_gd_left[1]))*5 -5),
       round( limitDouble(180+Degrees(sat_gd_left[2]))*5 +5),
       round( (90-Degrees(sat_gd_left[1]))*5 +5) ));

      image3.Picture.Bitmap.Canvas.Ellipse(rect(
       round( limitDouble(180+Degrees(sat_gd_right[2]))*5 -5),
       round( (90-Degrees(sat_gd_right[1]))*5 -5),
       round( limitDouble(180+Degrees(sat_gd_right[2]))*5 +5),
       round( (90-Degrees(sat_gd_right[1]))*5 +5) ));
      }
      xx:=round(DolgotaToX(Degrees(sat_gd_left[2]),wid));
      yy:=round(ShirotaToY({Degrees}(sat_gd_left[1]),hei));

      image3.Picture.Bitmap.Canvas.Ellipse(rect(
       xx -10,
       yy -10,
       xx +10,
       yy +10 ));

      xx:=round(DolgotaToX(Degrees(sat_gd_right[2]),wid));
      yy:=round(ShirotaToY({Degrees}(sat_gd_right[1]),hei));

      image3.Picture.Bitmap.Canvas.Ellipse(rect(
       xx -10,
       yy -10,
       xx +10,
       yy +10 ));


      //pImageScanLine:=Image2.Picture.Bitmap.ScanLine[i];
//      FillRGBArray16bit(pImageScanLine,MSUFullStruct.MSUChannelsData[3][i],MSUFullStruct.MSUChannelsData[3][i],MSUFullStruct.MSUChannelsData[3][i],MSUVideoChannelLen16bit, $07, 10);
      //FillRGBArray16bit(pImageScanLine,MSUFullStruct.MSUChannelsData[4][i],MSUFullStruct.MSUChannelsData[4][i],MSUFullStruct.MSUChannelsData[4][i],MSUVideoChannelLen16bit, $07, 10);
      if ((i div 3) mod 1 > 0) then
        begin
        end
       else
        begin
          for ipixel:=0 to MSUVideoChannelHalfLen16bit-1 do
            begin
              getLatLonAltPlusOrtoVector(jt,ipixel*minifier_good/MSUVideoChannelHalfLen16bit,sat_gd_left);
              getLatLonAltPlusOrtoVector(jt,-ipixel*minifier_good/MSUVideoChannelHalfLen16bit,sat_gd_right);
              mapX:=trunc(DolgotaToX(Degrees(sat_gd_left[2]),wid));
              mapY:=trunc(ShirotaToY({Degrees}(sat_gd_left[1]),hei));
              //mapX:=limitDouble(180+Degrees(sat_gd_left[2]));
              //mapY:=90-Degrees(sat_gd_left[1]);
              //mapX:=mapX*5;
              //mapY:=mapY*5;
              //image2.Picture.Bitmap.Canvas.Pixels[MSUVideoChannelHalfLen16bit+ipixel,i]:=image3.Picture.Bitmap.Canvas.Pixels[round(mapx),round(mapy)];
{
              image2.Picture.Bitmap.Canvas.Pixels[MSUVideoChannelHalfLen16bit+ipixel,i]:=CombineColors(
                  NightMethod,
                  //image3.Picture.Bitmap.Canvas.Pixels[round(mapx),round(mapy)],
                  //50,
                  MSUFullStruct.MSUChannelsData[4][i].pixels[MSUVideoChannelHalfLen16bit+ipixel] shr 8,
                  127,250,
                  0,0,0, 0,0,0, 0,0,0,
                  0,0,0,0);
}








              mapX:=trunc(DolgotaToX(Degrees(sat_gd_right[2]),wid));
              mapY:=trunc(ShirotaToY({Degrees}(sat_gd_right[1]),hei));



              if (i=32)and(ipixel=753)then
                image3.Picture.Bitmap.Canvas.FillRect(rect(round(mapx)-100,round(mapy)-100,round(mapx)+100,round(mapy)+100));




              //mapX:=limitDouble(180+Degrees(sat_gd_right[2]));
              //mapY:=90-Degrees(sat_gd_right[1]);
              //mapX:=mapX*5;
              //mapY:=mapY*5;
              //image2.Picture.Bitmap.Canvas.Pixels[MSUVideoChannelHalfLen16bit-ipixel,i]:=image3.Picture.Bitmap.Canvas.Pixels[round(mapx),round(mapy)];
{
              image2.Picture.Bitmap.Canvas.Pixels[MSUVideoChannelHalfLen16bit-ipixel,i]:=CombineColors(
                  NightMethod,
                  //image3.Picture.Bitmap.Canvas.Pixels[round(mapx),round(mapy)],
                  //50,
                  MSUFullStruct.MSUChannelsData[3][i].pixels[MSUVideoChannelHalfLen16bit-ipixel] shr 8,
                  210,700,
                  0,0,0, 0,0,0, 0,0,0,
                  0,0,0,0);
}
            end;
        end;


      if (i mod 200) = 0 then
        begin
          image2.Repaint();
          application.ProcessMessages();
        end;
    end;
end;

procedure TForm1.SpeedButton5Click(Sender: TObject);
label again;
var
 saved:bool;
 jpg:TJPEGImage;
begin
  saved:=false;
  sd1.FileName:=label17.Caption+'-'+label16.Caption+'-'+label15.Caption+'-'+label18.Caption+'-'+label19.Caption+'-meteor2.jpg';
again:
  if sd1.Execute then
    begin
      if LowerCase(ExtractFileExt(sd1.FileName))='.bmp' then
        begin
          screen.cursor:=crHourGlass;
          Application.ProcessMessages();
          image2.Picture.Bitmap.SaveToFile(sd1.FileName);
          saved:=true;
          screen.Cursor:=crDefault;
        end;
      if LowerCase(ExtractFileExt(sd1.FileName))='.jpg' then
        begin
          screen.cursor:=crHourGlass;
          Application.ProcessMessages();
          jpg:=TJPEGImage.Create();
          jpg.CompressionQuality:=100;
          jpg.Assign(image2.Picture.Bitmap);
          jpg.SaveToFile(sd1.FileName);
          saved:=true;
          screen.cursor:=crDefault;
          MessageBox(Form1.Handle,'Ready','Ready!',MB_APPLMODAL);
        end;
      if not saved then
        begin
          MessageBox(Form1.Handle,'File name has no extension. Write .jpg or .bmp in the file name','Error!',MB_APPLMODAL);
          goto again;
        end;
    end;
end;

procedure TForm1.SpeedButton6Click(Sender: TObject);
var
 i,j:integer;
 drawMethod:TDrawMethod;
 hideHue:THideHue;
 sweepMethod:TSweepMethod;
begin
  screen.Cursor:=crHourGlass;
  SpeedButton13.Enabled:=true;
  stopFlag:=false;
  Application.ProcessMessages();
  ScrollBox1.SetFocus();
  //jpgdir:='E:\SAS.Planet.121010\cache\yasat\z7\0\';
  pngdir:=edit3.text; //'E:\SAS.Planet.121010\cache\yahyb\z7\0\';
  calcAWidAHei();
  drawMethod:=NightMethod;
  if PageControl2.ActivePage=TabSheet6 then drawMethod:=NightMethod;
  if PageControl2.ActivePage=TabSheet7 then drawMethod:=RGBMethod;
  if PageControl2.ActivePage=TabSheet8 then drawMethod:=FalseColorMethod;
  if rotatedByUser then
    for j:=0 to MSUFullStruct.MSULinesInFile-1 do
      begin
        SetLength(MSUFullStruct.MSUVectorData[j].aVectorValue,MSUVideoChannelLen16bit);
        for i:=0 to MSUVideoChannelLen16bit-1 do
          MSUFullStruct.MSUVectorData[j].aVectorValue[i].valueExists:=false;
      end;
  rotatedByUser:=false;
  for i:= 1 to tilesCount do
    begin
      atiles[i].fileLoaded:=false;
      //if atiles[i].png<>nil then atiles[i].png.Free();
    end;

  hideHue.hide36:=CheckBox2.Checked;
  hideHue.hide60:=CheckBox3.Checked;
  hideHue.hide80:=CheckBox4.Checked;
  hideHue.hide120:=CheckBox5.Checked;
  hideHue.hide180:=CheckBox6.Checked;
  sweepMethod:=SatPixel;
  if RadioButton2.Checked then sweepMethod:=EarthAlpha;
  CombinePicture(
    drawMethod,

    // Night color
    TrackBar1.Position,
    TrackBar2.Position,
    TrackBar4.Position,
    TrackBar5.Position,

    // RGB method
    TrackBar27.Position,
    TrackBar21.Position, TrackBar15.Position, TrackBar16.Position,
    TrackBar22.Position, TrackBar17.Position, TrackBar18.Position,
    TrackBar23.Position, TrackBar19.Position, TrackBar20.Position,
    TrackBar26.Position/100,

    // False color method
    //TrackBar27.Position,
    TrackBar29.Position, TrackBar30.Position, TrackBar31.Position,
    TrackBar32.Position, TrackBar33.Position, TrackBar34.Position,
    //TrackBar23.Position, TrackBar19.Position, TrackBar20.Position,
    //TrackBar26.Position/100,

    // Scale & rotate
    sweepMethod,
    8.0/TrackBar6.Position,
    TrackBar7.Position/10.0,
    TrackBar24.Position,
    TrackBar25.Position,
    CheckBox1.Checked, hideHue{CheckBox2.Checked},
    TrackBar36.Position);
  SpeedButton5.Enabled:=true;
  screen.Cursor:=crDefault;
  SpeedButton13.Enabled:=false;
end;

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
  Label27.Caption:=inttostr(TrackBar1.Position+1);
  TrackBar2.Position:=TrackBar1.Position;
end;

procedure TForm1.TrackBar2Change(Sender: TObject);
begin
  Label28.Caption:=inttostr(TrackBar2.Position+1);
end;

procedure TForm1.TrackBar3Change(Sender: TObject);
begin
  Label29.Caption:=inttostr(TrackBar3.Position)+' %';
end;

procedure TForm1.TrackBar4Change(Sender: TObject);
begin
    Label30.Caption:=inttostr(TrackBar4.Position);
end;

procedure TForm1.TrackBar5Change(Sender: TObject);
begin
  Label31.Caption:=inttostr(TrackBar5.Position)+' %';
end;

procedure TForm1.TrackBar6Change(Sender: TObject);
begin
  Label32.Caption:=format('%.3f',[8.0/TrackBar6.Position]);
end;

procedure TForm1.SpeedButton7Click(Sender: TObject);
var
 i,j,lJ,rJ:integer;
 pImageScanLine:PByteArray;
 summator,density:Int64;
 aDensity: array[0..255] of integer;
begin
  SetImgBitmapFormat(Image1,MSUVideoChannelLen16bit,MSUFullStruct.MSULastLineInFileUserWant+1);
  SetImgBitmapFormat(Image8,256,MSUFullStruct.MSULastLineInFileUserWant+1);
  Image8.Picture.Bitmap.Canvas.Brush.Color:=clWhite;
  Image8.Picture.Bitmap.Canvas.FillRect(rect(0,0,Image8.Picture.Bitmap.Width,Image8.Picture.Bitmap.Height));

  //for i:=0 to MSUFullStruct.MSULinesInFile-1 do
  for i:=0 to MSUFullStruct.MSULastLineInFileUserWant do
    begin
      pImageScanLine:=Image1.Picture.Bitmap.ScanLine[i];
      FillRGBArray16bit(pImageScanLine,MSUFullStruct.MSUChannelsData[trackbar1.position][i],MSUFullStruct.MSUChannelsData[trackbar1.position][i],MSUFullStruct.MSUChannelsData[trackbar1.position][i],MSUVideoChannelLen16bit, $07, 10); // ������������� ����� ����� �� ���� /2 � � ��������� 3� ������� ����


      //** ���������� � ���������� ������� ��� ������ ������
      summator:=0;
      pImageScanLine:=Image8.Picture.Bitmap.ScanLine[i];
      for j:=0 to 255 do
        aDensity[j]:=0;
      for j:=0 to MSUVideoChannelLen16bit-1 do
        begin
          summator:=summator+MSUFullStruct.MSUChannelsData[trackbar1.position][i].pixels[j];
          density:=MSUFullStruct.MSUChannelsData[trackbar1.position][i].pixels[j] shr 8;
          if aDensity[density]<252 then
            begin
              aDensity[density]:=aDensity[density]+3;
            end;
        end;
      summator:=((summator) shr 8) div MSUVideoChannelLen16bit;

      //** ���������� ���� ���������
      for j:=0 to 255 do
        begin
          pImageScanLine[j*3+2]:=255-aDensity[j];
          pImageScanLine[j*3+1]:=255-aDensity[j];
          pImageScanLine[j*3+0]:=255;
        end;
      //** ���������� ����� �������
      lJ:=summator-3;if lJ<0 then lJ:=0;
      rJ:=summator+3;if rJ>255 then rJ:=255;
      for j:=lJ to rJ do
        begin
          pImageScanLine[j*3+2]:=0;
          pImageScanLine[j*3+1]:=0;
          pImageScanLine[j*3+0]:=255;
        end;


      //** ��������� �����, ������� ������ ������������
      summator:=round(MSUFullStruct.NightUserCalibrFirstLine*(1-(i/MSUFullStruct.MSULastLineInFileUserWant)) +
        MSUFullStruct.NightUserCalibrLastLine*(i/MSUFullStruct.MSULastLineInFileUserWant));

      lJ:=summator-3;if lJ<0 then lJ:=0;
      rJ:=summator+3;if rJ>255 then rJ:=255;
      for j:=lJ to rJ do
        begin
          pImageScanLine[j*3+2]:=255;
          pImageScanLine[j*3+1]:=0;
          pImageScanLine[j*3+0]:=0;
        end;


    end;
  image1.Repaint();
  image8.Repaint();
end;

procedure TForm1.FormCreate(Sender: TObject);
var
 i:integer;
begin
  PageControl1.ActivePage:=tabsheet5;

  ReadIniFile();

  TrackBar1Change(Sender);
  TrackBar2Change(Sender);
  TrackBar3Change(Sender);
  TrackBar4Change(Sender);
  TrackBar5Change(Sender);
  TrackBar6Change(Sender);
  TrackBar7Change(Sender);
  TrackBar8Change(Sender);
  TrackBar9Change(Sender);
  TrackBar10Change(Sender);
  TrackBar11Change(Sender);
  TrackBar12Change(Sender);
  TrackBar13Change(Sender);
  TrackBar14Change(Sender);
  TrackBar15Change(Sender);
  TrackBar16Change(Sender);
  TrackBar17Change(Sender);
  TrackBar18Change(Sender);
  TrackBar19Change(Sender);
  TrackBar20Change(Sender);
  TrackBar21Change(Sender);
  TrackBar22Change(Sender);
  TrackBar23Change(Sender);
  TrackBar24Change(Sender);
  TrackBar25Change(Sender);
  TrackBar26Change(Sender);
  TrackBar27Change(Sender);
  TrackBar28Change(Sender);
  TrackBar29Change(Sender);
  TrackBar30Change(Sender);
  TrackBar31Change(Sender);
  TrackBar32Change(Sender);
  TrackBar33Change(Sender);
  TrackBar34Change(Sender);
  image2FullSizeMode:=false;
  rotatedByUser:=false;
  jpgdir:='';
  pngdir:='';
  for i:= low(aWidaHei) to high(aWidaHei) do
    begin
      aWidaHei[i].pixelLimits.X:=0;
      aWidaHei[i].pixelLimits.Y:=0;
      aWidaHei[i].tileLimits.X:=0;
      aWidaHei[i].tileLimits.Y:=0;
      aWidaHei[i].threshold.low:=0;
      aWidaHei[i].threshold.high:=0;
    end;

  for i:=1 to tilesCount do
    begin
      atiles[i].jpg:=TJPEGImage.Create;
      atiles[i].loadedJpgFilename:='';
      atiles[i].png:=TPNGObject.Create;
      atiles[i].loadedPngFilename:='';
      atiles[i].fileLoaded:=false;
      //atiles[i].bitmap:=TBitmap.Create;
    end;

  image5.Picture.Bitmap.Width:=image3.Picture.Bitmap.Width;
  image5.Picture.Bitmap.Height:=image3.Picture.Bitmap.Height;
  image5.Picture.Bitmap.Canvas.Draw(0,0,image3.Picture.Bitmap);

end;

procedure TForm1.Memo2Change(Sender: TObject);
begin
  if memo2.Lines.Count<>2 then memo2.Color:=clred
   else memo2.Color:=clWhite;
end;

procedure TForm1.SpeedButton8Click(Sender: TObject);
begin
  memo2.Lines.Clear();
end;

procedure TForm1.Image2Click(Sender: TObject);
begin
  image2FullSizeMode:=not image2FullSizeMode;
  SetImageSize();
end;

procedure TForm1.ScrollBox1Resize(Sender: TObject);
begin
  SetImageSize();
end;

procedure TForm1.ScrollBox1MouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
  ScrollBox1.VertScrollBar.Position:=ScrollBox1.VertScrollBar.Position-WheelDelta;
end;

procedure TForm1.Image2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
 xRotated,yRotated,msuX,msuY,imgX,imgY:integer;
 timeOfMSULine : time_set;
 jTimeOfMSULine : double;
 sat_gd_this,sat_gd_next:vector;
 latitude,longitude:integer;
 latitudeF,longitudeF:double;
// latThis,lonThis,latNext,lonNext:double;
 zScaleXX_this,zScaleYY_this, zScaleXX_next,zScaleYY_next:double;
 minifier_good:double;
 zScale:byte;
 rotateLeftRight:double;
 angle:double;
 rgbColor:TRGBColor;
 hsbColor:THSBColor;
 DecimalSeparatorTmp: Char;
begin
  ScrollBox1.SetFocus();
  if MSUFullStruct.MSULinesInFile>0 then
    begin
      if (image2.Picture.Bitmap.Height*11)>MSUFullStruct.MSULinesInFile then //max img scale = 1/10, we take *11
        begin
          imgX:=(X * image2.Picture.Bitmap.Width) div image2.Width;
          imgY:=(Y * image2.Picture.Bitmap.Height) div image2.Height;
          if MSUFullStruct.timeIncrementer>0 then
            begin
              xRotated:=X;
              yRotated:=Y;
            end
           else
            begin
              xRotated:=image2.Width -1 - X;
              yRotated:=image2.Height -1 - Y;
            end;
          msuX:=(xRotated * MSUVideoChannelLen16bit) div image2.Width;
          msuY:=(yRotated * MSUFullStruct.MSULinesInFile) div image2.Height;

          timeOfMSULine:=MSUFullStruct.MSUVectorData[msuY].timeset;
          jTimeOfMSULine := Julian_Date(timeOfMSULine);

          minifier_good:=1{/2.5} * 55.4*piDiv180;
          rotateLeftRight:=TrackBar7.Position/10.0;
          getLatLonAltPlusOrtoVector(jTimeOfMSULine,+(msuX-MSUVideoChannelHalfLen16bit)*minifier_good/MSUVideoChannelHalfLen16bit-(rotateLeftRight*piDiv180),sat_gd_this);
//          getLatLonAltPlusOrtoVector(jTimeOfMSULine,+((msuX+1)-MSUVideoChannelHalfLen16bit)*minifier_good/MSUVideoChannelHalfLen16bit-(rotateLeftRight*piDiv180),sat_gd_next);
          latitudeF:=sat_gd_this[1]*piIn180;
          longitudeF:=Degrees(sat_gd_this[2]);
          latitude:=trunc(latitudeF);
          longitude:=round(longitudeF);
          //zScale:=calcZScale(latitude,round(calcAngle(sat_gd_this,sat_gd_next)));
          angle:=abs( (msuX-MSUVideoChannelHalfLen16bit)*100/(MSUVideoChannelHalfLen16bit) );
          zScale:=trunc(calcZScale(latitude{, round(angle)}{, false},8.0/TrackBar6.Position,TrackBar36.Position));
          label53.Caption:='Latitude: '+inttostr(latitude)+' Longitude: '+inttostr(longitude)+' zScale: '+inttostr(zScale);
          {
          latThis:=sat_gd_this[1]*piIn180;
          lonThis:=Degrees(sat_gd_this[2]);
          latNext:=sat_gd_next[1]*piIn180;
          lonNext:=Degrees(sat_gd_next[2]);
          }

          {
            zScaleXX_this:=DolgotaToX(Degrees(sat_gd_this[2]),aWidaHei[zScale].pixelLimits.X);
            zScaleYY_this:=ShirotaToY(sat_gd_this[1],aWidaHei[zScale].pixelLimits.Y);
            zScaleXX_next:=DolgotaToX(Degrees(sat_gd_next[2]),aWidaHei[zScale].pixelLimits.X);
            zScaleYY_next:=ShirotaToY(sat_gd_next[1],aWidaHei[zScale].pixelLimits.Y);

          angle:=arctan((zScaleYY_next-zScaleYY_this)/(zScaleXX_next-zScaleXX_this))*piIn180;
          }
          //label54.Caption:='Angle: '+inttostr(round(calcAngle(sat_gd_this,sat_gd_next)));
          label54.Caption:='Angle: '+inttostr(round(angle));

          rgbColor.R:=GetRValue(image2.Picture.Bitmap.Canvas.Pixels[imgX,imgY]);
          rgbColor.G:=GetGValue(image2.Picture.Bitmap.Canvas.Pixels[imgX,imgY]);
          rgbColor.B:=GetBValue(image2.Picture.Bitmap.Canvas.Pixels[imgX,imgY]);
          hsbColor:=RGBToHSB(rgbColor);

          label87.Caption:='Red: '+inttostr(rgbColor.r)+' Green: '+inttostr(rgbColor.g)+' Blue: '+inttostr(rgbColor.b);
          label88.Caption:='Hue: '+inttostr(round(hsbColor.Hue))+' Sat: '+inttostr(round(hsbColor.Sat))+' Bright: '+inttostr(round(hsbColor.Br));

          if timer1.Enabled then
            begin
              Memo4.Lines.Clear();

              DecimalSeparatorTmp:=DecimalSeparator;

              DecimalSeparator := '.';
              memo4.Lines.Add(format('%.6f, %.6f',[latitudeF,longitudeF]));
              memo4.Lines.Add(format('%.6f, %.6f',[longitudeF,latitudeF]));
              memo4.Lines.Add(format('%.6f, %.6f, %dz',[latitudeF,longitudeF,zScale]));
              memo4.Lines.Add(format('%.6f, %.6f, %dz',[longitudeF,latitudeF,zScale]));
              memo4.Lines.Add(format('https://www.google.ru/maps/@%.6f,%.6f,%dz',[latitudeF,longitudeF,zScale]));
//              memo4.Lines.Add('https://www.google.ru/maps/@'+FormatFloat('##.000000',latitudeF)+','+FormatFloat('##.000000',longitudeF)+','+inttostr(zScale)+'z');
              memo4.Lines.Add(format('https://yandex.ru/maps/?ll=%.6f%%2C%.6f&z=%d',[longitudeF,latitudeF,zScale]));

              DecimalSeparator:=DecimalSeparatorTmp;

            end;
        end;
    end;
end;

procedure TForm1.ScrollBox1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  ScrollBox1.SetFocus();
end;

procedure TForm1.TrackBar7Change(Sender: TObject);
begin
    Label36.Caption:=inttostr(TrackBar7.Position);
    rotatedByUser:=true;
end;

procedure TForm1.SpeedButton10Click(Sender: TObject);
var
 i:integer;
 pImageScanLine:PByteArray;
begin
  SetImgBitmapFormat(Image4,MSUVideoChannelLen16bit,MSUFullStruct.MSULastLineInFileUserWant+1);
  for i:=0 to MSUFullStruct.MSULastLineInFileUserWant do
    begin
      pImageScanLine:=Image4.Picture.Bitmap.ScanLine[i];
      FillRGBArray16bit(pImageScanLine,MSUFullStruct.MSUChannelsData[trackbar2.position][i],MSUFullStruct.MSUChannelsData[trackbar2.position][i],MSUFullStruct.MSUChannelsData[trackbar2.position][i],MSUVideoChannelLen16bit, $07, 10); // ������������� ����� ����� �� ���� /2 � � ��������� 3� ������� ����
    end;
  image4.Repaint();
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
  if od2.Execute then
    begin
      edit2.Text:=od2.FileName;
      SpeedButton11Click(Sender);
    end;
end;

procedure TForm1.SpeedButton11Click(Sender: TObject);
var
 i:integer;
 found:bool;
 m:TStringList;
begin
  m:=TStringList.Create();
  memo2.Lines.Clear();
  found:=false;
  if FileExists(edit2.Text) then
    try
      m.LoadFromFile(edit2.Text);
      for i:=0 to m.Count-1 do
        begin
          if m[i]=edit5.Text then
            begin
              if m.Count>=i+3 then
                begin
                  memo2.Lines.Add(m[i+1]);
                  memo2.Lines.Add(m[i+2]);
                  found:=true;
                end;
            end;
        end;
    except
    end;
  if not found then
    begin
      PageControl1.ActivePage:=TabSheet1;
      memo2.Lines.Add('ERROR: not found!');
    end;

end;

procedure TForm1.SpeedButton12Click(Sender: TObject);
begin
  edit5.Text:='METEOR-M 2              ';
end;

procedure TForm1.SpeedButton9Click(Sender: TObject);
var
 folder:string;
begin
  if SelectDirectory('�������� �������', '', folder) then
    begin
      edit3.Text:=folder;
    end;
end;

procedure TForm1.TrackBar8Change(Sender: TObject);
begin
  Label42.Caption:=inttostr(TrackBar8.Position);
  if TrackBar9.Position>TrackBar8.Position then TrackBar9.Position:=TrackBar8.Position;
end;

procedure TForm1.TrackBar9Change(Sender: TObject);
begin
  Label43.Caption:=inttostr(TrackBar9.Position);
  if TrackBar8.Position<TrackBar9.Position then TrackBar8.Position:=TrackBar9.Position;
  if TrackBar10.Position>TrackBar9.Position then TrackBar10.Position:=TrackBar9.Position;
end;

procedure TForm1.TrackBar10Change(Sender: TObject);
begin
  Label44.Caption:=inttostr(TrackBar10.Position);
  if TrackBar9.Position<TrackBar10.Position then TrackBar9.Position:=TrackBar10.Position;
  if TrackBar11.Position>TrackBar10.Position then TrackBar11.Position:=TrackBar10.Position;
end;

procedure TForm1.TrackBar11Change(Sender: TObject);
begin
  Label45.Caption:=inttostr(TrackBar11.Position);
  if TrackBar10.Position<TrackBar11.Position then TrackBar10.Position:=TrackBar11.Position;
  if TrackBar12.Position>TrackBar11.Position then TrackBar12.Position:=TrackBar11.Position;
end;

procedure TForm1.TrackBar12Change(Sender: TObject);
begin
  Label46.Caption:=inttostr(TrackBar12.Position);
  if TrackBar11.Position<TrackBar12.Position then TrackBar11.Position:=TrackBar12.Position;
  if TrackBar13.Position>TrackBar12.Position then TrackBar13.Position:=TrackBar12.Position;
end;

procedure TForm1.TrackBar13Change(Sender: TObject);
begin
  Label50.Caption:=inttostr(TrackBar13.Position);
  if TrackBar12.Position<TrackBar13.Position then TrackBar12.Position:=TrackBar13.Position;
end;

procedure TForm1.TrackBar14Change(Sender: TObject);
begin
  Label51.Caption:=inttostr(TrackBar14.Position)+'%';
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  WriteIniFile();
end;

procedure TForm1.TrackBar21Change(Sender: TObject);
begin
  Label73.Caption:=inttostr(TrackBar21.Position+1);
end;

procedure TForm1.TrackBar22Change(Sender: TObject);
begin
  Label74.Caption:=inttostr(TrackBar22.Position+1);
end;

procedure TForm1.TrackBar23Change(Sender: TObject);
begin
  Label75.Caption:=inttostr(TrackBar23.Position+1);
end;

procedure TForm1.TrackBar15Change(Sender: TObject);
begin
  Label64.Caption:=inttostr(TrackBar15.Position);
end;

procedure TForm1.TrackBar17Change(Sender: TObject);
begin
  Label66.Caption:=inttostr(TrackBar17.Position);
end;

procedure TForm1.TrackBar19Change(Sender: TObject);
begin
  Label68.Caption:=inttostr(TrackBar19.Position);
end;

procedure TForm1.TrackBar16Change(Sender: TObject);
begin
  Label65.Caption:=inttostr(TrackBar16.Position)+' %';
end;

procedure TForm1.TrackBar18Change(Sender: TObject);
begin
  Label67.Caption:=inttostr(TrackBar18.Position)+' %';
end;

procedure TForm1.TrackBar20Change(Sender: TObject);
begin
  Label69.Caption:=inttostr(TrackBar20.Position)+' %';
end;

procedure TForm1.TrackBar24Change(Sender: TObject);
begin
    Label77.Caption:=inttostr(TrackBar24.Position);
    rotatedByUser:=true;
end;

procedure TForm1.TrackBar25Change(Sender: TObject);
begin
    Label79.Caption:=inttostr(TrackBar25.Position);
    rotatedByUser:=true;
end;

procedure TForm1.SpeedButton13Click(Sender: TObject);
begin
  stopFlag:=true;
end;

procedure TForm1.TrackBar26Change(Sender: TObject);
begin
  Label82.Caption:=inttostr(TrackBar26.Position)+' %';
end;

procedure TForm1.TrackBar27Change(Sender: TObject);
begin
  Label84.Caption:=inttostr(TrackBar27.Position);
end;

procedure TForm1.SpeedButton14Click(Sender: TObject);
var
 chan:byte;
 i,j:integer;
 wide,iWide:integer;
begin
  wide:=TrackBar28.Position;

  screen.Cursor:=crHourGlass;
  ProgressBar1.Position:=0;
  ProgressBar1.Max:=(ChannelsCount*wide)-1;
  Application.ProcessMessages();

  for iWide:= 1 to wide do
    begin
      for chan:=0 to ChannelsCount-1 do
        begin
          // ���� ��������, ������� ��� ������ for i:=1 to MSUFullStruct.MSULinesInFile-2 do
          for i:=1 to MSUFullStruct.MSULastLineInFileUserWant-1 do
            begin
              for j:=1 to MSUVideoChannelLen16bit-2 do
                begin
                  RepairBrokenPixel(chan, i, j, iWide);
                end;
            end;
          ProgressBar1.Position:=((iWide-1)*ChannelsCount)+chan;
          Application.ProcessMessages();
        end;
    end;

  ProgressBar1.Position:=0;
  //PageControl1.ActivePage:=TabSheet2;
  screen.Cursor:=crDefault;
end;

procedure TForm1.TrackBar28Change(Sender: TObject);
begin
    Label86.Caption:=inttostr(TrackBar28.Position);
end;

procedure TForm1.SpeedButton15Click(Sender: TObject);
begin
 if od3.Execute then
   begin
     edit6.Text:=od3.FileName;
     LoadFalseColorMap(od3.FileName,image6);
   end;
end;

procedure TForm1.TrackBar29Change(Sender: TObject);
begin
  Label98.Caption:=inttostr(TrackBar29.Position+1);
end;

procedure TForm1.TrackBar32Change(Sender: TObject);
begin
  Label101.Caption:=inttostr(TrackBar32.Position+1);
end;

procedure TForm1.TrackBar30Change(Sender: TObject);
begin
  Label99.Caption:=inttostr(TrackBar30.Position);
end;

procedure TForm1.TrackBar33Change(Sender: TObject);
begin
  Label102.Caption:=inttostr(TrackBar33.Position);
end;

procedure TForm1.TrackBar31Change(Sender: TObject);
begin
  Label100.Caption:=inttostr(TrackBar31.Position)+' %';
end;

procedure TForm1.TrackBar34Change(Sender: TObject);
begin
  Label103.Caption:=inttostr(TrackBar34.Position)+' %';
end;

procedure TForm1.SpeedButton16Click(Sender: TObject);
var
 JulianTime : double;
 time1:time_set;
 sat_pos,sat_vel,obs_gd,  sat_gd, obs:vector;

 wid,hei:integer;
 mapX,mapY:integer;
  markerRadius:Integer;


begin



// ������� ����������� ��� ������� �������� http://meteosputnik.ru/autogallery/hrpt/2015-06-22-11-03-meteor2.jpg


  //sat_data[1][1]:=tle_1;
  //sat_data[1][2]:=tle_2;
  {
  Get_Current_Time(time1);
  }

//�������� ����� �������
  time1.yr:=2015;
  time1.mo:=06;
  time1.dy:=22;
  time1.hr:=07;
  time1.mi:=45;
  time1.se:=00;
  time1.hu:=0;// � � � � � ���� �������, �����

// �������� ��� �� ���� � ���������
  sat_data[1][1]:=memo2.Lines[0];
  sat_data[1][2]:=memo2.Lines[1];
  Convert_Satellite_Data(1);  // 1 -> ������ ������� �� ��� �����

//����������� ������� � ���������
  JulianTime := Julian_Date(time1);
//���������� ������� ������������ �� ��������
  JulianTime := JulianTime + TrackBar35.Position/2000;

//��������� ��� ���� ���
  SGP(JulianTime,sat_pos,sat_vel);
  Convert_Sat_State(sat_pos,sat_vel); //����������� ������������� ������ � ����������� ���������
//������ �������������� ����� - �� ������ ������ sat_gd
  Calculate_LatLonAlt(sat_pos,JulianTime,sat_gd); //������ � ������� ��������������� ����� �������� �� �����

//��������� �������� �� �����������
  {lat} obs_gd[1]:=Radians(55.4); // ������
  {lon} obs_gd[2]:=Radians(36.7); // �������
  {alt} obs_gd[3]:=0.164; //������
//������ ������� � ���� ����� �������� - �� ������ ������ obs
  Calculate_Obs(sat_pos,sat_vel,obs_gd,JulianTime, obs); //������ � ��������



//////////////////////////////////////////////////////////////////
// ����� �� �����. ������� � � � � � � � � � � � �� ��������!!! //
//////////////////////////////////////////////////////////////////

//����� �������������� �����

  memo3.Lines.Clear();
  memo3.Lines.Add('������ lat:');
  memo3.Lines.Add('  sat_gd[1] :');
  memo3.Lines.Add('    ' + floattostr(sat_gd[1]));
  memo3.Lines.Add('  Degrees(sat_gd[1]) :');
  memo3.Lines.Add('    ' + floattostr(Degrees(sat_gd[1])));
  memo3.Lines.Add('������� lon:');
  memo3.Lines.Add('  sat_gd[2] :');
  memo3.Lines.Add('    ' + floattostr(sat_gd[2]));
  memo3.Lines.Add('  Degrees(sat_gd[2]) :');
  memo3.Lines.Add('    ' + floattostr(Degrees(sat_gd[2])));
  memo3.Lines.Add('������ alt:');
  memo3.Lines.Add('  sat_gd[3] :');
  memo3.Lines.Add('    ' + floattostr(sat_gd[3]));
  memo3.Lines.Add('����? �� ����� theta:');
  memo3.Lines.Add('  sat_gd[4] :');
  memo3.Lines.Add('    ' + floattostr(sat_gd[4]));
  memo3.Lines.Add('  Degrees(sat_gd[4]) :');
  memo3.Lines.Add('    ' + floattostr(Degrees(sat_gd[4])));


//����������� �����

  wid:=image5.Picture.Bitmap.Width;
  hei:=image5.Picture.Bitmap.Height;

// mapX - ���������� ������ �� ����������
  mapX:=round(DolgotaToX(Degrees(sat_gd[2]),wid));
  mapY:=round(ShirotaToY_NO_MERKATOR(Degrees(sat_gd[1]),hei));
  markerRadius:=(wid*5) div 360;

  image5.Picture.Bitmap.Canvas.Draw(0,0,image3.Picture.Bitmap);
  image5.Picture.Bitmap.Canvas.Pen.Color:=clBlack;
  image5.Picture.Bitmap.Canvas.Ellipse(rect(mapX - markerRadius,mapY - markerRadius,mapX + markerRadius,mapY + markerRadius ));


//����� ����������� �� �������

  memo3.Lines.Add('');
  memo3.Lines.Add('������ Azimuth:');
  memo3.Lines.Add('  obs[1] :');
  memo3.Lines.Add('    ' + floattostr(obs[1]));
  memo3.Lines.Add('  Degrees(obs[1]) :');
  memo3.Lines.Add('    ' + floattostr(Degrees(obs[1])));
  memo3.Lines.Add('�������� Elevation:');
  memo3.Lines.Add('  obs[2] :');
  memo3.Lines.Add('    ' + floattostr(obs[2]));
  memo3.Lines.Add('  Degrees(obs[2]) :');
  memo3.Lines.Add('    ' + floattostr(Degrees(obs[2])));
  memo3.Lines.Add('���������� �� ��������? Range (kilometers):');
  memo3.Lines.Add('  obs[3] :');
  memo3.Lines.Add('    ' + floattostr(obs[3]));
  memo3.Lines.Add('�������� ��������� (��� �������)? Range Rate (kilometers/second):');
  memo3.Lines.Add('  obs[4] :');
  memo3.Lines.Add('    ' + floattostr(obs[4]));

//�����������

  mapX:=round(DolgotaToX(Degrees(obs_gd[2]),wid));
  mapY:=round(ShirotaToY_NO_MERKATOR(Degrees(obs_gd[1]),hei));
  markerRadius:=(wid*3) div 360;

//  image5.Picture.Bitmap.Canvas.Draw(0,0,image3.Picture.Bitmap);
  image5.Picture.Bitmap.Canvas.Pen.Color:=clBlue;
  image5.Picture.Bitmap.Canvas.Ellipse(rect(mapX - markerRadius,mapY - markerRadius,mapX + markerRadius,mapY + markerRadius ));

  image5.Picture.Bitmap.Canvas.Brush.Color:=rgb(230,230,230);
  image5.Picture.Bitmap.Canvas.Ellipse(rect(0,0,180,180));
  image5.Picture.Bitmap.Canvas.Brush.Color:=rgb(240,240,240);
  image5.Picture.Bitmap.Canvas.Ellipse(rect(45,45,135,135));
  image5.Picture.Bitmap.Canvas.Brush.Color:=clWhite;
  image5.Picture.Bitmap.Canvas.MoveTo(90,0);
  image5.Picture.Bitmap.Canvas.LineTo(90,180);
  image5.Picture.Bitmap.Canvas.MoveTo(0,90);
  image5.Picture.Bitmap.Canvas.LineTo(180,90);

  image5.Picture.Bitmap.Canvas.Ellipse(rect(87,87,93,93));
  image5.Picture.Bitmap.Canvas.Ellipse(rect(round( 85+ (sin (obs[1])*180*((pi/2-obs[2])/pi)) ),round( 85+ (-cos (obs[1])*180*((pi/2-obs[2])/pi))),round( 95+ (sin (obs[1])*180*((pi/2-obs[2])/pi))),round( 95+ (-cos (obs[1])*180*((pi/2-obs[2])/pi)))));

end;

procedure TForm1.TrackBar35Change(Sender: TObject);
begin
  SpeedButton16Click(sender);
end;

procedure TForm1.Image7MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  MSUFullStruct.MSULastLineInFileUserWant:=(MSUFullStruct.MSULinesInFile*y) div image7.Height;
  Image7Draw();

  SpeedButton7Click(Sender);    //��������� ����� �������� �� ������� Night Method
  SpeedButton10Click(Sender);   //��������� ������ �������� �� ������� Night Method

//  label104.Caption:='����� '+IntToStr(MSUFullStruct.MSULinesInFile)+' �����';
end;

procedure TForm1.Image8MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if y<(Image8.Height/3) then
    MSUFullStruct.NightUserCalibrFirstLine:=(x*256) div Image8.Width;
  if y>(Image8.Height*2/3) then
    MSUFullStruct.NightUserCalibrLastLine:=(x*256) div Image8.Width;
  if (y>(Image8.Height/3)) and (y<(Image8.Height*2/3)) then
    begin
      MSUFullStruct.NightUserCalibrFirstLine:=127;
      MSUFullStruct.NightUserCalibrLastLine:=127;
    end;

  SpeedButton7Click(Sender);
end;


procedure TForm1.TrackBar36Change(Sender: TObject);
begin
  label107.Caption:=inttostr(TrackBar36.Position-5);
end;

procedure TForm1.SpeedButton17Click(Sender: TObject);
var
 i,j,k:integer;
 s:string;
begin
  memo3.Lines.Clear();
  for i:=0 to 2 do
    begin
      for j:=0 to 9 do
        begin
          s:='';
          for k:=0 to 9 do
            begin
              s:=s+#$9+inttostr(i)+', '+inttostr(j)+', '+inttostr(k)+', ';
            end;
          memo3.Lines.Add(s+'\');
        end;
    end;
end;

procedure TForm1.SpeedButton18Click(Sender: TObject);
begin
  ScrollBar1.Position:=10;
  ScrollBar1.Visible:=true;
  memo4.Color:=clBtnFace;
  timer1.Enabled:=true;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  if ScrollBar1.Position>0 then
    begin
      ScrollBar1.Position:=ScrollBar1.Position-1;
    end
   else
     begin
       timer1.Enabled:=false;
       ScrollBar1.Visible:=false;
       memo4.Color:=clWindow;
     end
end;

end.
