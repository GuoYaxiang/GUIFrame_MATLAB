function varargout = GUIFrame(varargin)
% ����һ��Ϊ�˷���ʵ�������������������£�����ѡ����Ҫ�õĺ�����
% GUIFRAME MATLAB code for GUIFrame.fig
%      GUIFRAME, by itself, creates a new GUIFRAME or raises the existing
%      singleton*.
%
%      H = GUIFRAME returns the handle to a new GUIFRAME or the handle to
%      the existing singleton*.
%
%      GUIFRAME('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIFRAME.M with the given input arguments.
%
%      GUIFRAME('Property','Value',...) creates a new GUIFRAME or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUIFrame_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUIFrame_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUIFrame

% Last Modified by GUIDE v2.5 14-Oct-2016 15:21:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUIFrame_OpeningFcn, ...
                   'gui_OutputFcn',  @GUIFrame_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before GUIFrame is made visible.
function GUIFrame_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUIFrame (see VARARGIN)

% Choose default command line output for GUIFrame
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUIFrame wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUIFrame_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function SinglePic_Callback(hObject, eventdata, handles)
% hObject    handle to SinglePic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h2 = [handles.Info2 handles.ResultDisp2 handles.FrameMode2 handles.SeriesMode2 handles.uipanel2 ...
      handles.TrajectoryEnable2 handles.ResultSave2 handles.SaveEnable2 ...
      handles.MyFunction2 handles.MyPicture2 handles.InitTip handles.Run2];
set(h2,'Visible','off');
  
h1 = [handles.TemChoose1 handles.PicChoose1 handles.FuncChoose1 handles.Info1 handles.Run1 handles.CloseAll];
set(h1,'Visible','on');


% ��ͼ�����н���ƥ��Ľ���-------------------------------------------------------------
function SeriesPic_Callback(hObject, eventdata, handles)
% hObject    handle to SeriesPic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h2 = [handles.Info2 handles.ResultDisp2 handles.FrameMode2 handles.SeriesMode2 handles.uipanel2 handles.TrajectoryEnable2 ...
      handles.ResultSave2 handles.SaveEnable2 handles.MyFunction2 handles.MyPicture2 handles.Run2 handles.CloseAll];
set(h2,'Visible','on');
  
h1 = [handles.TemChoose1 handles.PicChoose1 handles.FuncChoose1 handles.Info1 handles.InitTip handles.Run1];
set(h1,'Visible','off');


% --- Executes when selected object is changed in uipanel2.
function uipanel2_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel2 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
global PauseEnable;
s = get(hObject,'Tag');
switch s
    case 'FrameMode2'
        PauseEnable = 1;
    case 'SeriesMode2'   
        PauseEnable = 0;
end    
set(handles.Info2,'String',s);


% --- Executes on selection change in SaveEnable2.
function SaveEnable2_Callback(hObject, eventdata, handles)
% hObject    handle to SaveEnable2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns SaveEnable2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from SaveEnable2
global SaveEnable;
global VideoEnable;
s = get(hObject,'Value');
switch s
    case 1
        SaveEnable = 0;
        VideoEnable = 0;
    case 2 
        SaveEnable = 1;
        VideoEnable = 0;
    case 3     
        SaveEnable = 1;
        VideoEnable = 1;
end
set(handles.Info2,'String',s);


% --- Executes during object creation, after setting all properties.
function SaveEnable2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SaveEnable2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in TrajectoryEnable2.
function TrajectoryEnable2_Callback(hObject, eventdata, handles)
% hObject    handle to TrajectoryEnable2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of TrajectoryEnable2
global TrajectoryEnable; 
TrajectoryEnable = get(hObject,'Value');
set(handles.Info2,'String','�켣��ʾ����');


% --- Executes on button press in MyFunction2.
function MyFunction2_Callback(hObject, eventdata, handles)
% hObject    handle to MyFunction2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FuncName,FuncPath,flag] = uigetfile('*.m','ѡ��ʹ�õĺ���');
if(flag ~= 0)
%     addpath(genpath(FuncPath));
    addpath(FuncPath);
end
global BaseFunc;
BaseFunc = str2func(strrep(FuncName,'.m',''));
functions(BaseFunc)
% path                          %%%����·����Ӳ����Ƿ�ɹ�
rmpath(FuncPath);             %%Ϊ�˱���������������Ӱ�죬��ʵ�������Ӧ�ý�����·��ȫ���Ƴ�

