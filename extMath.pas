unit extMath;

interface

uses
    Support,
  SGP_Init,
  SGP_In,
  SGP_Time,
  SGP_Math,
  SGP_Conv,
  Solar,
  SGP4SDP4,
  SGP_Obs,
  SGP_Out,
   myConst, StdCtrls, ExtCtrls,
   SGP_Intf;


const
 piDiv180:double=pi/180;
 piIn180:double=180/pi;

//const
{ noaa16_1:string='1 26536U 00055A   13076.42963155  .00000201  00000-0  13237-3 0  1369';
 noaa16_2:string='2 26536  99.0540 128.2392 0010826  39.9070  85.2960 14.12848373643614';

 noaa19_1:string='1 33591U 09005A   13080.48979507  .00000086  00000-0  72100-4 0  7352';
 noaa19_2:string='2 33591  98.8972  23.2789 0013329 321.1357 148.5886 14.11473514212126';

 tle_1:string='1 33591U 09005A   13080.48979507  .00000086  00000-0  72100-4 0  7352';
 tle_2:string='2 33591  98.8972  23.2789 0013329 321.1357 148.5886 14.11473514212126';
}
procedure OrtoVector(x1,y1,z1,x2,y2,z2:double; out x3,y3,z3:double);  overload;
procedure OrtoVector(v1,v2:vector; out v3:vector);  overload;
function DolgotaToX(Dolgota:double; width:integer):single;
function ShirotaToY(Shirota:double; height:integer):single;
function ShirotaToY_NO_MERKATOR(Shirota_Gradusy:double; height:integer):single;
function AlphaFromGamma_version2(sat_pos:vector;PixelGamma:double{��� ���� ����� ��������� ��������� �������}):double;
function GammaFromAlpha_version2(sat_pos:vector;alpha:double{��� ���� ����� ��������� ��������� �������}):double;
function HsFromPixelGamma(sat_pos:vector;PixelGamma:double{��� ���� ����� ��������� ��������� �������}):double;
function HsFromPixelAlpha(sat_pos:vector;
                          PixelAlpha:double{��� ���� � ���������������� (���-�� ����������� �����:), ������� ����������� ������ ��������)};
                          var PixelGamma:double{��� ���� ����� ��������� ��������� ������� (� ������� ������ ��������)}):double;



procedure getLatLonAltPlusOrtoVector(JulianTime:double; gamma:double; var sat_gd:vector); overload;
procedure getLatLonAltPlusOrtoVectorSatShift(JulianTime:double; gamma:double; satShift:double; var sat_gd:vector); overload;
procedure getLatLonAltPlusOrtoVector(time:time_set; gamma:double; var sat_gd:vector);    overload;
procedure getLatLonAlt(JulianTime:double; var sat_gd:vector); overload;
procedure getLatLonAlt(time:time_set; var sat_gd:vector);    overload;
procedure getLatLonAltPlusSpeed(JulianTime:double; len:double; var sat_gd:vector); overload;
procedure getLatLonAltPlusSpeed(time:time_set; len:double; var sat_gd:vector);    overload;
procedure getLatLonAltPlusOrtoVectorLineynaya(JulianTime:double; len:double; var sat_gd:vector); overload;
procedure getLatLonAltPlusOrtoVectorLineynaya(time:time_set; len:double; var sat_gd:vector);    overload;

procedure getSat_Pos(JulianTime:double; var sat_pos:vector); overload;

//�������� ���� ������� ��� HRPT-6-�����  Function Julian_Date_from_HRPT(year,dayOfYear,msecOfDay, group6linesBack:longword) : double;



implementation

procedure OrtoVector(x1,y1,z1,x2,y2,z2:double; out x3,y3,z3:double);  overload;
var
 x,y,z,len:double;
begin
  x:=y1*z2-y2*z1;
  y:=x2*z1-x1*z2;
  z:=x1*y2-y1*x2;
  len:=sqrt(x*x+y*y+z*z);
  if len>0 then
    begin
      x3:=x/len;
      y3:=y/len;
      z3:=z/len;
    end
  else
    begin
      x3:=0;
      y3:=0;
      z3:=0;
    end;
end;

procedure OrtoVector(v1,v2:vector; out v3:vector);  overload;
var
 x1,y1,z1,x2,y2,z2,x3,y3,z3:double;
