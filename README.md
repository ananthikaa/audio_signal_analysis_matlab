# audio_signal_analysis_matlab
This project implements a real-time audio signal recording, processing, and analysis system using MATLAB. The primary aim is to capture audio data, perform noise reduction, analyze the frequency spectrum, and provide real-time visualizations of both the time-domain signal and its frequency characteristics. The system is designed for applications in audio signal processing, speech analysis, and acoustics research.

Features
Real-time Audio Recording: Captures audio using a built-in microphone with adjustable sampling frequency (44.1 kHz).
Noise Reduction: Reduces background noise by setting audio samples below a specified threshold to zero.
Time and Frequency Domain Visualization: Plots the time-domain signal and the frequency spectrum in real-time.
Amplitude Classification: Classifies the audio's maximum amplitude level into categories: Low, Medium, and High.
Audio Saving: Saves the processed audio data to a WAV file for further analysis.
User Interface: Interactive real-time visual feedback, providing users with a clear view of both the time-domain waveform and frequency spectrum.
Requirements
MATLAB (R2019b or later recommended)
Audio input device (e.g., microphone)
Code Workflow
Initialization: The system initializes an audio recorder object and prepares the necessary parameters (sampling frequency, window size, FFT points).
Recording: Starts recording the audio in real-time, continuously fetching data from the microphone.
Processing: Each segment of the recorded audio undergoes:
Noise reduction by eliminating samples below a specified amplitude threshold.
Frequency spectrum analysis using Fast Fourier Transform (FFT).
Visualization: The time-domain signal and its frequency spectrum are plotted in real-time, updating dynamically as new audio data is processed.
Amplitude Classification: After the recording ends, the maximum amplitude of the entire recording is evaluated and classified into Low, Medium, or High levels.
Saving: The processed audio data is saved as a WAV file for further use or analysis.
Usage
Run the script to start the recording process.
Speak or produce sound into the microphone.
The system will continuously display real-time updates of the audio signal’s time-domain and frequency spectrum.
After the specified recording duration (10 seconds), the process will stop automatically, and the audio data will be saved as "ProcessedAudio.wav".
The maximum amplitude will be analyzed and classified into one of the predefined levels.
Example Output
Time-domain plot: Displays the waveform of the audio signal.
Frequency spectrum plot: Shows the magnitude of various frequencies within the audio signal.
Amplitude classification: Outputs whether the audio's amplitude is classified as Low, Medium, or High.
Contributions
Feel free to fork this repository, submit issues, and propose improvements! Contributions to enhance the system’s functionality and features are welcome.
