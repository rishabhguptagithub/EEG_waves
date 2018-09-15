%%
clf;
state=128; %freq at which we are sampling the data
time=0:1/state:2; %creating a time window of two seconds and taking data at sampling rate
eeg_table=readtable('data.csv'); %reading the data
m=size(eeg_table);%size of the table
power=eeg_table{2:m(1),2:m(2)};%converting the data from table type to double type
N=m(2);%length of the signal
nyquist=state/2;    % Nyquist frequency -- the highest frequency you can measure in the data

%%
% These are the actual frequencies in Hz that will be returned by the
% Fourier transform. The number of unique frequencies we can measure is
% exactly 1/2 of the number of data points in the time series (plus DC).
freq=linspace(0,nyquist,floor(N/1));
freq=freq(1:length(freq)-1);
%% This is further part which is in progress
t=eeg_table(:,1);
t=t{:,:};
t=cell2mat(t(2:length(t)));
%%


%now for converting the sinal from frequency domain to time domain
volt=zeros(size(power));
for i=1:m(1)-1
    volt(i,:)=abs(ifft(power(i,:)))*N;%applying the inverse fourier transform
end
figure(1);
subplot(211);

volt=volt*(1800000/(2000*4096));%converting the raw value to microvolts value of EEG

for i=1:m(1)-1
    
    plot(time(1:floor((length(time)/2))),volt(i,1:floor((length(time)/2))));
    hold on;
end


%if you want to print a specific signal then uncomment the next two lines and
%replace the 'i' with a number from 1 to 81.


% clf;
%plot(time(1:floor((length(time)/2))),volt(i,1:floor((length(time)/2))));

%
%% delta waves
delta_power=power(:,1:17);%selecting the domain of delta waves 
delta_volt=zeros(size(delta_power));
for i=1:m(1)-1
    delta_volt(i,:)=abs(ifft(delta_power(i,:)))*N;%applyting the inverse fourier transform
end
delta_volt=delta_volt*(1800000/(2000*4096));%raw values to microvolta

delta_size=size(delta_volt);
figure(2);
subplot(211);
for i=1:m(1)-1
    
    plot(delta_volt(i,1:floor((delta_size(2)/2))));
    hold on;
end
%if you want to print a specific delta wavev signal then uncomment the next two lines and
%replace the 'i' with a number from 1 to 81


% clf;
% plot(delta_volt(i,1:floor((delta_size(2)/2))));

%% Theta wave
theta_power=power(:,18:34);
theta_volt=zeros(size(theta_power));
for i=1:m(1)-1
    theta_volt(i,:)=abs(ifft(theta_power(i,:)))*N;
end
theta_volt=theta_volt*(1800000/(2000*4096));

theta_size=size(theta_volt);
figure(3);
subplot(211);
for i=1:m(1)-1
    
    plot(theta_volt(i,1:floor((theta_size(2)/2))));
    hold on;
end
%if you want to print a specific theta wave signal then uncomment the next two lines and
%replace the 'i' with a number from 1 to 81\


% clf;
% plot(theta_volt(i,1:floor((theta_size(2)/2))));

%% Alpha wave
alpha_power=power(:,35:54);
alpha_volt=zeros(size(alpha_power));
for i=1:m(1)-1
    alpha_volt(i,:)=abs(ifft(alpha_power(i,:)))*N;
end
alpha_volt=alpha_volt*(1800000/(2000*4096));

alpha_size=size(alpha_volt);
figure(4);
subplot(211);
for i=1:m(1)-1
    
    plot(alpha_volt(i,1:floor(alpha_size(2)/2)));
    hold on;
end
%if you want to print a specific alpha wave signal then uncomment the next two  lines and
%replace the 'i' with a number from 1 to 81


% clf;
% plot(alpha_volt(i,1:floor(alpha_size(2)/2)));

%% Beta wave
beta_power=power(:,55:122);
beta_volt=zeros(size(beta_power));

for i=1:m(1)-1
    beta_volt(i,:)=abs(ifft(beta_power(i,:)))*N;
end
beta_volt=beta_volt*(1800000/(2000*4096));

beta_size=size(beta_volt);
figure(6);
subplot(211);
for i=1:m(1)-1
    
    plot(beta_volt(i,1:floor(beta_size(2)/2)));
    hold on;
end
%if you want to print a specific beta wave signal then uncomment the next two lines and
%replace the 'i' with a number from 1 to 81


% clf;
% plot(beta_volt(i,1:floor(beta_size(2)/2)));
%% Gamma wave
gamma_power=power(:,123:256);
gamma_volt=zeros(size(gamma_power));
for i=1:m(1)-1
    gamma_volt(i,:)=abs(ifft(gamma_power(i,:)))*N;
end
gamma_volt=gamma_volt*(1800000/(2000*4096));


gamma_size=size(gamma_volt);
figure(7);
subplot(211);
for i=1:m(1)-1
    
    plot(gamma_volt(i,1:floor(gamma_size(2)/2)));
    hold on;
end
%%if you want to print a specific gamma wave signal then uncomment the next two line and
%replace the 'i' with a number from 1 to 81


% clf;
%plot(gamma_volt(i,1:floor(gamma_size(2)/2)));