begin
  x1:=v1[1];
  y1:=v1[2];
  z1:=v1[3];
  x2:=v2[1];
  y2:=v2[2];
  z2:=v2[3];
  OrtoVector(x1,y1,z1,x2,y2,z2, x3,y3,z3);
  v3[1]:=x3;
  v3[2]:=y3;
  v3[3]:=z3;
  v3[4]:=0;
end;

function DolgotaToX(Dolgota:double; width:integer):single;
//������� �������� ��������
var
 x:double;
begin
  x:=((Dolgota))+180;
  if x> 360 then x:= x-360;
  DolgotaToX:=((x)/360*width);

end;

function ShirotaToY(Shirota:double; height:integer):single;
//������� �������� ��������
var
 y,h,h_delta:double;

 R:double;
begin
  R:=height/pi;//���� ����� ����������, �� ��� ������ ������ ����.
  y:=height/2-R/2*ln(tan(pi/4+Shirota/2));
  if y<0 then y:=0; //out of mercator map!!!
  if y>height then y:=height; //out of mercator map!!!

//  y:=height/2-R*ln(tan(pi/4+pi/2/2));
  {
  h:=height;
  h_delta:=h/85*5/2;
  h:=h/85*90;
  y:=90-(Shirota);
  }
  ShirotaToY:=y;
end;

function ShirotaToY_NO_MERKATOR(Shirota_Gradusy:double; height:integer):single;
//������� �������� ��������
var
 y,h,h_delta:double;
 R:double;
begin
  y:=(-(Shirota_Gradusy))+90;
  ShirotaToY_NO_MERKATOR:=((y)/180*height);
end;

function AlphaFromGamma(sat_gd:vector; PixelGamma:double):double;
//alpha - ��� ���� � ������ ����� ����� 1.�������� �������� � 2.������������ �� ����� �������� � �������� (�����������������)
var
 hf:double;//������ �������� �� ������ �����
 tgg:double;//tg(�����)
 D:double;//������������
 de:double;//����� ������-������� ������������
begin
  hf:= sqrt( sat_gd[1]*sat_gd[1] + sat_gd[2]*sat_gd[2] + sat_gd[3]*sat_gd[3] );
  tgg:= tan(PixelGamma);
  D:= 4*hf*hf*tgg*tgg*tgg*tgg - 4*(1+tgg*tgg)*(tgg*tgg*hf*hf-xkmper*xkmper); //xkmper - ������ �����
  if D<0 then
    D:=0;
  de:= (2*hf*tgg*tgg + sqrt(D)) / (2+2*tgg*tgg);

  AlphaFromGamma:= arccos(de/xkmper);
end;

function GammaFromAlpha(sat_pos:vector; PixelAlpha:double):double;
var
 hf:double;//������ �������� �� ������ �����
 tga:double;//tg(�����)
 D:double;//������������
 de:double;//����� ������-������� ������������
 he:double;//������ ������-������� ������������
 ds:double;//������ ������� ���������������� ������������ � ���� Gamma
begin
  hf:= sqrt( sat_pos[1]*sat_pos[1] + sat_pos[2]*sat_pos[2] + sat_pos[3]*sat_pos[3] );
  tga:= tan(PixelAlpha);
  de:= xkmper*cos(PixelAlpha); //xkmper - ������ �����
  he:= xkmper*sin(PixelAlpha);
  ds:= hf-de;
  GammaFromAlpha:= arctan(he/ds);
end;

function AlphaFromGamma_version2(sat_pos:vector;PixelGamma:double{��� ���� ����� ��������� ��������� �������}):double;
//alpha - ��� ���� � ������ ����� ����� 1.�������� �������� � 2.������������ �� ����� �������� � �������� (�����������������)
var
 hf:double;//������ �������� �� ������ �����
 alpha:double;//���� ������-������� ������������

 kTheoremOfSin:double;//����������� �� ������� �������: ������� �������� �� ����� ���������������� ����
 betta:double;//������ ���� � ������������ - ���, ��� �� ����� � �� �����
begin
  hf:= sqrt( sat_pos[1]*sat_pos[1] + sat_pos[2]*sat_pos[2] + sat_pos[3]*sat_pos[3] );

  if PixelGamma<>0 then
    begin
      kTheoremOfSin:=xkmper/sin(PixelGamma);
      betta:=(2*pi) - arcsin(hf/kTheoremOfSin);
      alpha:=2*pi - PixelGamma - betta;//� ������������ 180 ��������
      if PixelGamma<0 then alpha:=-alpha;
    end
  else
    begin
      alpha:=0;
    end;
  AlphaFromGamma_version2:=alpha;
