% Parameters for recording and processing
fs = 44100;        % Sampling frequency
duration = 10;     % Total duration for real-time processing (seconds)
nfft = 2048;       % Number of FFT points
noiseThreshold = 0.05; % Threshold for noise reduction
windowSize = 2048; % Window size for real-time analysis

% Initialize audio recorder
recObj = audiorecorder(fs, 16, 1); % 16-bit, 1 channel (mono)

% Start recording
disp('Recording started. Speak into the microphone.');
record(recObj); % Start continuous recording

% Prepare figure for real-time visualization
figure('Name', 'Real-Time Audio Signal Analysis', 'NumberTitle', 'off');
subplot(1, 2, 1); timePlot = plot(nan, nan); title('Time-Domain Signal');
xlabel('Time (s)'); ylabel('Amplitude');
subplot(1, 2, 2); spectrumPlot = plot(nan, nan); title('Frequency Spectrum');
xlabel('Frequency (Hz)'); ylabel('Magnitude'); xlim([0 fs/2]);

% Timer for real-time updates
tic; elapsedTime = 0;

% Main processing loop
processedData = [];
while elapsedTime < duration
    % Fetch recorded audio data
    audioData = getaudiodata(recObj);
    elapsedTime = toc;
    segmentStart = max(1, length(audioData) - windowSize);
    currentSegment = audioData(segmentStart:end);

    % Noise Reduction: Set samples below threshold to zero
    currentSegment(abs(currentSegment) < noiseThreshold) = 0;
    processedData = [processedData; currentSegment];

    % Frequency Spectrum Analysis
    Y = fft(currentSegment, nfft);
    f = (0:nfft/2-1) * (fs / nfft); % Frequency axis
    mag = abs(Y(1:nfft/2)); % Magnitude spectrum

    % Update Real-Time Plots
    timeVec = linspace(0, elapsedTime, length(processedData));
    set(timePlot, 'XData', timeVec, 'YData', processedData);
    set(spectrumPlot, 'XData', f, 'YData', mag);

    % Update display
    drawnow;
end

% Stop recording
stop(recObj);
disp('Recording stopped.');

% Final Analysis
disp('Performing final analysis...');
audioData = getaudiodata(recObj);

% Classify Amplitude Levels
maxAmplitude = max(audioData);

if maxAmplitude > 0.2
    amplitudeLevel = 'High';
elseif maxAmplitude > 0.1
    amplitudeLevel = 'Medium';
else
    amplitudeLevel = 'Low';
end
disp(['Amplitude Level: ', amplitudeLevel]);

% Save Audio Files
audiowrite('ProcessedAudio.wav', audioData, fs);
disp('Audio saved as "ProcessedAudio.wav".');

% Summary of Analysis
disp('--- Real-Time Audio Analysis Summary ---');
disp(['Duration: ', num2str(elapsedTime), ' seconds']);
disp(['Sampling Frequency: ', num2str(fs), ' Hz']);
disp(['Maximum Amplitude: ', num2str(maxAmplitude)]);
disp(['Amplitude Level: ', amplitudeLevel]);
disp('Real-time frequency spectrum and time-domain signal analyzed.');
