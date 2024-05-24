chirpData = load('chirp.mat');
chirpObj = audioplayer(chirpData.y,chirpData.Fs);

gongData = load('gong.mat');
gongObj = audioplayer(gongData.y,gongData.Fs);
% Play the samples with blocking, one after the other.

playblocking(chirpObj);
playblocking(gongObj);
% Play without blocking. The audio can overlap.

play(chirpObj);
play(gongObj);