end;

function GammaFromAlpha_version2(sat_pos:vector;alpha:double{��� ���� ����� ��������� ��������� �������}):double;
//alpha - ��� ���� � ������ ����� ����� 1.�������� �������� � 2.������������ �� ����� �������� � �������� (�����������������)
var
 hf:double;//������ �������� �� ������ �����
 pixelGamma:double;//���� ������-������� ������������
 l:double;//���������� �� �������� �� ����� �����, �� ������� ��������� �������

 kTheoremOfSin:double;//����������� �� ������� �������: ������� �������� �� ����� ���������������� ����
 betta:double;//������ ���� � ������������ - ���, ��� �� ����� � �� �����
begin
  hf:= sqrt( sat_pos[1]*sat_pos[1] + sat_pos[2]*sat_pos[2] + sat_pos[3]*sat_pos[3] );

  if alpha<>0 then
    begin
      l:=sqrt( xkmper*xkmper + hf*hf - (2*xkmper*hf*cos(alpha)) );
      kTheoremOfSin:=l/sin(alpha);
      pixelGamma:=arcsin(xkmper/kTheoremOfSin);
      //if PixelGamma<0 then pixelGamma:=-pixelGamma;
    end
  else
    begin
      pixelGamma:=0;
    end;
  GammaFromAlpha_version2:=pixelGamma;
end;

function HsFromPixelGamma(sat_pos:vector;PixelGamma:double{��� ���� ����� ��������� ��������� �������}):double;
//Hs - ��� �������� ������������ �������� �� ���������,
// ������� ������ ���� �������������� ����� ��� ����� � �������
var
 hf:double;//������ �������� �� ������ �����
{
 tgg:double;//tg(�����)
 D:double;//������������
 de:double;//����� ������-������� ������������
}
 alpha, alpha2:double;//���� ������-������� ������������
 tga:double;//tg(�����)
 Hs:double;
begin
  hf:= sqrt( sat_pos[1]*sat_pos[1] + sat_pos[2]*sat_pos[2] + sat_pos[3]*sat_pos[3] );
{
  tgg:= tan(PixelGamma);
  D:= 4*hf*hf*tgg*tgg*tgg*tgg - 4*(1+tgg*tgg)*(tgg*tgg*hf*hf-xkmper*xkmper); //xkmper - ������ �����
  if D<0 then
    D:=0;
  //if D<0 then
  //  D:= 4*hf*hf*tgg*tgg*tgg*tgg + 4*(1+tgg*tgg)*(tgg*tgg*hf*hf-xkmper*xkmper);
  de:= (2*hf*tgg*tgg + sqrt(D)) / (2+2*tgg*tgg);
//  de2:= (2*hf*tgg*tgg - sqrt(D)) / (2+2*tgg*tgg);
  alpha:= arccos(de/xkmper);
}
  //������ ������, �� ��� ����� ���� �������? alpha:= AlphaFromGamma(sat_gd,PixelGamma);
  alpha:= AlphaFromGamma_version2(sat_pos,PixelGamma);
  tga:= tan(alpha);
  hs:= tga*hf;
  HsFromPixelGamma:= hs;
end;

function HsFromPixelAlpha(sat_pos:vector;
                          PixelAlpha:double{��� ���� � ���������������� (���-�� ����������� �����:), ������� ����������� ������ ��������)};
                          var PixelGamma:double{��� ���� ����� ��������� ��������� ������� (� ������� ������ ��������)}):double;
//Hs - ��� �������� ������������ �������� �� ���������,
// ������� ������ ���� �������������� ����� ��� ����� � �������
var
 hf:double;//������ �������� �� ������ �����
 tgg:double;//tg(�����)
 D:double;//������������
 de:double;//����� ������-������� ������������
 he:double;//������ ������-������� ������������
 ds:double;//������ ������� ���������������� ������������ � ���� Gamma
 tga:double;//tg(�����)
 Hs:double;