% --- Executes on button press in MyPicture2.
function MyPicture2_Callback(hObject, eventdata, handles)
% hObject    handle to MyPicture2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global mydir;
mydir = uigetdir('','ѡ���ƥ��ͼƬ�ļ���');
set(handles.Info2,'String',mydir);


% --------�˵����༭--------------------------------------------------------
function menu_Callback(hObject, eventdata, handles)
% hObject    handle to menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in TemChoose1.
function TemChoose1_Callback(hObject, eventdata, handles)
% hObject    handle to TemChoose1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ImgTemp;  %ȫ�ֱ�������ƥ�亯���е�����һ���������-----ģ��ͼ��
[tempPic,tempPath,flag] = uigetfile({'*.jpg';'*.bmp';'*.png';'*.tiff';'*.pgm'},'ѡ��ģ��ͼƬ');
if(flag ~= 0)
    ImgTemp = imread([tempPath,tempPic]);
    figure(1);
    imshow(ImgTemp);
end

% --- Executes on button press in PicChoose1.
function PicChoose1_Callback(hObject, eventdata, handles)
% hObject    handle to PicChoose1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ImgTar;  %ȫ�ֱ�������ƥ�亯���е�����һ���������-----��ƥ��ͼ��
[tarPic,tarPath,flag] = uigetfile({'*.jpg';'*.bmp';'*.png';'*.tiff';'*.pgm'},'ѡ���ƥ��ͼƬ');
if(flag ~= 0)
    ImgTar = imread([tarPath,tarPic]);
    figure(1);
    imshow(ImgTar);
end

%%%  ѡ��Ҫʹ�õĺ���
% --- Executes on button press in FuncChoose1.
function FuncChoose1_Callback(hObject, eventdata, handles)
% hObject    handle to FuncChoose1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FuncName,FuncPath,flag] = uigetfile('*.m','ѡ��ʹ�õĺ���');
if(flag ~= 0)
%     addpath(genpath(FuncPath));
    addpath(FuncPath);
end
global BaseFunc;
BaseFunc = str2func(strrep(FuncName,'.m',''));
functions(BaseFunc)
% path                          %%%����·����Ӳ����Ƿ�ɹ�
rmpath(FuncPath);             %%Ϊ�˱���������������Ӱ�죬��ʵ�������Ӧ�ý�����·��ȫ���Ƴ�


function Info1_Callback(hObject, eventdata, handles)
% hObject    handle to Info1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Info1 as text
%        str2double(get(hObject,'String')) returns contents of Info1 as a double


% --- Executes during object creation, after setting all properties.
function Info1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Info1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Info2_Callback(hObject, eventdata, handles)
% hObject    handle to Info2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Info2 as text
%        str2double(get(hObject,'String')) returns contents of Info2 as a double


% --- Executes during object creation, after setting all properties.
function Info2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Info2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%% ����ͼ��ƥ��ʱ�����к���
% --- Executes on button press in Run1.
function Run1_Callback(hObject, eventdata, handles)
% hObject    handle to Run1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ImgTemp;
global ImgTar;
global BaseFunc;
if size(ImgTar,3)~=1
    ImgTar = rgb2gray(ImgTar);
end
if size(ImgTemp,3)~=1
    ImgTemp = rgb2gray(ImgTemp);
end
ResultArray = BaseFunc(ImgTar,ImgTemp);
[max_c, imax] = max(ResultArray(:));                  %��������е����ֵ��
[ypeak, xpeak] = ind2sub(size(ResultArray),imax(1));
[temH,temW] = size(ImgTemp);
m = fix(temH/2);
n = fix(temW/2);
resultInfo = ['������',num2str(ypeak+m),'������',num2str(xpeak+n),'��Ӧֵ',num2str(max_c)];
set(handles.Info1,'String',resultInfo);
figure(1);
title('ƥ����');
imshow(ImgTar);
hold on
rectangle('Position',[xpeak,ypeak,m*2,n*2],'EdgeColor','r');     %�ú�ɫ���ο��Ŀ������
hold off

%%% ͼ������ƥ��ʱ�����к���
% --- Executes on button press in Run2.
function Run2_Callback(hObject, eventdata, handles)
% hObject    handle to Run2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global mydir;
global SaveEnable;
global VideoEnable;
global TrajectoryEnable; 
global BaseFunc;

Run(mydir,BaseFunc,SaveEnable,VideoEnable,TrajectoryEnable,handles);


