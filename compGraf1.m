function varargout = compGraf1(varargin)
% COMPGRAF1 MATLAB code for compGraf1.fig
%      COMPGRAF1, by itself, creates a new COMPGRAF1 or raises the existing
%      singleton*.
%
%      H = COMPGRAF1 returns the handle to a new COMPGRAF1 or the handle to
%      the existing singleton*.
%
%      COMPGRAF1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in COMPGRAF1.M with the given input arguments.
%
%      COMPGRAF1('Property','Value',...) creates a new COMPGRAF1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before compGraf1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to compGraf1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help compGraf1

% Last Modified by GUIDE v2.5 20-Feb-2023 21:33:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @compGraf1_OpeningFcn, ...
                   'gui_OutputFcn',  @compGraf1_OutputFcn, ...
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


% --- Executes just before compGraf1 is made visible.
function compGraf1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to compGraf1 (see VARARGIN)

% Choose default command line output for compGraf1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes compGraf1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = compGraf1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function path_Callback(hObject, eventdata, handles)
% hObject    handle to path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of path as text
%        str2double(get(hObject,'String')) returns contents of path as a double


% --- Executes during object creation, after setting all properties.
function path_CreateFcn(hObject, eventdata, handles)
% hObject    handle to path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in contrastBtn.
function contrastBtn_Callback(hObject, eventdata, handles)
% hObject    handle to contrastBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text5,'Visible','on');
set(handles.contrastImage,'Visible','off');
sourceImagePath=get(handles.path,'String');
sourceGraf=imread(char(sourceImagePath));
ymin=str2num(get(handles.edit3,'string'));
ymax=str2num(get(handles.edit4,'string'));
[m,n]=size(sourceGraf);
xmin=256;
xmax=0;
for i=1:m
    for j=1:n
        if sourceGraf(i,j)<xmin
            xmin=sourceGraf(i,j);
        end
        if sourceGraf(i,j)>xmax
            xmax=sourceGraf(i,j);
        end
    end
end
xmin=double(xmin);
xmax=double(xmax);
ymin=double(ymin);
ymax=double(ymax);
% for i=1:m
%     for j=1:n
%         contrastGraf(i,j)=uint8(double(sourceGraf(i,j)-xmin)*double(ymax-ymin)/double(xmax-xmin)+double(ymin));
%     end
% end
a=(ymax-ymin)/(xmax-xmin);
b=(xmax*ymin-xmin*ymax)/(xmax-xmin);
for i=1:m
    for j=1:n
        contrastGraf(i,j)=uint8(double(sourceGraf(i,j))*a+b);
    end
end
imshow(contrastGraf,'Parent',handles.contrastImage);

% --- Executes on button press in openImageBtn.
function openImageBtn_Callback(hObject, eventdata, handles)
% hObject    handle to openImageBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[sourceImage,sourceImagePath]=uigetfile('*.*','File Selector','C:\Users\Lenovo\Documents\MATLAB\Images\');
sourceImageGraph=imread(char(fullfile(sourceImagePath,sourceImage)));
set(handles.path,'String',strcat(sourceImagePath,sourceImage));
imshow(sourceImageGraph,'Parent',handles.sourceImage);


function newImageName_Callback(hObject, eventdata, handles)
% hObject    handle to newImageName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of newImageName as text
%        str2double(get(hObject,'String')) returns contents of newImageName as a double


% --- Executes during object creation, after setting all properties.
function newImageName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to newImageName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in saveBtn.
function saveBtn_Callback(hObject, eventdata, handles)
% hObject    handle to saveBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
saveImage=inputdlg({'Введите имя файла: '},'Сохранение файла', [1 50], {'newImage'},'on');
contrastGraf=uint8(getimage(handles.contrastImage));
imwrite(contrastGraf,strcat('C:/Users/Lenovo/Documents/MATLAB/Images/',string(saveImage),'.png'));
questdlg("Изображение сохранено!",'Оповещение','Ок','');



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