begin
  hf:= sqrt( sat_pos[1]*sat_pos[1] + sat_pos[2]*sat_pos[2] + sat_pos[3]*sat_pos[3] );

 {
  tgg:= tan(PixelGamma);
  D:= 4*hf*hf*tgg*tgg*tgg*tgg - 4*(1+tgg*tgg)*(tgg*tgg*hf*hf-xkmper*xkmper);
  if D<0 then
    D:=0;
  //if D<0 then
  //  D:= 4*hf*hf*tgg*tgg*tgg*tgg + 4*(1+tgg*tgg)*(tgg*tgg*hf*hf-xkmper*xkmper);
  de:= (2*hf*tgg*tgg + sqrt(D)) / (2+2*tgg*tgg);
//  de2:= (2*hf*tgg*tgg - sqrt(D)) / (2+2*tgg*tgg);
  tga:= tan(arccos(de/xkmper));
  ------------------------------------------------------------------------------
  }
  tga:= tan(PixelAlpha);
  
  de:= xkmper*cos(PixelAlpha); //xkmper - ������ �����
  he:= xkmper*sin(PixelAlpha);
  ds:= hf-de;
  tgg:=he/ds;
  PixelGamma:=arctan(tgg);

  //������ ��� return hs
  hs:= tga*hf;
  HsFromPixelAlpha:= hs;
end;


procedure getLatLonAlt(JulianTime:double; var sat_gd:vector); overload;
//������� �������� ��������
var
  sat_pos,sat_vel:vector;
begin
  //sat_data[1][1]:=tle_1;
  //sat_data[1][2]:=tle_2;
  {
  Get_Current_Time(time1);

  time1.yr:=2013;
  time1.mo:=02;
  time1.dy:=26;
  time1.hr:=18;
  time1.mi:=17;
  time1.se:=49;
  time1.hu:=0;
  }
  //Convert_Satellite_Data(1);
  SGP(JulianTime,sat_pos,sat_vel);
  Convert_Sat_State(sat_pos,sat_vel); //����������� ������������� ������ � ����������� ���������
  Calculate_LatLonAlt(sat_pos,JulianTime,sat_gd);
end;



procedure getLatLonAlt(time:time_set; var sat_gd:vector);    overload;
begin
  getLatLonAlt(Julian_Date(time),sat_gd);
end;




procedure getLatLonAltPlusOrtoVector(JulianTime:double; gamma:double; var sat_gd:vector); overload;
//������� �������� ��������
var
  sat_pos,sat_vel,sat_orto:vector;
  new_len:double;
begin
  //sat_data[1][1]:=tle_1;
  //sat_data[1][2]:=tle_2;

  //Convert_Satellite_Data(1);
  SGP(JulianTime,sat_pos,sat_vel);
          Convert_Sat_State(sat_pos,sat_vel); //����������� ������������� ������ � ����������� ���������

  OrtoVector(sat_pos,sat_vel,sat_orto);
//  new_len:=(3-sqrt(3*3-len*len)) *sign(len)  +len;
  new_len:=HsFromPixelGamma(sat_pos,gamma)*sign(gamma);
  sat_pos[1]:=sat_pos[1]+sat_orto[1]/1*new_len;
  sat_pos[2]:=sat_pos[2]+sat_orto[2]/1*new_len;
  sat_pos[3]:=sat_pos[3]+sat_orto[3]/1*new_len;
//  sat_pos[]:=sat_pos[]+sat_vel[];
//**//**//**//  Convert_Sat_State(sat_pos,sat_vel); //����������� ������������� ������ � ����������� ���������
  Calculate_LatLonAlt(sat_pos,JulianTime,sat_gd);
end;

procedure getLatLonAltPlusOrtoVectorSatShift(JulianTime:double; gamma:double; satShift:double; var sat_gd:vector);
//������� �������� ��������
// gamma - ���� �������� ������� (������� � ������� �� �������������� �����)
// satShift - �������� ������������
var
  sat_pos,sat_vel,sat_orto:vector;
  new_len:double;

  //sat_gd_tmp:vector;
begin
  //sat_data[1][1]:=tle_1;
  //sat_data[1][2]:=tle_2;

  //Convert_Satellite_Data(1);
  SGP(JulianTime,sat_pos,sat_vel);
          Convert_Sat_State(sat_pos,sat_vel); //����������� ������������� ������ � ����������� ���������

  sat_pos[1]:=sat_pos[1]+sat_orto[1]/1*satShift;
  sat_pos[2]:=sat_pos[2]+sat_orto[2]/1*satShift;
  sat_pos[3]:=sat_pos[3]+sat_orto[3]/1*satShift;
  OrtoVector(sat_pos,sat_vel,sat_orto); // sat_orto - ������, ������������ ����� (� ����� ������) �� ����������� ������
  new_len:=HsFromPixelGamma(sat_pos,gamma)*sign(gamma); // new_len - ���������� �� �������� �� ��� ������� ���������
