function out_data = window_adsr(data, samp_rate, window_ms)
    
    % out_data = window_adsr(data, samp_rate, window_ms)
    %
    % This function applies a raised cosine window at onset and offset of the
    % data. This is used to shape attack and decay characterisitics of stimuli
    %
    % Notes:
    % Hanning window a.k.a raised cosine window 
    %  h(theta) = 0.5*(1-cos(theta))    theta = 0 to 2*pi
    %  h(n) = 0.5*(1-cos(2*pi*n/(N-1)))     n = 0 to N-1
    %
    % Inputs:
    %   data      - input data vector assumes a single column
    %   samp_rate - sampling rate in Hz
    %   window_ms - attack or decay duration in ms
    %
    % Outputs:
    %   out_data  - output data always with row-time & column-ch format
    %
    
    % Version History:-
    %  ver - DD MMM YYYY - Feature added
    %  1.0 - 31 Jan 2022 - first implementation
    
    %% default values, error checks and handling
    
    if nargin < 2
        % set sampling rate in Hz
        samp_rate = 44100;
    end
    
    if nargin < 3
        % set attack, decay duration in ms
        window_ms = 10;
    end
    
    if nargin < 1
        % error handling
        disp('Error: no valid input');
        return;
    end
    
    
    %% initializations
    
    % extract the number of channels and length of the input data
    if size(data, 1) < size(data, 2)
        n_ch = size(data, 1);
        
        dat_len = size(data, 2);
        
        % intialize output data
        out_data = data.';
    else
        n_ch = size(data, 2);
        
        dat_len = size(data, 1);
        
        % intialize output data
        out_data = data;
    end
    
    % warn user if in case they are using this function incorrectly
    if n_ch > 2
        disp('Warning: unsupported data')
    end
    
    % compute length of the window needed
    win_len = round(window_ms / 1000 * samp_rate);
    
    % compute the Hann or raised cosine window function
    hann_win = ( 1 - cos(linspace(0, 2*pi, 2*win_len).') )/2;
    
    
    %% processing
    
    
    % iterate for each channel
    for ch = 1:n_ch
        
        % onset window is first half of the Hann window
        onset_win = hann_win(1:win_len);
        
        % apply onset window - attack characteristics
        out_data(1:win_len, ch) = out_data(1:win_len, ch) .* onset_win;
        
        % compute the start index of the window
        start_indx = dat_len - win_len + 1;
        
        % offset window is second half of Hann window
        offset_win = hann_win(win_len+1:end);
        
        % apply offset window - decay characteristics
        out_data(start_indx:dat_len, ch) = out_data(start_indx:dat_len, ch) .* offset_win;
        
    end
    
end