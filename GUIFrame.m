function varargout = GUIFrame(varargin)
% 这是一个为了方便实验而做的外框，在这个框架下，可以选择需要用的函数，
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


% 对图像序列进行匹配的界面-------------------------------------------------------------
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
set(handles.Info2,'String','轨迹显示开启');


% --- Executes on button press in MyFunction2.
function MyFunction2_Callback(hObject, eventdata, handles)
% hObject    handle to MyFunction2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FuncName,FuncPath,flag] = uigetfile('*.m','选择使用的函数');
if(flag ~= 0)
%     addpath(genpath(FuncPath));
    addpath(FuncPath);
end
global BaseFunc;
BaseFunc = str2func(strrep(FuncName,'.m',''));
functions(BaseFunc)
% path                          %%%测试路径添加操作是否成功
rmpath(FuncPath);             %%为了避免对其他工程造成影响，在实验结束后应该将函数路径全部移除

% --- Executes on button press in MyPicture2.
function MyPicture2_Callback(hObject, eventdata, handles)
% hObject    handle to MyPicture2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global mydir;
mydir = uigetdir('','选择待匹配图片文件夹');
set(handles.Info2,'String',mydir);


% --------菜单栏编辑--------------------------------------------------------
function menu_Callback(hObject, eventdata, handles)
% hObject    handle to menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in TemChoose1.
function TemChoose1_Callback(hObject, eventdata, handles)
% hObject    handle to TemChoose1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ImgTemp;  %全局变量，是匹配函数中的其中一个输入变量-----模板图像
[tempPic,tempPath,flag] = uigetfile({'*.jpg';'*.bmp';'*.png';'*.tiff';'*.pgm'},'选择模板图片');
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
global ImgTar;  %全局变量，是匹配函数中的其中一个输入变量-----待匹配图像
[tarPic,tarPath,flag] = uigetfile({'*.jpg';'*.bmp';'*.png';'*.tiff';'*.pgm'},'选择待匹配图片');
if(flag ~= 0)
    ImgTar = imread([tarPath,tarPic]);
    figure(1);
    imshow(ImgTar);
end

%%%  选择要使用的函数
% --- Executes on button press in FuncChoose1.
function FuncChoose1_Callback(hObject, eventdata, handles)
% hObject    handle to FuncChoose1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FuncName,FuncPath,flag] = uigetfile('*.m','选择使用的函数');
if(flag ~= 0)
%     addpath(genpath(FuncPath));
    addpath(FuncPath);
end
global BaseFunc;
BaseFunc = str2func(strrep(FuncName,'.m',''));
functions(BaseFunc)
% path                          %%%测试路径添加操作是否成功
rmpath(FuncPath);             %%为了避免对其他工程造成影响，在实验结束后应该将函数路径全部移除


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

%%% 单幅图像匹配时的运行函数
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
[max_c, imax] = max(ResultArray(:));                  %求计算结果中的最大值点
[ypeak, xpeak] = ind2sub(size(ResultArray),imax(1));
[temH,temW] = size(ImgTemp);
m = fix(temH/2);
n = fix(temW/2);
resultInfo = ['行坐标',num2str(ypeak+m),'列坐标',num2str(xpeak+n),'响应值',num2str(max_c)];
set(handles.Info1,'String',resultInfo);
figure(1);
title('匹配结果');
imshow(ImgTar);
hold on
rectangle('Position',[xpeak,ypeak,m*2,n*2],'EdgeColor','r');     %用红色矩形框出目标物体
hold off

%%% 图像序列匹配时的运行函数
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
%%%该函数是针对序列图像的处理程序。调用选择的基本函数计算图片的相关值，然后显示跟踪结果，可以选择保存为单帧图或者视频。
%   mydir       图片序列所在的目录
%   BaseFunc    计算模板与图片之间的相关值
%   SaveEnable  若为0则只显示结果，若为1则对结果进行保存
%   VideoEnable 若为1则保存为视频文件
%   TrajectoryEnable   若为1则在图片中显示目标运动的轨迹
%%%%%%%%%%%%功能还可以更完善

global PauseEnable;
global SeriesStart;
global SeriesEnd;
SeriesStart = 1;
SeriesEnd = 5;
tempsize = [48 48];   %%指示模板的尺寸，宽*高
I = imread([mydir,'\',num2str(SeriesStart),'.jpg']);  %%序列图像只支持jpg格式
figure(1);imshow(I);hold on
pt = ginput(1);r = round(pt(2));c = round(pt(1));   %%%获取模板中心
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
    
    [max_c, imax] = max(abs(ResultArray(:)));                  %求相关系数的最大值点
    [ypeak,xpeak] = ind2sub(size(ResultArray),imax(1));    
    
    r = ypeak+tempsize(2)/2;c = xpeak+tempsize(1)/2;
    imgTar(r,c-crossLength:c-3,:)=255;imgTar(r,c+3:c+crossLength,:)=255;%左边框
    imgTar(r-crossLength:r-3,c,:)=255;imgTar(r+3:r+crossLength,c,:)=255;%下边框
    imgTar(r,c,:)=255;%画十字叉
    imgTar(r+round(tempsize(1)/2),c-round(tempsize(2)/2):c+round(tempsize(2)/2),:)=255;
    imgTar(r-round(tempsize(1)/2),c-round(tempsize(2)/2):c+round(tempsize(2)/2),:)=255;
    imgTar(r-round(tempsize(1)/2):r+round(tempsize(1)/2),c-round(tempsize(2)/2),:)=255;
    imgTar(r-round(tempsize(1)/2):r+round(tempsize(1)/2),c+round(tempsize(2)/2),:)=255;

    %%%记录轨迹
    if(TrajectoryEnable == 1)
        rtp(num-SeriesStart+1) = r;
        ctp(num-SeriesStart+1) = c;
        imgTar=bitmapplot(rtp,ctp,imgTar,struct('LineWidth',1,'Color',[1 0 0 1]));    
    end
    
    resultInfo = ['帧数',num2str(num),'行坐标',num2str(r),'列坐标',num2str(c),'响应值',num2str(max_c)];
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
    
    
