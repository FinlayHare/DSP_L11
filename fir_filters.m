% Impulse responses for the FIR filters
h1 = [1 2 3 4 4 3 2 1];       % FIR Type I  (M even, symmetric)
h2 = [1 2 3 4 3 2 1];         % FIR Type II (M odd, symmetric)
h3 = [-1 -2 -3 -4 3 3 2 1];   % FIR Type III (M even, antisymmetric)
h4 = [-1 -2 -3 0 3 2 1];      % FIR Type IV (M odd, antisymmetric)

% Creating a figure for the plots
figure('Name','FIR Filters: Magnitude, Phase, Phase unwrapped and Pole-Zero','NumberTitle','off');

% List of filters and their names
filters = {h1, h2, h3, h4};
names = {'Type I', 'Type II', 'Type III', 'Type IV'};

for k = 1:4
    % Obtain the frequency response
    [H, w] = freqz(filters{k}, 1, 512);
    
    % Magnitude response
    subplot(4, 4, (k-1)*4 + 1); 
    plot(w/pi, abs(H)); 
    grid on; 
    title([names{k} ' |H|']); 
    ylabel('|H|');
    if k == 4, xlabel('\omega/\pi'); end


    % Phase response (wrapped)
    subplot(4, 4, (k-1)*4 + 2); 
    plot(w/pi, (angle(H))); 
    grid on; 
    title([names{k} ' \angleH']); 
    ylabel('rad');
    if k == 4, xlabel('\omega/\pi'); end
    
    % Phase response (unwrapped)
    subplot(4, 4, (k-1)*4 + 3); 
    plot(w/pi, unwrap(angle(H))); 
    grid on; 
    title([names{k} ' \angleH']); 
    ylabel('rad');
    if k == 4, xlabel('\omega/\pi'); end
    
    % Pole-Zero plot
    subplot(4, 4, (k-1)*4 + 4); 
    zplane(filters{k}, 1); 
    title([names{k} ' Pole-Zero Diagram']); 
end

% Adjust layout
sgtitle('Magnitude, Phase, Phase unwrapped and Pole-Zero Diagrams for FIR Filters');
