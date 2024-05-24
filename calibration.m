% Calibration script for PTA System
%
% This script collects calibration data for each standard frequency
% and calculates the calibration factor required to obtain 0 dB HL.


% https://www.peaktech.de/media/91/f2/40/1615231407/PeakTech_5055_01-2019F.pdf
% BS ISO 226:2023
% Acoustics. Normal equal-loudness-level contours
% Useful reference:
% BS EN ISO 8253-1:2010
% Acoustics. Audiometric test methods. Pure-tone air and bone conduction audiometry
% BS EN ISO 389-2:1997
% Acoustics. Reference zero for the calibration of audiometric equipment. Reference equivalent threshold sound pressure levels for pure tones and insert earphones
% BS EN ISO 7029:2017+A1:2024
% Acoustics. Statistical distribution of hearing thresholds related to age and gender
%
% Author: [Your Name]
% Date: [Today's Date]

clear; close all; clc;
addpath(genpath('./functions'));

%% user defined configuration

% Specify the path to store the calibration factors
cal_path = './calibration/';

% Set the sampling frequency
samp_freq = 48000; 

% Set the list of frequencies to be tested in kHz and
% Audiometric conversion factors (ISO 226)
% chttps://ec.europa.eu/health/ph_risk/committees/04_scenihr/docs/scenihr_o_018.pdf
% https://www.iso.org/obp/ui#iso:std:iso:226:ed-3:v1:en
audiometric_conversion = [
    250, 12;
    500, 5;
    1000, 2;
    2000, -2;
    4000, -5;
    6000, 5;
    8000, 13
];
list_freq = audiometric_conversion(:,1);

%% Initialize
% Create calibration directory if it does not exist
if ~exist(cal_path, 'dir')
    mkdir(cal_path);
end

% Initialize calibration factor array
cal_factors = zeros(length(list_freq), 1);

%% Calibration processing
for i = 1:length(list_freq)
    freq = list_freq(i);
    stimulus = generate_tones(freq, 'Left', samp_freq, 1, 1);

    % Play the tone
    player = audioplayer(stimulus, samp_freq);
    playblocking(player);
    
    % Simulate presenting the tone and ask for dB SPL reading
    fprintf('Presenting tone at %.1f Hz. Please enter the dB SPL readout of the artificial ear:\n', freq);
    dB_SPL = 1;%input('dB SPL Readout: ');
    
    % Calculate the calibration factor
    dB_HL_target = audiometric_conversion(i, 2);
    cal_factors(i) = dB_SPL - dB_HL_target;

end

% Save calibration factors to a .mat file
save([cal_path 'calibration_factors.mat'], 'list_freq', 'cal_factors');

disp('Calibration factors saved successfully.');

%% Function definitions here (if generate_tones function is not in a separate file)
