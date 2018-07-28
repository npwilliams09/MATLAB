function varargout = unitConverterGUI(varargin)
% UNITCONVERTERGUI MATLAB code for unitConverterGUI.fig
%      UNITCONVERTERGUI, by itself, creates a new UNITCONVERTERGUI or raises the existing
%      singleton*.
%
%      H = UNITCONVERTERGUI returns the handle to a new UNITCONVERTERGUI or the handle to
%      the existing singleton*.
%
%      UNITCONVERTERGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNITCONVERTERGUI.M with the given input arguments.
%
%      UNITCONVERTERGUI('Property','Value',...) creates a new UNITCONVERTERGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before unitConverterGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to unitConverterGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help unitConverterGUI

% Last Modified by GUIDE v2.5 27-Apr-2018 17:12:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @unitConverterGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @unitConverterGUI_OutputFcn, ...
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


% --- Executes just before unitConverterGUI is made visible.
function unitConverterGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to unitConverterGUI (see VARARGIN)

% Choose default command line output for unitConverterGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes unitConverterGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);

set(handles.text3,'String','°C');


% --- Outputs from this function are returned to the command line.
function varargout = unitConverterGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in calculate.
function calculate_Callback(hObject, eventdata, handles)
% hObject    handle to calculate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%get x value for function
if (get(handles.metric,'value') == 1)
    unitSys = 'm';
else 
    unitSys = 'i';
end

%get y value for function
if strcmp(unitSys, 'm')
    unitType = get(handles.MetricMenu,'value');
else
    unitType = get(handles.ImperialMenu,'value');
end

z = str2double(get(handles.edit1,'String'));


%call UnitConvert
[result,us,os,error1,error2] = UnitConvertGUIFct(unitSys, unitType, z);
%}
if (error1)
    resultStr = 'Please input a unit quantity';
elseif (error2)
    resultStr = 'Please ensure unit quantity is positive in this case';
else
    resultStr = sprintf("%g %s is equal to %g %s",z,os,result,us);
end

set(handles.text2, 'String', resultStr);

% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.metric,'value', 1);
uibuttongroup1_SelectionChangedFcn(handles.metric, eventdata, handles);
MetricMenu_Callback(handles.MetricMenu, eventdata, handles);
set(handles.MetricMenu,'value',1);
set(handles.edit1,'String','');
set(handles.text2,'String','Please input a unit quantity and press "Calculate"');
set(handles.text3,'String','°C');




function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function uibuttongroup1_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in unitgroup 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if (hObject == handles.metric)
    set(handles.MetricMenu, 'visible', 'on');
    set(handles.ImperialMenu, 'visible', 'off');
    set(handles.MetricMenu,'value',get(handles.ImperialMenu,'value'));
    MetricMenu_Callback(handles.MetricMenu, eventdata,handles);
    
    
   
else
    set(handles.MetricMenu, 'visible', 'off');
    set(handles.ImperialMenu, 'visible', 'on');
    set(handles.ImperialMenu,'value',get(handles.MetricMenu,'value'));
    ImperialMenu_Callback(handles.ImperialMenu, eventdata,handles);
    
end


% --- Executes on selection change in ImperialMenu.
function ImperialMenu_Callback(hObject, eventdata, handles)
% hObject    handle to ImperialMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns ImperialMenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ImperialMenu
switch get(handles.ImperialMenu,'value')
    case 1
        x = '°F';
    case 2
        x = 'inches';
    case 3
        x = 'feet';
    case 4
        x = 'miles';
    case 5
        x = 'ounces';
    case 6
        x = 'pounds';
    case 7
        x = 'mph';
    case 8
        x = 'gallons';
    case 9
        x = 'acres';
    otherwise 
        x = 'error';
end
set(handles.text3,'String', x);

% --- Executes during object creation, after setting all properties.
function ImperialMenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ImperialMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in MetricMenu.
function MetricMenu_Callback(hObject, eventdata, handles)
% hObject    handle to MetricMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns MetricMenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from MetricMenu
switch get(handles.MetricMenu,'value')
    case 1
        x = '°C';
    case 2
        x = 'cm';
    case 3
        x = 'metres';
    case 4
        x = 'km';
    case 5
        x = 'grams';
    case 6
        x = 'kg';
    case 7
        x = 'kph';
    case 8
        x = 'litres';
    case 9
        x = 'hectares';
    otherwise 
        x = 'error';
end
set(handles.text3,'String', x);

% --- Executes during object creation, after setting all properties.
function MetricMenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MetricMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