% --- Executes on button press in CloseAll.
function CloseAll_Callback(hObject, eventdata, handles)
% hObject    handle to CloseAll (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear all;
close all;
clc;
close();

function Run(mydir,BaseFunc,SaveEnable,VideoEnable,TrajectoryEnable,handles)
%%%�ú������������ͼ��Ĵ�����򡣵���ѡ��Ļ�����������ͼƬ�����ֵ��Ȼ����ʾ���ٽ��������ѡ�񱣴�Ϊ��֡ͼ������Ƶ��
%   mydir       ͼƬ�������ڵ�Ŀ¼
%   BaseFunc    ����ģ����ͼƬ֮������ֵ
%   SaveEnable  ��Ϊ0��ֻ��ʾ�������Ϊ1��Խ�����б���
%   VideoEnable ��Ϊ1�򱣴�Ϊ��Ƶ�ļ�
%   TrajectoryEnable   ��Ϊ1����ͼƬ����ʾĿ���˶��Ĺ켣
%%%%%%%%%%%%���ܻ����Ը�����

global PauseEnable;
global SeriesStart;
global SeriesEnd;
SeriesStart = 1;
SeriesEnd = 5;
tempsize = [48 48];   %%ָʾģ��ĳߴ磬��*��
I = imread([mydir,'\',num2str(SeriesStart),'.jpg']);  %%����ͼ��ֻ֧��jpg��ʽ
figure(1);imshow(I);hold on
pt = ginput(1);r = round(pt(2));c = round(pt(1));   %%%��ȡģ������
crossLength=10;
imgTemp = I(r-tempsize(2)/2:r+tempsize(2)/2,c-tempsize(1)/2:c+tempsize(1)/2,:);
if size(imgTemp,3) ~= 1
    imgTemp = rgb2gray(imgTemp);
end

if(VideoEnable == 1)
    mov = VideoWriter('Tracking Result.avi');
    mov.FrameRate = 15;
    mov.Quality = 20;
    open(mov);
end
if(TrajectoryEnable == 1)
    rtp = zeros(1,SeriesEnd-SeriesStart+1);
    ctp = zeros(1,SeriesEnd-SeriesStart+1);
end

for num=SeriesStart:SeriesEnd
    imgTar = imread([mydir,'\',num2str(num),'.jpg']);
    ResultArray = BaseFunc(imgTar,imgTemp);
    
    [max_c, imax] = max(abs(ResultArray(:)));                  %�����ϵ�������ֵ��
    [ypeak,xpeak] = ind2sub(size(ResultArray),imax(1));    
    
    r = ypeak+tempsize(2)/2;c = xpeak+tempsize(1)/2;
    imgTar(r,c-crossLength:c-3,:)=255;imgTar(r,c+3:c+crossLength,:)=255;%��߿�
    imgTar(r-crossLength:r-3,c,:)=255;imgTar(r+3:r+crossLength,c,:)=255;%�±߿�
    imgTar(r,c,:)=255;%��ʮ�ֲ�
    imgTar(r+round(tempsize(1)/2),c-round(tempsize(2)/2):c+round(tempsize(2)/2),:)=255;
    imgTar(r-round(tempsize(1)/2),c-round(tempsize(2)/2):c+round(tempsize(2)/2),:)=255;
    imgTar(r-round(tempsize(1)/2):r+round(tempsize(1)/2),c-round(tempsize(2)/2),:)=255;
    imgTar(r-round(tempsize(1)/2):r+round(tempsize(1)/2),c+round(tempsize(2)/2),:)=255;

    %%%��¼�켣
    if(TrajectoryEnable == 1)
        rtp(num-SeriesStart+1) = r;
        ctp(num-SeriesStart+1) = c;
        imgTar=bitmapplot(rtp,ctp,imgTar,struct('LineWidth',1,'Color',[1 0 0 1]));    
    end
    
    resultInfo = ['֡��',num2str(num),'������',num2str(r),'������',num2str(c),'��Ӧֵ',num2str(max_c)];
    set(handles.Info2,'String',resultInfo);
    
    figure(1);imshow(imgTar);
    if(VideoEnable == 1)
        writeVideo(mov,imgTar);
    elseif(SaveEnable == 1)
        savepath = ['result_',num2str(num),'.jpg'];
        imwrite(imgTar,savepath);
    end
    
    if(PauseEnable)
        pause;
    end
end
if(VideoEnable == 1)
    close(mov);
end    
    
    
