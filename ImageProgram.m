function varargout = ImageProgram(varargin)
% ImageProgram MATLAB code for ImageProgram.fig
% Edit the above text to modify the response to help ImageProgram
% Last Modified by GUIDE v2.5 25-Dec-2018 22:00:46
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ImageProgram_OpeningFcn, ...
                   'gui_OutputFcn',  @ImageProgram_OutputFcn, ...
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


% --- Executes just before ImageProgram is made visible.
function ImageProgram_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ImageProgram (see VARARGIN)

% Choose default command line output for ImageProgram
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
axes(handles.axes1);
anh = imread('imageprogramtheme.jpg');
imshow(anh);
% UIWAIT makes ImageProgram wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ImageProgram_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% % % --- Executes on button press in close.
% % function close_Callback(hObject, eventdata, handles)
% % choice = questdlg('Ban co muon dong chuong trinh?', ...
% % 	'Lua Chon', ...
% % 	'Yes','No','No'); 
% % switch choice
% %     case 'Yes'
% %         close;
% %     case 'No'
% % end 



% --- Executes on button press in start.
function start_Callback(hObject, eventdata, handles)
close
thicuoiky

% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
