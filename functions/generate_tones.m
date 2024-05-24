%% This function generates acoustic stimulus using tones for hearing test
function stimulus = generate_tones(tone_freq, ear, samp_rate, tone_dur, num_tones, int_tone_interval, rms_level, onset_duration)
    
    if nargin < 8
        % set the onset/offset duration of each tone 
        onset_duration = 20; % in ms
    end

    if nargin < 7
        % set the RMS level of the tones
        rms_level = 0.7;
    end

    if nargin < 6
        % set inter tone interval % in sec
        int_tone_interval = 0.100;
    end

    if nargin < 5
        % set the number of tones in a train
        num_tones = 3;
    end

    if nargin < 4
        % set the duration of the tone % in sec
        tone_dur = 0.2;
    end
    
    % set default sampling frequency in Hz
    if nargin < 3
        samp_rate = 48000;
    end
    
    % set default ear 
    if nargin < 2
        ear = 'Left';
    end
    
    % set default tone frequency
    if nargin < 1
        tone_freq = 1000;
    end
    
    %% Tone construction
    
    % compute the time indices
    t_vec = (0 : 1/samp_rate : tone_dur - 1/samp_rate);
    
    % compute the standard tone
    std_tone = sin(2*pi * tone_freq * t_vec);
    
    % set the level and temporal characteristics of the sound
    
    % set the RMS level of standard
    std_tone = rms_level * std_tone/std(std_tone);
    
    % shape the onset and offset of the standard tone
    std_tone = window_adsr(std_tone, samp_rate, onset_duration);
    
    %% Stimulus construction
    
    int_tone_gap = zeros(round(int_tone_interval * samp_rate),1);
    
    stimulus = [repmat([std_tone; int_tone_gap], num_tones-1, 1); std_tone];
    
    % convert to stereo
    if strcmpi(ear,'left')
        stimulus = [stimulus zeros(length(stimulus),1)];
    elseif strcmpi(ear,'right')
        stimulus = [zeros(length(stimulus),1) stimulus];
    end

end