//  new_len:=(3-sqrt(3*3-len*len)) *sign(len)  +len;
  sat_pos[1]:=sat_pos[1]+sat_orto[1]/1*new_len;
  sat_pos[2]:=sat_pos[2]+sat_orto[2]/1*new_len;
  sat_pos[3]:=sat_pos[3]+sat_orto[3]/1*new_len;
//  sat_pos[]:=sat_pos[]+sat_vel[];
//**//**//**//  Convert_Sat_State(sat_pos,sat_vel); //����������� ������������� ������ � ����������� ���������

  //Calculate_LatLonAlt(sat_pos,JulianTime,sat_gd_tmp);


{*}{*}{*}{*}{*}{*}{*}{*}{*}{*} //Convert_Sat_State(sat_pos,sat_vel); //����������� ������������� ������ � ����������� ���������


  Calculate_LatLonAlt(sat_pos,JulianTime,sat_gd);
end;


procedure getLatLonAltPlusOrtoVector(time:time_set; gamma:double; var sat_gd:vector);    overload;
begin
  getLatLonAltPlusOrtoVector(Julian_Date(time),gamma,sat_gd);
end;



procedure getLatLonAltPlusSpeed(JulianTime:double; len:double; var sat_gd:vector); overload;
var
  sat_pos,sat_vel:vector;
begin
  //sat_data[1][1]:=tle_1;
  //sat_data[1][2]:=tle_2;

  //Convert_Satellite_Data(1);
  SGP(JulianTime,sat_pos,sat_vel);
  sat_pos[1]:=sat_pos[1]+sat_vel[1]/10*len;
  sat_pos[2]:=sat_pos[2]+sat_vel[2]/10*len;
  sat_pos[3]:=sat_pos[3]+sat_vel[3]/10*len;
//  sat_pos[]:=sat_pos[]+sat_vel[];
  Convert_Sat_State(sat_pos,sat_vel); //����������� ������������� ������ � ����������� ���������
  Calculate_LatLonAlt(sat_pos,JulianTime,sat_gd);
end;


procedure getLatLonAltPlusSpeed(time:time_set; len:double; var sat_gd:vector);    overload;
begin
  getLatLonAltPlusSpeed(Julian_Date(time),len,sat_gd);
end;




procedure getLatLonAltPlusOrtoVectorLineynaya(JulianTime:double; len:double; var sat_gd:vector); overload;
var
  sat_pos,sat_vel,sat_orto:vector;
  new_len:double;
begin
  //sat_data[1][1]:=tle_1;
  //sat_data[1][2]:=tle_2;

  //Convert_Satellite_Data(1);
  SGP(JulianTime,sat_pos,sat_vel);

  OrtoVector(sat_pos,sat_vel,sat_orto);
  new_len:=(3-sqrt(3*3-len*len)) *sign(len)  +len;
  sat_pos[1]:=sat_pos[1]+sat_orto[1]/10*new_len;
  sat_pos[2]:=sat_pos[2]+sat_orto[2]/10*new_len;
  sat_pos[3]:=sat_pos[3]+sat_orto[3]/10*new_len;
//  sat_pos[]:=sat_pos[]+sat_vel[];
  Convert_Sat_State(sat_pos,sat_vel); //����������� ������������� ������ � ����������� ���������
  Calculate_LatLonAlt(sat_pos,JulianTime,sat_gd);
end;



procedure getLatLonAltPlusOrtoVectorLineynaya(time:time_set; len:double; var sat_gd:vector);    overload;
begin
  getLatLonAltPlusOrtoVectorLineynaya(Julian_Date(time),len,sat_gd);
end;

procedure getSat_Pos(JulianTime:double; var sat_pos:vector); overload;
//������� �������� ��������
var
  sat_vel:vector;
begin
  SGP(JulianTime,sat_pos,sat_vel);
  Convert_Sat_State(sat_pos,sat_vel); //����������� ������������� ������ � ����������� ���������
end;

end.
