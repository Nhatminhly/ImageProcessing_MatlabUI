function varargout = thicuoiky(varargin)
% THICUOIKY MATLAB code for thicuoiky.fig

% Edit the above text to modify the response to help thicuoiky

% Last Modified by GUIDE v2.5 03-Jan-2019 16:22:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @thicuoiky_OpeningFcn, ...
                   'gui_OutputFcn',  @thicuoiky_OutputFcn, ...
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


% --- Executes just before thicuoiky is made visible.
function thicuoiky_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to thicuoiky (see VARARGIN)

% Choose default command line output for thicuoiky
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes thicuoiky wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = thicuoiky_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes(thi hanh)on button press in NhapAnh.
function NhapAnh_Callback(hObject, eventdata, handles)
 [filename,filepath] = uigetfile({'*.*'},'File Selector');
 fullname = [filepath filename];
 %now read that image (fullname)
 axes(handles.axes2);
 handles.hinhanh = imread(fullname);
 guidata(hObject,handles)
 imshow(handles.hinhanh);
 
function biendoiRadon_Callback(hObject, eventdata, handles) 
  axes(handles.axes3);
%   handles.hinhanh = imresize(handles.hinhanh,[220 220]);
%   handles.hinhanh = rgb2gray(handles.hinhanh);
  ra = imresize(handles.hinhanh,[220 220]);
  ra = rgb2gray(ra);
  ra = RadonTransform(ra,180,1);
%  myRadon(handles.hinhanh,179)
   guidata(hObject,handles);
   imshow(ra);
%    imshow(handles.radontrans);
   title('The sinogram of Radon transform');
 

function biendoiFourier_Callback(hObject, eventdata, handles)
axes(handles.axes3);
DP = fftshift(fft2(handles.hinhanh));
imshow(DP);
title('Fourier Transform')

function FilterBackProjection_Callback(hObject, eventdata, handles)
 ftb = imresize(handles.hinhanh,[220 220]);
 ftb = rgb2gray(ftb);
 ftb = mat2gray(ftb);
%  handles.hinhanh= mat2gray(handles.hinhanh);
 R = radon(ftb,0:5:180);
 I1 = iradon(R,0:5:180);   
 axes(handles.axes3);
 imshow(I1);
 title('Filtered BackProjection Transform')
