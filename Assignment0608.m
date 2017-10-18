clear all; close all; clc;

unknown = [1 9 6 1 2 8];
unknown2 = [4 8 0 0 0 0];
unknown3 = [4 8 0 0 9 6];
unknown4 = [6 0 3 0 2 3];

Igray = imread('ann/training.jpg');

BW = ~im2bw(Igray);

SE = strel('disk',2);
BW2 = imdilate(BW, SE); 

labels = bwlabel(BW2);
Iprops = regionprops(labels);

Iprops( [Iprops.Area] < 1000 ) = [];
num = length( Iprops );

Ibox = floor( [Iprops.BoundingBox] );
Ibox = reshape(Ibox,[4 num]);

for k = 1:num
    col1 = Ibox(1,k);
    col2 = Ibox(1,k) + Ibox(3,k);
    row1 = Ibox(2,k);
    row2 = Ibox(2,k) + Ibox(4,k);
    subImage = BW2(row1:row2, col1:col2);
    
    subImageScaled = imresize(subImage, [24 12]);
    
    TPattern(k,:) = subImageScaled(:)';
end

TTarget = zeros(100,10);

for row = 1:10
    for col = 1:10
        TTarget( 10*(row-1) + col, row ) = 1;
    end
end




TPattern = TPattern';
TTarget = TTarget';


mynet = newff([zeros(288,1) ones(288,1)], [24 10], {'logsig' 'logsig'}, 'traingdx');
mynet.trainParam.epochs = 500;
mynet = train(mynet,TPattern,TTarget);

%%
Igray = imread('ann/196128.jpg');

BW = ~im2bw(Igray);

SE = strel('disk',2);
BW2 = imdilate(BW, SE); 

labels = bwlabel(BW2);
Iprops = regionprops(labels);

Iprops( [Iprops.Area] < 1000 ) = [];
num = length( Iprops );

Ibox = floor( [Iprops.BoundingBox] );
Ibox = reshape(Ibox,[4 num]);


for k = 1:num
    col1 = Ibox(1,k);
    col2 = Ibox(1,k) + Ibox(3,k);
    row1 = Ibox(2,k);
    row2 = Ibox(2,k) + Ibox(4,k);
    
    subImage = BW2(row1:row2, col1:col2);
    subImageScaled = imresize(subImage, [24 12]);
    UPattern(k,:) = subImageScaled(:)';
end

UPattern = UPattern';
wrong = 0;
right = 0;
for k = 1:20
Y = sim(mynet,UPattern);

[value, index] = max(Y);

postcode = index-1;


for k = 1:6
    if postcode(k) == unknown(k)
        right = right +1;
    else wrong = wrong+1;
    end
end
end
%%
Igray = imread('ann/480000.jpg');

BW = ~im2bw(Igray);

SE = strel('disk',2);
BW2 = imdilate(BW, SE); 

labels = bwlabel(BW2);
Iprops = regionprops(labels);

Iprops( [Iprops.Area] < 1000 ) = [];
num = length( Iprops );

Ibox = floor( [Iprops.BoundingBox] );
Ibox = reshape(Ibox,[4 num]);


for k = 1:num
    col1 = Ibox(1,k);
    col2 = Ibox(1,k) + Ibox(3,k);
    row1 = Ibox(2,k);
    row2 = Ibox(2,k) + Ibox(4,k);
    
    subImage = BW2(row1:row2, col1:col2);
    subImageScaled = imresize(subImage, [24 12]);
    UPattern2(k,:) = subImageScaled(:)';
end

UPattern2 = UPattern2';
wrong2 = 0;
right2 = 0;
for k = 1:20
Y2 = sim(mynet,UPattern2);

[value2, index2] = max(Y2);

postcode2 = index2-1;


for k = 1:6
    if postcode2(k) == unknown2(k)
        right2 = right2 +1;
    else wrong2 = wrong2+1;
    end
end
end

Igray = imread('ann/480096.jpg');

BW = ~im2bw(Igray);

SE = strel('disk',2);
BW2 = imdilate(BW, SE); 

labels = bwlabel(BW2);
Iprops = regionprops(labels);

Iprops( [Iprops.Area] < 1000 ) = [];
num = length( Iprops );

Ibox = floor( [Iprops.BoundingBox] );
Ibox = reshape(Ibox,[4 num]);


for k = 1:num
    col1 = Ibox(1,k);
    col2 = Ibox(1,k) + Ibox(3,k);
    row1 = Ibox(2,k);
    row2 = Ibox(2,k) + Ibox(4,k);
    
    subImage = BW2(row1:row2, col1:col2);
    subImageScaled = imresize(subImage, [24 12]);
    UPattern3(k,:) = subImageScaled(:)';
end

UPattern3 = UPattern3';
wrong3 = 0;
right3 = 0;
for k = 1:20
Y3 = sim(mynet,UPattern3);

[value3, index3] = max(Y3);

postcode3 = index3-1;


for k = 1:6
    if postcode3(k) == unknown3(k)
        right3 = right3 +1;
    else wrong3 = wrong3+1;
    end
end
end

Igray = imread('ann/603032.jpg');

BW = ~im2bw(Igray);

SE = strel('disk',2);
BW2 = imdilate(BW, SE); 

labels = bwlabel(BW2);
Iprops = regionprops(labels);

Iprops( [Iprops.Area] < 1000 ) = [];
num = length( Iprops );

Ibox = floor( [Iprops.BoundingBox] );
Ibox = reshape(Ibox,[4 num]);


for k = 1:num
    col1 = Ibox(1,k);
    col2 = Ibox(1,k) + Ibox(3,k);
    row1 = Ibox(2,k);
    row2 = Ibox(2,k) + Ibox(4,k);
    
    subImage = BW2(row1:row2, col1:col2);
    subImageScaled = imresize(subImage, [24 12]);
    UPattern4(k,:) = subImageScaled(:)';
end
UPattern4 = UPattern4';
wrong4 = 0;
right4 = 0;
for k = 1:20
Y4 = sim(mynet,UPattern4);

[value4, index4] = max(Y4);

postcode4 = index4-1;


for k = 1:6
    if postcode4(k) == unknown4(k)
        right4 = right4 +1;
    else wrong4 = wrong4+1;
    end
end
end


%%

right;
wrong;
right2;
wrong2;
right3;
wrong3;
right4;
wrong4;
PercentCorrect = [(right/(right+wrong))*100;(right2/(right2+wrong2))*100;(right3/(right3+wrong3))*100;(right4/(right4+wrong4))*100];
TotalRuns = ['20';'20';'20';'20'];
CorrectDigits = [right;right2;right3;right4];
IncorrectDigits = [wrong;wrong2;wrong3;wrong4];
UnknownImage = ['196128'; '480000'; '480096'; '603023'];
T = table(UnknownImage,TotalRuns,CorrectDigits,IncorrectDigits,PercentCorrect)


